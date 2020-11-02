terraform {
        backend "s3" {
                bucket         = "wp-infra-state"
                key            = "infrastructure/wp-mysql"
                region         = "ap-south-1"
                profile        = "aws_terraform_user"
                dynamodb_table = "terraform-state-lock"
                encrypt        = true
        }
}

