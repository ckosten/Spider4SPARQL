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
-- TOC entry 202 (class 1259 OID 32573)
-- Name: breeds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.breeds (
    breed_code character varying(10) NOT NULL,
    breed_name character varying(80)
);


ALTER TABLE public.breeds OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 32578)
-- Name: charges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.charges (
    charge_id integer NOT NULL,
    charge_type character varying(50),
    charge_amount numeric
);


ALTER TABLE public.charges OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 32601)
-- Name: dogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dogs (
    dog_id integer NOT NULL,
    owner_id integer NOT NULL,
    abandoned_yn boolean,
    breed_code character varying(50) NOT NULL,
    size_code character varying(50) NOT NULL,
    name character varying(50),
    age integer,
    date_of_birth timestamp without time zone,
    gender character varying(1),
    weight real,
    date_arrived timestamp without time zone,
    date_adopted timestamp without time zone,
    date_departed timestamp without time zone
);


ALTER TABLE public.dogs OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 32596)
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    owner_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    street character varying(50),
    city character varying(50),
    state character varying(20),
    zip_code character varying(20),
    email_address character varying(50),
    home_phone character varying(20),
    cell_number character varying(20)
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 32621)
-- Name: professionals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professionals (
    professional_id integer NOT NULL,
    role_code character varying(250) NOT NULL,
    first_name character varying(250),
    street character varying(250),
    city character varying(250),
    state character varying(250),
    zip_code character varying(250),
    last_name character varying(250),
    email_address character varying(250),
    home_phone character varying(250),
    cell_number character varying(250)
);


ALTER TABLE public.professionals OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 32586)
-- Name: sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sizes (
    size_code character varying(10) NOT NULL,
    size_description character varying(80)
);


ALTER TABLE public.sizes OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 32591)
-- Name: treatment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatment_types (
    treatment_type_code character varying(10) NOT NULL,
    treatment_type_description character varying(80)
);


ALTER TABLE public.treatment_types OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 32629)
-- Name: treatments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatments (
    treatment_id integer NOT NULL,
    dog_id integer NOT NULL,
    professional_id integer NOT NULL,
    treatment_type_code character varying(10) NOT NULL,
    date_of_treatment timestamp without time zone,
    cost_of_treatment numeric
);


ALTER TABLE public.treatments OWNER TO postgres;

--
-- TOC entry 3234 (class 0 OID 32573)
-- Dependencies: 202
-- Data for Name: breeds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.breeds (breed_code, breed_name) FROM stdin;
ESK	Eskimo
HUS	Husky
BUL	Bulldog
\.


--
-- TOC entry 3235 (class 0 OID 32578)
-- Dependencies: 203
-- Data for Name: charges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.charges (charge_id, charge_type, charge_amount) FROM stdin;
1	Daily Accommodation	98.0000
2	Drugs	322.0000
3	Health Check	640.0000
\.


