# CRAVAT-P Galaxy Docker

##### Description:
A docker flavor extended from the Galaxy docker image to include the CRAVAT-P demonstration material.



##### What's included:
- CRAVAT-P submit, intersect, annotate, and retrieve Galaxy tool
- CRAVAT Galaxy Viewer
- Input files (i.e., VCF and proBED files)
- Basic CRAVAT Workflow
---
# Docker Guide:
1.) Install Docker for  [Mac](https://docs.docker.com/docker-for-mac/install/) or [PC](https://docs.docker.com/docker-for-windows/install/). Open Docker.

2.) Open your terminal. Run the following command:
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


3.) Wait a few moments for the Docker image to initialize. Open ***http://localhost:8080*** and follow the next guide.

![logo](https://github.com/jraysajulga/cravatp-galaxy-docker/blob/master/graphics/step 1.gif.gif?raw=true)

---
# CRAVAT-P in Galaxy Guide:

*OVERVIEW*

|                          |                    |                       |
| ------------------------ | ------------------ | --------------------  |
| Import the input files → | Run the workflow → | Access the visualizer |
|                          |                    |                       |

1.) Import the input files:
* click *Shared Data* > *Data Libraries*,
* open *Training Data* > *Input files for CRAVAT-P Demo*,
* click the checkbox in the header to select both input files,
* click *to History*,
* *optional: name your new history (e.g., mcf7_cancer_proteogenomics)*,
* click on the green pop-up window to start analyzing.

2.) To access the dockerized CRAVAT-P workflow, you need to log in using this account:

| | | 
| ------------------------ | ------------------ |
|  **Username:**              | admin@galaxy.org |
| **Password:**  | admin |
| | | 

2.) 


