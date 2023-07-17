FROM centos:7

# installs wget and unzip
RUN yum install wget unzip -y

# installs terraform v1.4.5
RUN wget https://releases.hashicorp.com/terraform/1.4.5/terraform_1.4.5_linux_amd64.zip && \
    unzip terraform_1.4.5_linux_amd64.zip && \
    chmod +x terraform && \
    mv terraform /bin

# installs packer
RUN rm -rf /usr/sbin/packer && \
	yum install -y yum-utils && \
	yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
	yum -y install packer