# Chatmosphere deployment

Deploy [chatmosphere](https://chatmosphere.cc/) application to AWS.

## Infrastructure

Chatmosphere is a Single page App. We need no backend to deploy it, just a server to store file
and a proxy to distribute hosted files.

The infra we choose is the following: 

- S3 Bucket to store static files
- Cloudfront to distribute static files
- ACM to generate a valid certificate

Also to deploy the application on this infra we need a user with restricted rights.

To manage this infra, we use [Terraform](https://www.terraform.io/)

## Deployment

The deployment is managed by circle-ci. On every push, the CI run the lint-git and build-app jobs.
To deploy the application, a [manual](https://circleci.com/docs/2.0/workflows/#holding-a-workflow-for-a-manual-approval)
is required.
