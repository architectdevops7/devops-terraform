vpc_cidr_block = "10.0.0.0/16"
lc_name = "my-lc"
ami_id = "ami-0646513672e4fb341"
instance_type = "t2.micro"
user_data = <<-EOF
            #!/bin/bash
            yum update -y
            yum install -y httpd
            echo '<html><h1>Hello, Welcome to terraform</h1></html>' > /var/www/html/index.html
            systemctl start httpd
            systemctl enable httpd
            EOF
target_group_name = "my-target-group"
asg_name = "my-asg"
min_size = 1
max_size = 3
desired_capacity = 2