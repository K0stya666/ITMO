begin;

create table points (
    id SERIAL PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    r FLOAT NOT NULL,
    is_hit BOOLEAN NOT NULL,
    date DATE NOT NULL
);

commit;