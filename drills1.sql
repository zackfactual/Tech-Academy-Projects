/* Drills 1-6 for use with zooTest2 DB */
/* Drill 1. */  
SELECT * FROM tbl_habitat;
/* Drill 2. */ 
SELECT species_name FROM tbl_species WHERE species_order = 3;
/* Drill 3. */ 
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;
/* Drill 4. */ 
SELECT a1.species_name FROM tbl_species a1 
INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition 
WHERE nutrition_id BETWEEN 2202 AND 2206;
/* Drill 5. */
SELECT species_name AS 'Species Name:', nutrition_type AS 'Nutrition Type:' 
FROM tbl_species INNER JOIN tbl_nutrition ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;
/* Drill 6. */
SELECT a1.specialist_fname, a1.specialist_lname, a1.specialist_contact FROM tbl_specialist a1
INNER JOIN tbl_care a2 ON a1.specialist_id = a2.care_specialist WHERE a2.care_id = 'care_6';

/* Drill 7. */
CREATE DATABASE rpg

USE rpg

CREATE TABLE tbl_adventurer (
    adventurer_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    adventurer_name VARCHAR(50) NOT NULL,
    adventurer_race VARCHAR(50) NOT NULL,
    adventurer_class VARCHAR(50) NOT NULL,
    adventurer_level INT NOT NULL
);

CREATE TABLE tbl_player (
    player_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    player_fname VARCHAR(50) NOT NULL,
    player_lname VARCHAR(50) NOT NULL,
    player_character INT NOT NULL CONSTRAINT fk_adventurer_id FOREIGN KEY REFERENCES tbl_adventurer(adventurer_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_adventurer
    (adventurer_name, adventurer_race, adventurer_class, adventurer_level)
    VALUES
    ('Piping Plover', 'Halfling', 'Druid', 3),
    ('Miir Delmirev', 'Dragonborn', 'Bard', 3),
    ('Kerry Buckman', 'Human', 'Rogue', 2),
    ('Pharmyr', 'Drow', 'Fighter', 2),
    ('Kerig', 'Half-Orc', 'Ranger', 2)
;

INSERT INTO tbl_player
    (player_fname, player_lname, player_character)
    VALUES
    ('Elena', 'Ondich', 1),
    ('Ian', 'Petersen', 2),
    ('Sarah', 'Wolf', 3),
    ('Aaron', 'Hedquist', 4),
    ('Simone', 'Gabara', 5)
;

SELECT a1.player_fname AS 'Player First Name', a1.player_lname AS 'Player Last Name', a2.adventurer_name AS 'Character', a2.adventurer_race AS 'Race', a2.adventurer_class AS 'Class', a2.adventurer_level AS 'Level' 
FROM tbl_player a1 INNER JOIN tbl_adventure