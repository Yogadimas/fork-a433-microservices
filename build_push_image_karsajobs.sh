#!/bin/bash

# Build Docker image dari Dockerfile
docker build -t yogadimas/karsajobs:latest .

# --- Push ke Docker Hub ---
# Login ke Docker Hub menggunakan token
echo $DOCKER_HUB_TOKEN | docker login -u yogadimas --password-stdin

# Push Docker image ke Docker Hub
docker push yogadimas/karsajobs:latest

# --- Push ke GitHub Packages ---
# Menentukan nama image untuk GitHub Container Registry (GCR)
GITHUB_USERNAME=yogadimas
GITHUB_REGISTRY=ghcr.io

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag yogadimas/karsajobs:latest $GITHUB_REGISTRY/$GITHUB_USERNAME/karsajobs:latest

# Login ke GitHub Packages menggunakan token
echo $GITHUB_TOKEN | docker login $GITHUB_REGISTRY -u $GITHUB_USERNAME --password-stdin

# Push Docker image ke GitHub Packages
docker push $GITHUB_REGISTRY/$GITHUB_USERNAME/karsajobs:latest