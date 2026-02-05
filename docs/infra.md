# Infraestructura — Terraform + AWS EC2 + k3s

Este documento describe cómo se provisiona y opera la infraestructura cloud del proyecto utilizando **Infrastructure as Code (IaC)**.

El objetivo es demostrar un flujo **simple, reproducible y real**, adecuado para un proyecto de **portfolio DevOps Jr**.

---

## Objetivo de la infraestructura

- Provisionar infraestructura cloud desde código
- Ejecutar Kubernetes real (k3s)
- Soportar el deploy de aplicaciones backend y frontend
- Integrarse con CI/CD
- Mantener un alcance simple (sin overengineering)

---

## Stack de infraestructura

- **Cloud provider:** AWS
- **IaC:** Terraform
- **Compute:** EC2
- **OS:** Ubuntu Server 22.04 LTS
- **Orquestación:** Kubernetes (k3s)
- **CI/CD:** GitHub Actions (self-hosted runner)

---

## Arquitectura

Componentes principales:

- 1 instancia **EC2** (`t3.medium`)
- **Security Group** con reglas mínimas
- **k3s** instalado sobre la instancia
- **Self-hosted runner** para CD manual
- Aplicaciones desplegadas en Kubernetes
- Observabilidad corriendo en el mismo cluster

No se utilizan servicios administrados (EKS, ALB, RDS, etc.) para mantener el proyecto simple y enfocado.

---

## Estructura del código de infraestructura

```text
infra/
└── terraform/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── provider.tf
```
## Provisioning con Terraform

### Requisitos

- Terraform instalado
- Credenciales AWS configuradas (`aws configure`)
- Key Pair existente en AWS (para acceso SSH)

---

### Región y tipo de instancia

La infraestructura se despliega en:

- **Región:** `sa-east-1` (São Paulo)
- **Tipo de instancia:** `t3.medium`
- **Sistema operativo:** Ubuntu Server 22.04 LTS

La elección de `t3.medium` permite ejecutar:
- k3s
- workloads de aplicación
- observabilidad básica (Prometheus + Grafana)

sin problemas de memoria.

---

### Pasos para iniciar

Desde el root del repositorio:

```bash
cd infra/terraform
terraform init
terraform plan
terraform apply
```

### Recursos creados

Terraform crea y mantiene:

- 1 instancia EC2
- 1 Security Group
- Reglas de red asociadas

No se utilizan servicios administrados (EKS, ALB, etc.) para mantener el alcance simple.

### Security Group

El Security Group define reglas mínimas y explícitas, pensadas para operación y demo.

**Reglas de entrada (Inbound)**
- SSH (22)
  - Permitido solo desde la IP del operador
- NodePort — Frontend
  - Acceso a la aplicación Angular
- NodePort — Backend
  - Acceso a la API Flask
- NodePort — Grafana
  - Acceso a dashboards de observabilidad (solo para demo)

SSH no se expone de forma permanente a 0.0.0.0/0.

El Security Group define reglas mínimas y explícitas, pensadas para operación y demo.

**Reglas de salida (Outbound)**

Todo el tráfico permitido (configuración por defecto)


## Decisiones de diseño

- EC2 en lugar de EKS para reducir complejidad
- k3s para Kubernetes liviano y real
- Infra mínima, reproducible y fácil de entender
