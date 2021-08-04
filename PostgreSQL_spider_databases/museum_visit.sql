--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:08 CEST

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
-- TOC entry 202 (class 1259 OID 36064)
-- Name: museum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.museum (
    museum_id integer NOT NULL,
    name character varying,
    num_of_staff integer,
    open_year integer
);


ALTER TABLE public.museum OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 36093)
-- Name: visit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visit (
    museum_id integer NOT NULL,
    visitor_id integer NOT NULL,
    num_of_ticket integer,
    total_spent real
);


ALTER TABLE public.visit OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 36072)
-- Name: visitor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visitor (
    id integer NOT NULL,
    name character varying,
    level_of_membership integer,
    age integer
);


ALTER TABLE public.visitor OWNER TO postgres;

--
-- TOC entry 3199 (class 0 OID 36064)
-- Dependencies: 202
-- Data for Name: museum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.museum (museum_id, name, num_of_staff, open_year) FROM stdin;
1	Plaza Museum	62	2000
2	Capital Plaza Museum	25	2012
3	Jefferson Development Museum	18	2010
4	Willow Grande Museum	17	2011
5	RiverPark Museum	16	2008
6	Place Tower Museum	16	2008
7	Central City District Residential Museum	15	2010
8	ZirMed Gateway Museum	12	2009
\.


--
-- TOC entry 3201 (class 0 OID 36093)
-- Dependencies: 204
-- Data for Name: visit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visit (museum_id, visitor_id, num_of_ticket, total_spent) FROM stdin;
1	5	20	320.14
2	5	4	89.98
4	3	10	320.44
2	3	24	209.98
4	6	3	20.44
8	6	2	19.98
\.


--
-- TOC entry 3200 (class 0 OID 36072)
-- Dependencies: 203
-- Data for Name: visitor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visitor (id, name, level_of_membership, age) FROM stdin;
1	Gonzalo Higuain	8	35
2	Guti Midfielder	5	28
3	Arjen Robben	1	27
4	Raul Brown	2	56
5	Fernando Gago	6	36
6	Rafael van der Vaart	1	25
\.


--
-- TOC entry 3066 (class 2606 OID 36071)
-- Name: museum museum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.museum
    ADD CONSTRAINT museum_pkey PRIMARY KEY (museum_id);


--
-- TOC entry 3070 (class 2606 OID 36097)
-- Name: visit visit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_pkey PRIMARY KEY (museum_id, visitor_id);


--
-- TOC entry 3068 (class 2606 OID 36079)
-- Name: visitor visitor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitor
    ADD CONSTRAINT visitor_pkey PRIMARY KEY (id);


--
-- TOC entry 3071 (class 2606 OID 36098)
-- Name: visit visit_museum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_museum_id_fkey FOREIGN KEY (museum_id) REFERENCES public.museum(museum_id);


--
-- TOC entry 3072 (class 2606 OID 36103)
-- Name: visit visit_visitor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_visitor_id_fkey FOREIGN KEY (visitor_id) REFERENCES public.visitor(id);


-- Completed on 2021-08-03 19:17:08 CEST

--
-- PostgreSQL database dump complete
--

