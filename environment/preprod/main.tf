module "rg-axion" {
  source = "../../child/rg"
  rgs = var.rgs-preprod
}

module "vnet-axion" {
    depends_on = [ module.rg-axion ]
  source = "../../child/vnet"
  vnet = var.vnet-preprod
}

module "subnet-axion" {
    depends_on = [ module.rg-axion, module.vnet-axion ]
  source = "../../child/subnet"
  subnet = var.subnet-preprod
}

module "public-axion" {
    depends_on = [ module.rg-axion ]
  source = "../../child/public-ip"
  public = var.public-preprod
}

module "nic-axion" {
    depends_on = [ module.rg-axion, module.subnet-axion, module.vnet-axion ]
  source = "../../child/nic"
  nic = var.nic-preprod
}
module "nat-axion" {
    depends_on = [ module.rg-axion ]
  source = "../../child/nat"
  nat = var.nat-preprod
}

module "bastion-axion" {
    depends_on = [ module.rg-axion, module.public-axion, module.subnet-axion, module.vnet-axion ]
  source = "../../child/bastion"
  bastion = var.bastion-preprod
}
module "vm-axion" {
    depends_on = [ module.rg-axion, module.nic-axion, module.rg-axion ]
  source = "../../child/vm"
  vm = var.vm-preprod
}