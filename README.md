# DevOps Challenge — Flask (Backend) + Angular (Frontend)

Proyecto DevOps Jr.  

## Objetivo: 
Demostrar un flujo completo y simple de **CI/CD, Docker, Kubernetes, IaC y Cloud**.

## Stack
- Backend: Flask
- Frontend: Angular (servido con Nginx)
- CI/CD: GitHub Actions
- Registry: GitHub Container Registry (GHCR)
- Contenedores: Docker / Docker Compose
- Orquestación: Kubernetes (manifests básicos)
- Infra (próximo paso): Terraform + EC2 + k3s

## Arquitectura
- Pipeline de CI construye y publica imágenes Docker de backend y frontend en GHCR.
- Docker Compose consume esas imágenes para validación local.
- Kubernetes despliega ambos servicios en un namespace dedicado, con límites de recursos definidos.

## Quick start — Docker Compose (local)
Requisitos:
- Docker + Docker Compose

```bash
cd compose
docker compose up -d
```
# Accesos
- **Frontend:** [http://localhost:8080](http://localhost:8080)
- **Backend:** [http://localhost:5000](http://localhost:5000)

- Ver contenedores:
```bash
docker ps
```
- Bajar contenedores:
```bash
docker compose down
```

## CI/CD
[![CI](https://github.com/AlfreMu/devops-challenge-flask-angular/actions/workflows/build-push.yml/badge.svg?branch=main)](https://github.com/AlfreMu/devops-challenge-flask-angular/actions/workflows/build-push.yml)

---
El proyecto cuenta con un pipeline de CI/CD unificado implementado con GitHub Actions, encargado de construir y publicar imágenes Docker del backend y frontend en GitHub Container Registry (GHCR).

Un solo workflow con:
- Build automático en push y pull request a main.
- Imágenes versionadas con tags latest y sha.
- Las imágenes generadas por CI son consumidas tanto por Docker Compose como por Kubernetes.

👉 Ver documentación técnica de CI/CD:  
📄 [CI/CD – GitHub Actions](docs/ci-cd.md)

## Kubernetes

El proyecto incluye manifests de Kubernetes unificados y simples, preparados para desplegar el backend y frontend en un entorno real.
- Namespace dedicado (devops-challenge).
- Deployments y Services separados.
- Requests y limits de CPU/memoria definidos.
- Los manifests están preparados para ejecutarse en un cluster Kubernetes real (por ejemplo k3s sobre EC2).
  
👉 Ver documentación técnica de Kubernetes:  
📄 [Kubernetes](docs/kubernetes.md)

