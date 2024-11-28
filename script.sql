CREATE DATABASE ecommerce;

USE ecommerce;

-- Tabela Cliente
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('PF', 'PJ') NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(15),
    CHECK (tipo IN ('PF', 'PJ'))
);

-- Tabela Produto
CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao TEXT,
    fornecedor_id INT NOT NULL,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(id)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    forma_pagamento ENUM('Cartão', 'Boleto', 'Pix', 'Transferência') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    status ENUM('Pendente', 'Enviado', 'Entregue') DEFAULT 'Pendente',
    codigo_rastreio VARCHAR(50),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
);

-- Tabela Vendedor
CREATE TABLE Vendedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(id)
);

-- Tabela Produto_Pedido (tabela de associação)
CREATE TABLE Produto_Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

-- Inserir Clientes
INSERT INTO Cliente (nome, tipo, cpf_cnpj, email, telefone)
VALUES ('João Silva', 'PF', '12345678900', 'joao@gmail.com', '11999999999');

-- Inserir Fornecedores
INSERT INTO Fornecedor (nome, telefone)
VALUES ('Fornecedor A', '11888888888');

-- Inserir Produtos
INSERT INTO Produto (nome, preco, descricao, fornecedor_id)
VALUES ('Notebook', 3500.00, 'Notebook Dell Inspiron', 1);

-- Inserir Estoque
INSERT INTO Estoque (produto_id, quantidade)
VALUES (1, 10);

-- Inserir Pedido
INSERT INTO Pedido (cliente_id, total)
VALUES (1, 3500.00);

-- Inserir Pagamento
INSERT INTO Pagamento (pedido_id, forma_pagamento, valor)
VALUES (1, 'Cartão', 3500.00);

-- Inserir Entrega
INSERT INTO Entrega (pedido_id, status, codigo_rastreio)
VALUES (1, 'Enviado', 'BR123456789');

SELECT cliente_id, COUNT(*) AS total_pedidos
FROM Pedido
GROUP BY cliente_id;

SELECT v.nome AS vendedor, f.nome AS fornecedor
FROM Vendedor v
INNER JOIN Fornecedor f ON v.fornecedor_id = f.id;

SELECT p.nome AS produto, f.nome AS fornecedor, e.quantidade AS estoque
FROM Produto p
INNER JOIN Fornecedor f ON p.fornecedor_id = f.id
INNER JOIN Estoque e ON p.id = e.produto_id;

SELECT f.nome AS fornecedor, p.nome AS produto
FROM Produto p
INNER JOIN Fornecedor f ON p.fornecedor_id = f.id;
