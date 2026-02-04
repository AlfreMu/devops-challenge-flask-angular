# Kubernetes

Este proyecto incluye manifests de **Kubernetes unificados y simples**.
El objetivo es mostrar cómo desplegar backend y frontend en Kubernetes de forma clara, ordenada y preparada para escalar, sin introducir complejidad innecesaria.

---

## Estructura de manifests

La estructura de Kubernetes del proyecto es la siguiente:
```text
k8s/
├─ namespace.yml
├─ backend/
│  ├─ deployment.yml
│  └─ service.yml
└─ frontend/
   ├─ deployment.yml
   └─ service.yml
```
---
## Namespace

Se utiliza un **namespace dedicado** para el proyecto:

- `devops-challenge`

Esto permite:
- Aislar los recursos del proyecto.
- Evitar colisiones con otros despliegues.
- Mantener una buena práctica básica de organización en Kubernetes.

---

## Deployments

El proyecto cuenta con dos Deployments:

- Backend (Flask)
- Frontend (Angular servido con Nginx)

Características principales:
- Imágenes consumidas directamente desde **GitHub Container Registry (GHCR)**.
- Réplicas configuradas para permitir alta disponibilidad básica.
- Labels y selectors consistentes para el correcto enrutamiento del tráfico.
- Probes de readiness y liveness definidas para verificar el estado de los pods.

---

## Services

Cada Deployment tiene su Service asociado:

- Tipo: **NodePort**
- Backend y frontend expuestos de forma independiente.
- Selección de pods mediante labels.

El uso de NodePort permite:
- Probar el acceso de manera simple.
- Evitar introducir Ingress o balanceadores externos en esta etapa.
- Facilitar la validación en un entorno de laboratorio o demo.

---

## Recursos (requests y limits)

Se definieron **requests y limits de CPU y memoria** en ambos Deployments.

Valores utilizados:
```text
- CPU:
  - request: 100m
  - limit: 250m
- Memoria:
  - request: 128Mi
  - limit: 256Mi
```

Definir estos valores permite:
- Un mejor control del consumo de recursos.
- Evitar que un pod consuma más de lo esperado.
- Dejar la base preparada para implementar autoscaling (HPA) en una fase posterior.

---

## Relación con CI/CD

Los manifests de Kubernetes consumen las **mismas imágenes** generadas por el pipeline de CI/CD.

Esto garantiza:
- Coherencia entre el código versionado y lo que se despliega.
- Un flujo claro: CI construye → registry almacena → Kubernetes ejecuta.
- Separación entre build y runtime.

---

## Aplicación de manifests

En un cluster Kubernetes real (por ejemplo k3s sobre una EC2), los manifests se aplicarían en el siguiente orden:

1) Crear el namespace.
2) Aplicar los recursos del backend.
3) Aplicar los recursos del frontend.

Los manifests están preparados para ejecutarse sin modificaciones adicionales en un entorno Kubernetes estándar.

---

## Estado actual

- Manifests unificados y ordenados.
- Namespace dedicado configurado.
- Deployments y Services definidos.
- Requests y limits aplicados según feedback del challenge.
- Listos para desplegarse en un cluster Kubernetes real.

La validación en ejecución se planifica para una fase posterior, utilizando una EC2 provisionada con **Infraestructura como Código (Terraform)** e instalación de **k3s**.
