# EASY STACK DB

## Introduction
This stack provides a flexible and modular framework for managing Docker containers. It supports a variety of services, including backend applications in Java or PHP, frontends, and complete containerized solutions.

### Key Features

- Customizable and adaptable to various development needs
- Supports building and publishing Docker images locally or via CI/CD pipelines
- Compatible with container registries such as Docker Hub and GitHub Container Registry
- Scalable and easily extendable for different service configurations
- This stack allows developers to efficiently manage their containerized environments and streamline deployment workflows. Future updates will introduce pre-configured Easy-Stacks to further simplify the setup and usage.

#### Caution! Caution! This stack is intended for development use only and is not configured for production. For production use, please refer to the "Easy-Stack-Prod" stack - comming soon.

## Important Notice

We strongly recommend changing all passwords in the `.env.dist` file. These are purely test data and should not be used even in development mode.

### How to Update Environment Variables

1. Create a `.env` file next to `.env.dist`:
   ```sh
   cp .env.dist .env
   ```
2. Open the `.env` file and update the relevant values.
3. The `.env` file will be automatically loaded if it exists and will override the corresponding environment variables.

# License Information for Used Containers

| Container         | License                                | License Link                                                            |
|-------------------|----------------------------------------|-------------------------------------------------------------------------|
| **MongoDB**       | Server Side Public License (SSPL)      | [SSPL](https://www.mongodb.com/licensing/server-side-public-license)    |
| **MariaDB**       | GPL v2                                 | [GPL v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)        |
| **MySQL**         | GPL v2 / Proprietary                   | [GPL v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)        |
| **Redis**         | BSD 3-Clause                           | [BSD 3-Clause](https://opensource.org/licenses/BSD-3-Clause)            |
| **Elasticsearch** | Elastic License 2.0 (ELv2) / SSPL      | [Elastic License 2.0](https://www.elastic.co/licensing/elastic-license) |
| **PostgreSQL**    | PostgreSQL License                     | [PostgreSQL License](https://www.postgresql.org/about/licence/)         |
| **pgAdmin**       | PostgreSQL License                     | [PostgreSQL License](https://www.pgadmin.org/licence.php)               |
| **MinIO**         | Apache License 2.0                     | [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)               |
| **MSSQL**         | Proprietary (Microsoft EULA)           | [Microsoft EULA](https://www.microsoft.com/en-us/legal/terms-of-use)    |
| **Oracle**        | Proprietary (Oracle EULA)              | [Oracle EULA](https://www.oracle.com/downloads/licenses/)               |


## Installation and Starting the Stack
### Prerequisites
- Docker and Docker Compose must be installed on the system.

#### Before you run this project, ensure the following are installed on your host system:

- Git
- Docker
- Docker Compose
- Make

#### Build this stack


Clone this Project

```sh
git clone git@github.com:Opillion-GmbH-Co-KG/easy-stack-db.git

cd ./easy-stack-db

 ```

To start and install this stack:

```sh
make start
 ```
or

```sh
make restart
```

## The stack up and running:

![Alt text](.makefile/assets/stack.png?raw=true" "The database stack")

### Docker Container

### **MySQL**
- **Image:** Custom MySQL Build
- **Description:** A MySQL container with a preconfigured database environment.
- **Ports (preconfigured):**
   - **${MYSQL_EXTERNAL_PORT}:${MYSQL_INTERNAL_PORT}** (Default: 33069:3305)
- **Name:** mysql
- **Volumes:**
   - ${MYSQL_DATA_PATH:-mysql-data}:/var/lib/mysql

### **MariaDB**
- **Image:** Custom MariaDB Build
- **Description:** A MariaDB container with optimized database settings.
- **Ports (preconfigured):**
   - **${MARIA_EXTERNAL_PORT}:${MARIA_INTERNAL_PORT}** (Default: 3306:3306)
- **Name:** maria
- **Volumes:**
   - ${MARIA_DATA_PATH:-maria-data}:/var/lib/mysql

### **PostgreSQL**
- **Image:** Custom PostgreSQL Build
- **Description:** A PostgreSQL container for managing relational databases.
- **Ports (preconfigured):**
   - **${POSTGRES_EXTERNAL_PORT}:${POSTGRES_INTERNAL_PORT}** (Default: 5432:5432)
- **Name:** postgres
- **Volumes:**
   - ${POSTGRES_DATA_PATH:-postgres-data}:/var/lib/postgresql/data

### **MongoDB**
- **Image:** Custom MongoDB Build
- **Description:** A MongoDB container for NoSQL database management.
- **Ports (preconfigured):**
   - **${MONGO_DB_INTERNAL_PORT}** (Default: 27017)
- **Name:** mongodb
- **Volumes:**
   - ${MONGODB_DATA_PATH:-mongodb-data}:/data/db

### **OracleDB**
- **Image:** Custom Oracle Build
- **Description:** An Oracle database container with a preconfigured environment.
- **Ports (preconfigured):**
   - **${ORACLE_EXTERNAL_PORT}:${ORACLE_INTERNAL_PORT}**
- **Name:** oracle
- **Volumes:**
   - ./.docker/dev/oracle:/container-entrypoint-initdb.d

### **Redis**
- **Image:** Custom Redis Build
- **Description:** A Redis container for in-memory data storage.
- **Ports (preconfigured):**
   - **${REDIS_INTERNAL_PORT}, ${REDIS_INTERNAL_TWO_PORT}** (Default: 6379, 9121)
- **Name:** redis
- **Volumes:**
   - ${REDIS_DATA_PATH:-redis-data}:/data

### **Elasticsearch**
- **Image:** Custom Elasticsearch Build
- **Description:** An Elasticsearch container for full-text search and analytics.
- **Ports (preconfigured):**
   - **${ELASTIC_EXTERNAL_PORT}:${ELASTIC_INTERNAL_PORT}** (Default: 9200:9200)
- **Name:** elasticsearch
- **Volumes:**
   - ${ELASTIC_DATA_PATH:-elastic-data}:/usr/share/elasticsearch/data

### **MinIO**
- **Image:** Custom MinIO Build
- **Description:** A MinIO container for object storage.
- **Ports (preconfigured):**
   - **${MINIO_EXTERNAL_PORT_ONE}:${MINIO_INTERNAL_PORT_ONE}** (Default: 9006:9006)
   - **${MINIO_EXTERNAL_PORT_TWO}:${MINIO_INTERNAL_PORT_TWO}** (Default: 9007:9007)
- **Name:** minio
- **Volumes:**
   - ${MINIO_DATA_PATH:-minio-data}:/bitnami/minio/data

### **pgAdmin**
- **Image:** Custom pgAdmin Build
- **Description:** A pgAdmin container for managing PostgreSQL databases.
- **Ports (preconfigured):**
   - **${PGADMIN_EXTERNAL_PORT}:${PGADMIN_INTERNAL_PORT}** (Default: 8081:8081)
- **Name:** pgadmin
- **Volumes:**
   - ${PGADMIN_DATA_PATH:-pgadmin-data}:/var/lib/postgresql/data

### **MSSQL**
- **Image:** Custom MSSQL Build
- **Description:** A Microsoft SQL Server container for relational database management.
- **Ports (preconfigured):**
   - **${MSSQL_EXTERNAL_PORT}:${MSSQL_INTERNAL_PORT}** (Default: 1433:1433)
- **Name:** mssql
- **Volumes:**
   - ${MSSQL_DATA_PATH:-mssql-data}:/var/opt/mssql


## This Stack is based on Easy Stack Mini

[![Easy Stack Mini - DALL-E Image](.makefile/assets/easy-stack-mini.jpg?raw=true)](https://github.com/Opillion-GmbH-Co-KG/easy-stack-mini)


