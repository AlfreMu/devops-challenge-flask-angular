# Observabilidad— Prometheus & Grafana

Este documento describe la implementación de **observabilidad básica** del proyecto sobre Kubernetes.

El objetivo es contar con visibilidad mínima sobre el estado del cluster y las aplicaciones, manteniendo un alcance **simple y realista** para un proyecto DevOps Jr.

---

## 🎯 Objetivo

- Monitorear el estado del cluster Kubernetes
- Visualizar consumo de recursos (CPU / memoria)
- Validar que los servicios estén operativos

---

## 🧰 Stack

- **Prometheus** — recolección de métricas
- **Grafana** — visualización
- **Helm** — instalación y gestión
- **Namespace:** `monitoring`

---

## 🚀 Instalación

La observabilidad se instala en el cluster mediante **Helm**, utilizando un stack liviano basado en `kube-prometheus-stack`.

La instalación y configuración se versionan en el repositorio mediante un archivo `values.yaml`.

---

## 📊 Validación

### Grafana

- Grafana se expone mediante **NodePort**
- Permite visualizar dashboards de:
  - Node
  - Pods
  - Consumo de recursos

### Prometheus

- Prometheus recolecta métricas del cluster
- Targets en estado **UP**
  - node-exporter
  - kube-state-metrics
  - kubelet

---

## 📌 Alcance

Incluido:
- Métricas de infraestructura y workloads
- Dashboards básicos

Excluido (fuera de alcance):
- Alerting
- Logs
- Tracing

---

## ✅ Estado actual

- Prometheus operativo
- Grafana accesible
- Dashboards funcionales
- Observabilidad lista para demo y documentación
