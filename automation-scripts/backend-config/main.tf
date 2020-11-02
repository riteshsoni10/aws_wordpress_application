provider "aws" {
        region = "ap-south-1"
        profile = "aws_terraform_user"
}


## Create S3 Bucket to store the state files remotely

resource "aws_s3_bucket" "remote-backend-bucket" {
        bucket = "wp-infra-state"
        acl    = "private"
        versioning {
                enabled = true
        }
        force_destroy = true
        server_side_encryption_configuration {
                rule {
                        apply_server_side_encryption_by_default {
                                sse_algorithm = "AES256"
                        }
                }
        }
}



resource "aws_s3_bucket_public_access_block" "s3_block_public_access" {
        bucket = aws_s3_bucket.remote-backend-bucket.id
        block_public_acls = true
        block_public_policy = true
        restrict_public_buckets = true
        ignore_public_acls      = true
}

## Create Dynamo-DB for State Locking

resource "aws_dynamodb_table" "terraform_state_lock" {
        name = "terraform-state-lock"
        billing_mode = "PAY_PER_REQUEST"
        hash_key     = "LockID"

        attribute {
                name = "LockID"
                type = "S"
        }
}


