region  = "us-east-1" //update region
profile = "github"    //update this

// Compute values
key_name                    = "test_key"
template_file               = "./user_data/install.sh"
instance_type               = "t2.micro"
monitoring                  = true
subnet_id                   = true
vpc_security_group_ids      = [""]
sg_vpc_id                   = [""]
associate_public_ip_address = true

//EBS Values
delete_on_termination = true
device_name           = "/dev/sda1"
encrypted             = false
volume_size           = 10
volume_type           = "gp2"

// Network values
create_vpc               = true //if changed to false you will input the vpc, subnet etc
cidr_block               = "10.0.0.0/16"
subnet_availability_zone = "us-east-1e"
sg_name                  = ""
sg_description           = "test security group"

tags = {
  Name        = "terrafrom proje"
  Environment = "development"
  Project     = "NodejS"
  User        = "David"
}