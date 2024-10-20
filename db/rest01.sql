-- Drop tables in the correct order to avoid dependency issues
DROP TABLE IF EXISTS store CASCADE;
DROP TABLE IF EXISTS item CASCADE;
DROP TABLE IF EXISTS receipt CASCADE;
DROP TABLE IF EXISTS person_role_map CASCADE;
DROP TABLE IF EXISTS person_role CASCADE;
DROP TABLE IF EXISTS person CASCADE;

-- Create tables in the correct order
CREATE TABLE receipt (
    receiptid BIGINT NOT NULL,
    receiptname VARCHAR(255) NOT NULL,
    date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    PRIMARY KEY (receiptid)
);

CREATE TABLE person (
    personid BIGINT NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    PRIMARY KEY (personid)
);

CREATE TABLE item (
    itemid BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    weight BIGINT NOT NULL,
    pdate TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    expdate TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    receiptid BIGINT NOT NULL,
    makerid BIGINT NOT NULL,
    PRIMARY KEY (itemid),
    FOREIGN KEY (receiptid) REFERENCES receipt(receiptid),
    FOREIGN KEY (makerid) REFERENCES person(personid)
);

CREATE TABLE store (
    storeid BIGINT NOT NULL,
    itemid BIGINT NOT NULL,
    itemname VARCHAR(255) NOT NULL,
    PRIMARY KEY (storeid),
    FOREIGN KEY (itemid) REFERENCES item(itemid)
);

CREATE TABLE person_role (
    roleid BIGINT NOT NULL,
    role CHAR(255) NOT NULL,
    PRIMARY KEY (roleid)
);

CREATE TABLE person_role_map (
    personid BIGINT NOT NULL,
    roleid BIGINT NOT NULL,
    PRIMARY KEY (personid, roleid),
    FOREIGN KEY (personid) REFERENCES person(personid),
    FOREIGN KEY (roleid) REFERENCES person_role(roleid)
);


-- ============== INSERT ==============
-- ====================================

-- Insert into person
INSERT INTO person (personid, firstname, lastname) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Johnson'),
(4, 'Emily', 'Davis'),
(5, 'Chris', 'Brown'),
(6, 'Jessica', 'Miller'),
(7, 'David', 'Wilson'),
(8, 'Sarah', 'Moore'),
(9, 'Daniel', 'Taylor'),
(10, 'Anna', 'Anderson');

-- Insert into personrole
INSERT INTO person_role (roleid, role) VALUES
(1, 'Manager'),
(2, 'Chef'),
(3, 'Waiter'),
(4, 'Assistant Chef'),
(5, 'Cleaner'),
(6, 'Worker');

-- Insert into person_role_map to link person with roles
INSERT INTO person_role_map (personid, roleid) VALUES
(1, 1),  -- John is a Manager
(2, 2),  -- Jane is a Chef
(3, 2),  -- Michael is a Chef
(4, 2),  -- Emily is a Chef
(5, 2),  -- Chris is a Chef
(6, 4),  -- Jessica is Assistant Chef
(7, 4),  -- David is Assistant Chef
(8, 4),  -- Sarah is Assistant Chef
(9, 1),  -- Daniel is a Manager
(10, 5); -- Anna is a Cleaner

-- Insert into receipt (simplified, without person reference and item link corrected)
INSERT INTO receipt (receiptid, receiptname, date) VALUES
(1, 'Italian Sauce', '2024-01-01 10:00'),
(2, 'Mexican Food', '2024-01-02 11:20'),
(3, 'Finnish Food', '2024-01-03 13:10'),
(4, 'French Fries', '2024-01-04 06:05'),
(5, 'German Food', '2024-01-05 02:04'),
(6, 'German Sauce', '2024-01-06 17:30'),
(7, 'Iraqi Food', '2024-01-07 12:02'),
(8, 'Kebab', '2024-01-08 22:15'),
(9, 'Shawarma', '2024-01-09 06:12'),
(10, 'Rolle Kebab', '2024-01-10 09:49');

-- Insert into item (now includes receiptid and makerid)
INSERT INTO item (itemid, name, weight, pdate, expdate, receiptid, makerid) VALUES
(1, 'Italian Sauce', 100, '2023-01-01 10:00', '2024-01-01 10:00', 1, 10),
(2, 'Mexican Food', 200, '2023-02-01 10:00', '2024-02-01 10:00', 2, 8),
(3, 'Finnish Food', 300, '2023-03-01 10:00', '2024-03-01 10:00', 3, 9),
(4, 'French Fries', 400, '2023-04-01 10:00', '2024-04-01 10:00', 4, 6),
(5, 'German Food', 500, '2023-05-01 10:00', '2024-05-01 10:00', 5, 7),
(6, 'German Sauce', 600, '2023-06-01 10:00', '2024-06-01 10:00', 6, 5),
(7, 'Iraqi Food', 700, '2023-07-01 10:00', '2024-07-01 10:00', 7, 2),
(8, 'Kebab', 800, '2023-08-01 10:00', '2024-08-01 10:00', 8, 3),
(9, 'Shawarma', 900, '2023-09-01 10:00', '2024-09-01 10:00', 9, 1),
(10, 'Rolle Kebab', 1000, '2023-10-01 10:00', '2024-10-01 10:00', 10, 4);

-- Insert into store (ensuring valid item references)
INSERT INTO store (storeid, itemid, itemname) VALUES
(1, 1, 'Italian Sauce'),
(2, 2, 'Mexican Food'),
(3, 3, 'Finnish Food'),
(4, 4, 'French Fries'),
(5, 5, 'German Food'),
(6, 6, 'German Sauce'),
(7, 7, 'Iraqi Food'),
(8, 8, 'Kebab'),
(9, 9, 'Shawarma'),
(10, 10, 'Rolle Kebab');









