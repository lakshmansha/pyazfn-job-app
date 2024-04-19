# pyazfn-job-app
For Youtube Video on "Python Power-Up: Elevating Your Workflows with Docker on Azure Functions and Container Apps"

Steps:
1. Create Python Job with Az Function on Queue Trigger.
2. Dockerize the App and push to container registery.
3. Create Container App and Deploy the Job.
4. Setup Scaling via Queue Trigger.



# Docker Commands

```
docker build -t pyazfn-job-app -f Dockerfile .
```

### Setup for Docker

Setup for Dockerize the app, follow below steps

1. Build the Docker

    ```
    docker build -t pyazfn-job-app -f Dockerfile .
    ```

2. Run the Docker

    ```
    docker run --env-file ./.env --rm --name pyazfn-job-app pyazfn-job-app:dev
    ```

3. To Push the Docker to ACR

    ```
    docker build -f Dockerfile -t pyazfn-job-app:latest .
    docker tag pyazfn-job-app:latest pyazfnacr.azurecr.io/pyazfn-job-app:latest
    docker push pyazfnacr.azurecr.io/pyazfn-job-app:latest
    ```