# 🚜 AgriRent - Agriculture Equipment Rental System

A modern full-stack web application designed to empower farmers with on-demand access to agricultural machinery (tractors, harvesters, rotavators, sprayers, irrigation pumps) and provide equipment owners with a platform to monetize idle farming assets.

---

## 🌟 Key Features

### 🌾 For Farmers
- **Machinery Catalog**: Search and filter equipment by Category, City / District, and Keyword.
- **Flexible Rental Models**: Book machinery on either an **Hourly** or **Daily** basis.
- **Cost Estimation & Delivery**: Instant automatic cost calculation with optional doorstep farm delivery.
- **Booking Life-cycle Management**: Real-time status tracking (`PENDING` → `APPROVED` → `ACTIVE` → `COMPLETED` / `CANCELLED`).
- **Ratings & Reviews**: Rate machinery performance and write field reviews for community feedback.

### 🚜 For Equipment Owners / Vendors
- **Machinery Listing**: Add tractors, harvesters, tillers, and implements with horsepower specs, daily/hourly rates, security deposit, and photos.
- **Instant Availability Toggle**: 1-click show/hide availability of machinery in the marketplace.
- **Rental Request Approvals**: Approve or decline booking requests, mark dispatched machines as "In-Use", and finalize completed rentals.
- **Revenue Dashboard**: Track gross rental earnings, active field machinery, and booking counts.

### 🛡️ For Administrators
- **Platform Analytics**: Total platform revenue, machinery fleet metrics, active rentals, and user breakdown.
- **User Directory**: View all registered farmers, equipment owners, and admins.
- **System Bookings**: Audit and monitor all system-wide rental transactions.

---

## 🛠️ Tech Stack

- **Backend**:
  - **Java 21 / 25 LTS**
  - **Spring Boot 3.4.3**
  - **Spring Security 6** with **Stateless JWT Authentication**
  - **Spring Data JPA & Hibernate**
  - **H2 In-Memory Database** (Zero configuration needed, ready out-of-the-box) + MySQL profile toggle
  - **SpringDoc OpenAPI 3 / Swagger UI**
- **Frontend**:
  - **React 18** + **Vite**
  - **Tailwind CSS**
  - **Lucide React Icons**
  - **Axios** with JWT Request & Response Interceptors
  - **React Router 6**

---

## 🚀 Quick Start Guide

### Option 1: One-Click Launch (Windows)
Double-click `start-project.bat` in the project root directory. It will start both backend and frontend servers in separate windows.

---

### Option 2: Manual Terminal Startup

#### 1. Start Spring Boot Backend
Open a terminal in the root directory:
```bash
cd backend
mvn spring-boot:run
```
- **Backend API**: `http://localhost:8080`
- **Interactive Swagger UI**: `http://localhost:8080/swagger-ui.html`
- **H2 Database Web Console**: `http://localhost:8080/h2-console`
  - JDBC URL: `jdbc:h2:mem:agrirentdb`
  - User: `sa`
  - Password: *(leave blank)*

#### 2. Start React Frontend
Open a second terminal in the root directory:
```bash
cd frontend
npm.cmd run dev
```
- **Frontend URL**: `http://localhost:5173`

---

## 👥 Pre-Configured Demo Accounts (1-Click Login available on UI)

| Role | Email | Password | Details |
| :--- | :--- | :--- | :--- |
| **Farmer** | `ramesh.farmer@agrirent.com` | `farmer123` | Active renter, booked tractors & rotavators |
| **Farmer 2** | `anita.farmer@agrirent.com` | `farmer123` | Active renter in Punjab |
| **Owner 1** | `rajesh.owner@agrirent.com` | `owner123` | Owner of Mahindra Tractor, John Deere, Harvester |
| **Owner 2** | `sunita.owner@agrirent.com` | `owner123` | Owner of Rotavator, Boom Sprayer, Solar Pump |
| **Admin** | `admin@agrirent.com` | `admin123` | Platform Administrator with full analytics |

---

## 📡 REST API Summary

### Authentication (`/api/auth`)
- `POST /api/auth/register` - Register a new user (`ROLE_FARMER` or `ROLE_OWNER`)
- `POST /api/auth/login` - Authenticate with email and password, returns JWT token
- `GET /api/auth/me` - Get current authenticated user details

### Machinery Catalog (`/api/equipment`)
- `GET /api/equipment` - Browse equipment (Query params: `category`, `city`, `keyword`)
- `GET /api/equipment/{id}` - Get equipment details by ID
- `GET /api/equipment/owner/my` - Get equipment listed by current owner
- `POST /api/equipment` - List new equipment *(Owner/Admin)*
- `PUT /api/equipment/{id}` - Update equipment details *(Owner/Admin)*
- `PATCH /api/equipment/{id}/toggle-availability` - Toggle available status *(Owner/Admin)*
- `DELETE /api/equipment/{id}` - Remove equipment listing *(Owner/Admin)*

### Bookings (`/api/bookings`)
- `POST /api/bookings` - Submit equipment rental reservation
- `GET /api/bookings/my` - Farmer's booking history & status
- `GET /api/bookings/owner` - Owner's incoming rental requests
- `GET /api/bookings/{id}` - Booking details
- `PATCH /api/bookings/{id}/status` - Update rental status (`APPROVED`, `REJECTED`, `ACTIVE`, `COMPLETED`, `CANCELLED`)

### Reviews (`/api/reviews`)
- `GET /api/reviews/equipment/{equipmentId}` - Get reviews for machine
- `POST /api/reviews/equipment/{equipmentId}` - Submit rating & review

### Dashboard & Analytics (`/api/dashboard` & `/api/admin`)
- `GET /api/dashboard/owner` - Owner revenue and booking metrics
- `GET /api/admin/stats` - Platform-wide statistics *(Admin)*
- `GET /api/admin/users` - Registered users list *(Admin)*
- `GET /api/admin/bookings` - All platform bookings *(Admin)*
