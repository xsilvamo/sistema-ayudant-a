create database clinica1;

create table Paciente (
	rut_paciente int not null,
	nombre_paciente varchar(50),
	apellido_paciente varchar(50),
	direccion varchar(50),
	id_comuna int,
	cod_postal int,
	telefono_paciente int,
	fec_nacimineto datetime
);

create table Medico(
	rut_medico int not null,
	nombre_medico varchar(50),
	apellido_medico varchar(50),
	telefono_medico int,
	id_especialidad int
);

create table Hospitalizacion (
	id_hospitalizacion int not null,
	rut_paciente int,
	id_habitacion int,
	numero_cama int,
	estado_ingreso int,
	fecha_ingreso date,
	fecha_alta datetime
);

-- tablas intermedias

create table Comuna(
	id_comuna int not null,
	nom_cumuna varchar(50)
);

create table Especialidad(
	id_especialidad int not null,
	nom_especialidad varchar(50)
);

create table Especialidad_medico(
	id_especialidad_medico int not null,
	rut_medico int,
	id_especialidad int
);

create table atencion_pac_medico(
	id_atencion_pac_med int not null,
	rut_paciente int,
	rut_medico int,
	fecha_atencion datetime,
	estado_consulta int
);

create table estado_ingreso(
	id_ingreso int not null,
	estado_ingreso varchar(50)
);

create table estado_consulta(
	id_estado_consulta int not null,
	desc_estado_consulta varchar(50)
);

create table numero_habitacion(
	id_habitacion int not null,
	numero_habitacion varchar(50)
);

create table numero_cama(
	id_cama int not null,
	numero_cama varchar(50)
);

-- definicion de pks

alter table paciente
add constraint paciente_pk primary key (rut_paciente);

alter table medico
add constraint medico_pk primary key (rut_medico);

alter table hospitalizacion
add constraint hospitalizacion_pk primary key (id_hospitalizacion);

alter table comuna
add constraint comuna_pk primary key (id_comuna);

alter table especialidad
add constraint especialidad_pk primary key (id_especialidad);

alter table especialidad_medico
add constraint especialidad_medico_pk primary key (id_especialidad_medico);

alter table atencion_pac_medico
add constraint atencion_pac_med_pk primary key (id_atencion_pac_med);

alter table estado_ingreso
add constraint estado_ingreso_pk primary key (id_ingreso);

alter table estado_consulta
add constraint estado_consulta_pk primary key (id_estado_consulta);

alter table numero_habitacion
add constraint numero_habitacion_pk primary key (id_habitacion);

alter table numero_cama
add constraint numero_cama_pk primary key (id_cama);

-- definicion de Fks

alter table paciente
add constraint paciente_fk
foreign key (id_comuna) references comuna(id_comuna);

alter table hospitalizacion
add constraint hospitalizacion_fk
foreign key (estado_ingreso) references estado_ingreso(id_ingreso);

alter table hospitalizacion
add constraint hospitalizacion_2fk
foreign key (rut_paciente) references paciente(rut_paciente);

alter table hospitalizacion
add constraint hospitalizacion_3fk
foreign key (id_habitacion) references numero_habitacion(id_habitacion);

alter table hospitalizacion
add constraint hospitalizacion_4fk
foreign key (numero_cama) references numero_cama(id_cama);

alter table atencion_pac_medico
add constraint atencion_pac_med_fk
foreign key (rut_paciente) references paciente(rut_paciente);

alter table atencion_pac_medico
add constraint atencion_pac_med_2fk
foreign key (rut_medico) references medico(rut_medico);

alter table atencion_pac_medico
add constraint atencion_pac_med_3fk
foreign key (estado_consulta) references estado_consulta(id_estado_consulta);

alter table especialidad_medico
add constraint especialidad_medico_fk
foreign key (rut_medico) references medico(rut_medico);

alter table especialidad_medico
add constraint especialidad_medico_2fk
foreign key (id_especialidad) references especialidad(id_especialidad);

-- datos

-- datos especialidad
insert into especialidad values(1, 'general');
insert into especialidad values(2, 'traumatologia');
insert into especialidad values(3, 'kine');

-- datos estado_consulta
insert into estado_consulta values(1, 'confirmada');
insert into estado_consulta values(2, 'cancelada');
insert into estado_consulta values(3, 'pendiente');

