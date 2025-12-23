# Random プロバイダを使う宣言
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "random" {}

# ランダム文字列を生成するリソース
resource "random_string" "fumika-random" {
  length  = 16   # お好きな文字列長でOK（例：16文字）
  special = false
  upper   = false # これを追加して大文字を禁止にします
}

# 出力変数
output "myrandom_output" {
  value = random_string.fumika-random.result
}

terraform {
  cloud {
    organization = "fumika-kouzaki-terraform"
    workspaces {
      name = "FUMIKA-boot-camp"
    }
  }
}
