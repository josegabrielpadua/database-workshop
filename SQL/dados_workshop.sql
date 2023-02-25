INSERT INTO clients(nameC, Address, telephone, CPF, email, birthDay, age) VALUES
	('Rafael Aieres', 'Rua Afonso 98 - Zona Sul, SP, SP', '1193729594', '523.355.764-02', null, '1997-08-21', 25),
    ('Arthur Calvacante', 'Rua Robertinho da Silva 108 - Zona Oeste, SP, SP', '1198761327', '524.788.183-05', null, '1994-05-04', 28),
    ('Larissa Barbosa', 'Rua Homem do Saco - Zona Oeste, SP, SP', '1194831328', '588-133-592-02', 'larissabarbosa@hotmail.com', '2000-01-30', 23),
    ('Manoel Gomes', 'Rua Caneta Azul 13 - Zona Leste, SP, SP', '1198685332', '584-912-821-05', null, '1970-06-14', 52);

UPDATE clients SET email = 'rafaelaires@gmail.com' WHERE CPF = '523.355.764-02';
    
INSERT INTO mechanicalWorkshop(workshopName, workshopTelephone, workshopAddress, workshopLocation) VALUES 
	('CarWork', '112123-2111', 'Avenida Santana - Zona Norte, SP', 'SP');

INSERT INTO vehicle(idVMechanicalWorkshop, idVClient, vehicleName, vehicleModel, vehicleType) VALUES
	(1, 1, 'Porche Cayman S', '718', 'car'),
    (1, 4, 'Kombi volkswagen', '1500', 'van');

INSERT INTO part(partName, partValue) VALUES
	('Velas de ignição', 150.00),
    ('Filtro de Óleo', 85.00),
    ('Pistão', 300.00),
    ('Caixa de câmbio', 250.00),
    ('Suspensão', 150.00);

INSERT INTO mechanicalTeam(responsible) VALUES
	('Bruno Souza'),
    ('Santos Dulmond');



#Funções:

# 'Elétrica e eletrônica de automóveis', 'Sistemas de arrefecimento', 'Freios', 'Amortecedores e suspensões', 
#'Estética automotiva', 'Sistemas de transmissão', 'Manutenção de veículos leves e pesados', 'Ajudante'

INSERT INTO mechanics(idMecMechanicalWorkshop, idMecTeam, mechanicName, mechanicAddress, mechanicFunction, age) VALUES
	(1, 1, 'Arthur Valente', 'Rua Afonso 98 - Zona Norte, SP, SP', 'Elétrica e eletrônica de automóveis', 32),
    (1, 1, 'Leonan Aguiar', 'Rua Jubs 12 - Zona Leste, SP, SP', 'Sistemas de arrefecimento', 34),
	(1, 1, 'Rafael da Silva', 'Avenida Cerejeiras 21 - Zona Norte, SP, SP', 'Freios', 23),
    (1, 1, 'Bruno Souza', 'Rua Cidade das Flores - Zona Oeste, SP, SP', 'Amortecedores e suspensões', 42),
    (1, 2, 'Manoel Silva', 'Avenida Jardim Brasil - Zona Leste, SP, SP', 'Estética automotiva', 21),
    (1, 2, 'Leandro Barbosa', 'Avenida Edificios - Zona Sul, SP, SP', 'Sistemas de transmissão', 19),
    (1, 2, 'Santos Dulmond', 'Rua Rio de Janeiro - Zona Oeste, SP, SP', 'Manutenção de veículos leves e pesados', 24),
    (1, 2, 'Leonardo', 'Avenida Jardim Japão - Zona Norte, SP, SP', 'Ajudante', 18),
	(1, 2, 'Bruno da Silva', 'Rua Afonso 52 - Zona Norte, SP, SP', 'Ajudante', 20),
    (1, 2, 'Eduardo Gomes', 'Rua Flores 12, Zona Oeste, SP, SP', 'Ajudante', 21);
    