--
-- TOC entry 3239 (class 0 OID 32601)
-- Dependencies: 207
-- Data for Name: dogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dogs (dog_id, owner_id, abandoned_yn, breed_code, size_code, name, age, date_of_birth, gender, weight, date_arrived, date_adopted, date_departed) FROM stdin;
1	3	t	ESK	LGE	Kacey	6	2012-01-27 05:11:53	1	7.57	2017-09-08 20:10:13	2018-03-06 16:32:11	2018-03-25 06:58:44
2	11	f	BUL	LGE	Hipolito	9	2013-02-13 05:15:21	0	1.72	2017-12-22 05:02:02	2018-03-25 08:12:51	2018-03-25 02:11:32
4	14	f	ESK	LGE	Houston	5	2008-10-09 22:38:53	0	2.18	2017-04-20 00:58:55	2018-03-18 15:12:50	2018-03-24 19:12:22
5	7	f	BUL	MED	Jeffrey	4	2018-03-17 04:05:12	0	1.39	2017-10-25 00:55:34	2018-02-27 11:54:35	2018-03-25 04:50:22
6	5	f	HUS	MED	Merritt	9	2015-02-26 21:31:22	1	9.8	2017-04-15 09:25:31	2018-03-08 15:03:00	2018-03-25 13:07:04
7	3	f	BUL	MED	Narciso	2	2017-09-19 05:39:09	1	9.48	2017-05-06 08:03:52	2018-02-27 00:27:57	2018-03-25 06:29:10
8	14	f	ESK	SML	George	2	2013-02-20 14:50:56	0	8.95	2017-10-16 20:06:21	2018-03-23 16:02:04	2018-03-25 02:47:40
9	2	f	BUL	MED	Bessie	4	2012-05-31 08:01:36	1	3.52	2018-01-17 11:44:16	2018-02-25 23:45:30	2018-03-25 06:46:07
10	6	f	HUS	MED	Troy	9	2012-07-11 17:15:10	0	8.96	2017-12-29 06:08:26	2018-03-18 07:47:40	2018-03-25 04:42:14
11	13	f	BUL	LGE	Betty	3	2012-10-14 14:44:37	0	8.16	2017-07-25 15:19:07	2018-03-14 08:05:18	2018-03-25 15:05:16
12	12	f	HUS	MED	Holden	8	2009-04-12 06:02:48	0	6.92	2017-10-24 04:45:13	2018-03-05 06:05:23	2018-03-25 14:15:41
13	8	f	HUS	SML	Jesus	2	2012-05-03 21:42:25	0	5.16	2018-01-02 03:15:29	2018-03-21 10:41:18	2018-03-25 05:07:47
14	14	t	ESK	MED	Lyric	4	2010-11-11 07:11:53	0	4.36	2017-06-18 19:45:38	2018-03-13 12:47:15	2018-03-24 23:48:59
15	10	t	BUL	MED	Evangeline	1	2008-05-30 12:51:34	1	4.01	2017-12-29 23:24:13	2018-03-10 15:06:43	2018-03-24 19:36:59
3	1	f	BUL	MED	Mavis	8	2008-05-19 15:54:49	1	8.04	2017-06-25 10:14:05	2018-03-07 21:45:43	2018-03-25 10:25:46
\.


--
-- TOC entry 3238 (class 0 OID 32596)
-- Dependencies: 206
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (owner_id, first_name, last_name, street, city, state, zip_code, email_address, home_phone, cell_number) FROM stdin;
1	Nora	Haley	0647 Hintz Village Apt. 024	Lake Tia	Wisconsin	93165	lynn81@example.org	1-682-845-0116x63235	478.978.0729
2	Melisa	DuBuque	1204 Mae Highway Apt. 107	Port Reannamouth	Virginia	45244	ykris@example.com	(799)563-0260x454	(722)768-5439x484
3	Jaclyn	Stoltenberg	2635 Caitlyn Plains	Barrettburgh	Vermont	02647	hudson.favian@example.com	916.976.9480x13851	481-483-9083x37986
4	Tre	Hamill	692 Jaskolski Forges	Brakusfurt	Florida	87304	marks.gail@example.org	1-332-849-1908	739-136-7202
5	Johann	Fisher	68118 Daniel Row	Lake Valentin	NorthDakota	61019	zboncak.madonna@example.net	(544)034-1670	1-626-264-7659x1697
6	Kade	Rippin	51934 Treutel Harbor	Lake Carleyborough	Arizona	25609	margaretta.runte@example.net	318-052-6573	+70(4)9217952551
7	Emelie	Mertz	2417 Keara Stravenue Apt. 146	Lake Jennyferfort	NewYork	00589	angeline99@example.com	(058)997-7627	121.381.3316x6535
8	Rolando	Prohaska	57382 Yost Ridges	South Afton	Arkansas	86010	kturner@example.net	01802479758	(783)271-6744x4507
9	Adelle	Ondricka	9212 Rosenbaum Lights	East Hillardberg	Washington	92406	fschoen@example.net	066.264.7885	+00(2)4323592985
10	Lorenz	Nicolas	59509 Mellie Mountain	New Margaretteborough	SouthDakota	78297	ymaggio@example.com	085.557.0379x84348	559.874.3011x989
11	Gay	Feil	60352 Kayleigh Crossing Suite 700	Port Zackery	Indiana	35747	pearlie18@example.com	130-796-4589x05454	762.589.6117x1328
12	Orlando	Price	89011 Kertzmann Spring Suite 642	East Maribelbury	Mississippi	11990	christy49@example.org	363.948.1090	1-739-421-2225x38148
13	Cindy	Schmitt	6950 Katherine Forges Apt. 630	Beerton	NorthDakota	36871	wpfeffer@example.net	(094)747-5094x8134	633.455.3045x85484
14	Rachelle	Funk	15828 Spencer Extensions	West Leonard	Maryland	22731	edythe62@example.org	1-346-655-5842x768	(257)399-3116
15	Heather	Hauck	1858 Jan Park	South Daisyfurt	Pennsylvania	22693	ybergstrom@example.com	893-862-5295x61709	341.667.8085
\.


