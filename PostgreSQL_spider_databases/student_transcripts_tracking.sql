--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:10 CEST

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
-- TOC entry 202 (class 1259 OID 54183)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    address_id integer NOT NULL,
    line_1 character varying(255),
    line_2 character varying(255),
    line_3 character varying(255),
    city character varying(255),
    zip_postcode character varying(20),
    state_province_county character varying(255),
    country character varying(255),
    other_address_details character varying(255)
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 54191)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(255),
    course_description character varying(255),
    other_details character varying(255)
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 54207)
-- Name: degree_programs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.degree_programs (
    degree_program_id integer NOT NULL,
    department_id integer NOT NULL,
    degree_summary_name character varying(255),
    degree_summary_description character varying(255),
    other_details character varying(255)
);


ALTER TABLE public.degree_programs OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 54199)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(255),
    department_description character varying(255),
    other_details character varying(255)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 54220)
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sections (
    section_id integer NOT NULL,
    course_id integer NOT NULL,
    section_name character varying(255),
    section_description character varying(255),
    other_details character varying(255)
);


ALTER TABLE public.sections OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 54233)
-- Name: semesters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semesters (
    semester_id integer NOT NULL,
    semester_name character varying(255),
    semester_description character varying(255),
    other_details character varying(255)
);


ALTER TABLE public.semesters OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 54259)
-- Name: student_enrolment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_enrolment (
    student_enrolment_id integer NOT NULL,
    degree_program_id integer NOT NULL,
    semester_id integer NOT NULL,
    student_id integer NOT NULL,
    other_details character varying(255)
);


ALTER TABLE public.student_enrolment OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 54279)
-- Name: student_enrolment_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_enrolment_courses (
    student_course_id integer NOT NULL,
    course_id integer NOT NULL,
    student_enrolment_id integer NOT NULL
);


ALTER TABLE public.student_enrolment_courses OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 54241)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    current_address_id integer NOT NULL,
    permanent_address_id integer NOT NULL,
    first_name character varying(80),
    middle_name character varying(40),
    last_name character varying(40),
    cell_mobile_number character varying(40),
    email_address character varying(40),
    ssn character varying(40),
    date_first_registered timestamp without time zone,
    date_left timestamp without time zone,
    other_student_details character varying(255)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 54299)
-- Name: transcript_contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transcript_contents (
    student_course_id integer NOT NULL,
    transcript_id integer NOT NULL
);


ALTER TABLE public.transcript_contents OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 54294)
-- Name: transcripts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transcripts (
    transcript_id integer NOT NULL,
    transcript_date timestamp without time zone,
    other_details character varying(255)
);


ALTER TABLE public.transcripts OWNER TO postgres;

--
-- TOC entry 3259 (class 0 OID 54183)
-- Dependencies: 202
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (address_id, line_1, line_2, line_3, city, zip_postcode, state_province_county, country, other_address_details) FROM stdin;
1	2294 Grant Square Apt. 235	Apt. 370	NA	Port Chelsea	148	Virginia	Iceland	NA
2	3999 Aufderhar Ways Suite 593	Apt. 388	NA	Lake Laishafurt	943	Kentucky	Burundi	NA
3	67942 Carlotta Ferry Apt. 686	Apt. 583	NA	Goodwinhaven	541	Kansas	Saudi Arabia	NA
4	0144 Lamar Plaza Apt. 346	Suite 703	NA	Port Evanston	847	Washington	Angola	NA
5	858 Peggie Bypass Suite 212	Apt. 335	NA	Michelleburgh	446	Hawaii	Haiti	NA
6	16998 Mraz Lodge	Apt. 689	NA	North Omer	902	Kentucky	Gibraltar	NA
7	193 Marlin Brook	Apt. 406	NA	Herzoghaven	068	Arkansas	Cook Islands	NA
8	202 Hessel Views Apt. 468	Apt. 305	NA	Mariliehaven	638	Idaho	Croatia	NA
9	0643 Muller Vista	Suite 383	NA	Port Elvisfurt	777	NorthCarolina	Gabon	NA
10	7081 Eda Center	Suite 830	NA	Rutherfordtown	839	Delaware	Kyrgyz Republic	NA
11	9283 Schulist Falls Apt. 037	Suite 239	NA	South Palma	400	WestVirginia	Bermuda	NA
12	979 Haag Shores Suite 656	Apt. 468	NA	Prohaskafort	590	SouthDakota	Lesotho	NA
13	492 Wilkinson Route	Suite 865	NA	New Clemensburgh	386	Florida	Samoa	NA
14	186 Evan Motorway Apt. 409	Suite 079	NA	Lake Careyberg	895	Kentucky	New Caledonia	NA
15	74046 Metz Walk Apt. 113	Suite 674	NA	Port Oceane	669	Wyoming	Norfolk Island	NA
\.


