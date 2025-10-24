# Caddy Reverse Proxy

Ce dépôt contient la configuration pour déployer Caddy comme reverse proxy avec Docker.

## 📋 Prérequis

- Docker
- Docker Compose
- Un serveur avec les ports 80 et 443 accessibles
- (Optionnel) Un nom de domaine pointant vers votre serveur

## 🚀 Déploiement

1. Clonez ce dépôt :
```bash
git clone https://github.com/0xSt0n3Wardx/service-infrastructure.git
cd service-infrastructure/reverse-proxy/caddy
```

2. Créez un réseau Docker pour Caddy (si ce n'est pas déjà fait) :
```bash
docker network create proxy
```

3. Personnalisez votre `Caddyfile` selon vos besoins

4. Démarrez Caddy :
```bash
docker-compose up -d
```

## 🔧 Configuration

### Structure des fichiers

```
caddy/
├── .env                # Variables d'environnement
├── Caddyfile           # Configuration principale de Caddy
├── docker-compose.yml  # Configuration Docker
└── Dockerfile          # Image Docker personnalisée
```

### Configuration Docker Compose

Le fichier `docker-compose.yml` définit :
- Les volumes pour la persistance des données
- Les ports exposés (80 et 443)
- Les variables d'environnement
- Les réseaux

### Caddyfile

Le Caddyfile est le fichier de configuration principal où vous définissez :
- Vos domaines
- Les règles de reverse proxy
- Les configurations SSL/TLS
- Les en-têtes de sécurité

## 📝 Exemples d'utilisation

### Ajouter un nouveau service

1. Ajoutez la configuration dans le Caddyfile :

```
@plex host homeflix.mydomain.com
        handle @plex {
            reverse_proxy 192.168.1.10:5006
        }
```

### Sécurité basique


#### Restriction d'accès par IP
Créez un snippet réutilisable pour bloquer l'accès externe :
```
(block_all) {
    @block not remote_ip 10.0.0.0/8 192.168.0.0/16 172.16.0.0/12
    respond @block "🚫 Accès réservé au réseau interne 😊" 401
}
```

#### Exemple d'application avec restriction d'accès

```
# Configuration pour it-tools avec restriction au réseau interne
@it-tools host it-tools.mydomain.com {
    @it-tools host @it-tools host it-tools.mydomain.com
    handle @it-tools {
        import block_all
        reverse_proxy 192.168.1.20:8001
    }
}
```

Cette configuration :
- Définit un snippet `block_all` réutilisable qui :
  - Autorise uniquement les IPs des plages privées (10.0.0.0/8, 192.168.0.0/16, 172.16.0.0/12)
  - Renvoie une réponse 401 avec un message personnalisé pour les autres IPs
- Applique la restriction au service it-tools
- Configure le reverse proxy vers le service backend

## 🛠 Maintenance

### Mise à jour

1. Tirez la nouvelle image :

```bash
docker-compose pull
```

2. Redémarrez le service :

```bash
docker-compose up -d --force-recreate
```

## 📚 Ressources

- [Documentation officielle de Caddy](https://caddyserver.com/docs/)
- [Guide Docker officiel](https://docs.docker.com/)

