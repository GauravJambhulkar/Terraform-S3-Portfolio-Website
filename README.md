# Terraform-S3-Portfolio-Website
A Terraform-based project to deploy a static website on AWS S3 with public access. This setup includes HTML, CSS, JavaScript, image, and PDF files, along with proper S3 bucket configuration for website hosting.
# S3 Static Website

This project uses Terraform to deploy a static website on AWS S3. The setup includes HTML, CSS, JavaScript, image, and PDF files, with proper S3 bucket configuration for website hosting.

## Features

- Hosting a static website on S3
- Public access configuration
- Proper MIME type settings for various file types
- Embedding and linking a PDF file in the HTML page

## Files

- `index.html`: Main HTML file with embedded and linked PDF.
- `error.html`: Custom error page.
- `profile.png`: Sample image.
- `script.js`: JavaScript file.
- `style.css`: CSS file.
- `document.pdf`: PDF file to be embedded or linked in `index.html`.
- `main.tf`: Terraform configuration file.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI configured with appropriate credentials
- An S3 bucket name set in your Terraform variables

## Usage

1. Clone the repository:
    ```sh
    https://github.com/GauravJambhulkar/Terraform-S3-Portfolio-Website.git
    cd Terraform-S3-Portfolio-Website
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Apply the Terraform configuration:
    ```sh
    terraform apply
    ```

4. Enter your desired S3 bucket name when prompted.