--
-- TOC entry 3260 (class 0 OID 54191)
-- Dependencies: 203
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_name, course_description, other_details) FROM stdin;
1	ds	p	NA
2	math	q	NA
3	os	v	NA
4	en	k	NA
5	fr	c	NA
6	la	n	NA
7	cal	l	NA
8	nlp	q	NA
9	dl	l	NA
10	ml	b	NA
11	ai	w	NA
12	db	q	NA
13	rs	v	NA
14	pl	p	NA
15	oop	d	NA
\.


--
-- TOC entry 3262 (class 0 OID 54207)
-- Dependencies: 205
-- Data for Name: degree_programs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.degree_programs (degree_program_id, department_id, degree_summary_name, degree_summary_description, other_details) FROM stdin;
1	13	Master	architecto	NA
2	2	Master	cumque	NA
3	13	Master	placeat	NA
4	8	Bachelor	unde	NA
5	11	Master	officiis	NA
6	8	Bachelor	aperiam	NA
7	14	Bachelor	assumenda	NA
8	15	Master	earum	NA
9	3	Bachelor	voluptas	NA
10	8	Bachelor	aut	NA
11	14	Bachelor	aut	NA
12	4	Master	qui	NA
13	7	Bachelor	quam	NA
14	2	PHD	et	NA
15	12	PHD	esse	NA
\.


--
-- TOC entry 3261 (class 0 OID 54199)
-- Dependencies: 204
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name, department_description, other_details) FROM stdin;
1	computer science	error	NA
2	history	nostrum	NA
3	art	aliquam	NA
4	linguistic	natus	NA
5	management	nihil	NA
6	engineer	autem	NA
7	math	doloribus	NA
8	statistics	nihil	NA
9	law	dolorem	NA
10	economics	non	NA
11	biology	consequatur	NA
12	medical	ea	NA
13	dance	consequatur	NA
14	drama	in	NA
15	geography	nisi	NA
\.


--
-- TOC entry 3263 (class 0 OID 54220)
-- Dependencies: 206
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sections (section_id, course_id, section_name, section_description, other_details) FROM stdin;
1	9	a	non	NA
2	2	b	voluptatem	NA
3	8	c	qui	NA
4	1	d	voluptas	NA
5	5	e	ex	NA
6	7	f	doloremque	NA
7	12	g	provident	NA
8	14	h	et	NA
9	8	j	quis	NA
10	14	k	nesciunt	NA
11	1	l	ad	NA
12	4	o	et	NA
13	5	p	facilis	NA
14	6	u	reprehenderit	NA
15	10	y	qui	NA
\.


--
-- TOC entry 3264 (class 0 OID 54233)
-- Dependencies: 207
-- Data for Name: semesters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semesters (semester_id, semester_name, semester_description, other_details) FROM stdin;
1	spring 2010	x	NA
2	summer 2010	g	NA
3	fall 2010	w	NA
4	winter 2010	c	NA
5	spring 2018	c	NA
6	spring 2012	l	NA
7	spring 2013	y	NA
8	spring 2014	x	NA
9	spring 2015	x	NA
10	spring 2016	f	NA
11	spring 2017	g	NA
12	spring 2018	m	NA
13	fall 2018	q	NA
14	winter 2018	t	NA
15	spring 2019	o	NA
\.


--
-- TOC entry 3266 (class 0 OID 54259)
-- Dependencies: 209
-- Data for Name: student_enrolment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_enrolment (student_enrolment_id, degree_program_id, semester_id, student_id, other_details) FROM stdin;
1	12	13	14	NA
2	4	2	9	NA
3	10	2	7	NA
4	4	15	9	NA
5	5	1	14	NA
6	3	13	1	NA
7	9	9	4	NA
8	8	5	12	NA
9	12	6	7	NA
10	11	2	7	NA
11	10	13	4	NA
12	9	2	5	NA
13	2	12	6	NA
14	9	15	6	NA
15	2	4	6	NA
\.


