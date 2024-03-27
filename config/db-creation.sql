CREATE TABLE Customer (
    id INTEGER IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    name VARCHAR (200) NOT NULL,
    document VARCHAR (50) NOT NULL,
    phone VARCHAR (50) NOT NULL,
    address VARCHAR (200) NOT NULL
);

CREATE TABLE Sale (
    id INTEGER NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    full_price FLOAT NOT NULL,
    discount FLOAT NOT NULL,
    final_price FLOAT NOT NULL,
    timestamp DATETIME NOT NULL,
    CONSTRAINT Customer_FK FOREIGN KEY (customer_id) REFERENCES Customer (id),
);

CREATE TABLE Product (
    id INTEGER IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    name VARCHAR (200) NOT NULL,
    description VARCHAR (8000) NOT NULL,
    unit_of_measure VARCHAR (30) NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE SaleProduct (
    sale_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity FLOAT NOT NULL,
    unity_price FLOAT NOT NULL,
    total_price FLOAT NOT NULL,
    CONSTRAINT Sale_Product_FK FOREIGN KEY (sale_id) REFERENCES Sale (id),
    CONSTRAINT Product_FK FOREIGN KEY (product_id) REFERENCES Product (id),
    Primary key (sale_id, product_id)
);

CREATE TABLE Service (
    id INTEGER IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    name VARCHAR (200) NOT NULL,
    description VARCHAR (8000) NOT NULL,
    minutes_to_execute INTEGER NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE SaleService (
    sale_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    quantity FLOAT NOT NULL,
    total_price FLOAT NOT NULL,
    CONSTRAINT Sale_Service_FK FOREIGN KEY (sale_id) REFERENCES Sale (id),
    CONSTRAINT Service_FK FOREIGN KEY (service_id) REFERENCES Service (id),
    Primary key (sale_id, service_id)
);