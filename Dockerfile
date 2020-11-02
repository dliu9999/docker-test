ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

FROM $BASE_CONTAINER

USER root

RUN	apt-get install aria2 nmap traceroute

# 3) install packages
RUN pip install geopandas babypandas

# 4) change back to notebook user
COPY /run_jupyter.sh /
USER $NB_UID

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]