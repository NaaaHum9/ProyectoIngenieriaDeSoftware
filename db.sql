Table Clinicas {
    ID_Clinica int [pk, increment]
    Nombre_Clinica varchar(100)
    Direccion varchar(255)
}

Table Empleados {
    ID_Empleado int [pk, increment]
    Nombre varchar(100)
    Apellidos varchar(100)
    CURP varchar(18) [unique]
    RFC varchar(13)
    Direccion varchar(255)
    Fecha_Nacimiento date
    Rol enum('Médico', 'Asistente Médico', 'Personal de Farmacia', 'Administrador')
    Dias_Laborales varchar(50)
    Horario_Trabajo time
    Clinica_ID int [ref: > Clinicas.ID_Clinica]
    Estado enum('Alta', 'Baja') [default: 'Alta']
    Contraseña varchar(255)
}

Table Pacientes {
    ID_Paciente int [pk, increment]
    Nombre varchar(100)
    Apellidos varchar(100)
    CURP varchar(18) [unique]
    RFC varchar(13)
    Direccion varchar(255)
    Fecha_Nacimiento date
    Estado enum('Alta', 'Baja') [default: 'Alta']
    Clinica_ID int [ref: > Clinicas.ID_Clinica]
}

Table Citas {
    ID_Cita int [pk, increment]
    Paciente_ID int [ref: > Pacientes.ID_Paciente]
    Medico_ID int [ref: > Empleados.ID_Empleado]
    Fecha_Cita date
    Hora_Cita time
    Estado_Cita enum('Programada', 'Reprogramada', 'Cancelada', 'Tomada', 'No tomada') [default: 'Programada']
    Motivo varchar(255)
}

Table Historial_Medico {
    ID_Historial int [pk, increment]
    Paciente_ID int [ref: > Pacientes.ID_Paciente]
    Fecha date
    Diagnostico text
    Tratamiento text
    Medico_ID int [ref: > Empleados.ID_Empleado]
}

Table Inventario_Medicamentos {
    ID_Medicamento int [pk, increment]
    Nombre_Medicamento varchar(100)
    Tipo enum('Tabletas', 'Jarabe', 'Pomada', 'Otros')
    Concentracion varchar(50)
    Cantidad_Disponible int
    Fecha_Caducidad date
    Fecha_Ingreso date
    Lote varchar(50)
    Estado enum('Disponible', 'Bajo stock', 'Caducado') [default: 'Disponible']
}

Table Registro_Entradas_Salidas {
    ID_Registro int [pk, increment]
    Medicamento_ID int [ref: > Inventario_Medicamentos.ID_Medicamento]
    Fecha_Entrada date
    Fecha_Salida date
    Medico_ID int [ref: > Empleados.ID_Empleado]
    Asistente_ID int [ref: > Empleados.ID_Empleado]
}