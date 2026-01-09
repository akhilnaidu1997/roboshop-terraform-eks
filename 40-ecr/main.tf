resource "aws_ecr_repository" "ECR-catalogue" {
  name                 = "${var.project}/catalogue"
  image_tag_mutability = var.mutability
  force_delete = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "ECR-user" {
  name                 = "${var.project}/user"
  image_tag_mutability = var.mutability
  force_delete = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "ECR-cart" {
  name                 = "${var.project}/cart"
  image_tag_mutability = var.mutability
  force_delete = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "ECR-shipping" {
  name                 = "${var.project}/shipping"
  image_tag_mutability = var.mutability
  force_delete = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "ECR-payment" {
  name                 = "${var.project}/payment"
  image_tag_mutability = var.mutability
  force_delete = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "ECR-frontend" {
  name                 = "${var.project}/frontend"
  image_tag_mutability = var.mutability
  force_delete = true

  image_scanning_configuration {
    scan_on_push = false
  }
}