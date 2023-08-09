--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    radius_in_km numeric(10,3),
    description text,
    has_life boolean,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    radius_in_km numeric(50,3),
    description text,
    has_life boolean,
    is_spherical boolean
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
    name character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth integer,
    radius_in_km numeric(50,3),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth integer,
    radius_in_km numeric(50,3),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
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
    name character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth integer,
    radius_in_km numeric(50,3),
    description text,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer NOT NULL
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 31453, 54531, 5453.550, 'Largest Asteroid', false, false);
INSERT INTO public.asteroid VALUES (2, 'Eros', 41451, 523452, 52465.650, 'Small asteroid far away from Earth', false, true);
INSERT INTO public.asteroid VALUES (3, 'Hermes', 465246, 46342, 356.550, 'Big asteroid in Andromeda Galaxy', false, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 136000, 27, 500000.200, 'Huge collection of stars,dust and gas has a black hole in center', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1600000, 800000000, 70000.500, 'Huge collection of stars dust and gas far away from Milky Way has a black hole in center', false, true);
INSERT INTO public.galaxy VALUES (3, 'Magellanic Clouds', 12300000, 7000000, 540000.800, 'Huge collections of stars dust and gas, looks like a faint cloud', false, true);
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', 35535345, 546357537, 765436.550, 'Huge collection of stars and planets very big black hole in center', false, false);
INSERT INTO public.galaxy VALUES (5, 'Virgo A', 3553535, 545357537, 725436.650, 'Huge collection of stars and planets small black hole in center', false, false);
INSERT INTO public.galaxy VALUES (6, 'Maffei 1', 643535, 745357537, 565436.800, 'Huge collection of stars and planets medium black hole in center', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 14414, 143544, 3214.550, 'Natural satellite of Earth', false, false, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', 13415, 141414, 24654.650, 'Bigger moon of mars', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 13414, 1455, 2525.550, 'Smaller moon of mars', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1343141, 415235, 2556.550, 'Has a lot of volcanoes', false, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 145151, 1353531, 56246.440, 'Ice cold', false, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 65246, 252626, 2462623.660, 'Biggest moon of jupiter', false, false, 5);
INSERT INTO public.moon VALUES (7, 'Kallisto', 246246, 626, 24626.550, 'second largest moon of jupiter', false, false, 5);
INSERT INTO public.moon VALUES (8, 'Amaltea', 14141, 414145, 1556.550, 'First discovered jupiter moon', false, false, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 15135, 512515, 1535.660, 'Very small moon of jupiter', false, false, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 135135, 4256346, 2635.550, 'Dicovered in Lick observatory', false, false, 5);
INSERT INTO public.moon VALUES (11, 'Pazyfae', 35135, 13411, 54325.550, 'It used to be dwarf planet', false, false, 5);
INSERT INTO public.moon VALUES (12, 'Sinope', 141414, 124134, 5245.660, 'Little moon of jupiter', false, false, 5);
INSERT INTO public.moon VALUES (13, 'Lizytea', 135515, 13525, 246536.660, 'Discovered in 1938', false, false, 5);
INSERT INTO public.moon VALUES (14, 'Karme', 123515, 125246, 2466.550, 'Discovered in observatory in California', false, false, 5);
INSERT INTO public.moon VALUES (15, 'Ananke', 115135, 135135, 5525.550, 'Discovered in 1951', false, false, 5);
INSERT INTO public.moon VALUES (16, 'Leda', 13535, 135315, 1354.550, 'Discovered by man with polish surname', false, false, 5);
INSERT INTO public.moon VALUES (17, 'Tebe', 1451354, 14414, 135.550, 'Discovered from pictures taken by voyaher 1', false, false, 5);
INSERT INTO public.moon VALUES (18, 'Adrastea', 13414, 1414, 42656.660, 'Discovered from pictures taken by voyager 2', false, false, 5);
INSERT INTO public.moon VALUES (19, 'Metis', 11414, 1414, 1515.550, 'Discovered by voyager 1 pictures', false, false, 5);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', 153351, 135135, 52354.660, 'Small jupier moon', false, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 15425, 1245134, 2151.560, 'Closest to the sun', false, true, 8);
INSERT INTO public.planet VALUES (2, 'Venus', 1541245, 24514, 355.660, 'Called morning star', false, true, 8);
INSERT INTO public.planet VALUES (3, 'Earth', 312414, 53535, 6536.760, 'Our Home', true, true, 8);
INSERT INTO public.planet VALUES (4, 'Mars', 356246, 25414, 35636.650, 'There is planned to human explore this planet', false, true, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 354626, 235626, 35634.550, 'Gas giant closest to Earth', false, false, 8);
INSERT INTO public.planet VALUES (6, 'Saturn', 35342652, 23514, 2465246.450, 'Gas giant with asteroid belt around', false, true, 8);
INSERT INTO public.planet VALUES (7, 'Uranus', 1351116, 1246246, 4667756.440, 'Biggest planet in solar system', false, true, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', 1355553545, 132343, 425546.440, 'Last planet of solar system', false, true, 8);
INSERT INTO public.planet VALUES (9, 'Ceres', 1434, 135245, 134.540, 'Largest dwarf planet', false, false, 8);
INSERT INTO public.planet VALUES (10, 'Pluton', 6245, 13535, 1525.600, 'Used to be normal planet', false, true, 8);
INSERT INTO public.planet VALUES (11, 'Haumea', 55315, 13514, 5435.600, 'Day takes only 4h', false, false, 8);
INSERT INTO public.planet VALUES (12, 'Eris', 3414, 4254, 5462.400, 'Second largest dwarf planet', false, true, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Proxima Centauri', 35636, 324562, 3265.550, 'Big old star', false, false, 1);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus', 63255, 234514, 31534.540, 'Young Star', false, true, 1);
INSERT INTO public.star VALUES (5, 'Toliman', 552523, 624654, 534.550, 'Old brown dwarf', false, false, 1);
INSERT INTO public.star VALUES (6, 'Alfa Andromedae', 15135315, 145144, 6356.770, 'Brightest star', false, false, 2);
INSERT INTO public.star VALUES (7, 'Mirach', 135135, 234514, 6367.440, 'Red giant', false, false, 2);
INSERT INTO public.star VALUES (8, 'Sun', 15143, 23515, 2346.660, 'Our Star', false, true, 1);


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

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: asteroid uq_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT uq_asteroid_name UNIQUE (name);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

