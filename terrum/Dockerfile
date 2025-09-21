# Use the smallest official Oracle Linux image as the base image
FROM ${{ vars.ORACLE_BASE_IMAGE }}

# Set build argument for Terraform version
ARG TERRAFORM_VERSION="${{ vars.TERRAFORM_VERSION }}"

# Set a working directory inside the container
WORKDIR /tmp

# Install the necessary tools
# --no-cache ensure that package lists are not stored, reducing image size
RUN apk add --no-cache curl unzip

# Download, extract, and install Terraform
RUN curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin/ && \
    rm /tmp/terraform.zip

# Clean up remaining unnecessary files and directories
RUN apk del curl unzip

# Exposing port 9090 for Prometheus
EXPOSE 9090

# Set the entrypoint to Terraform
ENTRYPOINT ["/usr/local/bin/terraform"]

# Print Terraform version
CMD ["version"]
