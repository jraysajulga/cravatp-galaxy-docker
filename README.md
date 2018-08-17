# CRAVAT-P Galaxy Docker
A docker flavor extended from the Galaxy docker image to include the CRAVAT-P demonstration material:
- CRAVAT-P submit, intersect, annotate, and retrieve Galaxy tool
- CRAVAT Galaxy Viewer
- Input files (i.e., VCF and proBED files)
- Basic CRAVAT Workflow

Instructions:

1.) Install Docker. Please follow the thorough instructions prepared by the Docker project here (https://docs.docker.com/installation/).

2.) Run the following command in your terminal:
```sh
docker run -d -p 8080:80 jraysajulga/cravat-docker
```
