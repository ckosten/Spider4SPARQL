--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:04 CEST

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
-- TOC entry 204 (class 1259 OID 35549)
-- Name: has_pet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.has_pet (
    stuid integer NOT NULL,
    petid integer NOT NULL
);


ALTER TABLE public.has_pet OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 35544)
-- Name: pets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pets (
    petid integer NOT NULL,
    pettype character varying(20),
    pet_age integer,
    weight real
);


ALTER TABLE public.pets OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 35539)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    stuid integer NOT NULL,
    lname character varying(12),
    fname character varying(12),
    age integer,
    sex character varying(1),
    major integer,
    advisor integer,
    city_code character varying(3)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 3199 (class 0 OID 35549)
-- Dependencies: 204
-- Data for Name: has_pet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.has_pet (stuid, petid) FROM stdin;
1001	2001
1002	2002
1002	2003
\.


--
-- TOC entry 3198 (class 0 OID 35544)
-- Dependencies: 203
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pets (petid, pettype, pet_age, weight) FROM stdin;
2001	cat	3	12
2002	dog	2	13.4
2003	dog	1	9.3
\.


--
-- TOC entry 3197 (class 0 OID 35539)
-- Dependencies: 202
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (stuid, lname, fname, age, sex, major, advisor, city_code) FROM stdin;
1001	Smith	Linda	18	F	600	1121	BAL
1002	Kim	Tracy	19	F	600	7712	HKG
1003	Jones	Shiela	21	F	600	7792	WAS
1004	Kumar	Dinesh	20	M	600	8423	CHI
1005	Gompers	Paul	26	M	600	1121	YYZ
1006	Schultz	Andy	18	M	600	1148	BAL
1007	Apap	Lisa	18	F	600	8918	PIT
1008	Nelson	Jandy	20	F	600	9172	BAL
1009	Tai	Eric	19	M	600	2192	YYZ
1010	Lee	Derek	17	M	600	2192	HOU
1011	Adams	David	22	M	600	1148	PHL
1012	Davis	Steven	20	M	600	7723	PIT
1014	Norris	Charles	18	M	600	8741	DAL
1015	Lee	Susan	16	F	600	8721	HKG
1016	Schwartz	Mark	17	M	600	2192	DET
1017	Wilson	Bruce	27	M	600	1148	LON
1018	Leighton	Michael	20	M	600	1121	PIT
1019	Pang	Arthur	18	M	600	2192	WAS
1020	Thornton	Ian	22	M	520	7271	NYC
1021	Andreou	George	19	M	520	8722	NYC
1022	Woods	Michael	17	M	540	8722	PHL
1023	Shieber	David	20	M	520	8722	NYC
1024	Prater	Stacy	18	F	540	7271	BAL
1025	Goldman	Mark	18	M	520	7134	PIT
1026	Pang	Eric	19	M	520	7134	HKG
1027	Brody	Paul	18	M	520	8723	LOS
1028	Rugh	Eric	20	M	550	2311	ROC
1029	Han	Jun	17	M	100	2311	PEK
1030	Cheng	Lisa	21	F	550	2311	SFO
1031	Smith	Sarah	20	F	550	8772	PHL
1032	Brown	Eric	20	M	550	8772	ATL
1033	Simms	William	18	M	550	8772	NAR
1034	Epp	Eric	18	M	50	5718	BOS
1035	Schmidt	Sarah	26	F	50	5718	WAS
\.


--
-- TOC entry 3068 (class 2606 OID 35553)
-- Name: has_pet has_pet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.has_pet
    ADD CONSTRAINT has_pet_pkey PRIMARY KEY (stuid, petid);


--
-- TOC entry 3066 (class 2606 OID 35548)
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (petid);


--
-- TOC entry 3064 (class 2606 OID 35543)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (stuid);


--
-- TOC entry 3069 (class 2606 OID 35554)
-- Name: has_pet has_pet_petid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.has_pet
    ADD CONSTRAINT has_pet_petid_fkey FOREIGN KEY (petid) REFERENCES public.pets(petid);


--
-- TOC entry 3070 (class 2606 OID 35559)
-- Name: has_pet has_pet_stuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.has_pet
    ADD CONSTRAINT has_pet_stuid_fkey FOREIGN KEY (stuid) REFERENCES public.student(stuid);


-- Completed on 2021-08-03 19:17:05 CEST

--
-- PostgreSQL database dump complete
--

