## Flutter + Spring Boot + PostgreSQL Authentication System

### 📘 Overview

This project is a **full-stack authentication system** built with **Flutter (frontend)**, **Spring Boot (backend)**, and **PostgreSQL (database)**.
It demonstrates secure **JWT-based authentication** - including registration, login, and token generation, integrated between a mobile app and backend API.

---

### 🚀 Features

* ✅ User Registration (with BCrypt password hashing)
* ✅ User Login (JWT access & refresh tokens)
* ✅ PostgreSQL Database integration
* ✅ Secure Spring Boot REST API
* ✅ Flutter Mobile App with login/register UI
* ✅ Token display and secure storage using `flutter_secure_storage`
* ✅ Cross-Origin (CORS) support for Flutter ↔ Backend communication

---

### 🛠️ Tech Stack

**Frontend:**

* Flutter
* Dart
* HTTP package
* Flutter Secure Storage

**Backend:**

* Java 17
* Spring Boot 3
* Spring Security
* Spring Data JPA
* JWT (io.jsonwebtoken)
* BCryptPasswordEncoder
* Maven

**Database:**

* PostgreSQL

---

### 🏗️ Project Structure

```
auth_app/                   → Flutter frontend
├── lib/
│   ├── components/          → Login & Register forms
│   ├── screens/             → Login, Register, Home screens
│   └── services/            → AuthService, API handlers
│
auth_backend/               → Spring Boot backend
├── src/main/java/com/example/auth_backend/
│   ├── controller/          → AuthController.java
│   ├── model/               → User.java
│   ├── repo/                → UserRepository.java
│   ├── security/            → JwtUtil.java, SecurityConfig.java
│   └── AuthBackendApplication.java
└── src/main/resources/
    └── application.yml
```

---

### ⚙️ Setup Instructions

#### 🔹 Backend (Spring Boot)

1. Install **Java 17+** and **Maven**
2. Create a PostgreSQL database:

   ```sql
   CREATE DATABASE user_auth;
   ```
3. Update your `application.yml`:

   ```yaml
   spring:
     datasource:
       url: jdbc:postgresql://localhost:5432/user_auth
       username: postgres
       password: yourpassword
     jpa:
       hibernate:
         ddl-auto: update
       show-sql: true
   ```
4. Run the backend:

   ```bash
   mvn spring-boot:run
   ```

   The server runs at `http://localhost:8080`

---

#### 🔹 Frontend (Flutter)

1. Navigate to the `auth_app` folder:

   ```bash
   cd auth_app
   ```
2. Get dependencies:

   ```bash
   flutter pub get
   ```
3. Run the app:

   ```bash
   flutter run
   ```
4. The Flutter app communicates with backend API at:

   ```
   http://10.0.2.2:8080/api/auth
   ```

   (Use `10.0.2.2` for Android Emulator instead of `localhost`)

---

### 🔑 API Endpoints

| Endpoint             | Method | Description                       |
| -------------------- | ------ | --------------------------------- |
| `/api/auth/register` | POST   | Register new user                 |
| `/api/auth/login`    | POST   | Authenticate and get tokens       |
| `/api/test/user`     | GET    | Protected endpoint (JWT required) |

---

### 🧰 Example API Request (Login)

```json
POST http://localhost:8080/api/auth/login
{
  "username": "admin@gmail.com",
  "password": "admin123"
}
```

**Response:**

```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

---

### 📱 Flutter App Preview

* Login & Register screens with validation
* Successful login displays JWT tokens
* Tokens stored securely in local storage

---

### 📚 Learning Outcomes

* Connecting Flutter with a Java Spring Boot REST API
* Handling authentication via JWT tokens
* Using PostgreSQL with Spring Data JPA
* Managing state and API calls in Flutter

---

### 🧑‍💻 Author

**Teshan Wijewardhana**   
Mobile App Developer (Flutter & Firebase) | Backend Developer (Laravel & Spring Boot)   
📧 Email: [[teshan_wijewardhana@outlook.com](mailto:your.email@example.com)]    
🔗 GitHub: [[https://github.com/Teshan2000](https://github.com/Teshan2000)]

---
