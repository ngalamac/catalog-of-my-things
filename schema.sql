-- Music Album
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

-- Genre
CREATE TABLE Genre(
    id SERIAl PRIMARY KEY,
    name VARCHAR(100),
)
