FROM python:3.10

# Arguments
ARG PYTHON_VER
ARG ENV_NAME

# Environment variables
ENV ENV_NAME=$ENV_NAME
ENV PYTHON_VER=$PYTHON_VER

# Copy files
RUN mkdir requirements
COPY requirements.txt requirements/
COPY install_dependencies.sh requirements/

# Install dependencies
RUN bash requirements/install_dependencies.sh $ENV_NAME $PYTHON_VER