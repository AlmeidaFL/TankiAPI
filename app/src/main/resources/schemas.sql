CREATE TABLE spaces(
                       id INT PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       owner VARCHAR(50) NOT NULL
);

CREATE SEQUENCE space_id_seq;

CREATE TABLE messages(
                         space_id INT NOT NULL REFERENCES spaces(id),
                         msg_id INT PRIMARY KEY,
                         author VARCHAR(30) NOT NULL,
                         msg_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         msg_text VARCHAR(1024) NOT NULL
);

CREATE SEQUENCE msg_id_seq;

CREATE TABLE users(
                         id VARCHAR(30) PRIMARY KEY,
                         password_hash VARCHAR(255) NOT NULL
);

CREATE INDEX msg_timestamp_idx ON messages(msg_time);
CREATE UNIQUE INDEX space_name_idx ON spaces(name);

CREATE USER tank_api_user PASSWORD 'password';
GRANT SELECT, INSERT ON spaces, messages, users TO tank_api_user;

