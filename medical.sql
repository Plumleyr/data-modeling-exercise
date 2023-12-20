DROP DATABASE medical_db;

CREATE DATABASE medical_db;

\c medical_db

CREATE TABLE doctor
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT
);

CREATE TABLE patient
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    DOB TEXT
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctor ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patient ON DELETE CASCADE,
    diagnosis TEXT
);