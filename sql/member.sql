CREATE TABLE Member
(
    id           VARCHAR(20) PRIMARY KEY,
    password     VARCHAR(30) NOT NULL,
    nickname     VARCHAR(15) NOT NULL,
    introduction VARCHAR(100),
    joined       DATETIME    NOT NULL DEFAULT NOW()
);

SELECT *
FROM Member;