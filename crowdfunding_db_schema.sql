-- Create the crowdfunding_db database
CREATE DATABASE crowdfunding_db;

-- Use the crowdfunding_db database
\c crowdfunding_db;

-- Create the contacts table (assuming a contact is a person or entity)
CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) -- Assuming there's an email column for contacts
);

-- Create table for crowdfunding information, with foreign key referencing contacts
CREATE TABLE crowdfunding_info (
    cf_id SERIAL PRIMARY KEY,
    contact_id INT NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    blurb TEXT,
    goal NUMERIC NOT NULL,
    pledged NUMERIC NOT NULL,
    outcome VARCHAR(50),
    backers_count INT NOT NULL,
    country VARCHAR(2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    launched_at TIMESTAMP NOT NULL,
    deadline TIMESTAMP NOT NULL,
    staff_pick BOOLEAN NOT NULL,
    spotlight BOOLEAN NOT NULL,
    category_subcategory VARCHAR(255) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id) ON DELETE CASCADE
);

-- Example of how you can import the CSVs into the tables
-- For crowdfunding_info (assuming the CSV has the necessary columns)
COPY crowdfunding_info(contact_id, company_name, blurb, goal, pledged, outcome, backers_count, country, currency, launched_at, deadline, staff_pick, spotlight, category_subcategory)
FROM 'resources/crowdfunding_info.csv' DELIMITER ',' CSV HEADER;

-- SELECT statement to display the data
SELECT * FROM crowdfunding_info;

-- SELECT statement for contacts (to view contact information)
SELECT * FROM contacts;
