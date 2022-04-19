# Installation de Jenkins #

Version|Auteur|Contenu
-------|------|-------
1.0 | Tannie | Tout ce qu'il te faut

# 1 Introduction #

## 1.1 Gloassaire ##

Termes, abréviation|Définition
-------------------|-----------
DIE|Document d'Installation et d'Exploitation

## 1.2 Objet du document ##

# 2 Serveurs et pré-requis à l'installation #

## 2.1 Rappel : architecture des briques Office ##

## 2.2 Pré-requis à l'installation ##

Ressources nécessaires :

- 4GB de Ram
- 20GB d'espace disque

Le serveur doit se trouver dans **Ubuntu version 16.04.7**
Il est impératif d'avoir au moins **java 8** d'installer
```$ sudo apt-get install openjdk-8-jre```

# 3 Installation complète du serveur ##

## 3.1 Composants ##

Composants|Versions|Recommandation
----------|--------|-------------
Serveur d'applcation|Tomcat 8.5|Jenkins se lance avec le serveur d'application
Jenkins|2.332.2|Outil d’intégration continue

## 3.2 Configuration du serveur ##


