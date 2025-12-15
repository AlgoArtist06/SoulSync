# SoulSync

SoulSync is a modern matrimony and dating application designed to help users find their perfect match. It features a robust backend built with Java Spring Boot and a dynamic frontend built with React.


## 🚀 Features

-   **User Authentication**: Secure signup and login using JWT (JSON Web Tokens).
-   **Profile Management**: Comprehensive user profiles with diverse attributes (Education, Religion, Income, etc.).
-   **Smart Matching**: (Planned/Implemented) matching algorithms to connect compatible users.
-   **Responsive Design**: A seamless experience across desktop and mobile devices.
-   **Data Seeding**: Scripts to generate realistic mock data for testing and development.

## 🛠️ Tech Stack

### Backend
-   **Language**: Java 21
-   **Framework**: Spring Boot 3.5.6
-   **Database**: PostgreSQL
-   **Security**: Spring Security, JWT (jjwt 0.11.5)
-   **Tools**: Maven, Lombok, Python (for data generation)

### Frontend
-   **Framework**: React
-   **Build Tool**: Vite
-   **Styling**: CSS / Modern UI Libraries

## � Docker Deployment

Experience the full application stack with a single command using Docker.

### Capabilities
-   **Full Stack Containerization**: Frontend (Nginx), Backend (Spring Boot), and Database (PostgreSQL) run in isolated containers.
-   **Hot Reloading**: (Optional configuration) for easier development.
-   **Data Persistence**: Docker volumes ensure your database data survives container restarts.
-   **Production-Ready Frontend**: The frontend is built and served via high-performance Nginx.

### How to Run

1.  **Prerequisites**: Ensure you have Docker Desktop installed and running.
2.  **Run Command**:
    ```bash
    docker-compose up --build
    ```
3.  **Access Services**:
    -   **Frontend**: [http://localhost:5173](http://localhost:5173)
    -   **Backend API**: [http://localhost:8080](http://localhost:8080)
    -   **Database**: `localhost:5432`

**Note**: The Docker setup automatically provisions a PostgreSQL database (`soulsync-db-new`) with the required schema and credentials.

## �📋 Prerequisites

Before you begin, ensure you have the following installed:
-   **Java JDK 21**
-   **Node.js** (v18 or higher) & **npm**
-   **PostgreSQL**
-   **Python 3** (optional, for running seed scripts)

## 🏁 Getting Started

### 1. Database Setup

Create a PostgreSQL database named `soulsync`.

```bash
psql -U postgres
CREATE DATABASE soulsync;
\q
```

(Optional) Import seed data:
```bash
# From root directory
psql -U your_username -d soulsync -f seed_data.sql
```

### 2. Backend Setup

Navigate to the root directory and start the Spring Boot application.

```bash
./mvnw spring-boot:run
```
The backend server will likely start on `http://localhost:8080`.

### 3. Frontend Setup

Navigate to the frontend directory, install dependencies, and start the development server.

```bash
cd frontend
npm install
npm run dev
```
The frontend will typically run on `http://localhost:5173` (check console output).

## 🧪 Testing Credentials (Seed Data)

If you imported the seed data, you can use these credentials to log in:

-   **Email**: `vivaan.das.1@hotmail.com` (or any generated email)
-   **Password**: `password123`

## 📂 Project Structure

```
SoulSync/
├── src/                  # Backend source code (Java/Spring Boot)
├── frontend/             # Frontend source code (React/Vite)
├── seed_data.sql         # Database seed SQL
├── generate_profiles.py  # Python script to generate random profiles
├── pom.xml               # Maven configuration
└── docker-compose.yml    # Docker configuration (optional)
```

## 🤝 Contributing

Contributions are welcome! Please fork the repository and create a pull request.

## 📄 License

This project is licensed under the [MIT License](LICENSE).
