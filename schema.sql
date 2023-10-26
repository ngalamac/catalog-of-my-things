
CREATE TABLE MusicAlbum (
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    genre_id INT,
    author_id INT,
    label_id INT,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (label_id) REFERENCES label(id),
)


CREATE TABLE genre(
    id SERIAl PRIMARY KEY,
    name VARCHAR(100),
)

CREATE TABLE item (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  genre TEXT,
  author TEXT,
  cover_state TEXT,
  publish_date TEXT,
  title TEXT,
  artist TEXT,
  publish_date TEXT,
  label TEXT
);

CREATE TABLE label (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  color TEXT
);

CREATE TABLE book(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(50) NOT NULL,
  cover_state VARCHAR(50) NOT NULL,
  author_ID INT,
  genre_ID INT,
  label_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
);

CREATE TABLE author (
  id SERIAl PRIMARY KEY,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL
);

CREATE TABLE game (
     id SERIAl PRIMARY KEY,
     publish_date DATE NOT NULL,
     archived BOOLEAN,
     last_played_at TEXT,
     multiplayer TEXT,
     FOREIGN KEY (id) REFERENCES genre(id),
     FOREIGN KEY (id) REFERENCES author(id),
     FOREIGN KEY (id) REFERENCES label(id),
     FOREIGN KEY (id) REFERENCES source(id)
);