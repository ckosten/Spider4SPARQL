--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:15 CEST

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
-- TOC entry 204 (class 1259 OID 36136)
-- Name: other_available_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.other_available_features (
    feature_id integer NOT NULL,
    feature_type_code character varying(20) NOT NULL,
    feature_name character varying(80),
    feature_description character varying(80)
);


ALTER TABLE public.other_available_features OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 36167)
-- Name: other_property_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.other_property_features (
    property_id integer NOT NULL,
    feature_id integer NOT NULL,
    property_feature_description character varying(80)
);


ALTER TABLE public.other_property_features OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 36154)
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properties (
    property_id integer NOT NULL,
    property_type_code character varying(20) NOT NULL,
    date_on_market timestamp without time zone,
    date_sold timestamp without time zone,
    property_name character varying(80),
    property_address character varying(255),
    room_count integer,
    vendor_requested_price numeric(19,4),
    buyer_offered_price numeric(19,4),
    agreed_selling_price numeric(19,4),
    apt_feature_1 character varying(255),
    apt_feature_2 character varying(255),
    apt_feature_3 character varying(255),
    fld_feature_1 character varying(255),
    fld_feature_2 character varying(255),
    fld_feature_3 character varying(255),
    hse_feature_1 character varying(255),
    hse_feature_2 character varying(255),
    hse_feature_3 character varying(255),
    oth_feature_1 character varying(255),
    oth_feature_2 character varying(255),
    oth_feature_3 character varying(255),
    shp_feature_1 character varying(255),
    shp_feature_2 character varying(255),
    shp_feature_3 character varying(255),
    other_property_details character varying(255)
);


ALTER TABLE public.properties OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 36126)
-- Name: reference_feature_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reference_feature_types (
    feature_type_code character varying(20) NOT NULL,
    feature_type_name character varying(80)
);


ALTER TABLE public.reference_feature_types OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 36131)
-- Name: reference_property_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reference_property_types (
    property_type_code character varying(20) NOT NULL,
    property_type_description character varying(80)
);


ALTER TABLE public.reference_property_types OWNER TO postgres;

--
-- TOC entry 3212 (class 0 OID 36136)
-- Dependencies: 204
-- Data for Name: other_available_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.other_available_features (feature_id, feature_type_code, feature_name, feature_description) FROM stdin;
2	Amenity	AirCon	Air Conditioning.
3	Amenity	Pool	Swimming Pool.
4	Security	BurglarAlarm	Burglar Alarm
\.


--
-- TOC entry 3214 (class 0 OID 36167)
-- Dependencies: 206
-- Data for Name: other_property_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.other_property_features (property_id, feature_id, property_feature_description) FROM stdin;
15	3	dolorem
12	4	earum
6	2	illo
7	2	hic
6	3	et
14	4	quo
4	3	odio
1	2	ad
11	4	vitae
9	3	quo
6	3	corrupti
6	3	doloribus
13	2	autem
3	2	cumque
14	4	modi
\.


