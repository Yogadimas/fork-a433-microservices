#!/bin/bash

# Build Docker image dari Dockerfile
docker build -t item-app:v1 .

# Menampilkan daftar Docker image yang ada di lokal
docker images

# --- Push ke Docker Hub ---
# Mengubah nama image agar sesuai dengan format Docker Hub
docker tag item-app:v1 yogadimas/item-app:v1

# Login ke Docker Hub menggunakan token
echo $DOCKER_HUB_TOKEN | docker login -u yogadimas --password-stdin

# Push Docker image ke Docker Hub
docker push yogadimas/item-app:v1

# --- Push ke GitHub Packages ---
# Menentukan nama image untuk GitHub Container Registry (GCR)
GITHUB_USERNAME=yogadimas
GITHUB_REGISTRY=ghcr.io

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag item-app:v1 $GITHUB_REGISTRY/$GITHUB_USERNAME/item-app:v1

# Login ke GitHub Packages menggunakan token
echo $GITHUB_TOKEN | docker login $GITHUB_REGISTRY -u $GITHUB_USERNAME --password-stdin

# Push Docker image ke GitHub Packages
docker push $GITHUB_REGISTRY/$GITHUB_USERNAME/item-app:v1
