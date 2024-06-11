create database Bd_CDS;
use Bd_CDS;

create table Tb_Artista(
       Id_Artista int auto_increment not null,
     Nome_Artista varchar(100) not null unique,
	constraint Pk_Id_Artista primary key (Id_Artista)/*aviso de primary key */
);

describe Tb_Artista;
drop table Tb_Artista;

create table Tb_Gravadora(
       Id_Gravadora int auto_increment not null,
     Nome_Gravadora varchar(50) not null unique,
     constraint Pk_Id_Gravadora primary key (Id_Gravadora) /*aviso de primary key */
); 

create table Tb_Categoria(
      Id_Categoria int auto_increment not null,
	Nome_Categoria varchar(50) not null unique,
    constraint Pk_Id_Categoria primary key (Id_Categoria)
);

create table Tb_Estado(
      Sigla_Est varchar(2) not null,
   Nome_Estado varchar(50) not null unique,
   constraint Pk_Sigla_Estado primary key (Sigla_Est)
);

create table Tb_Cidade(
      Id_Cidade int not null,
	Nome_Cidade varchar(100) not null,
    Fk_Sigla_Est varchar(2) not null,
    constraint Pk_Id_Cidade primary key (Id_Cidade),
      constraint Fk_Sigla_Est foreign key (Fk_Sigla_Est) references Tb_Estado (Sigla_Est)
);

create table Tb_Cliente(
      Id_Cliente int not null,
	Nome_Cliente varchar(100) not null,
    End_Cli varchar(200) not null,
    Renda_Cli decimal(10,2) not null default 0 check (Renda_Cli >= 0),
    Genero_Cli enum ('M', 'F') default 'F',
    Fk_Id_Cidade int not null,
    constraint Pk_Id_Cliente primary key (Id_Cliente),
    constraint Fk_Id_Cidade foreign key (Fk_Id_Cidade) references Tb_Cidade (Id_Cidade)
 );
 
 create table Tb_Conjuge(
       Id_Cliente int not null,
       primary key (Id_Cliente),
       foreign key (Id_Cliente) references Tb_Cliente (Id_Cliente),
	Nome_Conj varchar(100) not null,
    Renda_Conj decimal(10,2) not null default 0 check (Renda_Conj >= 0),
    Genero_Conj char(1) not null default 'F' check (Genero_Conj in ('F', 'M'))
 );
 
 create table Tb_Funcionario (
	    Id_Func int not null,
	Nome_Func varchar(100) not null,
    End_Func varchar(200) not null,
    Sal_Func decimal(10,2) not null default 0 check (Sal_Func >=0),
    Genero_Conj enum ('M', 'F') default 'M',
    constraint Pk_Id_Func primary key (Id_Func)
 );
 
 create table Tb_Dependente(
		Id_Dep int not null,
	Fk_Id_Func int not null,
    Nome_Dep varchar(100) not null,
    Genero_Dep enum ('F', 'M') default 'M',
    constraint Pk_Id_Dep primary key (Id_Dep),
    constraint Fk_Id_Func foreign key (Fk_Id_Func) references Tb_Funcionario (Id_Func)
 );
 
 create table Tb_Titulo(
	    Id_Tit int not null,
	Fk_Id_Categoria int not null,
    Fk_Id_Gravadora int not null,
    Nome_CD varchar(100) not null unique,
    Val_CD decimal(10,2) not null check (Val_CD >0),
    Qtd_Estq int not null check (Qtd_Estq >= 0),
    constraint Pk_Id_Tit primary key (Id_Tit),
    constraint Fk_Id_Categoria foreign key (Fk_Id_Categoria) references Tb_Categoria (Id_Categoria),
    constraint Fk_Id_Gravadora foreign key (Fk_Id_Gravadora) references Tb_Gravadora (Id_Gravadora)
 );
 drop table Tb_Titulo;
 
 create table Tb_Pedido(
	    Num_Ped int not null,
	Fk_Id_Cliente int not null,
    Id_Func int not null,
    Data_Ped datetime not null,
    Val_Ped decimal (10,2) not null check (Val_Ped >= 0) default 0,
    constraint Pk_Num_Ped primary key (Num_Ped),
    constraint Fk_Id_Cliente foreign key (Fk_Id_Cliente) references Tb_Cliente (Id_Cliente),
         constraint Id_Func foreign key (Id_Func) references Tb_Funcionario (Id_Func)
 );
 
 create table Titulo_Pedido(
        Fk_Num_Ped int not null,
	Fk_Id_Tit int not null,
    Qtd_CD int not null check (Qtd_CD >=1),
    Val_CD decimal (10,2) not null check (Val_CD > 0)
 );
 
 create table Tb_Titulo_Artista(
        Fk_Id_Tit int not null,
	Fk_Id_Artista int not null,
    constraint Fk_Id_Tit foreign key (Fk_Id_Tit) references Tb_Titulo (Id_Tit),
	constraint Fk_Id_Artista foreign key (Fk_Id_Artista) references Tb_Artista (Id_Artista)
 );
 
 










