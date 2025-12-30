resource "aws_security_group_rule" "bastion_sg_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = local.bastion_sg_id
  cidr_blocks =  ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "mongodb_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = local.mongodb_sg_id
  source_security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "redis_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = local.redis_sg_id
  source_security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "rabbitmq_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = local.rabbitmq_sg_id
  source_security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = local.mysql_sg_id
  source_security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "ingress_alb_rule" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = local.ingress_alb_sg_id
  cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group_rule" "eks_control_plane_bastion" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = local.eks_control_plane_sg_id
  source_security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "eks_nodes_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = local.eks_nodes_sg_id
  source_security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "eks_control_plane_nodes" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = local.eks_control_plane_sg_id
  source_security_group_id = local.eks_nodes_sg_id
}

resource "aws_security_group_rule" "eks_nodes_eks_control_plane" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = local.eks_nodes_sg_id
  source_security_group_id = local.eks_control_plane_sg_id
}

resource "aws_security_group_rule" "eks_nodes" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = local.eks_nodes_sg_id
  cidr_blocks = [ "10.0.0.0/16" ]
}