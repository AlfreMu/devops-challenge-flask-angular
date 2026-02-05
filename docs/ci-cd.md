[![CI](https://github.com/AlfreMu/devops-challenge-flask-angular/actions/workflows/build-push.yml/badge.svg?branch=main)](https://github.com/AlfreMu/devops-challenge-flask-angular/actions/workflows/build-push.yml)
<br>
[![CD](https://github.com/AlfreMu/devops-challenge-flask-angular/actions/workflows/deploy-k3s.yml/badge.svg?branch=main)](https://github.com/AlfreMu/devops-challenge-flask-angular/actions/workflows/deploy-k3s.yml)
---

# CI/CD — GitHub Actions

Este documento describe cómo funciona el flujo de **Integración Continua (CI)** y **Despliegue Continuo (CD)** del proyecto.

---
## 🔁 Integración Continua (CI)

### Descripción

La **Integración Continua (CI)** se ejecuta automáticamente mediante **GitHub Actions** ante cambios relevantes en el repositorio, específicamente cuando se modifican:

- el código del **backend** (`backend/`)
- el código del **frontend** (`frontend/`)
- los archivos de **workflows** (`.github/workflows/`)

Responsabilidades principales:

- Build de imágenes Docker
- Taggeo consistente y trazable
- Publicación de imágenes en GitHub Container Registry (GHCR)

---

### Workflow de CI

- **Archivo:** [.github/workflows/build-push.yml](.github/workflows/build-push.yml)
- **Triggers:**
  - `push` a la rama `main`
  - cambios en:
    - `backend/`
    - `frontend/`
    - `.github/workflows/`

---

### Flujo del pipeline

El workflow ejecuta los siguientes pasos:

1. Build de la imagen Docker del **backend** (Flask)
2. Build de la imagen Docker del **frontend** (Angular + Nginx)
3. Push de ambas imágenes a **GHCR**
4. Aplicación de tags:
   - `latest`
   - `sha-<commit>`

---

### Imágenes publicadas

Las imágenes generadas por el pipeline son:

- **Backend**  
  `ghcr.io/alfremu/devops-challenge-flask-angular-backend`

- **Frontend**  
  `ghcr.io/alfremu/devops-challenge-flask-angular-frontend`

---

### Estrategia de tags

Cada imagen se publica con dos tags:

- **latest**  
  Generado automáticamente en cada push a la rama `main`.

- **sha-<commit>**  
  Tag inmutable que permite identificar exactamente qué commit generó la imagen.

Ejemplo:

```bash
ghcr.io/alfremu/devops-challenge-flask-angular-backend:latest
ghcr.io/alfremu/devops-challenge-flask-angular-backend:3f2a1c9
```

Esta estrategia facilita:
- debugging
- rollback
- alineación entre código e imagen en ejecución

---

## Detalles del pipeline

- El pipeline contiene jobs independientes para backend y frontend.
- Cada job se ejecuta solo si hay cambios en su directorio correspondiente.
- Ejecución condicional según cambios por directorio
- Naming consistente de imágenes y tags

Este diseño reduce tiempos de ejecución y facilita escalar el proyecto agregando nuevos servicios sin duplicar pipelines.

## 🚀 Entrega Continua (CD)

### Descripción

La **Entrega Continua (CD)** se implementa mediante **GitHub Actions** utilizando un enfoque **controlado y explícito**, adecuado para un proyecto de portfolio.

El despliegue **no es automático**: se ejecuta manualmente para mantener control total sobre cuándo y cómo se aplican los cambios en el entorno real.

Responsabilidades principales:

- Actualizar el código del repositorio en la EC2
- Desplegar la aplicación en **Kubernetes (k3s)**
- Utilizar imágenes previamente construidas en la etapa de CI

---

### Workflow de CD

- **Archivo:** [.github/workflows/deploy-k3s.yml](.github/workflows/deploy-k3s.yml)
- **Trigger:**
  - `workflow_dispatch` (ejecución manual)

Este diseño evita despliegues automáticos no deseados y permite validar cada cambio antes de aplicarlo en el cluster.

---

### Infraestructura de despliegue

El despliegue se realiza sobre:

- **EC2 en AWS**
- **Kubernetes (k3s)** en un cluster single-node
- **Self-hosted runner** ejecutándose dentro de la EC2

El runner tiene acceso directo al cluster y ejecuta los comandos de despliegue sin depender de servicios externos.

---

### Flujo del despliegue

Cuando se ejecuta el workflow de CD, se realizan los siguientes pasos:

1. Sincronización del repositorio (`git pull`)
2. Aplicación de manifiestos Kubernetes (`kubectl apply`)
3. Actualización de los workloads usando imágenes desde **GHCR**
4. Verificación del estado de los pods desplegados

El despliegue reutiliza las imágenes generadas en CI, garantizando coherencia entre build y runtime.

---

### Características clave del CD

- Despliegue manual y controlado
- Separación clara entre **CI (build)** y **CD (deploy)**
- Uso de self-hosted runner para acceso directo al entorno
- Sin GitOps ni automatizaciones innecesarias
- Flujo simple, reproducible y fácil de auditar

---

### Relación con CI

El flujo completo CI/CD queda definido de la siguiente manera:

- **CI:** build y publicación de imágenes Docker en GHCR
- **CD:** despliegue manual en Kubernetes consumiendo esas imágenes

Este enfoque refleja un pipeline realista y común en equipos DevOps, priorizando claridad, control y trazabilidad.
