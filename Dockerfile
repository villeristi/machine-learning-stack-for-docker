FROM python:3.6

# That's me \0/
LABEL maintainer="Wille <villeristimaki@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONBUFFERED=1
ENV CV_VERSION="3.4.2"
ENV JAVA_VER 8
ENV JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64/"
ENV SPARK_VERSION "spark-2.3.1-bin-hadoop2.7"
ENV SPARK_MIRROR "http://www.nic.funet.fi/pub/mirrors/apache.org/spark/spark-2.3.1"

# Create folders
RUN mkdir /jupyter
WORKDIR /jupyter

# Add apt-level deps
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && apt-get update

RUN apt-get install -y --no-install-recommends \
    gcc \
    gcc \
    curl \
    wget \
    yasm \
    unzip \
    cmake \
    unzip \
    libtbb2 \
    libpq-dev \
    pkg-config \
    libtbb-dev \
    libpng-dev \
    python3-dev \
    libjpeg-dev \
    libtiff-dev \
    python-numpy \
    libgtk2.0-dev \
    libswscale-dev \
    build-essential \
    libavformat-dev \
    python3-setuptools \
    apt-transport-https \
    python3-software-properties \
    && apt-get update \
    && apt-get install

# Install Java
RUN apt-get update \
    && apt-get install -y openjdk-8-jdk \
    && apt-get install -y ant \
    && apt-get clean;

# Fix certificate issues
RUN apt-get update \
    && apt-get install ca-certificates-java \
    && apt-get clean \
    && update-ca-certificates -f;

# Install Spark
RUN wget --quiet ${SPARK_MIRROR}/${SPARK_VERSION}.tgz
RUN tar -xzf ${SPARK_VERSION}.tgz
RUN mv ${SPARK_VERSION} /opt/spark

# Set $PATH vars
ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$PATH

# Add pip deps
RUN pip install -U pip
RUN pip install \
    findspark \
    jupyter \
    keras \
    matplotlib \
    mrjob \
    nltk \
    numpy \
    opencv-python \
    pandas \
    pyspark \
    requests \
    scikit-learn \
    scipy \
    seaborn \
    tensorflow

# Clean up redundancies
RUN /bin/rm -rf \
    /tmp/* \
    /var/tmp/* \
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
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]

