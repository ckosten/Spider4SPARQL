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
-- TOC entry 204 (class 1259 OID 35777)
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    document_id integer NOT NULL,
    template_id integer,
    document_name character varying(255),
    document_description character varying(255),
    other_details character varying(255)
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 35790)
-- Name: paragraphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paragraphs (
    paragraph_id integer NOT NULL,
    document_id integer NOT NULL,
    paragraph_text character varying(255),
    other_details character varying(255)
);


ALTER TABLE public.paragraphs OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 35746)
-- Name: reference_template_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reference_template_types (
    template_type_code character varying(15) NOT NULL,
    template_type_description character varying(255) NOT NULL
);


ALTER TABLE public.reference_template_types OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 35767)
-- Name: templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.templates (
    template_id integer NOT NULL,
    version_number integer NOT NULL,
    template_type_code character varying(15) NOT NULL,
    date_effective_from timestamp without time zone,
    date_effective_to timestamp without time zone,
    template_details character varying(255) NOT NULL
);


ALTER TABLE public.templates OWNER TO postgres;

--
-- TOC entry 3208 (class 0 OID 35777)
-- Dependencies: 204
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (document_id, template_id, document_name, document_description, other_details) FROM stdin;
0	7	Introduction of OS	n	\N
1	25	Understanding DB	y	\N
3	6	Summer Show	u	\N
76	20	Robbin CV	y	\N
80	14	Welcome to NY	h	\N
82	11	Data base	w	\N
2394	10	Customer reviews	y	\N
3830	14	Do not panic	k	\N
33930	1	How Google people work	z	\N
50123	22	Learning French	r	\N
651512	21	How to write a CV	f	\N
801801	4	How to read a book	w	\N
3540024	8	Palm reading	y	\N
16514113	25	A history of Arts	h	\N
385906526	11	About Korea	b	\N
\.


--
-- TOC entry 3209 (class 0 OID 35790)
-- Dependencies: 205
-- Data for Name: paragraphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paragraphs (paragraph_id, document_id, paragraph_text, other_details) FROM stdin;
7	2394	Korea	\N
9	3	Somalia	\N
65	50123	Palestinian Territory	\N
241	651512	Jersey	\N
3708	33930	UK	\N
9946	385906526	Fiji	\N
16615	80	Japan	\N
1104059	3830	Senegal	\N
243399026	651512	Indonesia	\N
280120913	2394	Ukraine	\N
510442723	2394	Korea	\N
571212310	16514113	Brazil	\N
608931827	80	Micronesia	\N
765713812	16514113	Ireland	\N
946335436	3540024	Papua New Guinea	\N
\.


--
-- TOC entry 3206 (class 0 OID 35746)
-- Dependencies: 202
-- Data for Name: reference_template_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reference_template_types (template_type_code, template_type_description) FROM stdin;
PPT	Presentation
CV	CV
AD	Advertisement
PP	Paper
BK	Book
\.


--
-- TOC entry 3207 (class 0 OID 35767)
-- Dependencies: 203
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.templates (template_id, version_number, template_type_code, date_effective_from, date_effective_to, template_details) FROM stdin;
0	5	PP	2005-11-12 07:09:48	2008-01-05 14:19:28	
1	9	PP	2010-09-24 01:15:11	1999-07-08 03:31:04	
4	4	BK	2002-03-02 14:39:49	2001-04-18 09:29:52	
6	2	PPT	1975-05-20 22:51:19	1992-05-02 20:06:11	
7	8	PPT	1993-10-07 02:33:04	1975-07-16 04:52:10	
8	3	BK	1983-07-16 21:16:16	1976-10-28 10:08:50	
9	2	BK	1997-04-17 08:29:44	1994-12-07 13:26:23	
10	1	PPT	2003-06-05 04:03:45	2007-06-06 06:18:53	
11	6	BK	1996-02-04 11:27:24	1995-09-19 22:27:48	
14	7	AD	1975-10-20 02:28:58	1979-11-04 08:58:39	
15	9	CV	1986-12-09 14:51:36	1993-03-24 14:30:23	
16	5	CV	2012-04-05 07:11:42	1980-05-07 12:15:47	
18	5	PP	1984-08-07 13:36:26	1998-05-12 12:51:29	
19	7	AD	1999-06-21 11:10:30	1974-09-14 06:34:39	
20	6	BK	1986-11-14 12:20:18	2008-08-08 18:36:43	
21	9	AD	2002-08-25 13:26:23	2015-09-06 01:08:44	
22	0	PP	2005-02-20 00:31:34	1989-11-24 19:06:06	
23	2	BK	1979-12-24 10:28:16	2000-10-22 11:57:12	
24	8	PP	2008-08-01 13:57:26	1973-01-12 14:13:34	
25	5	PP	1979-10-20 21:23:20	2006-02-06 23:52:04	
\.


--
-- TOC entry 3074 (class 2606 OID 35784)
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (document_id);


--
-- TOC entry 3076 (class 2606 OID 35797)
-- Name: paragraphs paragraphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paragraphs
    ADD CONSTRAINT paragraphs_pkey PRIMARY KEY (paragraph_id);


--
-- TOC entry 3070 (class 2606 OID 45555)
-- Name: reference_template_types ref_template_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reference_template_types
    ADD CONSTRAINT ref_template_types_pkey PRIMARY KEY (template_type_code);


--
-- TOC entry 3072 (class 2606 OID 35771)
-- Name: templates templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (template_id);


--
-- TOC entry 3078 (class 2606 OID 35785)
-- Name: documents documents_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_template_id_fkey FOREIGN KEY (template_id) REFERENCES public.templates(template_id);


--
-- TOC entry 3079 (class 2606 OID 35798)
-- Name: paragraphs paragraphs_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paragraphs
    ADD CONSTRAINT paragraphs_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.documents(document_id);


--
-- TOC entry 3077 (class 2606 OID 45556)
-- Name: templates templates_template_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_template_type_code_fkey FOREIGN KEY (template_type_code) REFERENCES public.reference_template_types(template_type_code);


-- Completed on 2021-08-03 19:17:07 CEST

--
-- PostgreSQL database dump complete
--

