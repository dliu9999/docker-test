ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

FROM $BASE_CONTAINER

# change to root to install packages
USER root

RUN	apt-get install -y aria2 nmap traceroute

# install packages
RUN pip install geopandas babypandas

# change back to notebook user
COPY /run_jupyter.sh /
RUN chmod 755 /run_jupyter.sh
USER $NB_UID