--
-- TOC entry 3240 (class 0 OID 32621)
-- Dependencies: 208
-- Data for Name: professionals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professionals (professional_id, role_code, first_name, street, city, state, zip_code, last_name, email_address, home_phone, cell_number) FROM stdin;
1	Employee	Taryn	6915 Oberbrunner Point Suite 491 Gleasonville, LA	West Heidi	Indiana	06646	Braun	deanna.schuster@example.com	+71(6)2898266914	(275)939-2435x80863
2	Employee	Jayson	88665 Terence Lodge Apt. 904 Corneliusfort, NC 194	North Odellfurt	Connecticut	43129	Ullrich	lucile.shanahan@example.org	+02(1)0259033559	889-940-2676
3	Employee	Olaf	68589 Bradly Manor New Audrey, IN 91497	Jaceton	Wisconsin	77129	Watsica	uboehm@example.org	325-155-0801x7005	(369)908-7311x065
4	Veterenarian	Vernice	72532 Hane Course Lake Berylland, ND 95283	Domenickton	Mississippi	02281	Tillman	lourdes.lowe@example.net	312.216.3352	00230569697
5	Veterenarian	Danny	188 VonRueden Tunnel Suite 630 North Macibury, NV	New Laurytown	Hawaii	84515	Considine	mekhi.little@example.org	1-609-566-2752x25197	011.193.9081x3186
6	Veterenarian	Ruben	17286 Waters Green East Bernadinefort, CA 89573	Baileymouth	NewMexico	52476	O'Reilly	jacynthe.mclaughlin@example.net	+43(5)1132733868	139-321-7313
7	Veterenarian	Velva	44234 Marvin Shoals Suite 659 North Frances, AL 23	McLaughlinfort	NorthCarolina	67980	Hayes	lambert62@example.org	022.529.0550x1319	499-434-0215x1628
8	Employee	Karley	36895 Eli Ferry Port Marcelle, FL 45712	Kirastad	Indiana	33020	Hyatt	goyette.roosevelt@example.net	891.475.2256	328.842.3792
9	Veterenarian	Monte	07073 Brenna Ways Suite 089 Lowehaven, KY 93275-96	South Rockyport	South Carolina	80775	Kshlerin	schneider.kathryne@example.org	320-508-6023	962-983-8109x3509
10	Employee	Domenica	7284 Torphy Flats Apt. 610 Diannaburgh, SC 78560	New Maryjane	California	54312	Jacobs	jerrod.bahringer@example.org	(230)338-3342x585	461-801-2600
11	Employee	Brady	09615 McKenzie Stravenue Apt. 128 West Elliottview	Raynorfort	Alabama	07412	Pouros	west.eula@example.net	(920)304-4499x59146	609-405-2990
12	Veterenarian	Winfield	92912 Langworth Valleys Apt. 743 Thompsonborough, 	Juddton	Utah	34041	Christiansen	marquardt.furman@example.org	246-951-0080x76716	1-181-670-9466
13	Veterenarian	Ericka	7783 Abraham Alley Port Madelynhaven, KY 59172-273	Borisside	Wyoming	17902	Murazik	delphine29@example.com	346.594.3739	880-659-7577x736
14	Employee	Sigurd	390 Bryce Drive North Dock, LA 65357-7228	East Ila	Connecticut	41215	Frami	cole.margarita@example.org	971.048.3763x9404	1-185-137-1945x409
15	Employee	Lesly	63949 Keeling Landing Apt. 502 Johnsview, SD 06780	North Adelberttown	Montana	98844	Walter	jeichmann@example.com	1-138-287-3775	1-258-285-4707x8020
\.


--
-- TOC entry 3236 (class 0 OID 32586)
-- Dependencies: 204
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sizes (size_code, size_description) FROM stdin;
SML	Small
MED	Medium
LGE	Large
\.


--
-- TOC entry 3237 (class 0 OID 32591)
-- Dependencies: 205
-- Data for Name: treatment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatment_types (treatment_type_code, treatment_type_description) FROM stdin;
EXAM	Physical examination
VAC	Vaccination
WALK	Take for a Walk
\.


