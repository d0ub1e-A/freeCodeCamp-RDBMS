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
    distance_from_milkiway_in_light_years integer,
    radius_in_light_years integer,
    about text
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
    moon_radius_in_km integer,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    g_force numeric(10,2)
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
    planet_radius_in_km integer,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_moon boolean,
    composition text,
    g_force numeric(10,2),
    telescope_id integer
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    number_of_planets integer,
    type character varying(30)
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
-- Name: telescope; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.telescope (
    telescope_id integer NOT NULL,
    name character varying(100) NOT NULL,
    on_earth boolean
);


ALTER TABLE public.telescope OWNER TO freecodecamp;

--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.telescope_telescope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telescope_telescope_id_seq OWNER TO freecodecamp;

--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.telescope_telescope_id_seq OWNED BY public.telescope.telescope_id;


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
-- Name: telescope telescope_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope ALTER COLUMN telescope_id SET DEFAULT nextval('public.telescope_telescope_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'Milky Way', 0, 52850, 'Our home spiral galaxy, containing the Solar System.');
INSERT INTO public.galaxy VALUES (8, 'Andromeda', 2537000, 110000, 'The nearest major galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (9, 'Triangulum', 2730000, 30000, 'The third-largest member of the Local Group of galaxies.');
INSERT INTO public.galaxy VALUES (10, 'Large Magellanic Cloud', 163000, 4900, 'A satellite dwarf galaxy of the Milky Way.');
INSERT INTO public.galaxy VALUES (11, 'Small Magellanic Cloud', 200000, 3500, 'A near-Earth dwarf irregular galaxy.');
INSERT INTO public.galaxy VALUES (12, 'Sombrero Galaxy', 31100000, 25000, 'A peculiar galaxy in the Virgo constellation with a bright nucleus.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1737, 'Moon', 16, 1.62);
INSERT INTO public.moon VALUES (2, 11, 'Phobos', 17, 0.01);
INSERT INTO public.moon VALUES (3, 6, 'Deimos', 17, 0.00);
INSERT INTO public.moon VALUES (4, 1821, 'Io', 18, 1.79);
INSERT INTO public.moon VALUES (5, 1560, 'Europa', 18, 1.31);
INSERT INTO public.moon VALUES (6, 2634, 'Ganymede', 18, 1.42);
INSERT INTO public.moon VALUES (7, 2410, 'Callisto', 18, 1.23);
INSERT INTO public.moon VALUES (8, 2574, 'Titan', 19, 1.35);
INSERT INTO public.moon VALUES (9, 252, 'Enceladus', 19, 0.11);
INSERT INTO public.moon VALUES (10, 198, 'Mimas', 19, 0.06);
INSERT INTO public.moon VALUES (11, 734, 'Iapetus', 19, 0.22);
INSERT INTO public.moon VALUES (12, 763, 'Rhea', 19, 0.26);
INSERT INTO public.moon VALUES (13, 561, 'Dione', 19, 0.23);
INSERT INTO public.moon VALUES (14, 531, 'Tethys', 19, 0.14);
INSERT INTO public.moon VALUES (15, 235, 'Miranda', 22, 0.08);
INSERT INTO public.moon VALUES (16, 578, 'Ariel', 22, 0.27);
INSERT INTO public.moon VALUES (17, 584, 'Umbriel', 22, 0.20);
INSERT INTO public.moon VALUES (18, 788, 'Titania', 22, 0.38);
INSERT INTO public.moon VALUES (19, 761, 'Oberon', 22, 0.35);
INSERT INTO public.moon VALUES (20, 1353, 'Triton', 23, 0.71);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (16, 6371, 'Earth', 31, true, 'Iron, Oxygen, Silicon, Magnesium', 9.81, 1);
INSERT INTO public.planet VALUES (17, 3389, 'Mars', 31, true, 'Iron, Silicon, Magnesium, Sulfur', 3.71, 1);
INSERT INTO public.planet VALUES (18, 69911, 'Jupiter', 31, true, 'Hydrogen, Helium', 24.79, 1);
INSERT INTO public.planet VALUES (19, 58232, 'Saturn', 31, true, 'Hydrogen, Helium, Methane', 10.44, 1);
INSERT INTO public.planet VALUES (20, 6051, 'Venus', 31, false, 'Carbon Dioxide, Nitrogen, Sulfur Dioxide', 8.87, 1);
INSERT INTO public.planet VALUES (21, 2439, 'Mercury', 31, false, 'Iron, Silicate', 3.70, 1);
INSERT INTO public.planet VALUES (22, 25362, 'Uranus', 31, true, 'Water, Ammonia, Methane', 8.69, 1);
INSERT INTO public.planet VALUES (23, 24622, 'Neptune', 31, true, 'Water, Ammonia, Methane', 11.15, 1);
INSERT INTO public.planet VALUES (24, 7150, 'TRAPPIST-1b', 32, false, 'Iron, Water, Silicate', 9.10, 2);
INSERT INTO public.planet VALUES (25, 6990, 'TRAPPIST-1c', 32, false, 'Rock, Iron', 9.80, 2);
INSERT INTO public.planet VALUES (26, 6500, 'Proxima Centauri b', 34, false, 'Silicate Rock, Iron', 10.50, 5);
INSERT INTO public.planet VALUES (27, 8300, 'Kepler-90b', 33, false, 'Rock, Gas', 12.00, 2);
INSERT INTO public.planet VALUES (28, 12000, '55 Cancri e', 38, false, 'Carbon, Iron, Silicate', 21.00, 2);
INSERT INTO public.planet VALUES (29, 11000, 'Tau Ceti e', 35, false, 'Rock, Water', 14.00, 5);
INSERT INTO public.planet VALUES (30, 70000, 'Fomalhaut b', 40, false, 'Hydrogen, Helium, Dust', 25.00, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (31, 'Sun', 7, 8, 'g-type');
INSERT INTO public.star VALUES (32, 'TRAPPIST-1', 7, 7, 'm-type');
INSERT INTO public.star VALUES (33, 'Kepler-90', 7, 8, 'g-type');
INSERT INTO public.star VALUES (34, 'Proxima Centauri', 7, 3, 'm-type');
INSERT INTO public.star VALUES (35, 'Tau Ceti', 7, 4, 'g-type');
INSERT INTO public.star VALUES (36, 'Kepler-11', 7, 6, 'g-type');
INSERT INTO public.star VALUES (37, 'HD 10180', 7, 6, 'g-type');
INSERT INTO public.star VALUES (38, '55 Cancri', 7, 5, 'k-type');
INSERT INTO public.star VALUES (39, 'Upsilon Andromedae', 7, 4, 'f-type');
INSERT INTO public.star VALUES (40, 'Fomalhaut', 7, 1, 'a-type');


--
-- Data for Name: telescope; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.telescope VALUES (1, 'Human Eye', true);
INSERT INTO public.telescope VALUES (2, 'Kepler Space Telescope', false);
INSERT INTO public.telescope VALUES (3, 'Hubble Space Telescope', false);
INSERT INTO public.telescope VALUES (4, 'James Webb Space Telescope', false);
INSERT INTO public.telescope VALUES (5, 'Very Large Telescope (VLT)', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 30, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 40, true);


--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.telescope_telescope_id_seq', 5, true);


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
-- Name: telescope telescope_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_name_key UNIQUE (name);


--
-- Name: telescope telescope_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_pkey PRIMARY KEY (telescope_id);


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
-- Name: planet planet_telescope_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_telescope_id_fkey FOREIGN KEY (telescope_id) REFERENCES public.telescope(telescope_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

