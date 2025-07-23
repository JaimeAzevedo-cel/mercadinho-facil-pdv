-- Crie o banco: CREATE DATABASE mercadinho_db;

CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  codigo_barras VARCHAR(50) UNIQUE,
  categoria VARCHAR(50),
  preco DECIMAL(10,2),
  estoque INT,
  estoque_minimo INT DEFAULT 5
);

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  cpf VARCHAR(14) UNIQUE,
  telefone VARCHAR(20)
);

CREATE TABLE vendas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT,
  data DATETIME,
  total DECIMAL(10,2),
  forma_pagamento VARCHAR(20),
  status_pagamento VARCHAR(20) DEFAULT 'pago',
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_venda (
  id INT AUTO_INCREMENT PRIMARY KEY,
  venda_id INT,
  produto_id INT,
  quantidade INT,
  preco_unitario DECIMAL(10,2),
  FOREIGN KEY (venda_id) REFERENCES vendas(id),
  FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  senha VARCHAR(255)
);