provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "logan-host" {
    ami = "ami-01f08ef3e76b957e5"
    instance_type = "t2.micro"
    key_name = "aws-logan-us-west-2"
    associate_public_ip_address = true
    root_block_device{
        volume_type = "gp2"
        volume_size = "30"
        delete_on_termination = true
    }
    security_groups = ["sgLoganUSw2"] 
    tags = {
        Name = "Loganhost"
    }
}

output "IPAddress" {
  value = "${aws_instance.logan-host.public_ip}"
}
