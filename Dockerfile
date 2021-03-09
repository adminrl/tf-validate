# base image

FROM ubuntu:20.04

# Install tools and packages

RUN \
apt-get update && \
apt-get -y upgrade && \
apt-get -y install tree findutils xjobs wget unzip git \
wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip \
unzip terraform_0.14.7_linux_amd64.zip \
mv terraform /usr/local/bin/ \


RUN \
mkdir /root/validate-test \
cd /root/validate-test \
git clone https://github.com/adminrl/tf-validate.git \

WORKDIR /root/validate-test

RUN chmod +x /root/validate-test/validate.sh

# Copies your code file from your action repository to the filesystem path `/` of the container
#COPY adminrl/tf-validate/validate.sh  /validate.sh


# Executes `validate.sh`
#ENTRYPOINT ["/validate.sh"]


# Add files: configs, scripts, templates etc.
#ADD root/.bashrc /root/.bashrc

# Set environment variables.
#ENV HOME /root

# Define working directory.
#WORKDIR /root

# Define default command.
#CMD ["bash"]

