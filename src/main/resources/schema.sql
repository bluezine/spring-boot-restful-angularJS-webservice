create table IF NOT EXISTS USER (
   ID 			VARCHAR(255)
  ,NAME		    VARCHAR(255)
  ,PRIMARY KEY(ID)
);

INSERT INTO USER (ID, NAME) VALUES ('bluezine', 'bluezine');
INSERT INTO USER (ID, NAME) VALUES ('hong', '홍길동');