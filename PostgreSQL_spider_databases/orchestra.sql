--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:12 CEST

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
-- TOC entry 202 (class 1259 OID 35329)
-- Name: conductor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conductor (
    conductor_id integer NOT NULL,
    name character varying,
    age integer,
    nationality character varying,
    year_of_work integer
);


ALTER TABLE public.conductor OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 35337)
-- Name: orchestra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orchestra (
    orchestra_id integer NOT NULL,
    orchestra character varying,
    conductor_id integer,
    record_company character varying,
    year_of_founded real,
    major_record_format character varying
);


ALTER TABLE public.orchestra OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 35350)
-- Name: performance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.performance (
    performance_id integer NOT NULL,
    orchestra_id integer,
    type character varying,
    date character varying,
    official_ratings_millions real,
    weekly_rank character varying,
    share character varying
);


ALTER TABLE public.performance OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 35375)
-- Name: show; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.show (
    show_id integer,
    performance_id integer,
    result character varying,
    if_first_show boolean,
    attendance real
);


ALTER TABLE public.show OWNER TO postgres;

--
-- TOC entry 3206 (class 0 OID 35329)
-- Dependencies: 202
-- Data for Name: conductor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conductor (conductor_id, name, age, nationality, year_of_work) FROM stdin;
1	Antal Doráti	40	USA	10
2	Igor Stravinsky	41	UK	11
3	Colin Davis	42	USA	6
4	Paul Jorgensen	43	UK	11
5	Antal Brown	43	USA	20
6	Charles Dutoit	43	France	12
7	Gerard Schwarz	50	USA	20
8	Pierre Boulez	49	UK	11
9	Valeri Gergiev	47	USA	16
10	Robert Craft	63	UK	21
11	Seiji Ozawa	43	USA	10
12	Michael Tilson Thomas	42	France	12
\.


--
-- TOC entry 3207 (class 0 OID 35337)
-- Dependencies: 203
-- Data for Name: orchestra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orchestra (orchestra_id, orchestra, conductor_id, record_company, year_of_founded, major_record_format) FROM stdin;
1	London Symphony Orchestra	1	Mercury Records	2003	CD
2	Columbia Symphony Orchestra	2	Columbia Masterworks	2009	CD / LP
3	Royal Concertgebouw Orchestra	3	Philips	2008	CD
4	Royal Danish Orchestra	4	Kultur	2002	DVD
5	Detroit Symphony Orchestra	5	Decca Records	2002	CD
6	Montreal Symphony Orchestra	6	Decca Records	2004	CD
7	Seattle Symphony Orchestra	7	Delos Records	2002	CD
8	Chicago Symphony Orchestra	8	Deutsche Grammophon	2003	CD
9	Kirov Orchestra	9	Philips Classics Records	2008	CD
10	Philharmonia Orchestra	10	Koch Records / Naxos Records	2006	CD
11	Orchestre de Paris	11	EMI	2007	CD
12	San Francisco Symphony Orchestra	12	RCA	2008	CD
\.


--
-- TOC entry 3208 (class 0 OID 35350)
-- Dependencies: 204
-- Data for Name: performance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.performance (performance_id, orchestra_id, type, date, official_ratings_millions, weekly_rank, share) FROM stdin;
1	1	Auditions 1	9 June	5.2	12	22.7%
2	2	Auditions 2	10 June	6.73	8	28.0%
3	3	Auditions 3	11 June	7.28	15	29.4%
4	4	Auditions 4	12 June	7.39	13	29.3%
5	5	Auditions 5	13 June	7.51	11	29.2%
11	11	Semi-final 1	14 June	8.36	9	34.0%
6	6	Semi-final 2	15 June	9.28	8	38.1%
7	7	Semi-final 3	16 June	9.29	7	40.9%
8	8	Live final	17 June	11.58	1	43.7%
9	9	Live final results	17 June	11.45	2	44.7%
10	10	Series average	2007	8.38	TBC	34%
\.


--
-- TOC entry 3209 (class 0 OID 35375)
-- Dependencies: 205
-- Data for Name: show; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.show (show_id, performance_id, result, if_first_show, attendance) FROM stdin;
1	1	Glebe Park	t	1026
2	2	Fir Park	t	695
3	3	St. Mirren Park	f	555
4	4	St. Mirren Park	f	1925
5	5	Hampden Park	t	2431
\.


--
-- TOC entry 3072 (class 2606 OID 35336)
-- Name: conductor conductor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conductor
    ADD CONSTRAINT conductor_pkey PRIMARY KEY (conductor_id);


--
-- TOC entry 3074 (class 2606 OID 35344)
-- Name: orchestra orchestra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orchestra
    ADD CONSTRAINT orchestra_pkey PRIMARY KEY (orchestra_id);


--
-- TOC entry 3076 (class 2606 OID 35357)
-- Name: performance performance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performance
    ADD CONSTRAINT performance_pkey PRIMARY KEY (performance_id);


--
-- TOC entry 3077 (class 2606 OID 35345)
-- Name: orchestra orchestra_conductor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orchestra
    ADD CONSTRAINT orchestra_conductor_id_fkey FOREIGN KEY (conductor_id) REFERENCES public.conductor(conductor_id);


--
-- TOC entry 3078 (class 2606 OID 35358)
-- Name: performance performance_orchestra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performance
    ADD CONSTRAINT performance_orchestra_id_fkey FOREIGN KEY (orchestra_id) REFERENCES public.orchestra(orchestra_id);


--
-- TOC entry 3079 (class 2606 OID 35381)
-- Name: show show_performance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_performance_id_fkey FOREIGN KEY (performance_id) REFERENCES public.performance(performance_id);


-- Completed on 2021-08-03 19:17:13 CEST

--
-- PostgreSQL database dump complete
--