-- datos comuna

insert into comuna values(1, 'providencia');
insert into comuna values(2, 'san miguel');
insert into comuna values(3, 'san ramon');

-- datos estado_ingreso

insert into estado_ingreso values(1, 'ingreso');
insert into estado_ingreso values(2, 'no ingreso');

-- datos numero_cama

insert into numero_cama values(1, 22);
insert into numero_cama values(2, 15);
insert into numero_cama values(3, 26);
insert into numero_cama values(4, null);
insert into numero_cama values(5, 2);
insert into numero_cama values(6, 40);

-- datos numero_habitacion

insert into numero_habitacion values(1, '123123');
insert into numero_habitacion values(2, '466456');
insert into numero_habitacion values(3, '656565');
insert into numero_habitacion values(4, 'null');
insert into numero_habitacion values(5, '151564');
insert into numero_habitacion values(6, '454545');

-- datos paciente

insert into paciente values(13,'Patricio','Perez','el bosque',1,898434,1232341,str_to_date('28-02-1967','%d-%m-%Y'));
insert into paciente values(16,'Susana','Carvajal','el arbol',2,32221,23423,str_to_date('28-02-1967','%d-%m-%Y'));
insert into paciente values(17,'Franco','Escalona','la flor',3,123,456,str_to_date('15-11-1969','%d-%m-%Y'));

-- datos medico

insert into medico values(12312,'Francisco','Reyes',312312,1);
insert into medico values(234234,'Maria','de los santos',123123,2);
insert into medico values(5678,'Jose','Jara',345345,3);

-- datos especialidad_medico

insert into especialidad_medico values(1,12312,1);
insert into especialidad_medico values(2,234234,1);
insert into especialidad_medico values(3,5678,1);
insert into especialidad_medico values(4,5678,3);

-- datos atencion_pac_medico

insert into atencion_pac_medico values(1,13,12312,str_to_date('01-02-2023 15:15:00','%d-%m-%Y %H:%i:%s'),1);
insert into atencion_pac_medico values(2,13,234234,str_to_date('15-03-2023 09:00:00','%d-%m-%Y %H:%i:%s'),1);
insert into atencion_pac_medico values(3,13,12312,str_to_date('13-02-2023 15:30:00','%d-%m-%Y %H:%i:%s'),1);
insert into atencion_pac_medico values(4,16,12312,str_to_date('15-02-2023 17:00:00','%d-%m-%Y %H:%i:%s'),2);
insert into atencion_pac_medico values(5,17,5678,str_to_date('10-03-2023 12:15:00','%d-%m-%Y %H:%i:%s'),1);
insert into atencion_pac_medico values(6,17,12312,str_to_date('14-04-2023 10:00:00','%d-%m-%Y %H:%i:%s'),3);
insert into atencion_pac_medico values(7,16,5678,str_to_date('10-05-2023 14:00:00','%d-%m-%Y %H:%i:%s'),1);


-- datos hospitalizacion

insert into hospitalizacion values(1,13,1,1,1,str_to_date('22-05-2022','%d-%m-%Y'),str_to_date('25-12-2022','%d-%m-%Y'));
insert into hospitalizacion values(2,13,2,2,2,null,null);
insert into hospitalizacion values(3,13,3,3,1,str_to_date('30-05-2023','%d-%m-%Y'),str_to_date('30-09-2023','%d-%m-%Y'));
insert into hospitalizacion values(4,16,4,4,null,null,null);
insert into hospitalizacion values(5,17,5,5,1,str_to_date('10-10-2022','%d-%m-%Y'),str_to_date('12-12-2023','%d-%m-%Y'));
insert into hospitalizacion values(6,17,3,6,1,str_to_date('30-05-2020','%d-%m-%Y'),str_to_date('30-05-2020','%d-%m-%Y'));
insert into hospitalizacion values(7,16,6,1,1,str_to_date('14-05-2022','%d-%m-%Y'),str_to_date('30-05-2022','%d-%m-%Y'));

-- consultas

select * from hospitalizacion;
select rut_paciente, numero_cama from hospitalizacion
group by numero_cama;

select * from atencion_pac_medico;

select rut_medico,count(*) as numero_pac from atencion_pac_medico
group by rut_medico
order by numero_pac;