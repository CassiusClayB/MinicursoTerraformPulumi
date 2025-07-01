# 🏗️ Minicurso IaC – Terraform e Pulumi na Prática

Este repositório contém exemplos práticos de **Infraestrutura como Código (IaC)** usando duas ferramentas amplamente utilizadas: 

- link da apresentação [Apresentação](https://docs.google.com/presentation/d/1SFCYiH5zLhferloK-h2FgZ6cBq0lM36fpBEx4RgtdRU/edit?usp=sharing)

- [Terraform](https://www.terraform.io/)
- [Pulumi](https://www.pulumi.com/) (com Python)

Você aprenderá a provisionar dois recursos na AWS:
- Uma instância **EC2**
- Um bucket **S3**

---

## 🔧 Pré-requisitos

Antes de iniciar, é necessário:

- Ter uma conta ativa na [AWS](https://aws.amazon.com/)
- Ter acesso à sua **chave de acesso (AWS_ACCESS_KEY_ID)** e **chave secreta (AWS_SECRET_ACCESS_KEY)**
- Ter instalado em seu sistema:
  - Terraform
  - Pulumi
  - Python 3.8+ (para o Pulumi)

---

## 📦 Estrutura do Projeto

```bash
iac-minicurso/
├── terraform/        # Código em HCL para provisionamento com Terraform
├── pulumi/           # Código em Python para uso com Pulumi
└── README.md         # Este documento
```

## 🟩 Terraform

### 📂 O que tem na pasta `terraform/`:

| Arquivo            | Função                                                                 |
|--------------------|------------------------------------------------------------------------|
| `main.tf`          | Código principal que define a instância EC2 e o bucket S3              |
| `variables.tf`     | Declaração de variáveis como região, AMI e nome do bucket              |
| `terraform.tfvars` | Valores reais das variáveis (credenciais e configurações do grupo)     |
| `outputs.tf`       | Exibe o ID da EC2 e o nome do bucket após provisionamento              |

---

### ✅ Como instalar o Terraform

#### Linux:

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

#### Windows (Chocolatey):
```bash
choco install terraform
```

#### ▶️ Como rodar

```bash
cd terraform/
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

#### 🧾 Exemplo do terraform.tfvars

```bash
access_key   = "SUA_AWS_ACCESS_KEY"
secret_key   = "SUA_AWS_SECRET_KEY"
region       = "us-east-1"
ami_id       = "ami-0c55b159cbfafe1f0"
bucket_name  = "meu-bucket-minicurso01"
```

#### ❌ Como destruir os recursos
```bash
terraform destroy -var-file="terraform.tfvars"
``` 

## 🐍 Pulumi (com Python)

### 📂 O que tem na pasta `pulumi/`:

| Arquivo            | Função                                                         |
|--------------------|----------------------------------------------------------------|
| `__main__.py`      | Código principal em Python que cria a EC2 e o bucket S3        |
| `Pulumi.yaml`      | Metadados do projeto (nome, descrição, runtime)                |
| `requirements.txt` | Dependências do projeto (Pulumi e Pulumi AWS SDK)              |

---

### ✅ Como instalar o Pulumi

#### 1. Instale o Pulumi CLI

**Linux ou Mac:**

```bash
curl -fsSL https://get.pulumi.com | sh
```


**Windows (PowerShell):**
```bash
iex ((New-Object System.Net.WebClient).DownloadString('https://get.pulumi.com/install.ps1'))
```

####  2. Instale as dependências Python
```bash
cd pulumi/
python -m venv venv
source venv/bin/activate   # No Windows: venv\Scripts\activate
pip install -r requirements.txt
```

#### ▶️ Como rodar

# Login local
pulumi login --local

# Definir configurações
pulumi config set aws:region us-east-1
pulumi config set ami_id ami-0c55b159cbfafe1f0

# Rodar
pulumi up


#### ❌ Como destruir os recursos
```bash
pulumi destroy
```


### 📊 Comparação rápida

| Item                 | Terraform         |   Pulumi (Python)   |
| -------------------- | ----------------- | :-----------------: |
| Linguagem            | HCL (declarativo) | Python (imperativo) |
| Popularidade         | Alta              |      Crescendo      |
| Curva de aprendizado | Baixa             |    Intermediária    |
| Ideal para           | Times DevOps      | Times Devs + Infra  |


#### 🛡️ Segurança

Nunca exponha sua AWS_ACCESS_KEY e SECRET_KEY em arquivos públicos.

Adicione terraform.tfvars e venv/ ao .gitignore se for publicar o projeto.

Use usuários IAM com permissões mínimas para testes.
