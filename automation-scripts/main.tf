provider "aws"{
    profile = var.user_profile
    region  = var.region_name
}

module "web_server" {
    source = "./modules/web_server"

}