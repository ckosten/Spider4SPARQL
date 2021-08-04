--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:07 CEST

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
-- TOC entry 202 (class 1259 OID 33485)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id integer NOT NULL,
    staring_date text,
    course text
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 33501)
-- Name: course_arrange; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_arrange (
    course_id integer NOT NULL,
    teacher_id integer NOT NULL,
    grade integer NOT NULL
);


ALTER TABLE public.course_arrange OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 33493)
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    teacher_id integer NOT NULL,
    name text,
    age integer,
    hometown text
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- TOC entry 3199 (class 0 OID 33485)
-- Dependencies: 202
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, staring_date, course) FROM stdin;
1	5 May	Language Arts
2	6 May	Math
3	7 May	Science
4	9 May	History
5	10 May	Bible
6	11 May	Geography
7	13 May	Sports
8	14 May	French
9	15 May	Health
10	17 May	Music
\.


--
-- TOC entry 3201 (class 0 OID 33501)
-- Dependencies: 204
-- Data for Name: course_arrange; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_arrange (course_id, teacher_id, grade) FROM stdin;
2	5	1
2	3	3
3	2	5
4	6	7
5	6	1
10	7	4
\.


--
-- TOC entry 3200 (class 0 OID 33493)
-- Dependencies: 203
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher (teacher_id, name, age, hometown) FROM stdin;
1	Joseph Huts	32	Blackrod Urban District
2	Gustaaf Deloor	29	Bolton County Borough
3	Vicente Carretero	26	Farnworth Municipal Borough
4	John Deloor	33	Horwich Urban District
5	Kearsley Brown	45	Kearsley Urban District
6	Anne Walker	41	Little Lever Urban District
7	Lucy Wong	39	Turton Urban District
\.


--
-- TOC entry 3070 (class 2606 OID 33505)
-- Name: course_arrange course_arrange_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_arrange
    ADD CONSTRAINT course_arrange_pkey PRIMARY KEY (course_id, teacher_id, grade);


--
-- TOC entry 3066 (class 2606 OID 33492)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- TOC entry 3068 (class 2606 OID 33500)
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacher_id);


--
-- TOC entry 3071 (class 2606 OID 33506)
-- Name: course_arrange course_arrange_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_arrange
    ADD CONSTRAINT course_arrange_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 3072 (class 2606 OID 33511)
-- Name: course_arrange course_arrange_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_arrange
    ADD CONSTRAINT course_arrange_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teacher(teacher_id);


-- Completed on 2021-08-03 19:17:08 CEST

--
-- PostgreSQL database dump complete
--

