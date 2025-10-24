# 🚀 Semaphore - Interface Web pour Ansible

**Semaphore** est une interface web légère permettant d'exécuter et gérer des **playbooks Ansible** facilement.

Ce guide décrit comment déployer Semaphore avec **Docker Compose**, connecté à une base **MySQL**.

## 📋 Prérequis

Avant de commencer, assurez-vous d'avoir :

- 🐧 Un serveur Linux (Ubuntu/Debian/CentOS)
- 🐳 **Docker** et **Docker Compose** installés
- 📦 Accès root ou sudo sur le serveur
- 🔧 Au moins 2GB de RAM disponibles

### Vérification de l'installation

- `docker --version`
- `docker-compose --version`

### 📁 Structure du projet

semaphore/
├── docker-compose.yml      # Stack Docker
├── .env                    # Variables d'environnement
├── inventory/              # Dossiers pour les inventaires Ansible
├── semaphore_data/         # Données persistantes de Semaphore
└── semaphore_config/       # Fichiers de configuration

## 🐳 Déploiement avec Docker Compose
