# 🌍 Terraform Infraestrutura - Estudo Pessoal

Este projeto contém uma estrutura modularizada de infraestrutura como código usando **Terraform**, com foco em boas práticas e reutilização via módulos.

A estrutura está organizada para simular ambientes reais, com provisionamento de recursos na AWS como **S3** e **CloudFront**.

## 📁 Estrutura do Projeto

```
.
├── modules/                  # Módulos reutilizáveis
│   ├── cloudfront/           # Módulo de CloudFront
│   │   ├── datasources.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── s3/                   # Módulo de S3
│       ├── datasources.tf
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── main.tf                   # Chama os módulos
├── outputs.tf                # Saídas principais
├── providers.tf              # Configuração do provider AWS
├── terraform.tfvars          # Variáveis com valores reais
├── variables.tf              # Declaração das variáveis
├── terraform.tfstate         # Arquivo de estado (gerado automaticamente)
└── terraform.tfstate.backup  # Backup do estado
```

## ⚙️ Como Usar

1. **Configure o provider**  
   Ajuste o `providers.tf` com a região desejada e o profile se necessário:

   ```hcl
   provider "aws" {
     region = var.region
     profile = "default"
   }
   ```

2. **Configure variáveis**  
   Edite o `terraform.tfvars` com os valores apropriados, por exemplo:

   ```hcl
   region         = "us-east-1"
   bucket_name    = "meu-bucket-teste-terraform"
   environment    = "dev"
   ```

3. **Inicialize o projeto**  
   ```bash
   terraform init
   ```

4. **Valide e visualize o plano**  
   ```bash
   terraform plan -var-file="terraform.tfvars"
   ```

5. **Aplique as mudanças**  
   ```bash
   terraform apply -var-file="terraform.tfvars"
   ```

6. **Destrua recursos (se quiser)**  
   ```bash
   terraform destroy -var-file="terraform.tfvars"
   ```

## 📦 Módulos Implementados

- **S3**  
  Criação de buckets, configuração de versionamento, políticas públicas/privadas.

- **CloudFront**  
  Distribuição CDN ligada ao bucket S3, com configurações customizadas.

## 📌 Observações

- O estado do Terraform (`terraform.tfstate`) está sendo salvo localmente.  
  - Em ambiente real, recomenda-se usar um backend remoto (como S3 + DynamoDB).
- Os módulos podem ser facilmente reutilizados para outros ambientes como `staging`, `prod`, etc.
- O `.tfvars` permite alternar configurações rapidamente sem alterar os arquivos `.tf`.

## 🧰 Requisitos

- Terraform >= 1.3
- AWS CLI configurado
- Permissões mínimas para criação dos recursos no IAM

## 🛠 Tecnologias

- **Terraform**
- **AWS S3**
- **AWS CloudFront**
- **Módulos reutilizáveis**

## 🧪 Objetivo

Este repositório é de **uso educacional**, para reforçar conceitos como:

- Modularização
- Separação de ambientes
- Uso de variáveis e arquivos `.tfvars`
- Boas práticas com `outputs`, `datasources` e estrutura limpa

## 📃 Licença

MIT
