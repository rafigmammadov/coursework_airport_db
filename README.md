# Airport Database System

This repository contains coursework materials and a database system for managing airport operations efficiently. The database system is implemented using PostgreSQL and includes functionalities such as flight scheduling, passenger management, and baggage tracking.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Getting Started](#getting-started)
4. [Usage](#usage)
5. [Contributing](#contributing)

## Introduction

The Airport Database System is designed to streamline various operations within an airport environment. Whether it's scheduling flights, managing passenger information, or tracking baggage, this system provides a robust solution to meet the demands of modern airports.

## Features

- **Flight Scheduling:** Manage flight schedules, departure/arrival times, and gate assignments.
- **Passenger Management:** Store passenger details, booking information, and check-in status.
- **Baggage Tracking:** Track baggage from check-in to retrieval, ensuring accurate handling and delivery.
- **Security:** Implement user roles, permissions, and data encryption to protect sensitive information.
- **Performance Optimization:** Indexing, query optimization, and performance testing ensure efficient database operations.

## Getting Started

To get started with the Airport Database System, follow these steps:

1. **Installation:** Install PostgreSQL on your system.
2. **Database Setup:** Create a new database using the provided SQL scripts.
3. **Populate Data:** Use sample SQL scripts to insert initial data into the database tables.
4. **Configuration:** Adjust database settings and security measures as needed.

## Usage

Once the database system is set up, you can start using it to manage airport operations. Here are some common tasks:

1. **Flight Management:** Schedule new flights, update departure/arrival times, and assign gates.
2. **Passenger Handling:** Register passengers, manage bookings, and handle check-in procedures.
3. **Baggage Tracking:** Track baggage movements, assign baggage to passengers, and ensure timely delivery.
4. **Security Administration:** Define user roles, set permissions, and manage data encryption settings.

# Installing the Dumped Database

This document provides instructions on how to install the dumped database into your PostgreSQL server.

## How to install it

1. [Prerequisites](#prerequisites)
2. [Steps to Install](#steps-to-install)
3. [Verifying Installation](#verifying-installation)
4. [Troubleshooting](#troubleshooting)

## Prerequisites

Before proceeding with the installation, ensure that you have the following prerequisites:

- PostgreSQL installed on your system.
- Access to a PostgreSQL superuser account (e.g., `postgres`).

## Steps to Install

Follow these steps to install the dumped database:

1. **Download the Database Dump:**
   - Ensure that you have downloaded the database dump file (usually with a `.sql` extension) to your local system.

2. **Restore the Database Dump:**
   - Open a terminal or command prompt.
   - Use the `pg_restore` command to restore the database dump. Replace `database_name` with the name you want to give to the restored database.
     ```bash
     pg_restore -U postgres -d database_name path/to/dumped_database.sql
     ```
   - You will be prompted to enter the password for the PostgreSQL superuser account (`postgres` by default).

3. **Wait for the Restoration to Complete:**
   - The restoration process may take some time depending on the size of the database dump. Wait for the process to complete.

4. **Verify the Installation:**
   - Once the restoration is complete, connect to the restored database using a PostgreSQL client or command line interface.
   - Verify that the database schema and data have been successfully restored.

## Verifying Installation

To verify that the installation was successful, follow these steps:

1. **Connect to the Restored Database:**
   - Open a PostgreSQL client or command line interface.
   - Connect to the restored database using the PostgreSQL superuser account (`postgres`).
     ```bash
     psql -U postgres -d database_name
     ```

2. **Check Tables and Data:**
   - Use SQL commands to list the tables and examine the data.
     ```sql
     \dt     -- List all tables
     SELECT * FROM table_name;    -- View data in a specific table
     ```

3. **Ensure Data Integrity:**
   - Verify that the data in the restored database matches the original database dump.

## Troubleshooting

If you encounter any issues during the installation process, consider the following troubleshooting steps:

- Ensure that the database dump file is accessible and not corrupted.
- Double-check the credentials and permissions required to restore the database dump.
- Verify that there is enough disk space available on your system to accommodate the restored database.
- Check the PostgreSQL logs for any error messages or warnings that may indicate issues during the restoration process.

If the issue persists, consult the PostgreSQL documentation or seek assistance from the PostgreSQL community forums or support channels.


## Contributing

Contributions to the Airport Database System are welcome! Whether it's bug fixes, feature enhancements, or documentation improvements, feel free to contribute by submitting pull requests.
