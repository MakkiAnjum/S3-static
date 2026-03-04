# ☁️ Cloud Engineer Portfolio (S3-Hosted)

This project is a clean, minimalist portfolio website designed to showcase my journey and skills as a **Cloud Engineer**. It is intentionally built as a single-file static site to demonstrate high-availability hosting using cloud-native object storage.

## 🚀 Live Demo

**URL:** [View My Portfolio](http://aws-cloud-engineer-to-certified.s3-website.eu-north-1.amazonaws.com/static.html)

## 🛠 Tech Stack

* **Frontend:** HTML5, CSS3 (Internal Styles)
* **Infrastructure:** Amazon S3 (Simple Storage Service)
* **Region:** `eu-north-1` (Stockholm)

## 🏗 Infrastructure Details

As a Cloud Engineer, I chose this deployment method to highlight:

* **Static Site Hosting:** Leveraging S3's built-in web server capabilities.
* **Cost-Efficiency:** Utilizing serverless storage to minimize overhead.
* **IAM & Permissions:** Configured Bucket Policies to allow public read access for the `static.html` object while maintaining secure bucket settings.
* **High Availability:** Hosted on AWS global infrastructure with 99.99% availability.

## Architecture diagram
![alt text](https://github.com/makkianjum/S3-static/blob/main/infra.png?raw=true)

## 📂 Project Structure

```text
.
├── static.html        # The main portfolio file (HTML + CSS)
└── README.md          # Documentation of the project

