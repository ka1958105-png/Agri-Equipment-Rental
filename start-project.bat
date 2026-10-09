@echo off
echo ========================================================
echo   Starting AgriRent - Agriculture Equipment Rental System
echo ========================================================
echo.

echo Starting Spring Boot Backend (Port 8080)...
start "AgriRent Backend" cmd /k "cd backend && mvn spring-boot:run"

echo Starting React + Vite Frontend (Port 5173)...
start "AgriRent Frontend" cmd /k "cd frontend && npm.cmd run dev"

echo.
echo Application launched!
echo - Frontend UI: http://localhost:5173
echo - Backend API & Swagger: http://localhost:8080/swagger-ui.html
echo - H2 Database Console: http://localhost:8080/h2-console
echo.
pause
