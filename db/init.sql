-- Seleciona o banco de dados
USE db_webapp;

-- Criando tabela "pessoas"
CREATE TABLE pessoas (
    PessoaID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    RG VARCHAR(20) UNIQUE,
    Genero VARCHAR(10) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    CONSTRAINT chk_cpf_length CHECK (CHAR_LENGTH(CPF) = 11)
);

-- Criando tabela "enderecos"
CREATE TABLE enderecos (
    EnderecoID INT PRIMARY KEY AUTO_INCREMENT,
    PessoaID INT NOT NULL,
    Tipo_Logradouro VARCHAR(20) NOT NULL,
    Logradouro VARCHAR(100) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50),
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    CONSTRAINT end_fk_pessoa
        FOREIGN KEY (PessoaID) REFERENCES pessoas(PessoaID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Criando tabela "contatos"
CREATE TABLE contatos(
    ContatoID INT PRIMARY KEY AUTO_INCREMENT,
    PessoaID INT NOT NULL,
    Telefone1 VARCHAR(15) NOT NULL,
    Telefone2 VARCHAR(15),
    Telefone3 VARCHAR(15),
    email1 VARCHAR(40) NOT NULL,
    email2 VARCHAR(40),
    CONSTRAINT cont_fk_pessoa
        FOREIGN KEY (PessoaID) REFERENCES pessoas(PessoaID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Criando novo usuário para acesso ao banco de dados
CREATE USER 'userdb'@'%' IDENTIFIED BY 'Zo0&p,12yT$7';

-- Concedendo permissões ao novo usuário
-- Ele não poderá criar, alterar ou excluir tabelas, 
-- mas poderá ler e escrever dados
GRANT SELECT, INSERT, UPDATE, DELETE ON db_webapp.* TO 'userdb'@'%';
