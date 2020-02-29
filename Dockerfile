# base image
FROM {{ IMAGE }}

# maintainer
MAINTAINER {{ MAINTAINER_MAIL }} 

# image labels
LABEL build.image="{{ LABEL }}"
LABEL build.tag="1.1.0"

# install some apt things
RUN apt-get update && apt-get install -y \
  git \
  gzip 


# copy some files
COPY {{ COPY_SOURCE }} {{ COPY_PATH }}

# set environmental variable
ENV VAR="{{ ENV_VARIABLE }}"

# expose some port
EXPOSE {{ PORT_TO_EXPOSE }}

# add some volume
ADD {{ ADD_SOURCE }} {{ ADD_PATH }}

# entrypoint of the container
ENTRYPOINT ["echo"]
CMD ["Hello from the container"]
