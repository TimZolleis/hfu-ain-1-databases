# hfu-ain-1-databases

This repository contains all tasks that are completed during the AIN 2023/2024 winter semester in the "databases"
course.

## ⚡️ Quick start

> ❗️ Note: You have to have docker and docker compose installed.

You can run your h2 database locally with docker (and docker compose) with no installation and no effort.

**Step 1: Clone the repository (or copy and paste the docker-compose.yml)**

```bash
git clone https://github.com/timzolleis/hfu-ain-1-databases.git
```

**Step 2: Run the database server**

```bash
docker-compose up -d
```

The server should now be up. It is now reachable under the following interfaces:

- Web: http://localhost:8080 - Authenticate with the username **sa** and no password
- JDBC: tcp://localhost:1521 - Authenticate with the username **sa** and no password.

