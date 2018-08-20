# CRAVAT-P Galaxy Docker

###### Description:
A docker flavor extended from the Galaxy docker image to include the CRAVAT-P demonstration material.



###### What's included:
- CRAVAT-P submit, intersect, annotate, and retrieve Galaxy tool
- CRAVAT Galaxy Viewer
- Input files (i.e., VCF and proBED files)
- Basic CRAVAT Workflow
---
### Docker Guide:
1.) Install Docker for  [Mac](https://docs.docker.com/docker-for-mac/install/) or [PC](https://docs.docker.com/docker-for-windows/install/). Open Docker.

2.) Run the the following command in your terminal:
```sh
docker run -d -p 8080:80 jraysajulga/galaxy-cravatp-docker
```
 *For your information:* [Docker Command Line Interface](https://docs.docker.com/engine/reference/commandline/docker/)
```
docker run [OPTIONS] IMAGE [COMMAND]
```
| Element                           | Description                                                     | Type         |
| --------------------------------- | --------------------------------------------------------------- | -----------  |
| docker                            | The base command for the Docker CLI (Command Language Interface)| Base command |
| run                               | Run a command in a new container                                | Command      |
| -d, --detach                      | Run container in background and print container ID              | OPTION       |
| -p, --publish                     | Publish a container's port(s) to the host                       | OPTION       |
| jraysajulga/galaxy-cravatp-docker | **jraysajulga's** *galaxy-cravatp-docker* image                 | IMAGE        |


3.) Wait a few moments for the image to load. Open ***http://localhost:8080***.

---
### CRAVAT-P in Galaxy Guide:
##### OVERVIEW
| Import the input files → | Run the workflow → | Access the visualizer |
| ------------------------ | ------------------ | --------------------  |
|                          |                    |                       |

1.) Log in using the provided account (to access the input files within the Data Library):
- Username: admin@galaxy.org
- Password: admin

![logo](https://github.com/jraysajulga/cravatp-galaxy-docker/blob/master/graphics/gpcravatdocker-1.gif?raw=true)

