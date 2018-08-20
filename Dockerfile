# Galaxy | CRAVAT-P Dockerized with Input Files, Workflow, Tool, and Visualization Plugin
#
# VERSION 0.1

FROM bgruening/galaxy-sequence-tools:17.09

MAINTAINER Ray W. Sajulga Jr., jraysajulga@gmail.com

ENV GALAXY_CONFIG_BRAND=" P [CRAVAT Demo]"

WORKDIR /galaxy-central

# Adds tool definitions to the container
ADD my_tool_list.yml $GALAXY_ROOT/tools.yaml

# Installs the defined tools
RUN install-tools $GALAXY_ROOT/tools.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf && \
    mkdir -p $GALAXY_HOME/workflows

# Adds the yaml file containing the data library information
ADD library_data.yaml $GALAXY_ROOT/library_data.yaml

# Adds the CRAVAT workflow to the docker image
ADD ./workflows/* $GALAXY_HOME/workflows/

# Container Style
ADD welcome.html /export/

ENV GALAXY_CONFIG_TOOL_PATH=/galaxy-central/tools/

RUN startup_lite && \
    galaxy-wait  && \
    curl -sL https://github.com/jraysajulga/CRAVAT-Galaxy-Visualizer/archive/docker_galaxy-v17.09.tar.gz > docker.tar.gz && \
    tar -xf docker.tar.gz CRAVAT-Galaxy-Visualizer-docker_galaxy-v17.09 && \
    cp -r CRAVAT-Galaxy-Visualizer-docker_galaxy-v17.09/cravatviewer /galaxy-central/config/plugins/visualizations/cravatviewer && \
    rm -rf master.tar.gz rm CRAVAT-Galaxy-Visualizer-docker_galaxy-v17.09 && \
    workflow-install --workflow_path $GALAXY_HOME/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD && \
    setup-data-libraries -i $GALAXY_ROOT/library_data.yaml -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD
