--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:13 CEST

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
-- TOC entry 203 (class 1259 OID 35394)
-- Name: friend; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friend (
    student_id integer NOT NULL,
    friend_id integer NOT NULL
);


ALTER TABLE public.friend OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 35386)
-- Name: high_schooler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.high_schooler (
    id integer NOT NULL,
    name text,
    grade integer
);


ALTER TABLE public.high_schooler OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 35409)
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    student_id integer NOT NULL,
    liked_id integer NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- TOC entry 3201 (class 0 OID 35394)
-- Dependencies: 203
-- Data for Name: friend; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friend (student_id, friend_id) FROM stdin;
1510	1381
1510	1689
1689	1709
1381	1247
1709	1247
1689	1782
1782	1468
1782	1316
1782	1304
1468	1101
1468	1641
1101	1641
1247	1911
1247	1501
1911	1501
1501	1934
1316	1934
1934	1304
1304	1661
1661	1025
\.


--
-- TOC entry 3200 (class 0 OID 35386)
-- Dependencies: 202
-- Data for Name: high_schooler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.high_schooler (id, name, grade) FROM stdin;
1510	Jordan	9
1689	Gabriel	9
1381	Tiffany	9
1709	Cassandra	9
1101	Haley	10
1782	Andrew	10
1468	Kris	10
1641	Brittany	10
1247	Alexis	11
1316	Austin	11
1911	Gabriel	11
1501	Jessica	11
1304	Jordan	12
1025	John	12
1934	Kyle	12
1661	Logan	12
\.


--
-- TOC entry 3202 (class 0 OID 35409)
-- Dependencies: 204
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (student_id, liked_id) FROM stdin;
1689	1709
1709	1689
1782	1709
1911	1247
1247	1468
1641	1468
1316	1304
1501	1934
1934	1501
1025	1101
\.


--
-- TOC entry 3067 (class 2606 OID 35398)
-- Name: friend friend_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friend
    ADD CONSTRAINT friend_pkey PRIMARY KEY (student_id, friend_id);


--
-- TOC entry 3065 (class 2606 OID 35393)
-- Name: high_schooler highschooler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.high_schooler
    ADD CONSTRAINT highschooler_pkey PRIMARY KEY (id);


--
-- TOC entry 3069 (class 2606 OID 35413)
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (student_id, liked_id);


--
-- TOC entry 3071 (class 2606 OID 35404)
-- Name: friend friend_friend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friend
    ADD CONSTRAINT friend_friend_id_fkey FOREIGN KEY (friend_id) REFERENCES public.high_schooler(id);


--
-- TOC entry 3070 (class 2606 OID 35399)
-- Name: friend friend_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friend
    ADD CONSTRAINT friend_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.high_schooler(id);


--
-- TOC entry 3072 (class 2606 OID 35414)
-- Name: likes likes_liked_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_liked_id_fkey FOREIGN KEY (liked_id) REFERENCES public.high_schooler(id);


--
-- TOC entry 3073 (class 2606 OID 35419)
-- Name: likes likes_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.high_schooler(id);


-- Completed on 2021-08-03 19:17:13 CEST

--
-- PostgreSQL database dump complete
--

