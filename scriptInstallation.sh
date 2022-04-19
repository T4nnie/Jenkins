#!/bin/bash

if [[ -d "/home/jenkins/apache-tomcat-8.5.78" ]]
then
    echo "il existe déjà un tomcat 8.5.78" | tee log.txt
    else 
        echo "decompression du apache-tomcat-8.5.78.tar.gz dans /home/jenkins" | tee log.txt
        tar -zxvf resources/apache-tomcat-8.5.78.tar.gz -C /home/jenkins/
fi

if [[ -d "/home/jenkins/apache-tomcat-8.5.78" ]]
then
    echo "Creation du dossier apache réussi !" | tee log.txt
    else
        echo "echec de la creation de l'apache" | tee log.txt
        exit 2
fi

if [[ -e "/home/jenkins/apache-tomcat-8.5.78/webapps/jenkins.war" ]]
then
    echo "jenkins.war est déjà dans le tomcat" | tee log.txt
    else
        echo "copie du jenkins.war dans apache-tomcat-8.5.78/webapps/"
        cp resources/jenkins.war /home/jenkins/apache-tomcat-8.5.78/webapps/
fi

if [[ -e "/home/jenkins/apache-tomcat-8.5.78/webapps/jenkins.war" ]]
then 
    echo "le jenkins est bien dans le dossir webapps"
    else 
        echo "le dossier jenkins n'a pas été copié au bon endroit" | tee log.txt
        exit 2
fi

echo "lancement du jenkins" | tee log.txt

sh /home/jenkins/apache-tomcat-8.5.78/bin/startup.sh

if [ -d "/home/jenkins/.jenkins" ]
then 
    echo "Installation c'est bien passé"
    else
        echo "Le lancement n'a pas fonctionné" | tee log.txt
fi