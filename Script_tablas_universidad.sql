use Universidad;

create table persona (
ID_persona INT auto_increment not null primary key,
DNI INT not null,
apellido VARCHAR(50) not null,
nombre VARCHAR(50) not null,
marca_prof VARCHAR(1) not null
);

create table contacto (
ID_contacto INT auto_increment not null primary key,
ID_persona INT not null,
mail VARCHAR(100) not null,
tel INT not null,
foreign key (ID_persona) references persona(ID_persona)
);

create table codigo_postal (
CP INT not null primary key,
descripcion VARCHAR(50) not null
);


create table direccion (
ID_direccion INT auto_increment not null primary key,
ID_persona INT not null,
calle VARCHAR(100) not null,
num INT not null,
depto VARCHAR(5),
CP INT not null,
foreign key (CP) references codigo_postal(CP)
);


create table becas (
ID_beca INT auto_increment not null primary key,
descripcion VARCHAR(50) not null
);

create table historico_becas (
numero_beca INT auto_increment not null primary key,
ID_beca INT not null,
ID_persona INT not null,
foreign key (ID_beca) references becas(ID_beca),
foreign key (ID_persona) references persona(ID_persona)
);

create table materias (
ID_materia INT auto_increment not null primary key,
descripcion VARCHAR(50) not null
);

create table carreras (
ID_carrera INT auto_increment not null primary key,
descripcion VARCHAR(50) not null
);

create table condicion_regular (
ID_regular INT auto_increment not null primary key,
ID_alumno INT not null,
ID_materia INT not null,
ID_carrera INT not null,
fecha DATE,
foreign key (ID_alumno) references persona(ID_persona),
foreign key (ID_materia) references materias(ID_materia),
foreign key (ID_carrera) references carreras(ID_carrera)
);

create table condicion_aprobado (
ID_aprobado INT auto_increment not null primary key,
ID_alumno INT not null,
ID_materia INT not null,
ID_carrera INT not null,
fecha DATE,
foreign key (ID_alumno) references persona(ID_persona),
foreign key (ID_materia) references materias(ID_materia),
foreign key (ID_carrera) references carreras(ID_carrera)
);

create table recibidos (
ID_recibido INT auto_increment not null primary key,
ID_alumno INT not null,
ID_carrera INT not null,
fecha DATE,
foreign key (ID_alumno) references persona(ID_persona),
foreign key (ID_carrera) references carreras(ID_carrera)
);

create table mesa_examen (
ID_mesa INT auto_increment not null primary key,
ID_materia INT not null,
ID_carrera INT not null,
ID_profesor INT not null,
fecha DATE,
foreign key (ID_materia) references materias(ID_materia),
foreign key (ID_carrera) references carreras(ID_carrera),
foreign key (ID_profesor) references persona(ID_persona)
);

create table inscripciones_examen (
ID_examen INT auto_increment not null primary key,
ID_mesa INT not null,
ID_alumno INT not null,
fecha DATE,
foreign key (ID_mesa) references mesa_examen(ID_mesa),
foreign key (ID_alumno) references persona(ID_persona)
);

create table comision (
ID_comision INT auto_increment not null primary key,
ID_materia INT not null,
ID_carrera INT not null,
ID_profesor INT not null,
anio INT,
foreign key (ID_materia) references materias(ID_materia),
foreign key (ID_carrera) references carreras(ID_carrera),
foreign key (ID_profesor) references persona(ID_persona)
);

create table inscripciones_cursada (
ID_cursada INT auto_increment not null primary key,
ID_comision INT not null,
ID_alumno INT not null,
fecha DATE,
foreign key (ID_comision) references comision(ID_comision),
foreign key (ID_alumno) references persona(ID_persona)
);

create table inasistencias (
ID_inasistencia INT auto_increment not null primary key,
ID_alumno INT not null,
ID_comision INT not null,
fecha DATE,
foreign key (ID_alumno) references persona(ID_persona),
foreign key (ID_comision) references comision(ID_comision)
);


