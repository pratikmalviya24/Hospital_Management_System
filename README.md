# Hospital Management System

This project is a Hospital Management System developed using Java Servlets, JDBC for database connectivity with MySQL, JSP for dynamic web page rendering, and Bootstrap 5 framework for responsive UI design.

## Features

- **Patient Management**: Allows administrators to add, update, and delete patient records.
- **Doctor Management**: Provides functionalities for managing doctor information.
- **Appointment Scheduling**: Enables scheduling and managing appointments between patients and doctors.
- **User Authentication**: Secure login and logout functionality for administrators and staff.
- **Responsive UI**: Designed using Bootstrap 5 for a modern and responsive user interface.

## Technologies Used

- **Java Servlets**: Backend logic and controller handling.
- **JDBC**: Java Database Connectivity for MySQL database interaction.
- **MySQL**: Database management system for storing hospital data.
- **JSP**: JavaServer Pages for dynamic content generation.
- **Bootstrap 5**: Front-end framework for responsive and mobile-first design.

## Getting Started

### Prerequisites

- Java Development Kit (JDK)
- Apache Tomcat Server
- MySQL Database Server

### Maven Dependencies

Add the following dependencies to your `pom.xml` file:

```xml
<dependencies>
    <!-- Servlet API -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>4.0.1</version>
        <scope>provided</scope> <!-- Servlet container (e.g., Tomcat) provides this -->
    </dependency>
    
    <!-- MySQL Connector -->
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>8.0.33</version>
    </dependency>
    
    <!-- JSTL (JavaServer Pages Standard Tag Library) -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>jstl</artifactId>
        <version>1.2</version>
    </dependency>
</dependencies>
```
## For Latest Dependency visit below link:
```
https://mvnrepository.com/
```
