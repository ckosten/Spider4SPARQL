--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:11 CEST

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
-- TOC entry 204 (class 1259 OID 36487)
-- Name: cartoon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cartoon (
    id real NOT NULL,
    title character varying,
    directed_by character varying,
    written_by character varying,
    original_air_date character varying,
    production_code real,
    channel real
);


ALTER TABLE public.cartoon OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 36442)
-- Name: tv_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tv_channel (
    id real NOT NULL,
    series_name character varying,
    country character varying,
    language character varying,
    content character varying,
    pixel_aspect_ratio_par character varying,
    high_definition_tv character varying,
    pay_per_view_ppv character varying,
    package_option character varying
);


ALTER TABLE public.tv_channel OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 36474)
-- Name: tv_series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tv_series (
    id real NOT NULL,
    episode character varying,
    air_date character varying,
    rating character varying,
    share real,
    rating_share character varying,
    viewers_m character varying,
    weekly_rank real,
    channel real
);


ALTER TABLE public.tv_series OWNER TO postgres;

--
-- TOC entry 3202 (class 0 OID 36487)
-- Dependencies: 204
-- Data for Name: cartoon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cartoon (id, title, directed_by, written_by, original_air_date, production_code, channel) FROM stdin;
1	The Rise of the Blue Beetle!	Ben Jones	Michael Jelenic	November14,2008	101	700
2	Terror on Dinosaur Island!	Brandon Vietti	Steven Melching	November21,2008	102	701
3	Evil Under the Sea!	Michael Chang	Joseph Kuhr	December5,2008	103	703
4	Day of the Dark Knight!	Ben Jones	J. M. DeMatteis	January2,2009	104	704
5	Invasion of the Secret Santas!	Brandon Vietti	Adam Beechen	December12,2008	105	705
6	Enter the Outsiders!	Michael Chang	Todd Casey	January9,2009	106	706
7	Dawn of the Dead Man!	Ben Jones	Steven Melching	January16,2009	107	707
8	Fall of the Blue Beetle!	Brandon Vietti	James Krieg	January23,2009	108	708
9	Journey to the Center of the Bat!	Michael Chang	Matt Wayne	January30,2009	109	707
10	The Eyes of Despero!	Ben Jones	J. M. DeMatteis	February6,2009	110	728
11	Return of the Fearsome Fangs!	Brandon Vietti	Todd Casey	February20,2009	111	700
12	Deep Cover for Batman!	Michael Chang	Joseph Kuhr	February27,2009	112	707
\.


--
-- TOC entry 3200 (class 0 OID 36442)
-- Dependencies: 202
-- Data for Name: tv_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tv_channel (id, series_name, country, language, content, pixel_aspect_ratio_par, high_definition_tv, pay_per_view_ppv, package_option) FROM stdin;
700	Sky Radio	Italy	Italian	music	4:3	no	no	Sky Famiglia
701	Sky Music	Italy	Italian	music	4:3	no	no	Sky Famiglia
703	Music Box Italia	Italy	Italian	music	4:3 / 16:9	no	no	Sky Famiglia
704	MTV Hits	Italy	Italian	music	16:9	no	no	Sky Famiglia
705	MTV Classic	Italy	Italian	music	4:3	no	no	Sky Famiglia
706	MTV Rocks	United Kingdom	English	music	16:9	no	no	Sky Famiglia
707	MTV Dance	United Kingdom	English	music	16:9	no	no	Sky Famiglia
708	MTV Music	Italy	Italian	music	16:9	no	no	no ( FTV )
709	MTV Live HD	Poland	English	music	16:9	yes	no	Sky Famiglia + Sky HD
713	Radio Capital TiVù	Italy	Italian	music	4:3	no	no	no ( FTV )
714	myDeejay	Italy	Italian	music	16:9	no	no	Sky Famiglia
715	Match Music	Italy	Italian	music	4:3 / 16:9	no	no	Sky Famiglia
717	Rock TV	Italy	Italian	music	4:3 / 16:9	no	no	Sky Famiglia
719	Hip Hop TV	Italy	Italian	music	4:3	no	no	Sky Famiglia
728	Classica	Italy	Italian	music	4:3	no	no	Option
\.


--
-- TOC entry 3201 (class 0 OID 36474)
-- Dependencies: 203
-- Data for Name: tv_series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tv_series (id, episode, air_date, rating, share, rating_share, viewers_m, weekly_rank, channel) FROM stdin;
1	A Love of a Lifetime	September 24, 2007	5.8	9	3.5/9	9.16	43	700
2	Friendly Skies	October 1, 2007	5.3	9	3.2/8	8.23	50	701
3	Game Three	October 8, 2007	4.4	7	2.9/7	6.94	61	707
4	The Year of the Rabbit	October 15, 2007	4.3	7	2.7/7	6.75	67	713
5	The Legend of Dylan McCleen	October 22, 2007	3.8	6	2.4/6	6.06	72	714
6	Keepers	October 29, 2007	3.7	6	2.2/6	5.75	71	700
7	Double Down	November 5, 2007	3.4	6	2.1/5	5.13	80	708
8	Winterland	November 12, 2007	4.0	7	2.4/6	6.09	70	707
9	Emily	November 19, 2007	3.7	6	2.2/6	5.61	66	717
10	Blowback	November 26, 2007	3.7	6	2.4/6	6.05	68	719
11	Home By Another Way	December 10, 2007	3.5	6	1.7/5	5.28	62	728
12	The Hanged Man	December 17, 2007	3.0	5	1.5/4	4.24	65	714
\.


--
-- TOC entry 3071 (class 2606 OID 36494)
-- Name: cartoon cartoon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartoon
    ADD CONSTRAINT cartoon_pkey PRIMARY KEY (id);


--
-- TOC entry 3067 (class 2606 OID 36449)
-- Name: tv_channel tv_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_channel
    ADD CONSTRAINT tv_channel_pkey PRIMARY KEY (id);


--
-- TOC entry 3069 (class 2606 OID 36481)
-- Name: tv_series tv_series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_series
    ADD CONSTRAINT tv_series_pkey PRIMARY KEY (id);


--
-- TOC entry 3073 (class 2606 OID 36495)
-- Name: cartoon cartoon_channel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartoon
    ADD CONSTRAINT cartoon_channel_fkey FOREIGN KEY (channel) REFERENCES public.tv_channel(id);


--
-- TOC entry 3072 (class 2606 OID 36482)
-- Name: tv_series tv_series_channel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_series
    ADD CONSTRAINT tv_series_channel_fkey FOREIGN KEY (channel) REFERENCES public.tv_channel(id);


-- Completed on 2021-08-03 19:17:11 CEST

--
-- PostgreSQL database dump complete
--

