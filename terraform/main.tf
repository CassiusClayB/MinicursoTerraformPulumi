locals {
  config = {
    dev = {
      ec2_name    = "EC2-DEV"
      s3_name     = "bucket-dev"
    }
    prod = {
      ec2_name    = "EC2-PROD"
      s3_name     = "bucket-prod"
    }
  }

  selected = local.config[var.profile]
}

provider "local" {}

resource "local_file" "ec2_simulation" {
  content = <<EOF
EC2 Simulado:
- Nome: ${local.selected.ec2_name}
- AMI: ${var.ami_id}
- IP Privado: 192.168.0.10
- Sistema Operacional: Ubuntu 22.04
- Sub-rede: subnet-abc123
- Status: running
EOF

  filename           = "${path.module}/simulated_output/ec2-${var.profile}.txt"
  directory_permission = "0777"
  file_permission      = "0777"
}

resource "local_file" "s3_simulation" {
  content = <<EOF
Bucket Simulado:
- Nome: ${local.selected.s3_name}
- Bucket real: ${var.bucket_name}
- Região: us-east-1
- Versionamento: habilitado
- Política: leitura pública
- Arquivos:
  - index.html
  - style.css
  - script.js
EOF

  filename           = "${path.module}/simulated_output/s3-${var.profile}.txt"
  directory_permission = "0777"
  file_permission      = "0777"
}
