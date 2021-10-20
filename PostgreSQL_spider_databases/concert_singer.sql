--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:15:57 CEST

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
-- TOC entry 204 (class 1259 OID 54373)
-- Name: concert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concert (
    concert_id integer NOT NULL,
    concert_name text,
    theme text,
    stadium_id integer,
    year integer
);


ALTER TABLE public.concert OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 54365)
-- Name: singer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.singer (
    singer_id integer NOT NULL,
    name text,
    country text,
    song_name text,
    song_release_year text,
    age integer,
    is_male boolean
);


ALTER TABLE public.singer OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 54386)
-- Name: singer_in_concert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.singer_in_concert (
    concert_id integer NOT NULL,
    singer_id integer NOT NULL
);


ALTER TABLE public.singer_in_concert OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 54357)
-- Name: stadium; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stadium (
    stadium_id integer NOT NULL,
    location text,
    name text,
    capacity integer,
    highest integer,
    lowest integer,
    average integer
);


ALTER TABLE public.stadium OWNER TO postgres;

--
-- TOC entry 3209 (class 0 OID 54373)
-- Dependencies: 204
-- Data for Name: concert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concert (concert_id, concert_name, theme, stadium_id, year) FROM stdin;
1	Auditions	Free choice	1	2014
2	Super bootcamp	Free choice 2	2	2014
3	Home Visits	Bleeding Love	2	2015
4	Week 1	Wide Awake	10	2014
5	Week 1	Happy Tonight	9	2015
6	Week 2	Party All Night	7	2015
\.


--
-- TOC entry 3208 (class 0 OID 54365)
-- Dependencies: 203
-- Data for Name: singer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.singer (singer_id, name, country, song_name, song_release_year, age, is_male) FROM stdin;
1	Joe Sharp	Netherlands	You	1992	52	f
2	Timbaland	United States	Dangerous	2008	32	t
3	Justin Brown	France	Hey Oh	2013	29	t
4	Rose White	France	Sun	2003	41	f
5	John Nizinik	France	Gentleman	2014	43	t
6	Tribal King	France	Love	2016	25	t
\.


--
-- TOC entry 3210 (class 0 OID 54386)
-- Dependencies: 205
-- Data for Name: singer_in_concert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.singer_in_concert (concert_id, singer_id) FROM stdin;
1	2
1	3
1	5
2	3
2	6
3	5
4	4
5	6
5	3
6	2
\.


--
-- TOC entry 3207 (class 0 OID 54357)
-- Dependencies: 202
-- Data for Name: stadium; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stadium (stadium_id, location, name, capacity, highest, lowest, average) FROM stdin;
1	Raith Rovers	Stark's Park	10104	4812	1294	2106
2	Ayr United	Somerset Park	11998	2363	1057	1477
3	East Fife	Bayview Stadium	2000	1980	533	864
4	Queen's Park	Hampden Park	52500	1763	466	730
5	Stirling Albion	Forthbank Stadium	3808	1125	404	642
6	Arbroath	Gayfield Park	4125	921	411	638
7	Alloa Athletic	Recreation Park	3100	1057	331	637
9	Peterhead	Balmoor	4000	837	400	615
10	Brechin City	Glebe Park	3960	780	315	552
\.


--
-- TOC entry 3075 (class 2606 OID 54380)
-- Name: concert concert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concert
    ADD CONSTRAINT concert_pkey PRIMARY KEY (concert_id);


--
-- TOC entry 3077 (class 2606 OID 54390)
-- Name: singer_in_concert singer_in_concert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singer_in_concert
    ADD CONSTRAINT singer_in_concert_pkey PRIMARY KEY (concert_id, singer_id);


--
-- TOC entry 3073 (class 2606 OID 54372)
-- Name: singer singer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singer
    ADD CONSTRAINT singer_pkey PRIMARY KEY (singer_id);


--
-- TOC entry 3071 (class 2606 OID 54364)
-- Name: stadium stadium_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stadium
    ADD CONSTRAINT stadium_pkey PRIMARY KEY (stadium_id);


--
-- TOC entry 3078 (class 2606 OID 54381)
-- Name: concert concert_stadium_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concert
    ADD CONSTRAINT concert_stadium_id_fkey FOREIGN KEY (stadium_id) REFERENCES public.stadium(stadium_id);


--
-- TOC entry 3079 (class 2606 OID 54391)
-- Name: singer_in_concert singer_in_concert_concert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singer_in_concert
    ADD CONSTRAINT singer_in_concert_concert_id_fkey FOREIGN KEY (concert_id) REFERENCES public.concert(concert_id);


--
-- TOC entry 3080 (class 2606 OID 54396)
-- Name: singer_in_concert singer_in_concert_singer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singer_in_concert
    ADD CONSTRAINT singer_in_concert_singer_id_fkey FOREIGN KEY (singer_id) REFERENCES public.singer(singer_id);


-- Completed on 2021-08-03 19:15:58 CEST

--
-- PostgreSQL database dump complete
--

