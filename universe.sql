----- preparing the environment -----

----- creating tables -----

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  age_in_millions_of_years INTEGER,
  galaxy_types VARCHAR(50)[]
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  galaxy_id INTEGER REFERENCES galaxy(galaxy_id) ON DELETE SET NULL
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  is_spherical BOOLEAN,
  age_in_millions_of_years INTEGER,
  planet_types VARCHAR(50)[],
  star_id INTEGER REFERENCES star(star_id) ON DELETE SET NULL
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  distance_from_earth NUMERIC(10, 2),
  age_in_millions_of_years INTEGER,
  planet_id INTEGER REFERENCES planet(planet_id) ON DELETE SET NULL
);

CREATE TABLE astronomer (
  astronomer_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  researcher_code INTEGER NOT NULL UNIQUE
);

------- adding values to the tables -------

-- min of 6 rows
INSERT INTO galaxy(name, description, age_in_millions_of_years, galaxy_types)
VALUES
  ('galaxy1', 'this is galaxy one', 1234, ARRAY['type A', 'type B']),
  ('galaxy2', 'this is galaxy two', 1234, ARRAY['type A', 'type B']), 
  ('galaxy3', 'this is galaxy three', 1234, ARRAY['type A', 'type B']), 
  ('galaxy4', 'this is galaxy four', 1234, ARRAY['type A', 'type B']),
  ('galaxy5', 'this is galaxy five', 1234, ARRAY['type A', 'type B']),
  ('galaxy6', 'this is galaxy six', 1234, ARRAY['type A', 'type B']);

-- min of 6 rows
INSERT INTO star(name, description, has_life, is_spherical, galaxy_id)
VALUES
  ('star1', 'this is star one', TRUE, TRUE, 1),
  ('star2', 'this is star two', TRUE, TRUE, 2),
  ('star3', 'this is star three', FALSE, TRUE, 2),
  ('star4', 'this is star four', TRUE, TRUE, 3),
  ('star5', 'this is star five', TRUE, TRUE, 4),
  ('star6', 'this is star six', TRUE, TRUE, 4);

-- min of 12 rows
INSERT INTO planet(name, description, is_spherical, age_in_millions_of_years, planet_types, star_id)
VALUES
  ('planet 1', 'this is planet one', TRUE, 1234, ARRAY['planet A', 'planet B'], 2),
  ('planet 2', 'this is planet two', TRUE, 1234, ARRAY['planet A', 'planet B'], 3),
  ('planet 3', 'this is planet three', TRUE, 1234, ARRAY['planet A', 'planet B'], 4),
  ('planet 4', 'this is planet four', TRUE, 1234, ARRAY['planet A', 'planet B'], 6),
  ('planet 5', 'this is planet five', TRUE, 1234, ARRAY['planet A', 'planet B'], 2),
  ('planet 6', 'this is planet six', TRUE, 1234, ARRAY['planet A', 'planet B'], 5),
  ('planet 7', 'this is planet seven', TRUE, 1234, ARRAY['planet A', 'planet B'], 1),
  ('planet 8', 'this is planet eight', TRUE, 1234, ARRAY['planet A', 'planet B'], 1),
  ('planet 9', 'this is planet nine', TRUE, 1234, ARRAY['planet A', 'planet B'], 2),
  ('planet 10', 'this is planet ten', TRUE, 1234, ARRAY['planet A', 'planet B'], 3),
  ('planet 11', 'this is planet eleven', TRUE, 1234, ARRAY['planet A', 'planet B'], 3),
  ('planet 12', 'this is planet twelve', TRUE, 1234, ARRAY['planet A', 'planet B'], 2);

-- min of 20 rows
INSERT INTO moon(name, description, distance_from_earth, age_in_millions_of_years, planet_id)
VALUES
  ('moon1', 'this is moon one', 12, 1234, 1),
  ('moon2', 'this is moon two', 13, 1234, 3),
  ('moon3', 'this is moon three', 14, 1234, 2),
  ('moon4', 'this is moon four', 2, 1234, 9),
  ('moon5', 'this is moon five', 32, 1234, 7),
  ('moon6', 'this is moon six', 12, 1234, 8),
  ('moon7', 'this is moon seven', 12, 1234, 1),
  ('moon8', 'this is moon eight', 12, 1234, 2),
  ('moon9', 'this is moon nine', 22, 1234, 1),
  ('moon10', 'this is moon ten', 42, 1234, 11),
  ('moon11', 'this is moon eleven', 25, 1234, 12),
  ('moon12', 'this is moon twelve', 16, 1234, 9),
  ('moon13', 'this is moon thirteen', 17, 1234, 10),
  ('moon14', 'this is moon fourteen', 11, 1234, 7),
  ('moon15', 'this is moon fifteen', 5, 1234, 10),
  ('moon16', 'this is moon sixteen', 7, 1234, 8),
  ('moon17', 'this is moon seventeen', 12, 1234, 9),
  ('moon18', 'this is moon eighteen', 14, 1234, 6),
  ('moon19', 'this is moon nineteen', 13, 1234, 4),
  ('moon20', 'this is moon twenty', 11, 1234, 5);

-- min of 3 rows
INSERT INTO astronomer(name, researcher_code)
VALUES
  ('Amanda', 123),
  ('Roberto', 125),
  ('Gabriela', 103);
