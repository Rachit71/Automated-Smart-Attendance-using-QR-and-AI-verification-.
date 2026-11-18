# SmartAttend Backend — MySQL starter

## Setup
1. Install Node.js and MySQL Server. In MySQL Workbench run `database/schema.sql`.
2. Open a terminal inside `Backend` and run `npm install`.
3. Edit `Backend/.env`: set your own MySQL password and replace `JWT_SECRET` with a random 32+ character secret. Never upload `.env` to GitHub.
4. Run `npm run dev`. Test `http://localhost:5000/api/health` (must show `database: connected`).
5. Run the existing frontend using VS Code Live Server on port 5500, and call backend at `http://localhost:5000/api`.

## Endpoints
- POST `/api/auth/register`: `{fullname,studentId,email,course,password}` (student only)
- POST `/api/auth/login`: `{email,password,role}` -> JWT + user
- GET `/api/auth/me`: Bearer JWT
- POST `/api/attendance/sessions`: teacher JWT, `{subject,className,duration}` -> `qrData`, `qrImage`
- GET `/api/attendance/sessions`: teacher JWT
- POST `/api/attendance/verify-qr`: student JWT, `{sessionId,token}`
- GET `/api/attendance/mine`: student JWT
- GET `/api/attendance/sessions/:id/attendance`: teacher JWT
- POST `/api/face/enroll`, `/api/face/verify`, `/api/attendance/mark`: currently return HTTP 501 intentionally.

## Important limitations
This is a functional authentication, MySQL, and QR-session API starter, **not** a finished AI attendance system. Real face enrollment/matching, liveness checks, secure identity binding, and actual attendance marking are NOT implemented. The backend does not invent successful face verification or allow unverified attendance marking. Teacher accounts must be provisioned by an administrator; there is no public teacher signup endpoint. Frontend pages from your ZIP still require `fetch()` integration, and login pages currently have demo behavior. Do not deploy publicly without further security review and integration testing.

## Local teacher test account
To test teacher-only endpoints, register a student account first, then locally in MySQL Workbench execute `UPDATE users SET role='teacher',student_id=NULL WHERE email='teacher@example.com';` **only if** that exact account exists and belongs to your test teacher. Do not allow ordinary students to change their role in production.
