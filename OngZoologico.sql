CREATE DATABASE ONG;

CREATE TABLE IF NOT EXISTS Plano (
	idPlano int primary key not null,
	nomePlano varchar(50) not null,
	valorMensal decimal(10, 2) not null
);

CREATE TABLE IF NOT EXISTS Apoiadores(
	IdApoiadores int primary key not null,
    CNPJ varchar(18),
    CPF varchar(14),
	nomeFantasia varchar(50) not null,
	logoLink varchar(200) not null,
	idPlano int,
	foreign key(idPlano) references Plano(idPlano)
);

CREATE TABLE IF NOT EXISTS Doacao(
	idDoacao int primary key not null,
	tipo varchar(50) not null,
	item varchar(50) not null,
	quantidade int not null,
	statusDoacao varchar(15)
);

CREATE TABLE IF NOT EXISTS UsuarioPessoa(
	idPessoa int primary key not null,
	telefone varchar(15) not null,
	endereco varchar(100) not null,
	idPlano int,
	email varchar(50) not null,
	foreign key(idPlano) references Plano(idPlano)
);

CREATE TABLE IF NOT EXISTS Animal(
	idAnimal int primary key not null,
	nome varchar(50) not null,
	especie varchar(50) not null,
	idade int,
	dataResgate date not null,
	valorApadrinhamento decimal(10,2),
	descricaoSaude varchar(300),
	statusSaude varchar(50) 
);

CREATE TABLE IF NOT EXISTS VisitasApadrinhadas(
	idVisita int primary key not null,
	idUsuario int not null,
	idAnimal int not null, 
	dataVisita date not null, 
	statusVisita varchar(15) not null,
	foreign key (idUsuario) references UsuarioPessoa(idPessoa),
	foreign key (idAnimal) references Animal(idAnimal)
);

CREATE TABLE IF NOT EXISTS Denuncia(
	idDenuncia int primary key not null,
	statusDenuncia varchar(50),
	localizacao varchar(100) not null,
	especieAnimal varchar(50) not null,
	descricaoDenuncia varchar(300)
);

CREATE TABLE IF NOT EXISTS Evento(
	idEvento int primary key not null,
	nomeEvento varchar(50) not null,
	dataEvento date not null,
	descricaoEvento varchar(300),
	tipo varchar(50)
);

CREATE TABLE IF NOT EXISTS Adm(
	IdFuncionario int primary key not null,
	senha varchar(20) not null,
	nome varchar(50) not null,
	funcao varchar(30)
);