--
-- TOC entry 3267 (class 0 OID 54279)
-- Dependencies: 210
-- Data for Name: student_enrolment_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_enrolment_courses (student_course_id, course_id, student_enrolment_id) FROM stdin;
8	2	5
28982908	8	9
1	6	8
2	14	5
9860	14	10
7	11	5
681404	10	4
96	2	4
438800	3	4
83814225	12	14
0	6	2
604750	4	6
70882679	13	9
45105806	13	14
76	10	13
\.


--
-- TOC entry 3265 (class 0 OID 54241)
-- Dependencies: 208
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, current_address_id, permanent_address_id, first_name, middle_name, last_name, cell_mobile_number, email_address, ssn, date_first_registered, date_left, other_student_details) FROM stdin;
1	10	15	Timmothy	Anna	Ward	(096)889-8954x524	erwin.zboncak@example.com	965	1971-02-05 07:28:23	1971-05-17 19:28:49	quia
2	12	5	Hobart	Lorenz	Balistreri	1-009-710-5151	swift.kolby@example.com	304246	1976-10-26 02:33:06	2013-10-05 17:41:28	autem
3	9	5	Warren	Violet	Gleichner	07661787471	johns.unique@example.net	3	2007-08-29 23:25:41	2007-03-31 09:53:19	facilis
4	7	11	Jarvis	Aaliyah	Carroll	09700166582	jillian26@example.net	141072406	2014-03-28 05:48:23	2007-08-02 04:12:58	atque
5	9	9	Milton	Vaughn	Christiansen	171-642-5684	lhartmann@example.org		1973-05-19 19:12:46	2007-11-28 12:50:21	laborum
6	6	3	Stanford	Mona	Rogahn	436.613.7683	skassulke@example.net	248	1997-03-20 16:47:25	2016-04-09 12:27:04	qui
7	15	3	Frida	Aisha	Huel	1-879-796-8987x164	baumbach.lucious@example.org	668	2018-03-13 09:56:22	1997-11-16 08:54:33	dolorum
8	1	5	Delaney	Judd	Ankunding	03174364122	dell43@example.net	402	1982-02-14 08:46:35	2004-12-08 05:29:11	voluptatem
9	2	15	Reva	Golda	Osinski	(507)365-8405	qo'kon@example.com	39	2017-01-04 08:10:25	1990-09-01 05:03:27	nesciunt
10	15	14	Helga	Cleve	Mohr	677.401.9382	nya.lesch@example.net	43	2009-09-25 00:14:25	2017-07-09 21:38:43	rerum
11	14	4	Gregg	Mossie	Schuppe	(462)246-7921	nbruen@example.org	494	1989-05-24 23:31:29	1975-10-09 00:49:27	omnis
12	14	9	Orrin	Neal	Kemmer	(982)153-1469x1733	beth42@example.org	6274274	2005-12-15 08:42:10	2006-08-04 17:26:49	non
13	9	8	Deon	Brooklyn	Weimann	(213)445-0399x85208	jhuel@example.com	68095	1986-02-24 21:12:23	2014-05-30 23:32:02	assumenda
14	12	11	Jordy	Osborne	Rempel	(605)919-3594x3661	gracie29@example.com	34458427	2004-12-24 12:36:46	1999-08-24 00:07:10	et
15	2	9	Jett	Alberta	Jaskolski	877.549.9067x8723	mya88@example.org	156	1982-06-19 13:15:18	1982-06-11 00:25:39	omnis
\.


--
-- TOC entry 3269 (class 0 OID 54299)
-- Dependencies: 212
-- Data for Name: transcript_contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transcript_contents (student_course_id, transcript_id) FROM stdin;
0	2
96	8
76	9
7	4
0	15
76	15
0	6
96	13
76	12
28982908	11
2	8
0	5
8	5
45105806	8
70882679	6
\.


--
-- TOC entry 3268 (class 0 OID 54294)
-- Dependencies: 211
-- Data for Name: transcripts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transcripts (transcript_id, transcript_date, other_details) FROM stdin;
1	1988-04-30 01:19:47	NA
2	1975-10-28 15:16:51	NA
3	1984-12-19 00:37:21	NA
4	1999-01-06 20:06:46	NA
5	2013-06-30 13:01:40	NA
6	2010-12-13 10:55:15	NA
7	1990-03-05 11:59:41	NA
8	1975-05-06 12:04:47	NA
9	1984-01-18 23:07:07	NA
10	1975-05-20 18:31:21	NA
11	1986-07-12 07:27:29	NA
12	1985-08-21 09:32:39	NA
13	1985-04-29 01:20:20	NA
14	2002-09-24 06:11:49	NA
15	1998-11-22 12:18:29	NA
\.


