# DevOps Intern Assignment

## Objective
This project demonstrates a basic infrastructure and CI/CD pipeline that:
- Deploys an EC2 instance using Terraform.
- Builds a Docker image of a simple Python application and pushes it to Amazon ECR using GitHub Actions.

## Project Structure
├── .github 
│ └── workflows 
│    ├── deploy_ec2.yml 
│    └── docker_push.yml 
├── terraform 
│ ├── main.tf 
│ ├── variables.tf 
│ └── outputs.tf 
├── app 
│ ├── app.py 
│ ├── requirements.txt 
├── Dockerfile 
└── README.md


## Prerequisites
- An AWS Account with IAM user access.
- [Terraform](https://www.terraform.io/downloads.html) installed.
- [Docker](https://docs.docker.com/get-docker/) installed.
- [Git](https://git-scm.com/) installed.
- AWS CLI configured with the necessary credentials.

## Part 1: Deploy EC2 Instance Using Terraform
1. **Navigate to the `terraform` directory**:
    ```bash
    cd terraform
    ```
2. **Initialize Terraform**:
    ```bash
    terraform init
    ```
3. **Preview the changes** that Terraform will make:
    ```bash
    terraform plan
    ```
4. **Apply the changes** to create the EC2 instance:
    ```bash
    terraform apply -auto-approve
    ```
5. **Output**: After running the script, Terraform will output the public IP of the EC2 instance.

## Part 2: GitHub Actions Workflow for EC2 Deployment
1. The `deploy_ec2.yml` workflow file in the `.github/workflows` folder will:
   - Set up Terraform.
   - Authenticate with AWS using GitHub secrets.
   - Deploy the EC2 instance automatically on a push to the `main` branch or a pull request merge.

2. **GitHub Secrets**:
   - Add your AWS credentials (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) in the GitHub repository under **Settings** > **Secrets** > **Actions**.

## Part 3: Dockerize the Python Application and Push to ECR
1. **Navigate to the root directory** where the `Dockerfile` is located.
2. **Build the Docker image**:
    ```bash
    docker build -t my-flask-app .
    ```
3. **Run the Docker image locally** (optional):
    ```bash
    docker run -p 80:80 my-flask-app
    ```
4. **GitHub Actions Workflow**:
   - The `docker_push.yml` workflow builds the Docker image and pushes it to an Amazon ECR repository using GitHub Actions.
   - **AWS Secrets**: Add your AWS credentials and account ID as GitHub secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_ACCOUNT_ID`).

## Part 4: Running the Workflows
1. **Push to GitHub**:
   - Push any changes to the `main` branch to automatically trigger the GitHub Actions workflows.
   - Ensure that the `deploy_ec2.yml` and `docker_push.yml` files are correctly set up in the `.github/workflows` directory.
2. **Workflow Triggers**:
   - The `deploy_ec2.yml` workflow runs on push to `main` or a pull request merge.
   - The `docker_push.yml` workflow builds and pushes the Docker image on push to `main`.

## Additional Notes
- Ensure that you have a valid AWS AMI ID in `main.tf` for the EC2 instance.
- The Python app is a simple Flask application that runs on port 80.

## Troubleshooting
- **Terraform errors**: Double-check your AWS credentials and ensure Terraform is installed correctly.
- **Docker build issues**: Make sure the `Dockerfile` syntax is correct and all dependencies in `requirements.txt` are valid.
- **GitHub Actions**: Ensure that the GitHub secrets for AWS credentials are correctly set.

## References
- [Terraform Documentation](https://www.terraform.io/docs/)
- [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [GitHub Actions](https://docs.github.com/en/actions)
- [Docker Documentation](https://docs.docker.com/)
