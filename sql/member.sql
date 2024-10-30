CREATE TABLE Member
(
    id           VARCHAR(20) PRIMARY KEY,
    password     VARCHAR(30) NOT NULL,
    nickname     VARCHAR(15) NOT NULL,
    introduction VARCHAR(100),
    joined       DATETIME    NOT NULL DEFAULT NOW()
);

# 관리자 권한 테이블
CREATE TABLE authorization
(
    id   VARCHAR(50) REFERENCES Member (id),
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id, name)
);

# 관리자 권한 부여
INSERT INTO authorization
    (id, name)
VALUES ('admin', 'admin');