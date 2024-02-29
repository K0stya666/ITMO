BEGIN;

CREATE TABLE culture (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    characteristic TEXT
);

CREATE TABLE detail (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    model TEXT,
    year_of_issue INT DEFAULT 100
);

CREATE TABLE technology (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    life_time INT,
    area_of_use TEXT,
    detail_id SERIAL REFERENCES detail(id)
);

CREATE TABLE liveability (
    id SERIAL PRIMARY KEY,
    water BOOLEAN,
    plants BOOLEAN,
    fossils BOOLEAN,
    atmosphere BOOLEAN
);

CREATE TABLE heavenly_body (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    weight FLOAT CHECK (weight > 0),
    diameter FLOAT CHECK (diameter > 0),
	liveability_id SERIAL REFERENCES liveability(id)
);

CREATE TABLE civilization (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    creatures TEXT,
    extinction_resistance TEXT,
	heavenly_body_id SERIAL REFERENCES heavenly_body(id),
    culture_id SERIAL REFERENCES culture(id),
    technology_id SERIAL REFERENCES technology(id)
);

INSERT INTO liveability (water, plants, fossils, atmosphere)
VALUES (true, false, false, false),
       (false, false, false, false),
	   (true, true, false, false);

INSERT INTO heavenly_body(name, weight, diameter)
VALUES ('Луна', 1200, 2300.5),
       ('Земля', 723, 5646),
       ('Марс', 24234, 243423);
    
INSERT INTO culture(name, characteristic)
VALUES ('Добрая', 'непримечательная'),
       ('Злая', 'особая'),
       ('Непримечательная', 'лучшая');
	   
INSERT INTO detail (name, model, year_of_issue)
VALUES ('шестерёнка', 'TX-1', 100),
       ('ствол', 'LFG-13', 23),
	   ('колесо', 'AM-12', 8);
    
INSERT INTO technology(name, life_time, area_of_use, detail_id)
VALUES ('Летающие корабли', 303, 'транспортировка', 2),
       ('Лазерные пулемёты', 666, 'оружие', 1),
       ('Световые мечи', 723, 'оружие', 3);
	   
INSERT INTO civilization (name, creatures, extinction_resistance, culture_id, technology_id)
VALUES ('Звездная Цивилизация', 'пришельцы', 'высокая', 1, 3),
       ('Подземный Народ', 'боги', 'средняя', 2, 1),
       ('Эльфийская Империя', 'монстры', 'низкая', 3, 2);

COMMIT;
