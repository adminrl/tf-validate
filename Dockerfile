# base image

FROM ubuntu:20.04

# Install tools and packages

RUN \
# Update
sudo apt-get update && \
sudo apt-get -y upgrade && \
# Install Tree, Findutils, Xjobs, Wget, Unzip
sudo apt-get -y install tree findutils xjobs wget unzip \
#Install Terraform
sudo wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip \
# Unzip 
sudo unzip terraform_0.14.7_linux_amd64.zip \
# Move to local bin
mv terraform /usr/local/bin/ \
# Check to see if Terraform is installed
terraform --version 

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY adminrl/tf-validate/validate.sh  /validate.sh

RUN chmod +x validate.sh

# Executes `validate.sh`
ENTRYPOINT ["/validate.sh"]


# Add files: configs, scripts, templates etc.
#ADD root/.bashrc /root/.bashrc

# Set environment variables.
#ENV HOME /root

# Define working directory.
#WORKDIR /root

# Define default command.
#CMD ["bash"]

