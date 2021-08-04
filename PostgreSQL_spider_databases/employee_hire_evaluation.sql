--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:06 CEST

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
-- TOC entry 202 (class 1259 OID 35993)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    name character varying,
    age integer,
    city character varying
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 36027)
-- Name: evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation (
    employee_id integer NOT NULL,
    year_awarded character varying NOT NULL,
    bonus real
);


ALTER TABLE public.evaluation OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 36009)
-- Name: hiring; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hiring (
    shop_id integer,
    employee_id integer NOT NULL,
    start_from character varying,
    is_full_time boolean
);


ALTER TABLE public.hiring OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 36001)
-- Name: shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop (
    shop_id integer NOT NULL,
    name character varying,
    location character varying,
    district character varying,
    number_products integer,
    manager_name character varying
);


ALTER TABLE public.shop OWNER TO postgres;

--
-- TOC entry 3208 (class 0 OID 35993)
-- Dependencies: 202
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, name, age, city) FROM stdin;
1	George Chuter	23	Bristol
2	Lee Mears	29	Bath
3	Mark Regan	43	Bristol
4	Jason Hobson	30	Bristol
5	Tim Payne	29	Wasps
6	Andrew Sheridan	28	Sale
7	Matt Stevens	29	Bath
8	Phil Vickery	40	Wasps
9	Steve Borthwick	32	Bath
10	Louis Deacon	36	Leicester
\.


--
-- TOC entry 3211 (class 0 OID 36027)
-- Dependencies: 205
-- Data for Name: evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation (employee_id, year_awarded, bonus) FROM stdin;
1	2011	3000
2	2015	3200
1	2016	2900
4	2017	3200
7	2018	3200
10	2016	4000
\.


--
-- TOC entry 3210 (class 0 OID 36009)
-- Dependencies: 204
-- Data for Name: hiring; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hiring (shop_id, employee_id, start_from, is_full_time) FROM stdin;
1	1	2009	t
1	2	2003	t
8	3	2011	f
4	4	2012	t
5	5	2013	t
2	6	2010	f
6	7	2008	t
\.


--
-- TOC entry 3209 (class 0 OID 36001)
-- Dependencies: 203
-- Data for Name: shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop (shop_id, name, location, district, number_products, manager_name) FROM stdin;
1	FC Haka	Valkeakoski	Tehtaan kenttä	3516	Olli Huttunen
2	HJK	Helsinki	Finnair Stadium	10770	Antti Muurinen
3	FC Honka	Espoo	Tapiolan Urheilupuisto	6000	Mika Lehkosuo
4	FC Inter	Turku	Veritas Stadion	10000	Job Dragtsma
5	FF Jaro	Jakobstad	Jakobstads Centralplan	5000	Mika Laurikainen
6	FC KooTeePee	Kotka	Arto Tolsa Areena	4780	Tommi Kautonen
7	KuPS	Kuopio	Magnum Areena	3500	Kai Nyyssönen
8	FC Lahti	Lahti	Lahden Stadion	15000	Ilkka Mäkelä
9	IFK Mariehamn	Mariehamn	Wiklöf Holding Arena	1600	Pekka Lyyski
\.


--
-- TOC entry 3072 (class 2606 OID 36000)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 3078 (class 2606 OID 45578)
-- Name: evaluation evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_pkey PRIMARY KEY (employee_id, year_awarded);


--
-- TOC entry 3076 (class 2606 OID 36016)
-- Name: hiring hiring_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring
    ADD CONSTRAINT hiring_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 3074 (class 2606 OID 36008)
-- Name: shop shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_pkey PRIMARY KEY (shop_id);


--
-- TOC entry 3081 (class 2606 OID 36035)
-- Name: evaluation evaluation_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- TOC entry 3080 (class 2606 OID 36022)
-- Name: hiring hiring_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring
    ADD CONSTRAINT hiring_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- TOC entry 3079 (class 2606 OID 36017)
-- Name: hiring hiring_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring
    ADD CONSTRAINT hiring_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


-- Completed on 2021-08-03 19:17:07 CEST

--
-- PostgreSQL database dump complete
--

