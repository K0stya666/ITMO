begin;

create table points (
    id SERIAL PRIMARY KEY,
    X FLOAT NOT NULL,
    Y FLOAT NOT NULL,
    R FLOAT NOT NULL,
    Hit BOOLEAN NOT NULL,
    Date DATE NOT NULL
);

commit;