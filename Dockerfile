# For more information, please refer to https://aka.ms/vscode-docker-python
FROM mcr.microsoft.com/azure-functions/python:4-python3.11-slim

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Environment variables
ARG AzureWebJobsStorage
ARG APPINSIGHTS_INSTRUMENTATIONKEY
ARG JOB_QUEUE_NAME

ENV AzureWebJobsStorage=$AzureWebJobsStorage
ENV APPINSIGHTS_INSTRUMENTATIONKEY=$APPINSIGHTS_INSTRUMENTATIONKEY
ENV JOB_QUEUE_NAME=$JOB_QUEUE_NAME

ENV FUNCTIONS_WORKER_RUNTIME=python

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
COPY QueueJobTrigger/ /home/site/wwwroot/QueueJobTrigger/
COPY host.json /home/site/wwwroot/
