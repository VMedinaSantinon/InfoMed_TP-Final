-- Tabla de hospitales con Latitud, Longitud, Dirección y Numero de telefono (1) 
CREATE TABLE Tabla_Hospitales (
    ID_Hospital INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    Latitud DECIMAL(10, 6),
    Longitud DECIMAL(10, 6),
    Teléfono VARCHAR(20)
);

-- Insertar los datos en la tabla
INSERT INTO Tabla_Hospitales (ID_Hospital, Nombre, Dirección, Latitud, Longitud, Teléfono)
VALUES 
(1, 'Hospital Garrahan', 'Combate de los Pozos 1881', -346.197, -583.913, '011-4122-6000'),
(2, 'Sanatorio Otamendi', 'Azcuénaga 870', -345.975, -583.931, '011-4965-2500'),
(3, 'Hospital Fernández', 'Cerviño 3356', -345.707, -584.013, '011-4808-2600'),
(4, 'Hospital Italiano', 'Gascón 450', -346.125, -584.174, '011-4959-0200'),
(5, 'Sanatorio Güemes', 'Av. Córdoba 3933', -345.979, -584.153, '011-4959-8000'),
(6, 'Clínica Bazterrica', 'Billinghurst 2072', -345.956, -584.117, '011-4821-1500'),
(7, 'CEMIC', 'Av. Las Heras 2900', -345.833, -584.106, '011-5299-0000'),
(8, 'Hospital El Cruce', 'Av. Calchaquí 5401', -347.497, -582.644, '011-4210-9000'),
(9, 'Clínica Modelo de Morón', 'Cabildo 329', -346.513, -586.197, '011-4629-2040'),
(10, 'Hospital Alemán', 'Av. Pueyrredón 1640', -345.982, -583.999, '011-4827-7000');

-- Tabla de especialidades médicas (2)
CREATE TABLE Tabla_Especialidades (
    ID_Especialidad INT PRIMARY KEY,
    Nombre VARCHAR(100)
);


-- Insertar los datos en la tabla
INSERT INTO Tabla_Especialidades (ID_Especialidad, Nombre)
VALUES 
(1, 'Clínica Médica'),
(2, 'Pediatría'),
(3, 'Traumatología'),
(4, 'Cardiología'),
(5, 'Neurología'),
(6, 'Dermatología'),
(7, 'Oncología'),
(8, 'Ginecología'),
(9, 'Nefrología'),
(10, 'Endocrinología'),
(11, 'Urología'),
(12, 'Psiquiatría'),
(13, 'Reumatología'),
(14, 'Alergología'),
(15, 'Gastroenterología');
  

-- Tabla de las especialidades por hospital en horarios (3)
CREATE TABLE Tabla_Horarios (
    ID_Guardia INT,
    ID_Hospital INT,
    ID_Especialidad INT,
    Horario_Inicio TIME,
    Horario_Fin TIME,
    PRIMARY KEY (ID_Guardia, ID_Hospital, ID_Especialidad)
);

-- Insertar los datos en la tabla
INSERT INTO Tabla_Horarios (ID_Guardia, ID_Hospital, ID_Especialidad, Horario_Inicio, Horario_Fin)
VALUES 
(1, 2, 1, '24:00:00', '24:00:00'),
(2, 1, 2, '8:00', '20:00'),
(3, 1, 3, '20:00', '8:00'),
(4, 3, 3, '10:00', '22:00'),
(5, 4, 6, '7:00', '19:00'),
(6, 5, 10, '8:00', '20:00'),
(7, 6, 8, '10:00', '18:00'),
(8, 7, 9, '12:00', '0:00'),
(9, 8, 10, '8:00', '16:00'),
(10, 9, 12, '9:00', '17:00'),
(11, 10, 1, '8:00', '18:00'),
(12, 10, 1, '9:00', '19:00');

-- Tabla con los horarios disponibles para turnos por guardia (4)
CREATE TABLE Tabla_Turnos (
    ID_Turno INT PRIMARY KEY,
    ID_Guardia INT,
    Fecha DATE,
    Hora TIME,
    Estado VARCHAR(20)
);

-- Insertar los datos en la tabla
INSERT INTO Tabla_Turnos (ID_Turno, ID_Guardia, Fecha, Hora, Estado)
VALUES 
(1, 1, '2024-12-15', '10:30', 'Ocupado'),
(2, 2, '2024-12-15', '11:00', 'Disponible'),
(3, 4, '2024-12-16', '15:00', 'Ocupado'),
(4, 5, '2024-12-16', '18:00', 'Ocupado'),
(5, 6, '2024-12-16', '12:00', 'Ocupado'),
(6, 7, '2024-12-16', '13:00', 'Disponible'),
(7, 8, '2024-12-16', '16:00', 'Ocupado'),
(8, 9, '2024-12-16', '9:30', 'Ocupado'),
(9, 11, '2024-12-17', '10:00', 'Disponible'),
(10, 12, '2024-12-17', '14:00', 'Ocupado');

-- Tabla con tiempos de espera promedio por guardia (5)
CREATE TABLE Tabla_Tiempos (
    ID_Tiempo INT PRIMARY KEY,
    ID_Guardia INT,
    Tiempo_Promedio_Historico_Min INT,
    Numero_Promedio_Pacientes DECIMAL(5,1)
);

-- Insertar los datos en la tabla
INSERT INTO Tabla_Tiempos (ID_Tiempo, ID_Guardia, Tiempo_Promedio_Historico_Min, Numero_Promedio_Pacientes)
VALUES 
(1, 1, 45, 8.5),
(2, 2, 40, 12.5),
(3, 3, 45, 16.0),
(4, 4, 7, 16.0),
(5, 5, 4, 9.0),
(6, 6, 30, 12.5),
(7, 7, 20, 14.5),
(8, 8, 5, 10.0),
(9, 9, 20, 8.0),
(10, 10, 15, 5.0),
(11, 11, 20, 13.0),
(12, 12, 7, 15.0);


-- Tabla de pacientes en espera (6)
CREATE TABLE Tabla_Espera (
    ID_Espera INT PRIMARY KEY,
    ID_Guardia INT,
    Fecha DATE,
    Hora TIME,
    Pacientes_En_Espera INT,
    Tiempo_Promedio_Min INT
);

-- Insertar los datos en la tabla
INSERT INTO Tabla_Espera (ID_Espera, ID_Guardia, Fecha, Hora, Pacientes_En_Espera, Tiempo_Promedio_Min)
VALUES 
(1, 1, '2024-12-15', '10:00', 12, 5),
(2, 1, '2024-12-15', '12:00', 8, 4),
(3, 1, '2024-12-15', '14:00', 5, 3),
(4, 2, '2024-12-15', '10:00', 15, 6),
(5, 2, '2024-12-15', '12:30', 10, 5),
(6, 3, '2024-12-15', '11:00', 18, 7),
(7, 4, '2024-12-15', '9:30', 20, 8),
(8, 4, '2024-12-15', '13:00', 12, 6),
(9, 5, '2024-12-15', '15:00', 9, 4),
(10, 6, '2024-12-16', '9:00', 11, 5),
(11, 6, '2024-12-16', '11:30', 14, 6),
(12, 7, '2024-12-16', '10:00', 16, 7),
(13, 8, '2024-12-16', '8:00', 10, 5),
(14, 9, '2024-12-16', '10:30', 8, 4),
(15, 10, '2024-12-16', '12:00', 5, 3),
(16, 11, '2024-12-16', '14:00', 13, 6),
(17, 12, '2024-12-16', '9:30', 17, 7);
