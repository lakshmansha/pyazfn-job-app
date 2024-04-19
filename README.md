# pyazfn-job-app
For Youtube Video


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
    docker build -f Dockerfile -t pyazfn-job-app:dev .
    docker tag pyazfn-job-app:latest pyazfnacr.azurecr.io/pyazfn-job-app:latest
    docker push pyazfnacr.azurecr.io/pyazfn-job-app:latest
    ```