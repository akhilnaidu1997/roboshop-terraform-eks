variable "project" {
    default = "roboshop"
}
variable "environment" {
    default = "dev"
}
variable "sg_name" {
    default = [
        # databases
        "mongodb","redis","rabbitmq","mysql",
        # bastion sg
        "bastion",
        # Ingress-alb
        "ingress-alb",
        # eks control plane
        "eks_control_plane",
        # worker nodes
        "eks_nodes"
        ]
}
variable "sg_desc" {
    default = "create sg for all modules"
}
