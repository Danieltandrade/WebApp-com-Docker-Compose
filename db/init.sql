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

-- Inserindo pessoas
INSERT INTO pessoas (Nome, Sobrenome, CPF, RG, Genero, Data_Nascimento) VALUES
('João', 'Silva', '12345678901', 'MG1234567', 'Masculino', '1985-04-15'),
('Maria', 'Oliveira', '23456789012', 'SP2345678', 'Feminino', '1990-08-22'),
('Carlos', 'Santos', '34567890123', 'RJ3456789', 'Masculino', '1979-12-05'),
('Ana', 'Souza', '45678901234', 'PR4567890', 'Feminino', '1988-06-11'),
('Pedro', 'Pereira', '56789012345', 'RS5678901', 'Masculino', '1995-01-28'),
('Lucas', 'Almeida', '67890123456', 'BA6789012', 'Masculino', '1999-09-10'),
('Juliana', 'Ferreira', '78901234567', 'PE7890123', 'Feminino', '1983-03-30'),
('Bruno', 'Rodrigues', '89012345678', 'SC8901234', 'Masculino', '1992-07-25'),
('Fernanda', 'Martins', '90123456789', 'DF9012345', 'Feminino', '1987-11-02'),
('André', 'Barbosa', '01234567890', 'GO0123456', 'Masculino', '1980-05-19'),
('Camila', 'Lima', '11223344556', 'AM1122334', 'Feminino', '1998-04-07'),
('Rodrigo', 'Ribeiro', '22334455667', 'CE2233445', 'Masculino', '1984-12-17'),
('Patrícia', 'Cardoso', '33445566778', 'MT3344556', 'Feminino', '1975-02-09'),
('Rafael', 'Gomes', '44556677889', 'PA4455667', 'Masculino', '1986-09-14'),
('Larissa', 'Moura', '55667788990', 'RO5566778', 'Feminino', '1993-06-03'),
('Thiago', 'Costa', '66778899001', 'RR6677889', 'Masculino', '1982-10-29'),
('Mariana', 'Azevedo', '77889900112', 'PI7788990', 'Feminino', '1991-03-15'),
('Gustavo', 'Pinto', '88990011223', 'RN8899001', 'Masculino', '1978-07-12'),
('Bianca', 'Teixeira', '99001122334', 'MA9900112', 'Feminino', '1996-12-21'),
('Alex', 'Dias', '10111213141', 'TO1011121', 'Outros', '1989-08-08');

-- Inserindo endereços (um por pessoa)
INSERT INTO enderecos (PessoaID, Tipo_Logradouro, Logradouro, Numero, Complemento, Bairro, Cidade, Estado, CEP) VALUES
(1, 'Rua', 'Das Flores', '123', NULL, 'Centro', 'Belo Horizonte', 'MG', '30110000'),
(2, 'Avenida', 'Paulista', '1000', 'Apto 12', 'Bela Vista', 'São Paulo', 'SP', '01310000'),
(3, 'Rua', 'Do Sol', '45', NULL, 'Jardim', 'Rio de Janeiro', 'RJ', '20040000'),
(4, 'Praça', 'Sete de Setembro', '1', NULL, 'Centro', 'Curitiba', 'PR', '80020000'),
(5, 'Rua', 'Dos Andradas', '500', NULL, 'Centro', 'Porto Alegre', 'RS', '90020000'),
(6, 'Avenida', 'Tancredo Neves', '200', 'Sala 301', 'Caminho das Árvores', 'Salvador', 'BA', '41820020'),
(7, 'Rua', 'Aurora', '88', NULL, 'Boa Vista', 'Recife', 'PE', '50050000'),
(8, 'Avenida', 'Beira-Mar', '3000', NULL, 'Centro', 'Florianópolis', 'SC', '88015000'),
(9, 'Rua', 'Das Palmeiras', '77', NULL, 'Asa Norte', 'Brasília', 'DF', '70000000'),
(10, 'Rua', 'Goiás', '250', NULL, 'Setor Central', 'Goiânia', 'GO', '74000000'),
(11, 'Avenida', 'Brasil', '199', NULL, 'Centro', 'Manaus', 'AM', '69010000'),
(12, 'Rua', 'Fortaleza', '321', NULL, 'Meireles', 'Fortaleza', 'CE', '60160110'),
(13, 'Praça', 'Da Matriz', '5', NULL, 'Centro', 'Cuiabá', 'MT', '78020000'),
(14, 'Rua', 'Ver-o-Peso', '66', NULL, 'Cidade Velha', 'Belém', 'PA', '66020000'),
(15, 'Avenida', 'Carlos Gomes', '101', NULL, 'Centro', 'Porto Velho', 'RO', '76801000'),
(16, 'Rua', 'Das Seringueiras', '12', NULL, 'Centro', 'Boa Vista', 'RR', '69301000'),
(17, 'Rua', 'São João', '400', NULL, 'Centro', 'Teresina', 'PI', '64000000'),
(18, 'Avenida', 'Ponta Negra', '900', NULL, 'Ponta Negra', 'Natal', 'RN', '59090000'),
(19, 'Rua', 'Dos Coqueiros', '555', NULL, 'Centro', 'São Luís', 'MA', '65010000'),
(20, 'Avenida', 'Palmas Brasil Norte', '700', NULL, 'Plano Diretor Norte', 'Palmas', 'TO', '77001000');

-- Inserindo contatos (um por pessoa)
INSERT INTO contatos (PessoaID, Telefone1, Telefone2, Telefone3, Email1, Email2) VALUES
(1, '+5531999991111', NULL, NULL, 'joao.silva@email.com', NULL),
(2, '+5511988882222', NULL, NULL, 'maria.oliveira@email.com', NULL),
(3, '+5521977773333', NULL, NULL, 'carlos.santos@email.com', NULL),
(4, '+5541966664444', NULL, NULL, 'ana.souza@email.com', NULL),
(5, '+5551955555555', NULL, NULL, 'pedro.pereira@email.com', NULL),
(6, '+5571944446666', NULL, NULL, 'lucas.almeida@email.com', NULL),
(7, '+5581933337777', NULL, NULL, 'juliana.ferreira@email.com', NULL),
(8, '+5548922228888', NULL, NULL, 'bruno.rodrigues@email.com', NULL),
(9, '+5561911119999', NULL, NULL, 'fernanda.martins@email.com', NULL),
(10, '+5562988880000', NULL, NULL, 'andre.barbosa@email.com', NULL),
(11, '+5592977771111', NULL, NULL, 'camila.lima@email.com', NULL),
(12, '+5585966662222', NULL, NULL, 'rodrigo.ribeiro@email.com', NULL),
(13, '+5565695553333', NULL, NULL, 'patricia.cardoso@email.com', NULL),
(14, '+5591944444444', NULL, NULL, 'rafael.gomes@email.com', NULL),
(15, '+5569933335555', NULL, NULL, 'larissa.moura@email.com', NULL),
(16, '+5595922226666', NULL, NULL, 'thiago.costa@email.com', NULL),
(17, '+5586911117777', NULL, NULL, 'mariana.azevedo@email.com', NULL),
(18, '+5584988888888', NULL, NULL, 'gustavo.pinto@email.com', NULL),
(19, '+5598977779999', NULL, NULL, 'bianca.teixeira@email.com', NULL),
(20, '+5563966660000', NULL, NULL, 'alex.dias@email.com', NULL);
