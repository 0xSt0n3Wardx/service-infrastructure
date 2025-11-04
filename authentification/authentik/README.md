# 🔐 Authentik - Guide d'installation rapide

Solution SSO moderne et open source pour centraliser l'authentification (LDAP, OAuth2, SAML).

## 📋 Prérequis

- Docker & Docker Compose
- 2GB RAM minimum


## 📁 Structure

```
authentik/
├── docker-compose.yml  # Configuration des conteneurs
├── .env               # Variables d'environnement
├── media/            # Stockage des médias
├── certs/            # Certificats SSL
└── custom-templates/ # Templates personnalisés
```

## 🚀 Installation rapide

1. **Créer l'arborescence**
   ```bash
   mkdir -p /home/portainer/docker-compose/authentik/{media,certs,custom-templates}
   cd /home/portainer/docker-compose/authentik
   ```

2. **Récupérer les fichiers de configuration**
   ```bash
   # Cloner le dépôt
   git clone https://github.com/0xSt0n3Wardx/service-infrastructure.git
   
   # Se déplacer dans le dossier authentik
   cd service-infrastructure/authentification/authentik
   ```

   > 💡 Le dépôt contient tous les fichiers nécessaires

   > ⚠️ N'oubliez pas de modifier le `.env` pour personnaliser les variables

## ▶️ Démarrage

1. **Lancer la stack**
   ```bash
   docker compose up -d
   ```

2. **Vérifier le statut**
   ```bash
   docker compose ps
   ```

## 🌐 Première connexion

1. **Accéder à l'interface**
   - HTTP: http://ip_server:9011
   - HTTPS: https://ip_server:9012

2. **Configuration initiale**
   - URL: https://ip_server:9012/if/flow/initial-setup/
   - Renseigner email admin
   - Créer mot de passe admin
   - Se connecter à l'interface

## 🔧 Post-installation

- Configurer un reverse proxy (recommandé)
- Mettre en place SSL/TLS
- Sauvegarder régulièrement les volumes

## 📚 Documentation

- [Documentation officielle](https://goauthentik.io/docs/)
- [Guide des providers](https://goauthentik.io/docs/providers/)
- [Exemples d'intégration](https://goauthentik.io/integrations/)
