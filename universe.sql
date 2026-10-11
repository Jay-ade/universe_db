--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    diameter_in_km integer,
    rotation_period_hours integer,
    mass_in_billion_tonnes numeric(10,2),
    is_spherical boolean,
    has_ice boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text NOT NULL,
    diameter_in_lightyears integer,
    estimated_stars_millions integer,
    age_in_millions_of_years numeric(10,2),
    is_spiral boolean,
    has_active_nucleaus boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    radius_in_km integer,
    surface_temperature_celcius integer,
    orbital_period_days numeric(10,2),
    is_spherical boolean,
    has_ice boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    description text,
    radius_in_km integer,
    day_length_hours integer,
    orbital_period_days numeric(10,2),
    has_life boolean,
    has_rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    temperature_kelvin integer,
    radius_in_km integer,
    age_in_millions_of_years numeric(10,2),
    is_main_sequence boolean,
    is_variable_brightness boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Korven', 'A small rocky asteroid with deep craters', 12, 8, 2.50, false, false);
INSERT INTO public.asteroid VALUES (2, 'Iskara', 'An irregular asteroid with frozen deposits', 30, 15, 21.75, false, true);
INSERT INTO public.asteroid VALUES (3, 'Thalon', 'A large rounded asteroid with an icy surface', 600, 9, 240000.00, true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Asteria', 'A broad spiral with bright outer arms', 110000, 240000, 12500.50, true, false);
INSERT INTO public.galaxy VALUES (2, 'Velora', 'An oval galaxy with an active central region', 85000, 180000, 11200.75, false, true);
INSERT INTO public.galaxy VALUES (4, 'Solara', 'A large spiral with a brilliant central core', 140000, 360000, 13100.00, true, true);
INSERT INTO public.galaxy VALUES (5, 'Orinth', 'A faint oval galaxy containing old stars', 67000, 95000, 12800.40, false, false);
INSERT INTO public.galaxy VALUES (6, 'Caelora', 'A compact spiral with tightly wound arms', 54000, 42000, 9700.60, true, false);
INSERT INTO public.galaxy VALUES (3, 'Nymera', 'A small irregular galaxy rich in gas', 32000, 12000, 8400.25, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Auri', 1, 'A pale moon with frozen polar craters', 1700, -25, 27.30, true, true);
INSERT INTO public.moon VALUES (2, 'Brin', 2, 'A large moon with a cracked ice shell', 2400, -160, 3.55, true, true);
INSERT INTO public.moon VALUES (3, 'Brel', 2, 'A small irregular rocky moon', 120, -145, 7.20, false, false);
INSERT INTO public.moon VALUES (4, 'Ciri', 3, 'A cratered moon with a dry surface', 600, -80, 12.40, true, false);
INSERT INTO public.moon VALUES (5, 'Dova', 4, 'A bright moon covered in ice', 1400, -130, 8.75, true, true);
INSERT INTO public.moon VALUES (6, 'Dren', 4, 'A tiny jagged moon beyond the rings', 85, -140, 19.60, false, true);
INSERT INTO public.moon VALUES (7, 'Evin', 5, 'A rocky moon heated by volcanic activity', 1100, 95, 2.80, true, false);
INSERT INTO public.moon VALUES (8, 'Fira', 6, 'A large frozen moon with deep fractures', 2600, -170, 4.10, true, true);
INSERT INTO public.moon VALUES (9, 'Fenn', 6, 'A round moon with dark rocky plains', 900, -155, 9.35, true, false);
INSERT INTO public.moon VALUES (10, 'Fosk', 6, 'A small irregular moon covered in frost', 70, -180, 21.80, false, true);
INSERT INTO public.moon VALUES (11, 'Gavi', 7, 'A dry moon with broad impact basins', 1500, 60, 16.25, true, false);
INSERT INTO public.moon VALUES (12, 'Hira', 8, 'An icy moon with a smooth surface', 1800, -195, 5.90, true, true);
INSERT INTO public.moon VALUES (13, 'Hesh', 8, 'A small angular moon with frozen ridges', 95, -205, 14.70, false, true);
INSERT INTO public.moon VALUES (14, 'Iven', 9, 'A dark moon with scattered ice deposits', 700, -185, 11.15, true, true);
INSERT INTO public.moon VALUES (15, 'Jora', 10, 'A large moon with a thick frozen crust', 2200, -200, 6.45, true, true);
INSERT INTO public.moon VALUES (16, 'Jex', 10, 'A small rocky moon with sharp cliffs', 60, -190, 18.30, false, false);
INSERT INTO public.moon VALUES (17, 'Kavi', 11, 'A round moon with ice near its poles', 1600, -35, 23.80, true, true);
INSERT INTO public.moon VALUES (18, 'Keth', 11, 'A tiny rocky moon with an uneven shape', 45, -50, 38.50, false, false);
INSERT INTO public.moon VALUES (19, 'Luma', 12, 'A bright moon covered in frozen plains', 1300, -150, 7.65, true, true);
INSERT INTO public.moon VALUES (20, 'Lorn', 12, 'An irregular moon with an icy surface', 110, -165, 20.40, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Auren', 1, 'A rocky world covered in warm oceans', 6400, 24, 365.25, true, false);
INSERT INTO public.planet VALUES (2, 'Bravik', 1, 'A large gas planet with wide rings', 68000, 10, 4300.50, false, true);
INSERT INTO public.planet VALUES (3, 'Cindra', 2, 'A dry rocky world with red plains', 4200, 31, 90.75, false, false);
INSERT INTO public.planet VALUES (4, 'Doreth', 2, 'A cold world with a thin ring system', 7100, 19, 240.20, false, true);
INSERT INTO public.planet VALUES (5, 'Evara', 3, 'A hot rocky world with volcanic plains', 5900, 17, 180.40, false, false);
INSERT INTO public.planet VALUES (6, 'Faron', 3, 'A massive gas planet with bright rings', 74000, 9, 2200.60, false, true);
INSERT INTO public.planet VALUES (7, 'Galdor', 4, 'A scorched world with a thick atmosphere', 8200, 42, 1500.00, false, false);
INSERT INTO public.planet VALUES (8, 'Hesper', 4, 'A distant ice giant with narrow rings', 26000, 16, 9200.80, false, true);
INSERT INTO public.planet VALUES (9, 'Ilyra', 5, 'A dark rocky world with frozen valleys', 3500, 28, 320.10, false, false);
INSERT INTO public.planet VALUES (10, 'Jorath', 5, 'A cold gas planet with pale clouds', 51000, 12, 5100.35, false, true);
INSERT INTO public.planet VALUES (11, 'Kavera', 6, 'A temperate world with forests and seas', 6700, 26, 290.50, true, false);
INSERT INTO public.planet VALUES (12, 'Lurien', 6, 'An icy world with a faint ring system', 9800, 21, 870.90, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Aureon', 1, 'A steady yellow star', 5800, 700000, 4600.50, true, false);
INSERT INTO public.star VALUES (2, 'Veyra', 2, 'A cool red dwarf with changing brightness', 3200, 180000, 6200.25, true, true);
INSERT INTO public.star VALUES (3, 'Nymor', 3, 'A young blue star', 18000, 2800000, 25.75, true, false);
INSERT INTO public.star VALUES (4, 'Solvex', 4, 'An expanding red giant', 4100, 18000000, 7100.00, false, true);
INSERT INTO public.star VALUES (5, 'Orinel', 5, 'A small cooling white dwarf', 9500, 8500, 8900.80, false, false);
INSERT INTO public.star VALUES (6, 'Caelis', 6, 'A stable orange star', 4700, 520000, 5300.40, true, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

