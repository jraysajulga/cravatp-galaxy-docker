# CRAVAT-P Galaxy Docker
---
###### Description:
A docker flavor extended from the Galaxy docker image to include the CRAVAT-P demonstration material.



###### What's included:
- CRAVAT-P submit, intersect, annotate, and retrieve Galaxy tool
- CRAVAT Galaxy Viewer
- Input files (i.e., VCF and proBED files)
- Basic CRAVAT Workflow
---
#### Installation Guide:
1.) Install Docker for  [Mac](https://docs.docker.com/docker-for-mac/install/) or [PC](https://docs.docker.com/docker-for-windows/install/). Open Docker and make sure its working properly.

2.) Run the the following command in your terminal:
```sh
docker run -p 8080:80 jraysajulga/galaxy-cravatp-docker
```
*This command retrieves the ***galaxy-cravatp-docker*** image and assigns it to your 8080 port.*

3.) Wait a few moments for the image to load. Open ***http://localhost:8080***.
