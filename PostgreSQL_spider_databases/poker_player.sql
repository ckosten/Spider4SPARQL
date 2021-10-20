--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:11 CEST

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
-- TOC entry 202 (class 1259 OID 36108)
-- Name: people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.people (
    people_id integer NOT NULL,
    nationality character varying,
    name character varying,
    birth_date character varying,
    height real
);


ALTER TABLE public.people OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 36116)
-- Name: poker_player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poker_player (
    poker_player_id integer NOT NULL,
    people_id integer,
    final_table_made real,
    best_finish real,
    money_rank real,
    earnings real
);


ALTER TABLE public.poker_player OWNER TO postgres;

--
-- TOC entry 3191 (class 0 OID 36108)
-- Dependencies: 202
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.people (people_id, nationality, name, birth_date, height) FROM stdin;
1	Russia	Aleksey Ostapenko	May 26, 1986	207
2	Bulgaria	Teodor Salparov	August 16, 1982	182
3	Russia	Roman Bragin	April 17, 1987	187
4	Russia	Sergey Grankin	January 22, 1987	193
5	Russia	Yevgeni Sivozhelez	August 8, 1986	196
6	Russia	Maksim Botin	July 14, 1983	194
7	Russia	Semen Poltavskiy	February 8, 1981	205
\.


--
-- TOC entry 3192 (class 0 OID 36116)
-- Dependencies: 203
-- Data for Name: poker_player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poker_player (poker_player_id, people_id, final_table_made, best_finish, money_rank, earnings) FROM stdin;
1	1	42	1	68	476090
2	2	10	2	141	189233
3	5	21	1	166	104871
4	6	19	2	58	596462
5	7	26	3	154	142800
\.


--
-- TOC entry 3061 (class 2606 OID 36115)
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (people_id);


--
-- TOC entry 3063 (class 2606 OID 36120)
-- Name: poker_player poker_player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poker_player
    ADD CONSTRAINT poker_player_pkey PRIMARY KEY (poker_player_id);


--
-- TOC entry 3064 (class 2606 OID 36121)
-- Name: poker_player poker_player_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poker_player
    ADD CONSTRAINT poker_player_people_id_fkey FOREIGN KEY (people_id) REFERENCES public.people(people_id);


-- Completed on 2021-08-03 19:17:12 CEST

--
-- PostgreSQL database dump complete
--

