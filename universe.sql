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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions integer,
    distance_from_earth integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(50) NOT NULL,
    budget numeric
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mission_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions integer,
    distance_from_earth integer,
    price numeric,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions integer,
    distance_from_earth integer,
    price numeric,
    has_life boolean,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_mission (
    planet_mission_id integer NOT NULL,
    planet_id integer,
    mission_id integer,
    name character varying(50) NOT NULL
);


ALTER TABLE public.planet_mission OWNER TO freecodecamp;

--
-- Name: planet_mission_planet_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_mission_planet_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_mission_planet_mission_id_seq OWNER TO freecodecamp;

--
-- Name: planet_mission_planet_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_mission_planet_mission_id_seq OWNED BY public.planet_mission.planet_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions integer,
    distance_from_earth integer,
    price numeric,
    description text,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.mission_mission_id_seq'::regclass);


--
-- Name: planet_mission planet_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_mission ALTER COLUMN planet_mission_id SET DEFAULT nextval('public.planet_mission_planet_mission_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 200, 190, 'is the biggest in the local group');
INSERT INTO public.galaxy VALUES (2, 'galaxy 68FE', 321390, 4189283, 'a galaxy next the andromeda');
INSERT INTO public.galaxy VALUES (3, 'galaxy 312E', 3543252, 41123283, 'a galaxy, have some stars');
INSERT INTO public.galaxy VALUES (4, 'galaxy 8329A', 343252, 441583, 'a galaxy');
INSERT INTO public.galaxy VALUES (5, 'galaxy 940M', 53462, 21441583, 'a galaxy too');
INSERT INTO public.galaxy VALUES (6, 'galaxy 98N', 68892, 2139583, 'the galaxy');


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'mission alpha', 1000);
INSERT INTO public.mission VALUES (2, 'mission beta', 1000);
INSERT INTO public.mission VALUES (3, 'mission gamma', 1000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 234B', 13, 213994, 13000, 'was born a 13 millions years', 1);
INSERT INTO public.moon VALUES (2, 'moon2321', 58732, 3981298, 1000, 'moon 2321 on galaxy', 1);
INSERT INTO public.moon VALUES (3, 'moon2323', 58732, 3981298, 1000, 'moon 2323 on galaxy', 1);
INSERT INTO public.moon VALUES (4, 'moon2343', 58732, 3981298, 1000, 'moon 2343 on galaxy', 1);
INSERT INTO public.moon VALUES (5, 'moon2353', 58732, 3981298, 1000, 'moon 2353 on galaxy', 1);
INSERT INTO public.moon VALUES (6, 'moon2363', 58732, 3981298, 1000, 'moon 2363 on galaxy', 1);
INSERT INTO public.moon VALUES (7, 'moon 2', 64539, 12893, 1000, 'a moon', 2);
INSERT INTO public.moon VALUES (8, 'moon 3', 64539, 12893, 1000, 'a moon', 3);
INSERT INTO public.moon VALUES (9, 'moon 4', 64539, 12893, 1000, 'a moon', 4);
INSERT INTO public.moon VALUES (10, 'moon 5', 64539, 12893, 1000, 'a moon', 5);
INSERT INTO public.moon VALUES (11, 'moon 6', 64539, 12893, 1000, 'a moon', 6);
INSERT INTO public.moon VALUES (12, 'moon 7', 64539, 12893, 1000, 'a moon', 7);
INSERT INTO public.moon VALUES (13, 'moon 8', 64539, 12893, 1000, 'a moon', 8);
INSERT INTO public.moon VALUES (14, 'moon 9', 64539, 12893, 1000, 'a moon', 9);
INSERT INTO public.moon VALUES (15, 'moon 10', 64539, 12893, 1000, 'a moon', 10);
INSERT INTO public.moon VALUES (16, 'moon 11', 64539, 12893, 1000, 'a moon', 10);
INSERT INTO public.moon VALUES (17, 'moon 12', 64539, 12893, 1000, 'a moon', 11);
INSERT INTO public.moon VALUES (18, 'moon 13', 64539, 12893, 1000, 'a moon', 12);
INSERT INTO public.moon VALUES (19, 'moon 14', 64539, 12893, 1000, 'a moon', 12);
INSERT INTO public.moon VALUES (20, 'moon 15', 64539, 12893, 1000, 'a moon', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 2230', 2183, 29138, 150000, true, 'one of the planets of andromeda', 1);
INSERT INTO public.planet VALUES (2, 'planet 43B', 45738, 493298, 900000, true, 'a planet on galaxy andromeda', 1);
INSERT INTO public.planet VALUES (3, 'planet 64FB', 455838, 598192, 900000, true, 'a planet on galaxy andromeda, next the planet 43B', 1);
INSERT INTO public.planet VALUES (4, 'planet 67AA', 3485838, 5312992, 900000, false, 'a planet on galaxy andromeda', 1);
INSERT INTO public.planet VALUES (5, 'planet 4F', 3189432, 31029, 31000, true, 'a super planet', 2);
INSERT INTO public.planet VALUES (6, 'planet 90J', 332982, 12899, 30000, false, 'a super planet, but dont have a superman', 3);
INSERT INTO public.planet VALUES (7, 'planet 10B', 32345, 141329, 40000, true, 'have some aliens', 4);
INSERT INTO public.planet VALUES (8, 'planet 907H', 953405, 439321, 95300, false, 'a rock planet', 4);
INSERT INTO public.planet VALUES (9, 'planet MHJ', 34965, 21399321, 953000, false, 'a rock planet', 5);
INSERT INTO public.planet VALUES (10, 'planet HBO', 94965, 232491, 1000, true, 'a rock planet, have some producers here?', 5);
INSERT INTO public.planet VALUES (11, 'planet 29F', 94965, 232491, 11000, false, 'a gas planet', 6);
INSERT INTO public.planet VALUES (12, 'planet 9000', 43281, 4392181, 11500, false, 'a gas planet', 6);


--
-- Data for Name: planet_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_mission VALUES (1, 1, 1, 'link 1');
INSERT INTO public.planet_mission VALUES (2, 2, 2, 'link 2');
INSERT INTO public.planet_mission VALUES (3, 3, 3, 'link 3');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'alpheratz', 270, 100000, 150000, 'the most lightful star', true, 1);
INSERT INTO public.star VALUES (2, 'star 48B', 32198, 39445983, 38000, 'the biggest', true, 2);
INSERT INTO public.star VALUES (3, 'star 790N', 3232118, 57633, 3300, 'the biggest', true, 3);
INSERT INTO public.star VALUES (4, 'star 90M', 794040918, 3242903, 10000, 'the non spherical', false, 3);
INSERT INTO public.star VALUES (5, 'star NAT23', 794213, 369403, 132200, 'the non spherical and big', false, 4);
INSERT INTO public.star VALUES (6, 'star OLA', 74395, 323953, 1200, 'OLA', false, 5);


--
-- Name: mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mission_mission_id_seq', 3, true);


--
-- Name: planet_mission_planet_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_mission_planet_mission_id_seq', 1, false);


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
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


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
-- Name: planet_mission planet_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_mission
    ADD CONSTRAINT planet_mission_name_key UNIQUE (name);


--
-- Name: planet_mission planet_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_mission
    ADD CONSTRAINT planet_mission_pkey PRIMARY KEY (planet_mission_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_mission planet_mission_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_mission
    ADD CONSTRAINT planet_mission_mission_id_fkey FOREIGN KEY (mission_id) REFERENCES public.mission(mission_id);


--
-- Name: planet_mission planet_mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_mission
    ADD CONSTRAINT planet_mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

