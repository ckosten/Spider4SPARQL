--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:14 CEST

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
-- TOC entry 202 (class 1259 OID 36180)
-- Name: singer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.singer (
    singer_id integer NOT NULL,
    name text,
    birth_year real,
    net_worth_millions real,
    citizenship text
);


ALTER TABLE public.singer OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 36188)
-- Name: song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.song (
    song_id integer NOT NULL,
    title text,
    singer_id integer,
    sales real,
    highest_position real
);


ALTER TABLE public.song OWNER TO postgres;

--
-- TOC entry 3192 (class 0 OID 36180)
-- Dependencies: 202
-- Data for Name: singer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.singer (singer_id, name, birth_year, net_worth_millions, citizenship) FROM stdin;
1	Liliane Bettencourt	1944	30	France
2	Christy Walton	1948	28.8	United States
3	Alice Walton	1949	26.3	United States
4	Iris Fontbona	1942	17.4	Chile
5	Jacqueline Mars	1940	17.8	United States
6	Gina Rinehart	1953	17	Australia
7	Susanne Klatten	1962	14.3	Germany
8	Abigail Johnson	1961	12.7	United States
\.


--
-- TOC entry 3193 (class 0 OID 36188)
-- Dependencies: 203
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.song (song_id, title, singer_id, sales, highest_position) FROM stdin;
1	Do They Know It's Christmas	1	1.094e+06	1
2	F**k It (I Don't Want You Back)	1	552407	1
3	Cha Cha Slide	2	351421	1
4	Call on Me	4	335000	1
5	Yeah	2	300000	1
6	All This Time	6	292000	1
7	Left Outside Alone	5	275000	3
8	Mysterious Girl	7	261000	1
\.


--
-- TOC entry 3062 (class 2606 OID 36187)
-- Name: singer singer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singer
    ADD CONSTRAINT singer_pkey PRIMARY KEY (singer_id);


--
-- TOC entry 3064 (class 2606 OID 36195)
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (song_id);


--
-- TOC entry 3065 (class 2606 OID 36196)
-- Name: song song_singer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_singer_id_fkey FOREIGN KEY (singer_id) REFERENCES public.singer(singer_id);


-- Completed on 2021-08-03 19:17:15 CEST

--
-- PostgreSQL database dump complete
--

