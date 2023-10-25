CREATE DATABASE IF NOT EXISTS `catalog_db`;

/*Create tables foe book and label*/
CREATE TABLE IF NOT EXISTS book (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255) NOT NULL,
    cover_style VARCHAR(255) NOT NULL,
    FOREIGN KEY (id) REFERENCES item(id) ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    item INT[],
    FOREIGN KEY (id) REFERENCES item(id) ON DELETE CASCADE
)
