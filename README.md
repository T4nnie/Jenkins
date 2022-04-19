# Installation de Jenkins

| Version | Auteur | Contenu               |
| ------- | ------ | --------------------- |
| 1.0     | Tannie | Tout ce qu'il te faut |

## 1 Introduction

### 1.1 Gloassaire

| Termes, abréviation | Définition                                |
| ------------------- | ----------------------------------------- |
| DIE                 | Document d'Installation et d'Exploitation |

### 1.2 Objet du document

Le document est là pour :

- [Donner les pré-requis du serveur pour installer le service jenkins](#22-pré-requis-à-linstallation)
- [Vous guider via une installation par github](#32-par-github)
- [Vous donner les informations nécessaire pour une installation manuelle](#33-sans-github)

## 2 Serveurs et pré-requis à l'installation

### 2.1 Rappel : architecture des briques Office

### 2.2 Pré-requis à l'installation

Ressources nécessaires :

- 4GB de Ram
- 20GB d'espace disque

L'installation est faite pour un serveur **Ubuntu version 16.04.7**
Il est impératif d'avoir au moins **java 8** d'installer

`$ sudo apt-get install openjdk-8-jre`

Il vous faut un utilisateur **_jenkins_** pour pouvoir utiliser ce script d'installation.

`$ sudo useradd jenkins`

## 3 Installation complète du serveur

### 3.1 Composants

| Composants           | Versions   | Recommandation                                 |
| -------------------- | ---------- | ---------------------------------------------- |
| Serveur d'applcation | Tomcat 8.5 | Jenkins se lance avec le serveur d'application |
| Jenkins              | 2.332.2    | Outil d’intégration continue                   |

### 3.2 Par github

Vous pouvez installer via git

#### pour installer git

`$ sudo apt-get install git`

Et après :

`$ git clone https://github.com/T4nnie/Jenkins.git`

une fois dans le dossier

`$ sh scriptInstallation.sh`

### 3.3 Sans Github

Téléchargez le dossier github et envoyez le dans votre serveur _host_

la commande `$ scp` peut vous aider.
Une fois le package présent sur votre [serveur](#2-serveurs-et-pré-requis-à-linstallation), placez vous dans le dossier et lancez la commande:

`$ sh scriptInstallation.sh`
