# jenkins_project

Note For vpc task, you can use module: 
Please create the VPC using terraform. Make sure the code work in every region of AWS. 
1. VPC
6 subnets
   3 private 
   3 public 
Public subnets should have IGW attached to it. 
Private subnets should have NG attached to it. 
Configure route tables properly. Once private and public subnet created, please create ec2 instance (manually)  on public subnet and ping google.com. If everything is successful, you should have proper response

Moving forward, on that VPC you just provisioned, please create ec2 intance to install jenkins. Jenkins has to be installed using terraform provisioner. One command should create VPC with the components, and build jenkins on top of it. Once the jenkins up and running, please print out the username password as an output

Please read the instructions and requirements of the instance needed for jenkins
