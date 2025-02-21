# online-store-microservices

This is a sample application designed to illustrate various concepts related to containers on AWS. It presents a sample retail store application including a product catalog, shopping cart and checkout.

It provides:

- A distributed component architecture in various languages and frameworks
- Utilization of a variety of different persistence backends for different components like MariaDB (or MySQL), DynamoDB and Redis
- The ability to run in various container orchestration technologies like Docker Compose, Kubernetes etc.
- Pre-built container images for both x86-64 and ARM64 CPU architectures
- All components instrumented for Prometheus metrics and OpenTelemetry OTLP tracing
- Support for Istio on Kubernetes
- Load generator which exercises all of the infrastructure

**This project is intended for educational purposes only and not for production use.**
The project is based on 'AWS Containers Retail Sample' by Amazon.com, Inc. and modified under the MIT License. 

![Screenshot](/docs/images/screenshot.png)

## Application Architecture

The application has been deliberately over-engineered to generate multiple de-coupled components. These components generally have different infrastructure dependencies, and may support multiple "backends" (example: Carts service supports MongoDB or DynamoDB).

![Architecture](/docs/images/architecture.png)

| Component                                                                                                                   | Language | Container Image                                                             | Description                                                                 |
| --------------------------------------------------------------------------------------------------------------------------- | -------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| ![ui workflow](https://github.com/aws-containers/retail-store-sample-app/actions/workflows/ci-ui.yml/badge.svg)             | Java     | [Link](https://gallery.ecr.aws/aws-containers/retail-store-sample-ui)       | Aggregates API calls to the various other services and renders the HTML UI. |
| ![catalog workflow](https://github.com/aws-containers/retail-store-sample-app/actions/workflows/ci-catalog.yml/badge.svg)   | Go       | [Link](https://gallery.ecr.aws/aws-containers/retail-store-sample-catalog)  | Product catalog API                                                         |
| ![cart workflow](https://github.com/aws-containers/retail-store-sample-app/actions/workflows/ci-cart.yml/badge.svg)         | Java     | [Link](https://gallery.ecr.aws/aws-containers/retail-store-sample-cart)     | User shopping carts API                                                     |
| ![orders workflow](https://github.com/aws-containers/retail-store-sample-app/actions/workflows/ci-orders.yml/badge.svg)     | Java     | [Link](https://gallery.ecr.aws/aws-containers/retail-store-sample-orders)   | User orders API                                                             |
| ![checkout workflow](https://github.com/aws-containers/retail-store-sample-app/actions/workflows/ci-checkout.yml/badge.svg) | Node     | [Link](https://gallery.ecr.aws/aws-containers/retail-store-sample-checkout) | API to orchestrate the checkout process                                     |
| ![assets workflow](https://github.com/aws-containers/retail-store-sample-app/actions/workflows/ci-assets.yml/badge.svg)     | Nginx    | [Link](https://gallery.ecr.aws/aws-containers/retail-store-sample-assets)   | Serves static assets like images related to the product catalog             |



## Quickstart

The following sections provide quickstart instructions for various platforms. 

### Terraform

In the original project the following options are available to deploy the application using Terraform:

| Name                                                    | Description                                                                                                     |
| ------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| [Amazon EKS]                                            | Deploys the application to Amazon EKS using other AWS services for dependencies, such as RDS, DynamoDB etc.     |
| [Amazon EKS (Minimal)]                                  | Deploys the application to Amazon EKS using in-cluster dependencies instead of RDS, DynamoDB etc.               |
| [Amazon ECS]                                            | Deploys the application to Amazon ECS using other AWS services for dependencies, such as RDS, DynamoDB etc.     |
| [AWS App Runner]                                        | Deploys the application to AWS App Runner using other AWS services for dependencies, such as RDS, DynamoDB etc. |

In this project K3s Kubernetes Cluster is used.

### K3s Kubernetes 

In this project a K3s kubernetes cluster is created in AWS and the applicationis deployed in this k3s Kubernetes cluster.

