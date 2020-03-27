data "terraform_remote_state" "dev" {
backend = "s3"
config = {
bucket = "terraform-project-backend-2020-team3"
key = "tower/us-east-1/tools/virginia/new-tower.tfstate"
region = "us-east-1"
}
}


output "VPC_ID" {
value = "${data.terraform_remote_state.team1.dev.VPC_ID}"
}
output "Private_Subnet1" {
value = "${data.terraform_remote_state.team1.dev.Private_Subnet1}"
}
output "Private_Subnet2" {
value = "${data.terraform_remote_state.team1.dev.Private_Subnet2}"
}
output "Private_Subnet3" {
value = "${data.terraform_remote_state.team1.dev.Private_Subnet3}"
}

