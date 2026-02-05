# DevOps Challenge — Flask (Backend) + Angular (Frontend)

## Objetivo: 
Demostrar, de punta a punta, cómo: contenerizar aplicaciones backend y frontend, automatizar build & push de imágenes, provisionar infraestructura con IaC, desplegar en Kubernetes en EC2 y operar el cluster con observabilidad.

El foco está puesto en:
- simplicidad
- buenas prácticas
- ejecución real.

## Stack
- Backend: Flask
- Frontend: Angular servido con Nginx.
- CI/CD: GitHub Actions
  - CI automatico (build & push)
  - CD manual (self-hosted runner)
- Registry: GitHub Container Registry (GHCR)
- Contenedores: Docker
- Orquestación: Kubernetes (k3s)
- Infraestructura: Terraform + AWS EC2  
- Observabilidad: Prometheus + Grafana (Helm)


## Arquitectura
- Monorepo con `backend/` y `frontend/`
- CI construye y publica imágenes en GHCR
- Infraestructura provisionada con Terraform
- Cluster Kubernetes (k3s) corriendo en EC2
- Deploy vía CD manual con self-hosted runner
- Observabilidad activa sobre el cluster

## Quick start — Docker Compose (local)
Requisitos:
- Docker + Docker Compose

```bash
git clone https://github.com/AlfreMu/devops-challenge-flask-angular.git
cd devops-challenge-flask-angular/compose
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
<br>
[![CD](https://github.com/AlfreMu/devops-challenge-flask-angular/actions/workflows/deploy-k3s.yml/badge.svg?branch=main)](https://github.com/AlfreMu/devops-challenge-flask-angular/actions/workflows/deploy-k3s.yml)
---
El proyecto cuenta con un pipeline de CI unificado implementado con GitHub Actions, encargado de construir y publicar imágenes del backend y frontend en GitHub Container Registry (GHCR).

CI: 
- Build automático en push y pull request a main.
- Imágenes versionadas con tags latest y sha.
- Las imágenes generadas por CI son consumidas tanto por Docker Compose como por Kubernetes.

CD: 
- Self-hosted runner instalado en la EC2
- Deploy manual controlado:
```bash
git pull
kubectl apply
```

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

## Infraestructura como Codigo (IaC):
- AWS EC2 provisionada con Terraform
- Instalación de k3s sobre la instancia
- Security Groups mínimos
- Self-hosted runner para CD

👉 Ver documentación técnica de Infraestructura:  
📄 [Infraestructura](docs/infra.md)

## Observabilidad:
- Stack de observabilidad instalado vía Helm
- Prometheus + Grafana en namespace monitoring
- Métricas de:
  -node
  - pods
  - recursos (CPU / memoria)
- Dashboards funcionales y targets en estado UP
  
👉 Ver documentación técnica de Observabilidad:  
📄 [Observabilidad](docs/observability.md)

---

# Estado del proyecto 

- ✅ Proyecto completo y funcional
- ✅ Ejecutado sobre infraestructura real
- ✅ Pensado como primer proyecto de portfolio DevOps Jr

Autor: Alfre Muñiz.
_Proyecto desarrollado como parte de un proceso de formación y transición a DevOps / Cloud._
