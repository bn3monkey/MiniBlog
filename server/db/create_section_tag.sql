TRUNCATE table Section restart identity CASCADE;
TRUNCATE table Tag restart identity CASCADE;

INSERT INTO Section (name)
    values 
     ('개발'),
     ('음악'),
     ('그림');

INSERT INTO Tag (name)
    values 
     ('Cpp'),
     ('Kotlin'),
     ('드럼'),
     ('작곡'),
     ('만화'),
     ('크로키');

SELECT * FROM Section;
SELECT * FROM Tag;
