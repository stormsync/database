
# Stormsync Database

Welcome to the Stormsync Database repository. This repository contains a Go package for handling database operations, including migrations, and connection management, tailored for use with the Stormsync suite.





## DB Schema
![DBSchema](https://github.com/stormsync/database/weather_db_schema.png)


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

### Connecting to the Database

To connect to the database, use the following code snippet:

```go
package main

import (
    "github.com/stormsync/database"
    "log"
)

func main() {
    config := database.Config{
        Driver:   "postgres",
        Host:     "localhost",
        Port:     5432,
        User:     "your_username",
        Password: "your_password",
        DBName:   "stormsync_db",
        SSLMode:  "disable",
    }

    db, err := database.Connect(config)
    if err != nil {
        log.Fatalf("Failed to connect to the database: %v", err)
    }

    defer db.Close()
    log.Println("Successfully connected to the database")
}
```

### Running Migrations

To run database migrations, use the following code:

```go
package main

import (
    "github.com/stormsync/database"
    "log"
)

func main() {
    config := database.Config{
        Driver:   "postgres",
        Host:     "localhost",
        Port:     5432,
        User:     "your_username",
        Password: "your_password",
        DBName:   "stormsync_db",
        SSLMode:  "disable",
    }

    db, err := database.Connect(config)
    if err != nil {
        log.Fatalf("Failed to connect to the database: %v", err)
    }

    defer db.Close()

    if err := database.Migrate(db, "./migrations"); err != nil {
        log.Fatalf("Failed to run migrations: %v", err)
    }

    log.Println("Migrations ran successfully")
}
```

### Seeding the Database

To seed the database with initial data, use the following code:

```go
package main

import (
    "github.com/stormsync/database"
    "log"
)

func main() {
    config := database.Config{
        Driver:   "postgres",
        Host:     "localhost",
        Port:     5432,
        User:     "your_username",
        Password: "your_password",
        DBName:   "stormsync_db",
        SSLMode:  "disable",
    }

    db, err := database.Connect(config)
    if err != nil {
        log.Fatalf("Failed to connect to the database: %v", err)
    }

    defer db.Close()

    if err := database.Seed(db, "./seeds"); err != nil {
        log.Fatalf("Failed to seed the database: %v", err)
    }

    log.Println("Database seeded successfully")
}
```

## Contributing

We welcome contributions to the Stormsync Database project. To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

Please ensure your code adheres to our coding standards and includes appropriate tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For any questions or feedback, please reach out to us at [support@stormsync.com](mailto:support@stormsync.com) or join our [community forum](https://community.stormsync.com).

---

Feel free to customize the above template further to match any specific details or preferences you have for your project.