--
-- TOC entry 3213 (class 0 OID 36154)
-- Dependencies: 205
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properties (property_id, property_type_code, date_on_market, date_sold, property_name, property_address, room_count, vendor_requested_price, buyer_offered_price, agreed_selling_price, apt_feature_1, apt_feature_2, apt_feature_3, fld_feature_1, fld_feature_2, fld_feature_3, hse_feature_1, hse_feature_2, hse_feature_3, oth_feature_1, oth_feature_2, oth_feature_3, shp_feature_1, shp_feature_2, shp_feature_3, other_property_details) FROM stdin;
1	House	1991-06-21 23:52:10	1979-05-13 16:58:06	park	4745 Emerson Stravenue Suite 829\nSouth Garret, IN 16772-5682	7	372652.2909	1.6800	4201.8000	aut	suscipit	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	House	1990-05-25 23:01:51	1990-11-14 19:16:38	the cole	098 Tremaine Highway Suite 569\nSouth Wilford, NJ 46587-3537	1	661536468.4429	8.7122	21769471.8328	est	est	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	Other	1986-11-26 04:12:18	1981-06-26 21:28:28	prism	062 Micaela Court Apt. 707\nMargretville, WV 51628-3617	8	1337.0000	11375259.5020	5.0000	ut	et	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	Field	2017-09-14 15:49:23	2003-02-27 18:17:11	riverside	49578 Ayden Mountains\nNew Russellhaven, UT 46626	6	192374065.8000	15.1700	4514.8070	nesciunt	adipisci	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	Apartment	2016-05-06 16:53:39	2012-08-19 07:36:57	parc east	2765 Schulist Stream\nLindmouth, UT 03391-3817	5	983.8596	10.1067	1.0012	quo	sequi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	Shop	1994-02-14 02:27:13	1995-01-31 11:18:42	high line	6837 Darien Views Apt. 475\nSouth Maraview, KS 77770	9	2573.0000	0.0000	476919.3000	sed	culpa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	Shop	1996-09-16 22:04:27	1998-09-15 05:26:22	avalon	092 Paucek Highway Apt. 772\nEast Erika, IA 61358	8	150045.7568	296733.0000	2794972.2495	quos	est	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	Apartment	1976-06-10 20:25:38	2001-11-09 04:37:33	vogue	24365 Ulices Run\nHomenicktown, MD 88485-6198	9	13.4715	0.0000	0.0000	fuga	odio	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	Apartment	1978-05-15 10:53:37	1971-04-14 03:23:49	longacre	107 Roob Courts\nErdmanburgh, IA 42926-0873	5	2219.6778	3520911.5258	3344706.5755	enim	sit	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	Apartment	2003-12-25 16:13:19	1997-01-07 19:52:45	renoir	084 Lakin Vista Apt. 394\nFishertown, MA 16876	9	77172926.3000	1.5509	244353758.1824	consequatur	vero	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	Other	1981-08-23 05:40:38	1997-11-07 20:22:05	murray hill	2088 Bashirian Fork Suite 337\nFaustinoport, MT 16771-9320	2	6713620.9000	13991131.4340	170766.4720	et	est	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	Apartment	2016-05-24 09:57:45	1980-07-08 16:13:17	ten tower	743 Ephraim Greens\nAnniemouth, HI 47084-3853	5	305.0000	2.0000	456840888.1600	qui	autem	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	Other	2000-08-07 06:59:14	1973-02-24 02:56:06	chelsea	60845 Else Highway Apt. 826\nSouth Dougfort, CO 43200-4258	2	2198735.0950	0.0000	44132.4621	fuga	aut	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	Other	1986-12-31 10:05:32	1987-12-07 07:41:27	wall street	1474 Dibbert Fields Suite 055\nSouth Renee, IN 58286-3097	7	78.7208	2449185.2000	0.0000	et	eos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	Apartment	1993-08-04 10:49:04	1984-02-01 19:54:54	parc coliseum	986 Hagenes Drives\nDraketon, UT 83411-3393	3	331.0000	27537286.0000	2574.0000	aut	iusto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3210 (class 0 OID 36126)
-- Dependencies: 202
-- Data for Name: reference_feature_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reference_feature_types (feature_type_code, feature_type_name) FROM stdin;
Amenity	Amenity, eg Pool.
Security	Securiyt, eg Burglar Alarm.
\.


--
-- TOC entry 3211 (class 0 OID 36131)
-- Dependencies: 203
-- Data for Name: reference_property_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reference_property_types (property_type_code, property_type_description) FROM stdin;
House	House, Bungalow, etc.
Apartment	Apartment, Flat, Condo, etc.
Field	Field, Meadow.
Other	Other, to be determined.
Shop	Shop, Retail Outlet.
\.


--
-- TOC entry 3077 (class 2606 OID 36140)
-- Name: other_available_features other_available_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_available_features
    ADD CONSTRAINT other_available_features_pkey PRIMARY KEY (feature_id);


--
-- TOC entry 3079 (class 2606 OID 36161)
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (property_id);


--
-- TOC entry 3073 (class 2606 OID 36130)
-- Name: reference_feature_types ref_feature_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reference_feature_types
    ADD CONSTRAINT ref_feature_types_pkey PRIMARY KEY (feature_type_code);


--
-- TOC entry 3075 (class 2606 OID 36135)
-- Name: reference_property_types ref_property_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reference_property_types
    ADD CONSTRAINT ref_property_types_pkey PRIMARY KEY (property_type_code);


--
-- TOC entry 3080 (class 2606 OID 36141)
-- Name: other_available_features other_available_features_feature_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_available_features
    ADD CONSTRAINT other_available_features_feature_type_code_fkey FOREIGN KEY (feature_type_code) REFERENCES public.reference_feature_types(feature_type_code);


--
-- TOC entry 3082 (class 2606 OID 36170)
-- Name: other_property_features other_property_features_feature_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_property_features
    ADD CONSTRAINT other_property_features_feature_id_fkey FOREIGN KEY (feature_id) REFERENCES public.other_available_features(feature_id);


--
-- TOC entry 3083 (class 2606 OID 36175)
-- Name: other_property_features other_property_features_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_property_features
    ADD CONSTRAINT other_property_features_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(property_id);


--
-- TOC entry 3081 (class 2606 OID 36162)
-- Name: properties properties_property_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_property_type_code_fkey FOREIGN KEY (property_type_code) REFERENCES public.reference_property_types(property_type_code);


-- Completed on 2021-08-03 19:17:15 CEST

--
-- PostgreSQL database dump complete
--

