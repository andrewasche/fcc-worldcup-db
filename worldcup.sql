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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    round character varying(60) NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) FROM stdin;
8	2018	14	15	4	2	Final
9	2018	16	17	2	0	Third Place
10	2018	15	17	2	1	Semi-Final
11	2018	14	16	1	0	Semi-Final
12	2018	15	18	3	2	Quarter-Final
13	2018	17	19	2	0	Quarter-Final
14	2018	16	20	2	1	Quarter-Final
15	2018	14	21	2	0	Quarter-Final
16	2018	17	22	2	1	Eighth-Final
17	2018	19	23	1	0	Eighth-Final
18	2018	16	24	3	2	Eighth-Final
19	2018	20	25	2	0	Eighth-Final
20	2018	15	26	2	1	Eighth-Final
21	2018	18	27	2	1	Eighth-Final
22	2018	21	28	2	1	Eighth-Final
23	2018	14	29	4	3	Eighth-Final
24	2014	30	29	1	0	Final
25	2014	31	20	3	0	Third Place
26	2014	29	31	1	0	Semi-Final
27	2014	30	20	7	1	Semi-Final
28	2014	31	32	1	0	Quarter-Final
29	2014	29	16	1	0	Quarter-Final
30	2014	20	22	2	1	Quarter-Final
31	2014	30	14	1	0	Quarter-Final
32	2014	20	33	2	1	Eighth-Final
33	2014	22	21	2	0	Eighth-Final
34	2014	14	34	2	0	Eighth-Final
35	2014	30	35	2	1	Eighth-Final
36	2014	31	25	2	1	Eighth-Final
37	2014	32	36	2	1	Eighth-Final
38	2014	29	23	1	0	Eighth-Final
39	2014	16	37	2	1	Eighth-Final
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.teams (team_id, name) FROM stdin;
14	France
15	Croatia
16	Belgium
17	England
18	Russia
19	Sweden
20	Brazil
21	Uruguay
22	Colombia
23	Switzerland
24	Japan
25	Mexico
26	Denmark
27	Spain
28	Portugal
29	Argentina
30	Germany
31	Netherlands
32	Costa Rica
33	Chile
34	Nigeria
35	Algeria
36	Greece
37	United States
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 39, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 37, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams name_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT name_constraint UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games opponent_games; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_games FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games winner_games; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_games FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

