rgs-preprod = {
  rgs1 = {
    rg_name  = "azure-rgs"
    location = "CentralIndia"
  }
}

vnet-preprod = {
  vnet1 = {
    vnet_name     = "azure-vnet"
    rg_name       = "azure-rgs"
    location      = "CentralIndia"
    address_space = ["10.0.0.0/16"]
  }
}

subnet-preprod = {
  subnet1 = {
    subnet_name      = "azure-subnet1"
    rg_name          = "azure-rgs"
    vnet_name        = "azure-vnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name      = "azure-subnet2"
    rg_name          = "azure-rgs"
    vnet_name        = "azure-vnet"
    address_prefixes = ["10.0.2.0/24"]
  }
  subnet3 = {
    subnet_name      = "AzureBastionSubnet"
    rg_name          = "azure-rgs"
    vnet_name        = "azure-vnet"
    address_prefixes = ["10.0.3.0/24"]
  }
}

nic-preprod = {
  nic1 = {
    nic_name    = "frontend-nic"
    rg_name     = "azure-rgs"
    location    = "CentralIndia"
    subnet_name = "azure-subnet"
    vnet_name   = "azure-vnet"
  }
  nic2 = {
    nic_name    = "backend-nic"
    rg_name     = "azure-rgs"
    location    = "CentralIndia"
    subnet_name = "azure-subnet2"
    vnet_name   = "azure-vnet"
  }
}

public-preprod = {
  public1 = {
    public_name = "azure-public"
    location    = "CentralIndia"
    rg_name     = "azure-rgs"
  }
}

nat-preprod = {
  nat1 = {
    nat_name = "nat-gateway"
    location = "centralIndia"
    rg_name  = "azure-rg"
  }
}

bastion-preprod = {
  bastion1 = {
    bastion_name = "azure-bestion"
    rg_name      = "azure-rgs"
    location     = "CentralIndia"
    vnet_name    = "azure-vnet"
    subnet_name  = "AzureBastionSubnet"
    public_name  = "azure-public"
  }
}

vm-preprod = {
  vm1 = {
    vm_name  = "frontend-vm"
    rg_name  = "azure-rgs"
    location = "CentraIndia"
    nic_name = "frontend-nic"
    nsg_name = "azure-nsg"
  }
  vm2 = {
    vm_name  = "backend-vm"
    rg_name  = "azure-rgs"
    location = "CentraIndia"
    nic_name = "backend-nic"
    nsg_name = "azure-nsg"
  }
}
