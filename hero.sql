CREATE DATABASE hero;


--1.	Create new branch named "feat/create-tables"

CREATE TABLE IF NOT EXISTS public.class
(
    class_id integer NOT NULL,
    class_name character varying(255) NOT NULL,
    class_description text,
    PRIMARY KEY (class_id)
);

CREATE TABLE IF NOT EXISTS public.item
(
    item_id integer NOT NULL,
    item_name character varying(255) NOT NULL,
    item_description text,
    item_type character varying(50),
    PRIMARY KEY (item_id)
);

CREATE TABLE IF NOT EXISTS public.hero
(
    hero_id integer NOT NULL,
    hero_name character varying(255) NOT NULL,
    class_id integer,
    is_active boolean,
    PRIMARY KEY (hero_id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE IF NOT EXISTS public.heroitem
(
    hero_item_id integer NOT NULL,
    hero_id integer,
    item_id integer,
    PRIMARY KEY (hero_item_id),
    FOREIGN KEY (hero_id) REFERENCES hero(hero_id),
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);

CREATE TABLE IF NOT EXISTS public.player
(
    player_id integer NOT NULL,
    player_name character varying(255) NOT NULL,
    player_level integer,
    player_experience integer,
    hero_id integer,
    PRIMARY KEY (player_id),
    FOREIGN KEY (hero_id) REFERENCES hero(hero_id)
);

CREATE TABLE IF NOT EXISTS public.skills
(
    skill_id integer NOT NULL,
    skill_name character varying(255) NOT NULL,
    skill_description text,
    class_id integer,
    PRIMARY KEY (skill_id),
	FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE IF NOT EXISTS public.HeroItem 
(
    hero_item_id INT PRIMARY KEY,
    hero_id INT,
    item_id INT,
    FOREIGN KEY (hero_id) REFERENCES Hero(hero_id),
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);
