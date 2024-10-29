CREATE TABLE Member
(
    id          VARCHAR(20) PRIMARY KEY,
    password    VARCHAR(30) NOT NULL,
    name        VARCHAR(15) NOT NULL,
    description VARCHAR(100),
    joined      DATETIME    NOT NULL DEFAULT NOW()
);