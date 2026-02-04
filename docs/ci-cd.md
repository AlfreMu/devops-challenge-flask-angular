# CI/CD — GitHub Actions

Este proyecto utiliza un pipeline de **CI/CD unificado** implementado con **GitHub Actions**, orientado a un monorepo con backend (Flask) y frontend (Angular).

El objetivo del pipeline es automatizar la construcción y publicación de imágenes Docker, manteniendo un flujo simple, reproducible y alineado a prácticas DevOps reales.

---

## Ubicación del workflow

El workflow se encuentra en:
📄 [.github/workflows/build-push.yml](.github/workflows/build-push.yml)

Es un único pipeline que maneja ambos servicios del proyecto.

---

## Qué hace el pipeline

El pipeline realiza las siguientes tareas:

- Se ejecuta en:
  - push a la rama `main`
  - pull request contra `main`
- Construye imágenes Docker para:
  - Backend (Flask)
  - Frontend (Angular)
- Publica las imágenes en **GitHub Container Registry (GHCR)**.
- Utiliza autenticación nativa mediante `GITHUB_TOKEN`.

---

## Imágenes generadas

Las imágenes Docker publicadas por el pipeline son:

- https://ghcr.io/alfremu/devops-challenge-flask-angular-backend
- https://ghcr.io/alfremu/devops-challenge-flask-angular-frontend

Estas imágenes son utilizadas tanto por Docker Compose como por Kubernetes, evitando builds locales y asegurando coherencia entre entornos.

---

## Estrategia de tags

Cada imagen se publica con dos tags:

- **latest**  
  Generado automáticamente en cada push a la rama `main`.

- **sha**  
  Generado siempre, permite trazar exactamente qué commit produjo cada imagen.

Ejemplo de tags:

- ghcr.io/alfremu/devops-challenge-flask-angular-backend:latest  
  👉 https://ghcr.io/alfremu/devops-challenge-flask-angular-backend

- ghcr.io/alfremu/devops-challenge-flask-angular-backend:3f2a1c9  
  👉 https://ghcr.io/alfremu/devops-challenge-flask-angular-backend

Esta estrategia facilita:
- debugging
- rollback
- alineación entre código e imagen en ejecución

---

## Detalles del pipeline

- El pipeline contiene jobs independientes para backend y frontend.
- Cada job se ejecuta solo si hay cambios en su directorio correspondiente.
- Esto evita builds innecesarios y reduce tiempos de ejecución.

Este enfoque permite escalar el proyecto agregando nuevos servicios sin duplicar pipelines.

---

## Relación con Docker Compose y Kubernetes

Las imágenes generadas por el pipeline son consumidas directamente por:

- **Docker Compose**  
  Para validación local del sistema completo.

- **Kubernetes**  
  Para despliegue en un cluster real.

De esta forma se separa claramente:

- el proceso de **build** (CI/CD)
- del proceso de **ejecución** (Compose / Kubernetes)