--
-- TOC entry 3241 (class 0 OID 32629)
-- Dependencies: 209
-- Data for Name: treatments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatments (treatment_id, dog_id, professional_id, treatment_type_code, date_of_treatment, cost_of_treatment) FROM stdin;
1	14	9	WALK	2018-03-19 04:39:54	567.0000
2	4	10	VAC	2018-03-15 20:25:34	147.0000
3	14	4	EXAM	2018-03-08 05:26:23	429.0000
4	2	8	VAC	2018-03-01 04:14:46	266.0000
5	12	14	VAC	2018-03-23 13:52:10	668.0000
6	10	4	EXAM	2018-03-11 04:23:15	313.0000
7	15	14	EXAM	2018-03-10 11:45:58	852.0000
8	2	6	EXAM	2018-03-24 22:25:58	407.0000
9	14	10	WALK	2018-03-14 19:10:40	139.0000
10	10	7	WALK	2018-02-28 17:09:43	681.0000
11	15	5	VAC	2018-03-13 12:22:58	514.0000
12	13	9	EXAM	2018-03-16 10:27:36	428.0000
13	7	8	VAC	2018-02-26 09:08:53	945.0000
14	10	9	WALK	2018-03-04 20:33:43	349.0000
15	1	6	WALK	2018-03-15 19:10:02	656.0000
\.


--
-- TOC entry 3087 (class 2606 OID 32577)
-- Name: breeds breeds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.breeds
    ADD CONSTRAINT breeds_pkey PRIMARY KEY (breed_code);


--
-- TOC entry 3089 (class 2606 OID 32585)
-- Name: charges charges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charges
    ADD CONSTRAINT charges_pkey PRIMARY KEY (charge_id);


--
-- TOC entry 3097 (class 2606 OID 32605)
-- Name: dogs dogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dogs
    ADD CONSTRAINT dogs_pkey PRIMARY KEY (dog_id);


--
-- TOC entry 3095 (class 2606 OID 32600)
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (owner_id);


--
-- TOC entry 3099 (class 2606 OID 32628)
-- Name: professionals professionals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professionals
    ADD CONSTRAINT professionals_pkey PRIMARY KEY (professional_id);


--
-- TOC entry 3091 (class 2606 OID 32590)
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (size_code);


--
-- TOC entry 3093 (class 2606 OID 32595)
-- Name: treatment_types treatment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_types
    ADD CONSTRAINT treatment_types_pkey PRIMARY KEY (treatment_type_code);


--
-- TOC entry 3101 (class 2606 OID 32636)
-- Name: treatments treatments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatments
    ADD CONSTRAINT treatments_pkey PRIMARY KEY (treatment_id);


--
-- TOC entry 3102 (class 2606 OID 32606)
-- Name: dogs dogs_breed_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dogs
    ADD CONSTRAINT dogs_breed_code_fkey FOREIGN KEY (breed_code) REFERENCES public.breeds(breed_code);


--
-- TOC entry 3104 (class 2606 OID 32616)
-- Name: dogs dogs_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dogs
    ADD CONSTRAINT dogs_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(owner_id);


--
-- TOC entry 3103 (class 2606 OID 32611)
-- Name: dogs dogs_size_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dogs
    ADD CONSTRAINT dogs_size_code_fkey FOREIGN KEY (size_code) REFERENCES public.sizes(size_code);


--
-- TOC entry 3107 (class 2606 OID 32647)
-- Name: treatments treatments_dog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatments
    ADD CONSTRAINT treatments_dog_id_fkey FOREIGN KEY (dog_id) REFERENCES public.dogs(dog_id);


--
-- TOC entry 3106 (class 2606 OID 32642)
-- Name: treatments treatments_professional_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatments
    ADD CONSTRAINT treatments_professional_id_fkey FOREIGN KEY (professional_id) REFERENCES public.professionals(professional_id);


--
-- TOC entry 3105 (class 2606 OID 32637)
-- Name: treatments treatments_treatment_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatments
    ADD CONSTRAINT treatments_treatment_type_code_fkey FOREIGN KEY (treatment_type_code) REFERENCES public.treatment_types(treatment_type_code);


-- Completed on 2021-08-03 19:17:14 CEST

--
-- PostgreSQL database dump complete
--

