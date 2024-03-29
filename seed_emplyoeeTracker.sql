DROP DATABASE IF EXISTS employee_tracker_db;

CREATE DATABASE employee_tracker_db;

USE employee_tracker_db;

CREATE TABLE employee (
id INTEGER NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id),
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
role_id INTEGER NOT NULL,
CONSTRAINT fk_role_id
FOREIGN KEY (role_id)
    REFERENCES role(id)
    ON UPDATE CASCADE,
manager_id INTEGER,
CONSTRAINT fk_manager_id
FOREIGN KEY (manager_id)
    REFERENCES manager(id)
    ON UPDATE CASCADE
);

CREATE TABLE role (
id INTEGER NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id),
title VARCHAR(30),
salary DECIMAL,
department_id INTEGER NOT NULL,
CONSTRAINT fk_department_id
FOREIGN KEY (department_id)
    REFERENCES department(id)
    ON UPDATE CASCADE
);

CREATE TABLE department (
id INTEGER NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
department VARCHAR(30)
);

CREATE TABLE manager (
id INTEGER NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
manager VARCHAR(30)
);

SELECT * FROM employee_tracker_db.employee;

SELECT * FROM employee_tracker_db.role;

SELECT * FROM employee_tracker_db.department;

SELECT * FROM employee_tracker_db.manager;

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES
("Sary", "Jamie", 1, 1),
("John","Smith", 2, 1),
("William","Apolo", 4, 3),
("Monica","Guiller", 4, 3),
("Aya","Martin", 4, 3),
("Helen","Gwenn", 3, 2)
("Arturo","Pandito", 3, 2);

INSERT INTO role (title, salary, department_id)
VALUES
('Sales lead', 60,000, 1),
('HR lead', 60,000, 2),
('Sales assistant', 45,000, 1),
('HR assistant', 45,000, 2);

INSERT into department (department)
VALUES
('Sales'),
('HR');

INSERT INTO manager (id, manager)
VALUES
('Bob'),
('Helen'),
('John');

SELECT
id, first_name, last_name, title, department, salary, manager
FROM
employee
INNER JOIN
role USING (id)
INNER JOIN
department USING (id)
INNER JOIN
role using (id)
ORDER BY
id;








