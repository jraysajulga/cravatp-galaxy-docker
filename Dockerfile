# Galaxy - P Dockerized with Workflows
#
# VERSION 0.1

FROM bgruening/galaxy-sequence-tools:17.09

MAINTAINER Ray W. Sajulga Jr., jraysajulga@gmail.com

ENV GALAXY_CONFIG_BRAND P [CRAVAT Demo]

WORKDIR /galaxy-central

# Adds tool definitions to the container
ADD my_tool_list.yml $GALAXY_ROOT/tools.yaml

# Installs the defined tools
RUN install-tools $GALAXY_ROOT/tools.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf && \
    mkdir -p $GALAXY_HOME/workflows

# Mark folders as imported from the host.
# VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Adds the yaml file containing the data library information
ADD library_data.yaml $GALAXY_ROOT/library_data.yaml

# Adds the CRAVAT workflow to the docker image
ADD ./workflows/* $GALAXY_HOME/workflows/

# Add config/plugins/visualizations/cravatviewer
# ADD galaxy-central /export/

ADD cravatviewer /config/plugins/visualizations/

# Container Style
ADD welcome.html /export/

ENV GALAXY_CONFIG_TOOL_PATH=/galaxy-central/tools/

RUN startup_lite && \
    galaxy-wait  && \
#    curl -sL https://github.com/jraysajulga/CRAVAT-Galaxy-Visualizer/archive/master.tar.gz > master.tar.gz && \
#    tar -xf master.tar.gz CRAVAT-Galaxy-Visualizer-master && \
#    cp -r CRAVAT-Galaxy-Visualizer-master/cravatviewer/ config/plugins/visualizations/ && \
#    rm -rf master.tar.gz rm CRAVAT-Galaxy-Visualizer-master && \
    workflow-install --workflow_path $GALAXY_HOME/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD && \
    setup-data-libraries -i $GALAXY_ROOT/library_data.yaml -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD

RUN curl -sL https://github.com/bgruening/galaxytools/archive/master.tar.gz > master.tar.gz && \
	tar -xf master.tar.gz galaxytools-master/visualisations && \
	cp -r galaxytools-master/visualisations/dotplot/ config/plugins/visualizations/ && \
	cp -r galaxytools-master/visualisations/dbgraph/ config/plugins/visualizations/ && \
	rm -rf master.tar.gz rm galaxytools-master 
 
#RUN curl -sL https://github.com/jraysajulga/CRAVAT-Galaxy-Visualizer/archive/master.tar.gz > master.tar.gz && \
#	tar -xf master.tar.gz CRAVAT-Galaxy-Visualizer-master && \
#	cp -r CRAVAT-Galaxy-Visualizer-master/ config/plugins/visualizations/ && \
#	rm -rf master.tar.gz rm galaxytools-master   