INSERT INTO  service(idSerTeam, serviceDescription, serviceValue) VALUES
	(2, 'A Kombi está com o sistema de transmissão prejudicado', 250.00),
    (1, 'A porche cayman S está precisando de uma manunteção no motor', 980.00);

 
 #Status do serviço: 'Serviço terminado', 'Serviço em andamento', 'Serviço Cancelado'
 #Autorização do cliente: 'Confirmado', 'Cancelado', 'Em andamento'
 
INSERT INTO serviceOrder(idSOSMechanicalWorkshop, deliveryDate, issueDate, serviceValueTotal, 
	clientAuthorization, serviceOrderStatus, idSOSClient, idSOSVehicle) VALUES
	(1, '2023-02-21', '2023-01-22', 400.00, 'Confirmado', default, 1, 1),
	 (1, '2023-03-14', '2023-01-30', 1200.00, 'Em andamento', default, 4, 2);

INSERT INTO partOS(idPartOSServiceOrder, idPartOSPart) VALUES
	(1, 4),
    (2, 1);
    
INSERT INTO serviceOS(idSerOSServiceOrder, idSerOSService) VALUES
	(1, 1),
    (2, 2);

#Veículos que estão na oficina mecânica

SELECT * FROM mechanicalWorkshop INNER JOIN vehicle ON idVMechanicalWorkshop = idMechanicalWorkshop;


#Procurando clientes e ordenando por email

SELECT NameC as Client, Address, telephone, email FROM clients
	ORDER BY email;
    
#Procurando clientes que mandaram seus veículos para a oficina mecânica, e fazendo uma relação de oficina - cliente - veículo

SELECT NameC as Client, telephone, vehicleName as vehicle, workshopName as Workshop
	FROM clients INNER JOIN vehicle ON idVClient = idClient
		INNER JOIN mechanicalWorkshop ON idVMechanicalWorkshop = idMechanicalWorkshop;

#Procurando mecânicos e seus responsáveis

SELECT mechanicName as Name, mechanicAddress as Address, mechanicFunction as FunctionM, age, responsible
	FROM mechanicalTeam INNER JOIN mechanics WHERE idMecTeam = idTeam;

#Utlizando o HAVING, procurando pessoas que possuem 22 anos ou mais

SELECT mechanicName as Name, mechanicAddress as Address, mechanicFunction as FunctionM, age, responsible
	FROM mechanicalTeam INNER JOIN mechanics WHERE idMecTeam = idTeam
		HAVING age >= 22;

#Procurando a equipe que tenha somente Santos Dulmond como responsável

SELECT mechanicName as Name, mechanicAddress as Address, mechanicFunction as FunctionM, age, responsible
	FROM mechanicalTeam INNER JOIN mechanics WHERE (idMecTeam = idTeam)
		and (responsible = 'Santos Dulmond');
	
#Procurar Ordem de serviço, nome do client, telefone, veículo e valor

SELECT NameC as Name, telephone, vehicleName as vehicle, serviceValueTotal as ServiceValue
	FROM serviceOrder INNER JOIN clients ON idClient = idSOSClient
		INNER JOIN vehicle ON idVehicle = idSOSVehicle;

#Procurando peças, valor da peça e serviços relacionados

SELECT partName, partValue, serviceOrderStatus 
	FROM partOS INNER JOIN part ON idPartOSPart = idPart
		INNER JOIN serviceOrder ON idServiceOrder = idPartOSServiceOrder;
        
#Procurando descrição do serviço, valor de serviço, status de serviço, valor total de serviço, data de emissão e entrega

SELECT serviceDescription, serviceValue, serviceValueTotal, serviceOrderStatus, issueDate, deliveryDate
	FROM serviceOS INNER JOIN serviceOrder ON idSerOSServiceOrder = idServiceOrder
		INNER JOIN service ON idSerOSService = idService;