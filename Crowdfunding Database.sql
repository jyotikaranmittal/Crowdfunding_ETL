CREATE TABLE Contacts (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Category (
    category_id VARCHAR(20) PRIMARY KEY,
    category VARCHAR(50)
);

CREATE TABLE Subcategory (
    subcategory_id VARCHAR(30) PRIMARY KEY,
    subcategory VARCHAR(100)
);

CREATE TABLE Campaign (
    cf_id INT PRIMARY KEY,
    contact_id INT,
    company_name VARCHAR(100),
    description VARCHAR(150),
    goal INT,
    pledged INT,
	outcome VARCHAR(50)
    backers_count INT,
    country VARCHAR(50),
    currency VARCHAR(30),
    launched_date DATE,
    end_date DATE,
    category_id VARCHAR(20),
    subcategory_id VARCHAR(30),
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES Subcategory(subcategory_id)
);

ALTER TABLE Campaign
DROP COLUMN outcome;

ALTER TABLE Campaign
ALTER COLUMN goal TYPE NUMERIC

ALTER TABLE Campaign
ALTER COLUMN pledged TYPE NUMERIC;
