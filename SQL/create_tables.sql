CREATE DATABASE MELI_ECOMERCE;

USE MELI_ECOMERCE;

CREATE TABLE CUSTOMER(
    id_customer   INT PRIMARY KEY,
    tipo_usuario  VARCHAR(7),
    email         VARCHAR,
    nome          VARCHAR(100),
    sobrenome     VARCHAR(100),
    sexo          VARCHAR(20),
    endereco      VARCHAR,
    nascimento    DATE,
    telefone      VARCHAR(30)
);

CREATE TABLE CATEGORY(
    id_category  INT PRIMARY KEY,
    nome         VARCHAR(100),
    caminho      VARCHAR(200)
);

CREATE TABLE ITEM(
    id_item            INT PRIMARY KEY,
    nome               VARCHAR,
    descricao          VARCHAR,
    preco              DECIMAL(10,2),
    status             VARCHAR(20),
    data_cadastro      DATE,
    data_cancelamento  DATE,
    id_category        INT,
    FOREIGN KEY (id_category) REFERENCES Category(id_category)
);


CREATE TABLE ORDERS(
    id_order     INT PRIMARY KEY,
    id_customer  INT,
    id_vendedor  INT,
    data_pedido  DATE,
    total        Decimal(10,2),
    FOREIGN KEY (id_vendedor) REFERENCES Customer(id_customer),
    FOREIGN KEY (id_customer) REFERENCES Customer(id_customer)
);

CREATE TABLE ORDERITEM (
    id_order        INT,
    id_item         INT,
    quantidade      INT,
    preco_unitario  DECIMAL(10,2),
    FOREIGN KEY (id_order) REFERENCES Orders(id_order),
    FOREIGN KEY (id_item) REFERENCES Item(id_item)
);