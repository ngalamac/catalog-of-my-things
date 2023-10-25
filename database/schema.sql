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

/* Games talble */

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  label_id INT NOT NULL,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres (id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors (id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES labels (id)
);

/* Authors table */

CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR (255) NOT NULL,
  last_name VARCHAR (255) NOT NULL,
  PRIMARY KEY (id)
);
