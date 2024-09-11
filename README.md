# Inception
42 Inception

This project is an introduction to Docker.

It sets up a MariaDB database with a WordPress website and an Nginx container for managing client connections.

A `.env` file is required for password and user management.

## Makefile
- **`make`**: Prepares the Docker containers and runs them.
- **`make run`**: Starts the Docker containers.
- **`make run-daemon`**: Starts the Docker containers in detached mode.
- **`make down`**: Removes the Docker network and volumes.
- **`make stop`**: Stops the Docker containers.
- **`make prepare`**: Prepares the Docker containers.
- **`make build`**: Builds the Docker containers.
- **`make clean`**: Removes unused resources.
- **`make fclean`**: Kills the Docker containers and cleans everything.
- **make re**: `make fclean` `make all`.
- **make delete-volumes**: Remove volumes.
- **make status**: Print dockers status