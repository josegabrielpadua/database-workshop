#Criação de DATABASE workshop

#DROP DATABASE workshop;

CREATE SCHEMA IF NOT EXISTS workshop;
USE workshop;

#Criação de tabelas do workshop

CREATE TABLE clients(
	idClient int auto_increment primary key,
    nameC varchar(80) not null,
    Address varchar(255),
    telephone varchar(15),
    CPF varchar(15) not null,
    email varchar(45),
    birthDay date,
    age int 
);


CREATE TABLE mechanicalWorkshop(
	idMechanicalWorkshop int auto_increment primary key,
    workshopName varchar(45),
    workshopTelephone varchar(15),
    workshopLocation char(2),
    workshopAddress varchar(255)
);


CREATE TABLE vehicle(
	idVehicle int auto_increment primary key,
    idVMechanicalWorkshop int,
    idVClient int,
	vehicleName varchar(100) not null,
    vehicleModel varchar(15),
    vehicleType varchar(30),
    constraint fk_vehicle_mechanicalworkshop foreign key(idVMechanicalWorkshop) references mechanicalWorkshop(idMechanicalWorkshop),
    constraint fk_vehicle_client foreign key(idVClient) references clients(idClient)
);

CREATE TABLE part(
	idPart int auto_increment,
    partName varchar(100) not null,
    partValue float not null,
    primary key(idPart)
);

CREATE TABLE mechanicalTeam(
	idTeam int auto_increment primary key,
    responsible varchar(80) not null
);

CREATE TABLE mechanics(
    idMecMechanicalWorkshop int,
    idMecTeam int,
	mechanicName varchar(80),
    mechanicAddress varchar(255),
    mechanicFunction enum('Elétrica e eletrônica de automóveis', 'Sistemas de arrefecimento', 'Freios', 'Amortecedores e suspensões', 
		'Estética automotiva', 'Sistemas de transmissão', 'Manutenção de veículos leves e pesados', 'Ajudante'),
	age int,
    constraint fk_mechanics_mechanicalworkshop foreign key(idMecMechanicalWorkshop) references mechanicalWorkshop(idMechanicalWorkshop),
    constraint fk_mechanics_team foreign key(idMecTeam) references mechanicalTeam(idTeam)
);

CREATE TABLE serviceOrder(
	idServiceOrder int auto_increment,
    idSOSMechanicalWorkshop int,
    idSOSTeam int,
    idSOSClient int,
    idSOSVehicle int,
    deliveryDate date,
    issueDate date,
    serviceValueTotal float default 0,
    primary key(idServiceOrder),
    clientAuthorization enum('Confirmado', 'Cancelado', 'Em andamento') default 'Em andamento',
    serviceOrderStatus enum('Serviço terminado', 'Serviço em andamento', 'Serviço Cancelado') default 'Serviço em andamento',
    constraint fk_serviceorder_mechanicalworkshop foreign key(idSOSMechanicalWorkshop) references mechanicalWorkshop(idMechanicalWorkshop),
    constraint fk_serviceorder_team foreign key(idSOSTeam) references mechanicalTeam(idTeam),
    constraint fk_serviceorder_client foreign key(idSOSClient) references clients(idClient),
    constraint fk_serviceorder_vehicle foreign key(idSOSVehicle) references vehicle(idVehicle)
);


CREATE TABLE service(
	idService int auto_increment,
    idSerTeam int,
    serviceDescription varchar(255),
    serviceValue float not null,
    primary key(idService),
    constraint fk_service_team foreign key (idSerTeam) references mechanicalTeam(idTeam)
);

CREATE TABLE serviceOS(
	idSerOSServiceOrder int, 
    idSerOSService int,
    primary key(idSerOSServiceOrder, idSerOSService),
    constraint fk_serviceos_serviceorder foreign key(idSerOSServiceOrder) references serviceOrder(idServiceOrder),
    constraint fk_serviceos_service foreign key(idSerOSService) references service(idService)
);

CREATE TABLE partOS(
	idPartOSServiceOrder int,
    idPartOSPart int,
    primary key(idPartOSServiceOrder, idPartOSPart),
    constraint fk_partos_serviceorder foreign key(idPartOSServiceOrder) references serviceOrder(idServiceOrder),
    constraint fk_partos_part foreign key(idPartOSPart) references part(idPart)
);



