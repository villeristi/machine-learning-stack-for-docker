FROM python:3.6

# That's me \0/
LABEL maintainer="Wille <villeristimaki@gmail.com>"

ENV PYTHONBUFFERED=1
ENV CV_VERSION="3.4.2"
ENV NOTEBOOK_PWD="mldocker"

# Create folders
RUN mkdir /jupyter
WORKDIR /jupyter

# Add apt-level deps

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    software-properties-common \
    apt-transport-https \
    python3-software-properties \
    python3-setuptools \
    python3-dev \
    python-numpy \
    build-essential \
    cmake \
    gcc \
    wget \
    unzip \
    yasm \
    pkg-config \
    libswscale-dev \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavformat-dev \
    libpq-dev \
    libgtk2.0-dev

RUN apt-get update && apt-get install

# Add pip deps
RUN pip install -U pip
RUN pip install \
    jupyter \
    keras \
    matplotlib \
    mrjob \
    numpy \
    opencv-python \
    pandas \
    requests \
    scikit-learn \
    scipy \
    seaborn \
    tensorflow

# Clean up redundancies
RUN /bin/rm -rf \
    /builds \
    /downloads \
    /app/.git \
    /usr/share/man \
    /usr/share/info \
    /usr/share/doc \
    /var/lib/apt/lists/* \
    && apt-get remove -y --purge \
    python3-dev \
    python3-setuptools \
    gcc \
    cpp \
    build-essential \
    binutils \
    && apt-get clean -y \
    && apt-get autoclean \
    && apt-get autoremove -y

# Expose 8888
EXPOSE 8888

# Create local jupyter conf-folder
RUN mkdir -p  ~/.jupyter

# Disable password from notebook web-server
RUN echo "c.NotebookApp.token = u''" >> ~/.jupyter/jupyter_notebook_config.py

# Start jupyter notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]

