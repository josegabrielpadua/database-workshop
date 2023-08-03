# Oficina Mecânica (Workshop)

### Descrição

Este projeto tem como objetivo criar um banco de dados para gerenciar uma oficina mecânica. O banco de dados foi projetado para armazenar informações sobre clientes, veículos, serviços, peças, equipes de mecânicos e ordens de serviço. O sistema permite o registro de clientes, veículos, mecânicos, serviços prestados e controle das ordens de serviço.

### Diagrama da Oficina Mecânica

![Oficina-mecânica-image](https://user-images.githubusercontent.com/118117592/221372059-17c9ca74-d820-4d3d-865f-1b5beb158ae8.png)

### Tecnologias utilizadas

* Linguagem SQL
* Sistema de Gerenciamento de Banco de Dados (SGBD) - Exemplo: MySQL

### Modelagem do Banco de Dados

#### O banco de dados foi projetado com as seguintes tabelas:

1. clients: Armazena informações dos clientes, como nome, endereço, telefone, CPF, email, data de nascimento e idade.
2. mechanicalWorkshop: Tabela para registrar informações da oficina mecânica, como nome, telefone, endereço e localização.
3. vehicle: Tabela para armazenar informações dos veículos que passam pela oficina, incluindo nome do veículo, modelo, tipo e relacionamento com a oficina e o cliente.
4. part: Tabela para registrar informações sobre as peças utilizadas nos serviços, incluindo nome da peça e valor.
5. mechanicalTeam: Tabela para registrar informações das equipes de mecânicos, incluindo o responsável.
6. mechanics: Tabela para armazenar informações dos mecânicos, como nome, endereço, função e idade. Também relaciona-se com a oficina e a equipe de mecânicos.
7. serviceOrder: Tabela para registrar as ordens de serviço, incluindo informações sobre a oficina, equipe, cliente, veículo e datas de entrega e emissão da ordem de serviço.
8. service: Tabela para armazenar informações sobre os serviços prestados, como descrição e valor.
9. serviceOS: Tabela de relacionamento entre as ordens de serviço e os serviços prestados.
10. partOS: Tabela de relacionamento entre as ordens de serviço e as peças utilizadas.

### Funcionalidades

1. Cadastro de clientes, veículos e mecânicos.
2. Registro de informações da oficina mecânica.
3. Cadastro de serviços oferecidos pela oficina.
4. Criação de ordens de serviço para relacionar cliente, veículo e serviços prestados.
5. Controle do status das ordens de serviço (em andamento, concluído, cancelado) e autorização do cliente (confirmado, cancelado, em andamento).

### Como utilizar o projeto

1. Crie um banco de dados no SGBD de sua escolha (exemplo: MySQL) e importe o arquivo contendo o código SQL disponibilizado neste projeto para criar todas as tabelas e relacionamentos.
2. Execute as consultas SQL para inserir os dados iniciais nas tabelas, como clientes, veículos, mecânicos e serviços.
3. Utilize as consultas SQL apresentadas no código para realizar consultas e obter informações sobre clientes, veículos, serviços e ordens de serviço.

### Considerações Finais

Este projeto oferece uma estrutura básica para o gerenciamento de uma oficina mecânica. Dependendo das necessidades do negócio, é possível expandir e aprimorar o banco de dados, adicionando novas funcionalidades e otimizando o código SQL. Além disso, é importante garantir a segurança e integridade dos dados, implementando medidas de proteção, como backups regulares e restrições de acesso aos dados.

### Autor: José Gabriel dos Santos Pádua
