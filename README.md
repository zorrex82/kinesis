# Setting Up and Deploying Environments with Terraform

This guide outlines the process to configure and execute a Terraform deployment script for different environments (DEV, QA, and PROD) using Bitbucket Pipelines.


## Prerequisites

1. **Bitbucket Repository**: Ensure you have a Bitbucket repository set up to host your Terraform configuration.
2. **AWS Account**: Have access to an AWS account and configure the AWS CLI with necessary credentials.

## Directory Structure

```plaintext
.
├── environments
│   ├── dev
│   ├── qa
│   └── prod
├── modules
│   ├── bucket_s3
│   ├── kinesis_analytics
│   ├── kinesis_firehose
│   ├── kinesis_stream
│   └── name_convention
├── deployment_files
│   └── code_deployment.zip
└── bitbucket-pipelines.yml
```
* environments: Contains directories for DEV, QA, and PROD environments.

* modules: Contains all modules to create resources in AWS.

* deployment_files: Contains zip file with the Flink Code.

* bitbucket-pipelines.yml: Configuration for the CI/CD pipeline.

## Bitbucket Pipelines Configuration (`bitbucket-pipelines.yml`)

```yaml
pipelines:
  branches:
    dev:
      - step:
          name: Deploy DEV
          script:
            - export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
            - export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
            - cd environments/dev
            - terraform init
            - terraform apply -auto-approve

    qa:
      - step:
          name: Deploy QA
          script:
            - export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
            - export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
            - cd environments/qa
            - terraform init
            - terraform apply -auto-approve

    prod:
      - step:
          name: Deploy PROD
          script:
            - export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
            - export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY         
            - cd environments/prod
            - terraform init
            - terraform apply -auto-approve
```

## Execution Steps
1. **Clone Repository:** Clone the Bitbucket repository to your local machine.

2. **Configure Terraform Files:** Ensure your Terraform configuration files are appropriately set up within each environment directory (dev, qa, prod).

3. **Commit Changes:** Make necessary changes to your Terraform configuration files based on the environment requirements and commit the changes to the respective branch (e.g., dev, qa, prod).

4. **Push to Bitbucket:** Push the changes to the corresponding branch on Bitbucket (e.g., dev, qa, prod).

5. **Pipeline Execution:** Bitbucket Pipelines will automatically trigger the appropriate deployment step based on the branch pushed.

6. **Deployment:** Terraform will initialize and apply the changes for the respective environment.

## Setting up AWS Credentials in Bitbucket

1. **Access Bitbucket:**
   Log in to your Bitbucket account and navigate to the repository where you want to configure the credentials.

2. **Access Repository Settings:**
   In the repository, click on "Settings" in the left-hand sidebar to access the repository settings.

3. **Access Environment Variables:**
   In the left menu, scroll down to find the "Pipelines" section and click on "Environment variables".

4. **Add AWS Credentials:**
   Click on "Create variable" to add a new environment variable. You will need to add two variables: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

   - **AWS_ACCESS_KEY_ID:** Name the variable as `AWS_ACCESS_KEY_ID` and add the value of your AWS access key.

   - **AWS_SECRET_ACCESS_KEY:** Name the variable as `AWS_SECRET_ACCESS_KEY` and add the value of your AWS secret key.

5. **Save Environment Variables:**
   Click "Add" or "Save" to save the environment variables.
