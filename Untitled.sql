create table category(
    category_id VARCHAR NOT NULL,
    category VARCHAR NOT NULL,
    PRIMARY KEY (category_id));
	select * from category
create table subcategory (
    subcategory_id VARCHAR NOT NULL,
    subcategory VARCHAR NOT NULL,
    PRIMARY KEY (subcategory_id)
);
select * from subcategory

CREATE TABLE contacts (
    contact_id INT NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    PRIMARY KEY (contact_id)
);
select * from contacts

CREATE TABLE campaign (
    cf_id INT NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    description VARCHAR(150) NOT NULL,
    goal DECIMAL(10,2) NOT NULL,
    pledged DECIMAL(10,2) NOT NULL,
    outcome VARCHAR(50) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(50) NOT NULL,
    currency VARCHAR(30) NOT NULL,
    launched_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(20) NOT NULL,
    subcategory_id VARCHAR(30) NOT NULL,
    CONSTRAINT pk_campaign PRIMARY KEY (cf_id),
    CONSTRAINT fk_contact FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(category_id),
    CONSTRAINT fk_subcategory FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);
select * from campaign