--
-- TOC entry 3103 (class 2606 OID 54190)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (address_id);


--
-- TOC entry 3105 (class 2606 OID 54198)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- TOC entry 3109 (class 2606 OID 54214)
-- Name: degree_programs degree_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degree_programs
    ADD CONSTRAINT degree_programs_pkey PRIMARY KEY (degree_program_id);


--
-- TOC entry 3107 (class 2606 OID 54206)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- TOC entry 3111 (class 2606 OID 54227)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- TOC entry 3113 (class 2606 OID 54240)
-- Name: semesters semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semesters
    ADD CONSTRAINT semesters_pkey PRIMARY KEY (semester_id);


--
-- TOC entry 3119 (class 2606 OID 54283)
-- Name: student_enrolment_courses student_enrolment_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolment_courses
    ADD CONSTRAINT student_enrolment_courses_pkey PRIMARY KEY (student_course_id);


--
-- TOC entry 3117 (class 2606 OID 54263)
-- Name: student_enrolment student_enrolment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolment
    ADD CONSTRAINT student_enrolment_pkey PRIMARY KEY (student_enrolment_id);


--
-- TOC entry 3115 (class 2606 OID 54248)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- TOC entry 3121 (class 2606 OID 54298)
-- Name: transcripts transcripts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcripts
    ADD CONSTRAINT transcripts_pkey PRIMARY KEY (transcript_id);


--
-- TOC entry 3122 (class 2606 OID 54215)
-- Name: degree_programs degree_programs_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degree_programs
    ADD CONSTRAINT degree_programs_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3123 (class 2606 OID 54228)
-- Name: sections sections_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- TOC entry 3129 (class 2606 OID 54284)
-- Name: student_enrolment_courses student_enrolment_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolment_courses
    ADD CONSTRAINT student_enrolment_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- TOC entry 3130 (class 2606 OID 54289)
-- Name: student_enrolment_courses student_enrolment_courses_student_enrolment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolment_courses
    ADD CONSTRAINT student_enrolment_courses_student_enrolment_id_fkey FOREIGN KEY (student_enrolment_id) REFERENCES public.student_enrolment(student_enrolment_id);


--
-- TOC entry 3126 (class 2606 OID 54264)
-- Name: student_enrolment student_enrolment_degree_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolment
    ADD CONSTRAINT student_enrolment_degree_program_id_fkey FOREIGN KEY (degree_program_id) REFERENCES public.degree_programs(degree_program_id);


--
-- TOC entry 3127 (class 2606 OID 54269)
-- Name: student_enrolment student_enrolment_semester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolment
    ADD CONSTRAINT student_enrolment_semester_id_fkey FOREIGN KEY (semester_id) REFERENCES public.semesters(semester_id);


--
-- TOC entry 3128 (class 2606 OID 54274)
-- Name: student_enrolment student_enrolment_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolment
    ADD CONSTRAINT student_enrolment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id);


--
-- TOC entry 3124 (class 2606 OID 54249)
-- Name: students students_current_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_current_address_id_fkey FOREIGN KEY (current_address_id) REFERENCES public.addresses(address_id);


--
-- TOC entry 3125 (class 2606 OID 54254)
-- Name: students students_permanent_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_permanent_address_id_fkey FOREIGN KEY (permanent_address_id) REFERENCES public.addresses(address_id);


--
-- TOC entry 3131 (class 2606 OID 54302)
-- Name: transcript_contents transcript_contents_student_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcript_contents
    ADD CONSTRAINT transcript_contents_student_course_id_fkey FOREIGN KEY (student_course_id) REFERENCES public.student_enrolment_courses(student_course_id);


--
-- TOC entry 3132 (class 2606 OID 54307)
-- Name: transcript_contents transcript_contents_transcript_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcript_contents
    ADD CONSTRAINT transcript_contents_transcript_id_fkey FOREIGN KEY (transcript_id) REFERENCES public.transcripts(transcript_id);


-- Completed on 2021-08-03 19:17:11 CEST

--
-- PostgreSQL database dump complete
--

