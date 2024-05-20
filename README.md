
# Stormsync Database

Welcome to the Stormsync Database repository. This repository contains a Go package for handling database operations, including migrations, and connection management, tailored for use with the Stormsync suite.





## DB Schema
![DBSchema](https://github.com/stormsync/database/blob/main/weather_db_schema.png?raw=true)

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

The Stormsync Database package is designed to simplify database management tasks within Go applications. It provides tools for database migrations, seeding, and connection handling, making it easier to develop and maintain consistent database states across different environments.

## Features

- **Database Migrations**: Manage database schema changes in a structured and version-controlled manner.
- **Seeding**: Populate your database with initial or test data using seed scripts.
- **Connection Management**: Simplified database connection handling.
- **Compatibility**: Supports multiple database systems including PostgreSQL, MySQL, and SQLite.

## Installation

To install the Stormsync Database package, use the following command:

```bash
go get github.com/stormsync/database
```


### Environment Variables

You can configure the database package using environment variables. Here are the supported variables:

- `DB_DRIVER`
- `DB_HOST`
- `DB_PORT`
- `DB_USER`
- `DB_PASSWORD`
- `DB_NAME`
- `DB_SSLMODE`

## Usage



### Running Migrations

To run database migrations, use the following code:

```bash
 migrate -source file:./migrations -database  "postgresql://<host>/<dbname>?<params>" up
 or
 migrate -source file:./migrations -database  "postgresql://<host>/<dbname>?<params>" down

```


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For any questions or feedback, please reach out to us at [support@stormsync.com](mailto:support@stormsync.com) or join our [community forum](https://community.stormsync.com).

---
