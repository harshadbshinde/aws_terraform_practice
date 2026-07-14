module "ec2" {
  source = "../module"
ami_ids = var.ami_ids
instance_type = var.instance_type
key_name = var.key_name
}

