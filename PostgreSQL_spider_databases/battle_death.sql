--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:09 CEST

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
-- TOC entry 202 (class 1259 OID 35917)
-- Name: battle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.battle (
    id integer NOT NULL,
    name character varying,
    date character varying,
    bulgarian_commander character varying,
    latin_commander character varying,
    result character varying
);


ALTER TABLE public.battle OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 35938)
-- Name: death; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.death (
    caused_by_ship_id integer,
    id integer NOT NULL,
    note character varying,
    killed integer,
    injured integer
);


ALTER TABLE public.death OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 35925)
-- Name: ship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ship (
    lost_in_battle integer,
    id integer NOT NULL,
    name character varying,
    tonnage character varying,
    ship_type character varying,
    location character varying,
    disposition_of_ship character varying
);


ALTER TABLE public.ship OWNER TO postgres;

--
-- TOC entry 3200 (class 0 OID 35917)
-- Dependencies: 202
-- Data for Name: battle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.battle (id, name, date, bulgarian_commander, latin_commander, result) FROM stdin;
1	Battle of Adrianople	14 April 1205	Kaloyan	Baldwin I	Bulgarian victory
2	Battle of Serres	June 1205	Kaloyan	Unknown	Bulgarian victory
3	Battle of Rusion	31 January 1206	Kaloyan	Thierry de Termond	Bulgarian victory
4	Battle of Rodosto	February 1206	Kaloyan	Unknown	Bulgarian victory
5	Battle of Messinopolis	4 September 1207	Unknown	Boniface of Montferrat	Bulgarian victory
6	Battle of Boruy	June 1205	Boril	Henry I	Bulgarian victory
7	Battle of Philippopolis	31 June 1208	Boril	Henry I	Latin victory
8	Siege of Constantinople	1235	Ivan Asen II	John of Brienne	Two Year Truce
\.


--
-- TOC entry 3202 (class 0 OID 35938)
-- Dependencies: 204
-- Data for Name: death; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.death (caused_by_ship_id, id, note, killed, injured) FROM stdin;
1	1	Dantewada, Chhattisgarh	8	0
2	2	Dantewada, Chhattisgarh	3	0
3	13	Erraboru, Chhattisgarh	25	0
3	3	East Champaran, Bihar	2	0
4	4	Gajapati, Odisha	3	0
4	5	Sundargarh, Odisha	0	9
5	6	Dantewada, Chhattisgarh	0	0
5	7	Dantewada, Chhattisgarh	4	5
6	8	Kanker, Chhattisgarh	0	0
1	9	Dantewada, Chhattisgarh	29	0
3	10	WestMidnapore, West Bengal	0	0
2	11	Bastar, Chattisgarh	0	0
5	12	Bokaro, Jharkhand	14	0
\.


--
-- TOC entry 3201 (class 0 OID 35925)
-- Dependencies: 203
-- Data for Name: ship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ship (lost_in_battle, id, name, tonnage, ship_type, location, disposition_of_ship) FROM stdin;
8	1	Lettice	t	Brig	English Channel	Captured
7	2	Bon Accord	t	Brig	English Channel	Captured
6	3	Mary	t	Brig	English Channel	Captured
5	4	HMS Avon	391	18-gun Brig	English Channel	Wrecked
5	5	Three Brothers	t	Brig	SW Approaches	Scuttled
4	6	Bacchus	t	Brig	English Channel	Sank
8	7	HMS Atalanta	225	8 gun Brig	Mid-Atlantic	Captured
\.


--
-- TOC entry 3067 (class 2606 OID 35924)
-- Name: battle battle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.battle
    ADD CONSTRAINT battle_pkey PRIMARY KEY (id);


--
-- TOC entry 3071 (class 2606 OID 35945)
-- Name: death death_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.death
    ADD CONSTRAINT death_pkey PRIMARY KEY (id);


--
-- TOC entry 3069 (class 2606 OID 35932)
-- Name: ship ship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_pkey PRIMARY KEY (id);


--
-- TOC entry 3073 (class 2606 OID 35946)
-- Name: death death_caused_by_ship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.death
    ADD CONSTRAINT death_caused_by_ship_id_fkey FOREIGN KEY (caused_by_ship_id) REFERENCES public.ship(id);


--
-- TOC entry 3072 (class 2606 OID 35933)
-- Name: ship ship_lost_in_battle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_lost_in_battle_fkey FOREIGN KEY (lost_in_battle) REFERENCES public.battle(id);


-- Completed on 2021-08-03 19:17:10 CEST

--
-- PostgreSQL database dump complete
--

