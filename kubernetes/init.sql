CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;
CREATE TABLE IF NOT EXISTS mytable (
    id INT NOT NULL AUTO_INCREMENT,
    data VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO mytable (id, data)
SELECT 1, 'initial data'
WHERE NOT EXISTS (SELECT 1 FROM mytable);

