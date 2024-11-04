CREATE TABLE Board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(50)   NOT NULL,
    content  VARCHAR(5000) NOT NULL,
    writer   VARCHAR(15)   NOT NULL,
    created  DATETIME      NOT NULL DEFAULT NOW(),
    modified DATETIME               DEFAULT NOW() ON UPDATE NOW(),
    pinned   BOOLEAN                DEFAULT FALSE
);

INSERT INTO Board (title, content, writer)
VALUES ('test1', 'test1', 'test1');
