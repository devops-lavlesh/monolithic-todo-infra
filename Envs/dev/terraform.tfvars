rgs = {
  dev_rg1 = {
    name     = "dev-rg-vri"
    location = "East US"
    tags = {
      costcenter = "12345"
    }
  }
}
vnets = {
  vnet1 = {
    name                = "dev-vnet1-vri"
    resource_group_name = "dev-rg-vri"
    location            = "East US"
    address_space       = ["10.0.0.0/16"]

    subnets = {
      subnet1 = {
        name             = "dev-subnet1-vri"
        address_prefixes = ["10.0.0.0/24"]
      }
    }
    tags = {
      costcenter = "12345"
    }
  }
}

pips = {
  pip1 = {
    name              = "dev-pip1-vri"
    location          = "East US"
    rg_name           = "dev-rg-vri"
    allocation_method = "Static"
    dns_settings = {
      domain_name_label = "dev-vri-app"
    }
    tags = {
      costcenter = "12345"
    }
  }
}

vms = {
  vm1 = {
    nic_name            = "dev-nic1-vri"
    location            = "East US"
    resource_group_name = "dev-rg-vri"
    vnet_name           = "dev-vnet1-vri"
    subnet_name         = "dev-subnet1-vri"
    pip_name            = "dev-pip1-vri"
    vm_name             = "dev-vm1-vri"
    admin_username      = "adminuser"
    admin_password      = "Devops@1001"
    size                = "Standard_B2s"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
