# Use the smallest official Oracle Linux image as the base image
FROM oraclelinux:10-slim

# Set build argument for Terraform version
ARG TERRAFORM_VERSION=1.12.2

# Set a working directory inside the container
WORKDIR /tmp

# Install the necessary tools
RUN dnf instsall -y curl unzip && \
    dnf clean all

# Download, extract, and install Terraform
RUN curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin/ && \
    rm /tmp/terraform.zip

# Exposing port 9090 for Prometheus
EXPOSE 9090

# Set the entrypoint to Terraform
ENTRYPOINT ["/usr/local/bin/terraform"]

# Print Terraform version
CMD ["version"]