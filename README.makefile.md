|--------------------------------|-----------------------------------------------------------------------------|
| Make Commands                  | Description                                                                 |
|--------------------------------|-----------------------------------------------------------------------------|
| `make build`                   | Builds the current stack                                                    |
| `make build-%`                 | Builds and pushes (base/dev/prod) images to Docker Hub with Buildx          |
| `make clean-stack`             | Stops, removes and deletes volumes, images, and networks                    |
| `make console`                 | Runs a bash for mysql                                                       |
| `make docker-login`            | Logs in to Docker Hub registry                                              |
| `make elasticsearch-console`   | Runs a bash for elastic search                                              |
| `make fix-buildx`              | Fixes a broken Buildx setup                                                 |
| `make fix-line-endings`        | Fixes the line endings of all files                                         |
| `make help`                    | Shows help for make commands                                                |
| `make maria-console`           | Runs a bash for mariadb                                                     |
| `make minio-console`           | Runs a bash for minio                                                       |
| `make mongodb-console`         | Runs a bash for mongodb                                                     |
| `make mssql-console`           | Runs a bash for mssql                                                       |
| `make mysql-console`           | Runs a bash for mysql                                                       |
| `make oracle-console`          | Runs a bash for oracle                                                      |
| `make postgres-console`        | Runs a bash for postgres                                                    |
| `make redis-console`           | Runs a bash for redis                                                       |
| `make remove-buildx`           | Removes Buildx runtime container                                            |
| `make restart`                 | Cleans your stack containers, volumes, networks & restarts all services     |
| `make start`                   | Starts all services defined in your docker-compose file                     |
| `make stop`                    | Stops running Docker containers                                             |
| `make validate-docker-compose` | Validates the docker-compose.yml file                                       |
|--------------------------------|-----------------------------------------------------------------------------|
