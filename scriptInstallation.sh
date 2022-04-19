#!/bin/bash

echo "lancement de l'installation du jenkins !" | tee log.txt
#Vérification d'un dossier untilisateur jenkins
if [[ -d "/home/jenkins" ]]
then
    echo "Utilisateur jenkins existant" | tee -a log.txt
    else
        echo "Il n'y a pas d'e dossier utilisateur jenkins !" | tee -a log.txt
        exit 2
fi

if [[ -d "/home/jenkins/apache-tomcat-8.5.78" ]]
then
    echo "il existe déjà un tomcat 8.5.78" | tee -a log.txt
    else 
        echo "decompression du apache-tomcat-8.5.78.tar.gz dans /home/jenkins" | tee -a log.txt
        tar -zxvf resources/apache-tomcat-8.5.78.tar.gz -C /home/jenkins/
fi

if [[ -d "/home/jenkins/apache-tomcat-8.5.78" ]]
then
    echo "Creation du dossier apache réussi !" | tee -a log.txt
    else
        echo "echec de la creation de l'apache" | tee -a log.txt
        exit 2
fi

if [[ -e "/home/jenkins/apache-tomcat-8.5.78/webapps/jenkins.war" ]]
then
    echo "jenkins.war est déjà dans le tomcat" | tee -a log.txt
    else
        echo "copie du jenkins.war dans apache-tomcat-8.5.78/webapps/" | tee -a log.txt
        cp resources/jenkins.war /home/jenkins/apache-tomcat-8.5.78/webapps/
fi

if [[ -e "/home/jenkins/apache-tomcat-8.5.78/webapps/jenkins.war" ]]
then 
    echo "le jenkins est bien dans le dossir webapps" | tee -a log.txt
    else 
        echo "le dossier jenkins n'a pas été copié au bon endroit" | tee -a log.txt
        exit 2
fi

echo "lancement du jenkins" | tee -a log.txt

sh /home/jenkins/apache-tomcat-8.5.78/bin/startup.sh

if [ -d "/home/jenkins/.jenkins" ]
then 
    echo "Installation c'est bien passé" | tee -a log.txt
    else
        echo "Le lancement n'a pas fonctionné !" | tee -a log.txt
        exit 2
fi