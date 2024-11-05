CREATE TABLE Board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(30)   NOT NULL,
    content  VARCHAR(5000) NOT NULL,
    writer   VARCHAR(15)   NOT NULL,
    created  DATETIME      NOT NULL DEFAULT NOW(),
    modified DATETIME               DEFAULT NOW() ON UPDATE NOW(),
    pinned   BOOLEAN                DEFAULT FALSE
);

DROP TABLE Board;

ALTER TABLE Board
    MODIFY title VARCHAR(30) NOT NULL;

SELECT id, title, pinned
FROM Board;