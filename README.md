# 🚀 Projet Inception - 42

## 📚 Description du projet

Inception est un projet de l'école 42 qui vise à vous familiariser avec l'utilisation de Docker et la mise en place d'une infrastructure multi-conteneurs. L'objectif principal est de créer un petit ensemble de services web en utilisant Docker Compose.

## 🛠️ Technologies utilisées

- Docker 🐳
- Docker Compose
- NGINX 🌐
- WordPress
- MariaDB 💾
- PHP-FPM

## 🏗️ Structure du projet

```
inception/
│
├── srcs/
│   ├── docker-compose.yml
│   ├── .env
│   │
│   └── requirements/
│       ├── nginx/
│       │   ├── Dockerfile
│       │   └── conf/
│       ├── wordpress/
│       │   ├── Dockerfile
│       │   └── conf/
│       └── mariadb/
│           ├── Dockerfile
│           └── conf/
│
├── Makefile
└── README.md
```

## 🚀 Installation et lancement

1. Clonez le dépôt :
   ```
   git clone https://github.com/votre-username/inception.git
   cd inception
   ```

2. Configurez les variables d'environnement dans le fichier `srcs/.env`

3. Lancez le projet avec :
   ```
   make up
   ```

4. Pour arrêter le projet :
   ```
   make down
   ```

## 🔧 Configuration

- NGINX : Serveur web principal, configuré pour rediriger vers WordPress
- WordPress : CMS installé avec PHP-FPM
- MariaDB : Base de données pour WordPress

## 📝 Commandes utiles

- `make up` : Démarre les conteneurs
- `make down` : Arrête les conteneurs
- `make prune` : Nettoie les volumes et les images Docker

## 🤝 Contribution

Les pull requests sont les bienvenues. Pour les changements majeurs, veuillez d'abord ouvrir une issue pour discuter de ce que vous aimeriez changer.

## 📜 Licence

Ce projet est réalisé dans le cadre du cursus de l'école 42 et est soumis à leurs conditions d'utilisation.

## ✨ Auteur

Ozan - [@justeozan](https://github.com/justeozan)
