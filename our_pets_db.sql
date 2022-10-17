CREATE DATABASE our_pets;

USE our_pets;

CREATE TABLE pets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pets_name VARCHAR(20) NOT NULL,
    pet_owner VARCHAR(20),
    birth DATE NOT NULL,
    sex CHAR(1),
    species VARCHAR(20) NOT NULL
);

CREATE TABLE events (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pets_name VARCHAR(20) NOT NULL,
    event_date DATE,
    event_type VARCHAR(50) NOT NULL,
    event_description VARCHAR(200)
);

DESCRIBE pets;
DESCRIBE events;

ALTER TABLE events MODIFY pets_name INT;

ALTER TABLE events
ADD FOREIGN KEY(pets_name)
REFERENCES pets(id)
ON DELETE SET NULL;

INSERT INTO pets (pets_name, pet_owner, birth, sex, species) 
VALUES ('Bagira', 'Anastasiia', '2006-01-01', 'f', 'cat');

DELETE FROM pets WHERE id = 1;

INSERT INTO pets (pet_name, pet_owner, birth, sex, species) 
VALUES ('Bagira', 'Anastasiia', '2006-01-01', 'f', 'cat');

ALTER TABLE pets CHANGE pets_name pet_name VARCHAR(20);

INSERT INTO pets (pet_name, pet_owner, birth, sex, species) 
VALUES ('Kiria', 'Diana', '2013-01-01', 'm', 'cat'), 
('Archick', 'Diana', '2021-05-01', 'm', 'dog');

INSERT INTO events (pets_name, event_date, event_type, event_description) 
VALUES (1, '2022-05-01', 'Vaccination', null), 
(1, '2022-01-01', 'Disease', 'stomach upset'), 
(2, '2022-08-01', 'Disease', 'sand in the kidneys'),
(3, '2022-09-01', 'Disease', 'food allergy'),
(3, '2022-07-01', 'Disease', 'epileptic seizure');

ALTER TABLE events CHANGE pets_name pet INT; 

update pets set id=1 where id=4;
update events set pet=1 where id=2;

SELECT * FROM pets;
SELECT * FROM events;

select pets.id, pets.pet_name, pets.pet_owner from pets;
select events.event_date, events.event_type from events;

select pets.id, pets.pet_name, pets.pet_owner 
from pets where pets.birth < '2010-01-01';

select events.pets_name, events.event_date, events.event_type, events.event_description 
from events 
where events.event_description is not null;

select pets.pet_name, pets.species, pets.pet_owner, events.event_date, events.event_type 
from pets 
join events on events.pets_name = pets.id;

select pets.pet_name, pets.pet_owner, pets.sex, pets.birth, events.event_date, events.event_type 
from pets 
join events on events.pets_name = pets.id;

INSERT INTO pets (pet_name, pet_owner, birth, sex, species) 
VALUES ('Barsik', 'Sergey', '2020-01-01', 'm', 'cat'), ('Bonya', 'Sergey', '2018-01-01', 'm', 'dog');

select pets.pet_name, pets.species, pets.pet_owner, events.event_date, events.event_type 
from pets 
left join events on events.pets_name = pets.id;

select pets.pet_name, count(events.pets_name) as eventCount from pets join events on events.pets_name = pets.id group by `pets_name`;

select pets.pet_name, count(events.pets_name) as eventCount from pets join events on events.pets_name = pets.id group by `pets_name` having count(events.pets_name)>1;