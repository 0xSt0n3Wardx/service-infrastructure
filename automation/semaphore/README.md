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
```bash
docker --version
docker-compose --version
```
### 📁 Structure du projet

Voici l'arborescence du projet :

```bash
semaphore/
├── docker-compose.yml      # Stack Docker
├── .env                    # Variables d'environnement
├── inventory/              # Dossiers pour les inventaires Ansible
├── semaphore_data/         # Données persistantes de Semaphore
└── semaphore_config/       # Fichiers de configuration
```
## 🐳 Déploiement avec Docker Compose

1. Démarrage des services
```bash
docker-compose up -d
```

2. Vérification du statut
```bash
docker-compose ps
```

🧩 7️⃣ Configuration post-installation
Connectez-vous avec les identifiants admin définis dans .env.
Créez un projet (ex : homelab)
Créer un une nouvelle clé

![Description de l’image](./images/ssh_key.png)

Crée un repositories GitHub ou GitLab

![Description de l’image](./images/repo_github.png)

Ajouter un fichier Inventory

![Description de l’image](./images/inventory.png)

Créer Task 

Ce task a pour but de tester un ping sur les serveurs

![Description de l’image](./images/task.png)


Résultat du test ping 

![Description de l’image](./images/resultat_task.png)

NB : Assurez-vous d’avoir python installer sur vos machines cibles

```bash
sudo apt update
sudo apt install python3 python3-venv -y
```

Un autre exemple qui consiste a déployer nginx et apache respectivement sur nos 2 serveurs

![task_install_nginx_apache](./images/task_install_nginx_apache.png)

Dépôt GitHub

![Description de l’image](./images/file_yaml_nginx_apache.png)

Résultat  exécution

![Description de l’image](./images/resultat_task_nginx_apache.png)

[demo_nginx](http://srv-deb-demo.blackward.net/)

![demo_nginx](./images/demo_nginx.png)

[demo_apache](http://srv-deb2-demo.blackward.net/)

![demo_apache](./images/demo_apache.png)

## 📚 Ressources utiles

-`[Documentation Semaphore](https://semaphoreui.com/docs)`
-`[Guide Ansible](https://docs.ansible.com/)`
-`[Docker Documentation](https://docs.docker.com/)`
