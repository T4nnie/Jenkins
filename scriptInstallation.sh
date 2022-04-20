#!/bin/bash

echo "Lancement de l'installation du jenkins !" | tee log.txt
#Vérification d'un dossier untilisateur jenkins
if [ -d "/home/jenkins" ]
then
    echo "Utilisateur jenkins existant" | tee -a log.txt
    else
        echo "Il n'y a pas de dossier utilisateur jenkins !" | tee -a log.txt
        exit 2
fi

#Création du serveur apache
if [ -d "/home/jenkins/apache-tomcat-8.5.78" ]
then
    echo "Il existe déjà un tomcat 8.5.78" | tee -a log.txt
    else 
        echo "Decompression du apache-tomcat-8.5.78.tar.gz dans /home/jenkins" | tee -a log.txt
        tar -zxvf resources/apache-tomcat-8.5.78.tar.gz -C /home/jenkins/
fi

#Vérification du serveur apache décompressé
if [ -d "/home/jenkins/apache-tomcat-8.5.78" ]
then
    echo "Creation du dossier apache réussi !" | tee -a log.txt
    else
        echo "Echec de la creation de l'apache" | tee -a log.txt
        exit 2
fi

#On place le fichier jenkins.war dans l'apache serveur
if [ -e "/home/jenkins/apache-tomcat-8.5.78/webapps/jenkins.war" ]
then
    echo "jenkins.war est déjà dans le tomcat" | tee -a log.txt
    else
        echo "Copie du jenkins.war dans apache-tomcat-8.5.78/webapps/" | tee -a log.txt
        cp resources/jenkins.war /home/jenkins/apache-tomcat-8.5.78/webapps/
fi

#Vérification du jenkins.war dans l'apache serveur
if [ -e "/home/jenkins/apache-tomcat-8.5.78/webapps/jenkins.war" ]
then 
    echo "Le jenkins est bien dans le dossir webapps" | tee -a log.txt
    else 
        echo "Le dossier jenkins n'a pas été copié au bon endroit" | tee -a log.txt
        exit 2
fi

#Lancement de l'apache serveur avec le jenkins dans le dossier webapps
echo "Lancement du jenkins" | tee -a log.txt

sh /home/jenkins/apache-tomcat-8.5.78/bin/startup.sh

#Vérification de l'éxecution du jenkins
if [ -d "/home/jenkins/.jenkins" ]
then 
    echo "Installation c'est bien passé" | tee -a log.txt
    else
        echo "Le lancement n'a pas fonctionné !" | tee -a log.txt
        exit 2
fi