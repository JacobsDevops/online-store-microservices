#terraform {
 # backend "http" {
  #}
#}

terraform {
  backend "s3" {
    bucket = "k3s-backend"          # new andy backend name
    key    = "terraform.tfstate"        # Path for the state file in the bucket
    region = "us-east-1"                # AWS region where your bucket is located
    # encryption is disabled
    # dynamodb_table is not used
  }
}
