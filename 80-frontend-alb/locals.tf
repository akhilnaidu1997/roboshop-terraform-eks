locals {
  common_name_suffix = "${var.project}-${var.environment}"
  ingress_alb_id = data.aws_ssm_parameter.ingress_alb_id.value
  public_subnet_ids = split(",",data.aws_ssm_parameter.public_subnet_ids.value)
  certificate_arn = data.aws_ssm_parameter.certificate_arn.value
  vpc_id = data.aws_ssm_parameter.vpc_id.id
  common_tags = {
    project = var.project
    environment = var.environment
    Terraform = "True"
  }
}