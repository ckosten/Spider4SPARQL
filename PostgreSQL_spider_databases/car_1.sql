--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.1

-- Started on 2021-08-03 19:17:05 CEST

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
-- TOC entry 204 (class 1259 OID 34464)
-- Name: car_makers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_makers (
    id integer NOT NULL,
    maker text,
    fullname text,
    country integer
);


ALTER TABLE public.car_makers OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 34492)
-- Name: car_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_names (
    makeid integer NOT NULL,
    model text,
    make text
);


ALTER TABLE public.car_names OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 34505)
-- Name: cars_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars_data (
    id integer NOT NULL,
    mpg real,
    cylinders integer,
    edispl real,
    horsepower integer,
    weight integer,
    accelerate real,
    year integer
);


ALTER TABLE public.cars_data OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 34443)
-- Name: continents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.continents (
    contid integer NOT NULL,
    continent text
);


ALTER TABLE public.continents OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 34451)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    countryid integer NOT NULL,
    countryname text,
    continent integer
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 34477)
-- Name: model_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_list (
    modelid integer NOT NULL,
    maker integer,
    model text
);


ALTER TABLE public.model_list OWNER TO postgres;

--
-- TOC entry 3227 (class 0 OID 34464)
-- Dependencies: 204
-- Data for Name: car_makers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_makers (id, maker, fullname, country) FROM stdin;
1	amc	American Motor Company	1
2	volkswagen	Volkswagen	2
3	bmw	BMW	2
4	gm	General Motors	1
5	ford	Ford Motor Company	1
6	chrysler	Chrysler	1
7	citroen	Citroen	3
8	nissan	Nissan Motors	4
9	fiat	Fiat	5
11	honda	Honda	4
12	mazda	Mazda	4
13	daimler benz	Daimler Benz	2
14	opel	Opel	2
15	peugeaut	Peugeaut	3
16	renault	Renault	3
17	saab	Saab	6
18	subaru	Subaru	4
19	toyota	Toyota	4
20	triumph	Triumph	7
21	volvo	Volvo	6
22	kia	Kia Motors	8
23	hyundai	Hyundai	8
10	NA	NA	0
\.


--
-- TOC entry 3229 (class 0 OID 34492)
-- Dependencies: 206
-- Data for Name: car_names; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_names (makeid, model, make) FROM stdin;
1	chevrolet	chevrolet chevelle malibu
2	buick	buick skylark 320
3	plymouth	plymouth satellite
4	amc	amc rebel sst
5	ford	ford torino
6	ford	ford galaxie 500
7	chevrolet	chevrolet impala
8	plymouth	plymouth fury iii
9	pontiac	pontiac catalina
10	amc	amc ambassador dpl
11	citroen	citroen ds-21 pallas
12	chevrolet	chevrolet chevelle concours (sw)
13	ford	ford torino (sw)
14	plymouth	plymouth satellite (sw)
15	amc	amc rebel sst (sw)
16	dodge	dodge challenger se
17	plymouth	plymouth cuda 340
18	ford	ford mustang boss 302
19	chevrolet	chevrolet monte carlo
20	buick	buick estate wagon (sw)
21	toyota	toyota corona mark ii
22	plymouth	plymouth duster
23	amc	amc hornet
24	ford	ford maverick
25	datsun	datsun pl510
26	volkswagen	volkswagen 1131 deluxe sedan
27	peugeot	peugeot 504
28	audi	audi 100 ls
29	saab	saab 99e
30	bmw	bmw 2002
31	amc	amc gremlin
32	ford	ford f250
33	chevrolet	chevy c20
34	dodge	dodge d200
35	hi	hi 1200d
36	datsun	datsun pl510
37	chevrolet	chevrolet vega 2300
38	toyota	toyota corona
39	ford	ford pinto
40	volkswagen	volkswagen super beetle 117
41	amc	amc gremlin
42	plymouth	plymouth satellite custom
43	chevrolet	chevrolet chevelle malibu
44	ford	ford torino 500
45	amc	amc matador
46	chevrolet	chevrolet impala
47	pontiac	pontiac catalina brougham
48	ford	ford galaxie 500
49	plymouth	plymouth fury iii
50	dodge	dodge monaco (sw)
51	ford	ford country squire (sw)
52	pontiac	pontiac safari (sw)
53	amc	amc hornet sportabout (sw)
54	chevrolet	chevrolet vega (sw)
55	pontiac	pontiac firebird
56	ford	ford mustang
57	mercury	mercury capri 2000
58	opel	opel 1900
59	peugeot	peugeot 304
60	fiat	fiat 124b
61	toyota	toyota corolla 1200
62	datsun	datsun 1200
63	volkswagen	volkswagen model 111
64	plymouth	plymouth cricket
65	toyota	toyota corona hardtop
66	dodge	dodge colt hardtop
67	volkswagen	volkswagen type 3
68	chevrolet	chevrolet vega
69	ford	ford pinto runabout
70	chevrolet	chevrolet impala
71	pontiac	pontiac catalina
72	plymouth	plymouth fury iii
73	ford	ford galaxie 500
74	amc	amc ambassador sst
75	mercury	mercury marquis
76	buick	buick lesabre custom
77	oldsmobile	oldsmobile delta 88 royale
78	chrysler	chrysler newport royal
79	mazda	mazda rx2 coupe
80	amc	amc matador (sw)
81	chevrolet	chevrolet chevelle concours (sw)
82	ford	ford gran torino (sw)
83	plymouth	plymouth satellite custom (sw)
84	volvo	volvo 145e (sw)
85	volkswagen	volkswagen 411 (sw)
86	peugeot	peugeot 504 (sw)
87	renault	renault 12 (sw)
88	ford	ford pinto (sw)
89	datsun	datsun 510 (sw)
90	toyota	toyota corona mark ii (sw)
91	dodge	dodge colt (sw)
92	toyota	toyota corolla 1600 (sw)
93	buick	buick century 350
94	amc	amc matador
95	chevrolet	chevrolet malibu
96	ford	ford gran torino
97	dodge	dodge coronet custom
98	mercury	mercury marquis brougham
99	chevrolet	chevrolet caprice classic
100	ford	ford ltd
101	plymouth	plymouth fury gran sedan
102	chrysler	chrysler new yorker brougham
103	buick	buick electra 225 custom
104	amc	amc ambassador brougham
105	plymouth	plymouth valiant
106	chevrolet	chevrolet nova custom
107	amc	amc hornet
108	ford	ford maverick
109	plymouth	plymouth duster
110	volkswagen	volkswagen super beetle
111	chevrolet	chevrolet impala
112	ford	ford country
113	plymouth	plymouth custom suburb
114	oldsmobile	oldsmobile vista cruiser
115	amc	amc gremlin
116	toyota	toyota carina
117	chevrolet	chevrolet vega
118	datsun	datsun 610
119	mazda	mazda rx3
120	ford	ford pinto
121	mercury	mercury capri v6
122	fiat	fiat 124 sport coupe
123	chevrolet	chevrolet monte carlo s
124	pontiac	pontiac grand prix
125	fiat	fiat 128
126	opel	opel manta
127	audi	audi 100ls
128	volvo	volvo 144ea
129	dodge	dodge dart custom
130	saab	saab 99le
131	toyota	toyota mark ii
132	oldsmobile	oldsmobile omega
133	plymouth	plymouth duster
134	ford	ford maverick
135	amc	amc hornet
136	chevrolet	chevrolet nova
137	datsun	datsun b210
138	ford	ford pinto
139	toyota	toyota corolla 1200
140	chevrolet	chevrolet vega
141	chevrolet	chevrolet chevelle malibu classic
142	amc	amc matador
143	plymouth	plymouth satellite sebring
144	ford	ford gran torino
145	buick	buick century luxus (sw)
146	dodge	dodge coronet custom (sw)
147	ford	ford gran torino (sw)
148	amc	amc matador (sw)
149	audi	audi fox
150	volkswagen	volkswagen dasher
151	opel	opel manta
152	toyota	toyota corona
153	datsun	datsun 710
154	dodge	dodge colt
155	fiat	fiat 128
156	fiat	fiat 124 tc
157	honda	honda civic
158	subaru	subaru
159	fiat	fiat x1.9
160	plymouth	plymouth valiant custom
161	chevrolet	chevrolet nova
162	mercury	mercury monarch
163	ford	ford maverick
164	pontiac	pontiac catalina
165	chevrolet	chevrolet bel air
166	plymouth	plymouth grand fury
167	ford	ford ltd
168	buick	buick century
169	chevrolet	chevrolet chevelle malibu
170	amc	amc matador
171	plymouth	plymouth fury
172	buick	buick skyhawk
173	chevrolet	chevrolet monza 2+2
174	ford	ford mustang ii
175	toyota	toyota corolla
176	ford	ford pinto
177	amc	amc gremlin
178	pontiac	pontiac astro
179	toyota	toyota corona
180	volkswagen	volkswagen dasher
181	datsun	datsun 710
182	ford	ford pinto
183	volkswagen	volkswagen rabbit
184	amc	amc pacer
185	audi	audi 100ls
186	peugeot	peugeot 504
187	volvo	volvo 244dl
188	saab	saab 99le
189	honda	honda civic cvcc
190	fiat	fiat 131
191	opel	opel 1900
192	capri	capri ii
193	dodge	dodge colt
194	renault	renault 12tl
195	chevrolet	chevrolet chevelle malibu classic
196	dodge	dodge coronet brougham
197	amc	amc matador
198	ford	ford gran torino
199	plymouth	plymouth valiant
200	chevrolet	chevrolet nova
201	ford	ford maverick
202	amc	amc hornet
203	chevrolet	chevrolet chevette
204	chevrolet	chevrolet woody
205	volkswagen	vw rabbit
206	honda	honda civic
207	dodge	dodge aspen se
208	ford	ford granada ghia
209	pontiac	pontiac ventura sj
210	amc	amc pacer d/l
211	volkswagen	volkswagen rabbit
212	datsun	datsun b-210
213	toyota	toyota corolla
214	ford	ford pinto
215	volvo	volvo 245
216	plymouth	plymouth volare premier v8
217	peugeot	peugeot 504
218	toyota	toyota mark ii
219	mercedes-benz	mercedes-benz 280s
220	cadillac	cadillac seville
221	chevrolet	chevy c10
222	ford	ford f108
223	dodge	dodge d100
224	honda	honda accord cvcc
225	buick	buick opel isuzu deluxe
226	renault	renault 5 gtl
227	plymouth	plymouth arrow gs
228	datsun	datsun f-10 hatchback
229	chevrolet	chevrolet caprice classic
230	oldsmobile	oldsmobile cutlass supreme
231	dodge	dodge monaco brougham
232	mercury	mercury cougar brougham
233	chevrolet	chevrolet concours
234	buick	buick skylark
235	plymouth	plymouth volare custom
236	ford	ford granada
237	pontiac	pontiac grand prix lj
238	chevrolet	chevrolet monte carlo landau
239	chrysler	chrysler cordoba
240	ford	ford thunderbird
241	volkswagen	volkswagen rabbit custom
242	pontiac	pontiac sunbird coupe
243	toyota	toyota corolla liftback
244	ford	ford mustang ii 2+2
245	chevrolet	chevrolet chevette
246	dodge	dodge colt m/m
247	subaru	subaru dl
248	volkswagen	volkswagen dasher
249	datsun	datsun 810
250	bmw	bmw 320i
251	mazda	mazda rx-4
252	volkswagen	volkswagen rabbit custom diesel
253	ford	ford fiesta
254	mazda	mazda glc deluxe
255	datsun	datsun b210 gx
256	honda	honda civic cvcc
257	oldsmobile	oldsmobile cutlass salon brougham
258	dodge	dodge diplomat
259	mercury	mercury monarch ghia
260	pontiac	pontiac phoenix lj
261	chevrolet	chevrolet malibu
262	ford	ford fairmont (auto)
263	ford	ford fairmont (man)
264	plymouth	plymouth volare
265	amc	amc concord
266	buick	buick century special
267	mercury	mercury zephyr
268	dodge	dodge aspen
269	amc	amc concord d/l
270	chevrolet	chevrolet monte carlo landau
271	buick	buick regal sport coupe (turbo)
272	ford	ford futura
273	dodge	dodge magnum xe
274	chevrolet	chevrolet chevette
275	toyota	toyota corona
276	datsun	datsun 510
277	dodge	dodge omni
278	toyota	toyota celica gt liftback
279	plymouth	plymouth sapporo
280	oldsmobile	oldsmobile starfire sx
281	datsun	datsun 200-sx
282	audi	audi 5000
283	volvo	volvo 264gl
284	saab	saab 99gle
285	peugeot	peugeot 604sl
286	volkswagen	volkswagen scirocco
287	honda	honda accord lx
288	pontiac	pontiac lemans v6
289	mercury	mercury zephyr 6
290	ford	ford fairmont 4
291	amc	amc concord dl 6
292	dodge	dodge aspen 6
293	chevrolet	chevrolet caprice classic
294	ford	ford ltd landau
295	mercury	mercury grand marquis
296	dodge	dodge st. regis
297	buick	buick estate wagon (sw)
298	ford	ford country squire (sw)
299	chevrolet	chevrolet malibu classic (sw)
300	chrysler	chrysler lebaron town @ country (sw)
301	volkswagen	vw rabbit custom
302	mazda	 mazda glc deluxe
303	dodge	dodge colt hatchback custom
304	amc	amc spirit dl
305	mercedes	mercedes benz 300d
306	cadillac	cadillac eldorado
307	peugeot	peugeot 504
308	oldsmobile	oldsmobile cutlass salon brougham
309	plymouth	plymouth horizon
310	plymouth	plymouth horizon tc3
311	datsun	datsun 210
312	fiat	fiat strada custom
313	buick	buick skylark limited
314	chevrolet	chevrolet citation
315	oldsmobile	oldsmobile omega brougham
316	pontiac	pontiac phoenix
317	volkswagen	vw rabbit
318	toyota	toyota corolla tercel
319	chevrolet	chevrolet chevette
320	datsun	datsun 310
321	chevrolet	chevrolet citation
322	ford	ford fairmont
323	amc	amc concord
324	dodge	dodge aspen
325	audi	audi 4000
326	toyota	toyota corona liftback
327	mazda	mazda 626
328	datsun	datsun 510 hatchback
329	toyota	toyota corolla
330	mazda	mazda glc
331	dodge	dodge colt
332	datsun	datsun 210
333	volkswagen	vw rabbit c (diesel)
334	volkswagen	vw dasher (diesel)
335	audi	audi 5000s (diesel)
336	mercedes-benz	mercedes-benz 240d
337	honda	honda civic 1500 gl
338	renault	renault lecar deluxe
339	subaru	subaru dl
340	volkswagen	volkswagen rabbit
341	datsun	datsun 280-zx
342	mazda	mazda rx-7 gs
343	triumph	triumph tr7 coupe
344	ford	ford mustang cobra
345	honda	honda accord
346	plymouth	plymouth reliant
347	buick	buick skylark
348	dodge	dodge aries wagon (sw)
349	chevrolet	chevrolet citation
350	plymouth	plymouth reliant
351	toyota	toyota starlet
352	plymouth	plymouth champ
353	honda	honda civic 1300
354	subaru	subaru
355	datsun	datsun 210 mpg
356	toyota	toyota tercel
357	mazda	mazda glc 4
358	plymouth	plymouth horizon 4
359	ford	ford escort 4w
360	ford	ford escort 2h
361	volkswagen	volkswagen jetta
362	renault	renault 18i
363	honda	honda prelude
364	toyota	toyota corolla
365	datsun	datsun 200sx
366	mazda	mazda 626
367	peugeot	peugeot 505s turbo diesel
368	saab	saab 900s
369	volvo	volvo diesel
370	toyota	toyota cressida
371	datsun	datsun 810 maxima
372	buick	buick century
373	oldsmobile	oldsmobile cutlass ls
374	ford	ford granada gl
375	chrysler	chrysler lebaron salon
376	chevrolet	chevrolet cavalier
377	chevrolet	chevrolet cavalier wagon
378	chevrolet	chevrolet cavalier 2-door
379	pontiac	pontiac j2000 se hatchback
380	dodge	dodge aries se
381	pontiac	pontiac phoenix
382	ford	ford fairmont futura
383	amc	amc concord dl
384	volkswagen	volkswagen rabbit l
385	mazda	mazda glc custom l
386	mazda	mazda glc custom
387	plymouth	plymouth horizon miser
388	mercury	mercury lynx l
389	nissan	nissan stanza xe
390	honda	honda accord
391	toyota	toyota corolla
392	honda	honda civic
393	honda	honda civic (auto)
394	datsun	datsun 310 gx
395	buick	buick century limited
396	oldsmobile	oldsmobile cutlass ciera (diesel)
397	chrysler	chrysler lebaron medallion
398	ford	ford granada l
399	toyota	toyota celica gt
400	dodge	dodge charger 2.2
401	chevrolet	chevrolet camaro
402	ford	ford mustang gl
403	volkswagen	vw pickup
404	dodge	dodge rampage
405	ford	ford ranger
406	chevrolet	chevy s-10
\.


--
-- TOC entry 3230 (class 0 OID 34505)
-- Dependencies: 207
-- Data for Name: cars_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars_data (id, mpg, cylinders, edispl, horsepower, weight, accelerate, year) FROM stdin;
1	18	8	307	130	3504	12	1970
2	15	8	350	165	3693	11.5	1970
3	18	8	318	150	3436	11	1970
4	16	8	304	150	3433	12	1970
5	17	8	302	140	3449	10.5	1970
6	15	8	429	198	4341	10	1970
7	14	8	454	220	4354	9	1970
8	14	8	440	215	4312	8.5	1970
9	14	8	455	225	4425	10	1970
10	15	8	390	190	3850	8.5	1970
16	15	8	383	170	3563	10	1970
17	14	8	340	160	3609	8	1970
19	15	8	400	150	3761	9.5	1970
20	14	8	455	225	3086	10	1970
21	24	4	113	95	2372	15	1970
22	22	6	198	95	2833	15.5	1970
23	18	6	199	97	2774	15.5	1970
24	21	6	200	85	2587	16	1970
25	27	4	97	88	2130	14.5	1970
26	26	4	97	46	1835	20.5	1970
27	25	4	110	87	2672	17.5	1970
28	24	4	107	90	2430	14.5	1970
29	25	4	104	95	2375	17.5	1970
30	26	4	121	113	2234	12.5	1970
31	21	6	199	90	2648	15	1970
32	10	8	360	215	4615	14	1970
33	10	8	307	200	4376	15	1970
34	11	8	318	210	4382	13.5	1970
35	9	8	304	193	4732	18.5	1970
36	27	4	97	88	2130	14.5	1971
37	28	4	140	90	2264	15.5	1971
38	25	4	113	95	2228	14	1971
41	19	6	232	100	2634	13	1971
42	16	6	225	105	3439	15.5	1971
43	17	6	250	100	3329	15.5	1971
44	19	6	250	88	3302	15.5	1971
45	18	6	232	100	3288	15.5	1971
46	14	8	350	165	4209	12	1971
47	14	8	400	175	4464	11.5	1971
48	14	8	351	153	4154	13.5	1971
49	14	8	318	150	4096	13	1971
50	12	8	383	180	4955	11.5	1971
51	13	8	400	170	4746	12	1971
52	13	8	400	175	5140	12	1971
53	18	6	258	110	2962	13.5	1971
54	22	4	140	72	2408	19	1971
55	19	6	250	100	3282	15	1971
56	18	6	250	88	3139	14.5	1971
57	23	4	122	86	2220	14	1971
58	28	4	116	90	2123	14	1971
59	30	4	79	70	2074	19.5	1971
60	30	4	88	76	2065	14.5	1971
61	31	4	71	65	1773	19	1971
62	35	4	72	69	1613	18	1971
63	27	4	97	60	1834	19	1971
64	26	4	91	70	1955	20.5	1971
65	24	4	113	95	2278	15.5	1972
66	25	4	97.5	80	2126	17	1972
67	23	4	97	54	2254	23.5	1972
68	20	4	140	90	2408	19.5	1972
69	21	4	122	86	2226	16.5	1972
70	13	8	350	165	4274	12	1972
71	14	8	400	175	4385	12	1972
72	15	8	318	150	4135	13.5	1972
73	14	8	351	153	4129	13	1972
74	17	8	304	150	3672	11.5	1972
75	11	8	429	208	4633	11	1972
76	13	8	350	155	4502	13.5	1972
77	12	8	350	160	4456	13.5	1972
78	13	8	400	190	4422	12.5	1972
79	19	3	70	97	2330	13.5	1972
80	15	8	304	150	3892	12.5	1972
81	13	8	307	130	4098	14	1972
82	13	8	302	140	4294	16	1972
83	14	8	318	150	4077	14	1972
84	18	4	121	112	2933	14.5	1972
85	22	4	121	76	2511	18	1972
86	21	4	120	87	2979	19.5	1972
87	26	4	96	69	2189	18	1972
88	22	4	122	86	2395	16	1972
89	28	4	97	92	2288	17	1972
90	23	4	120	97	2506	14.5	1972
91	28	4	98	80	2164	15	1972
92	27	4	97	88	2100	16.5	1972
93	13	8	350	175	4100	13	1973
94	14	8	304	150	3672	11.5	1973
95	13	8	350	145	3988	13	1973
96	14	8	302	137	4042	14.5	1973
97	15	8	318	150	3777	12.5	1973
98	12	8	429	198	4952	11.5	1973
99	13	8	400	150	4464	12	1973
100	13	8	351	158	4363	13	1973
101	14	8	318	150	4237	14.5	1973
102	13	8	440	215	4735	11	1973
103	12	8	455	225	4951	11	1973
104	13	8	360	175	3821	11	1973
105	18	6	225	105	3121	16.5	1973
106	16	6	250	100	3278	18	1973
107	18	6	232	100	2945	16	1973
108	18	6	250	88	3021	16.5	1973
109	23	6	198	95	2904	16	1973
110	26	4	97	46	1950	21	1973
111	11	8	400	150	4997	14	1973
112	12	8	400	167	4906	12.5	1973
113	13	8	360	170	4654	13	1973
114	12	8	350	180	4499	12.5	1973
115	18	6	232	100	2789	15	1973
116	20	4	97	88	2279	19	1973
117	21	4	140	72	2401	19.5	1973
118	22	4	108	94	2379	16.5	1973
119	18	3	70	90	2124	13.5	1973
120	19	4	122	85	2310	18.5	1973
121	21	6	155	107	2472	14	1973
122	26	4	98	90	2265	15.5	1973
123	15	8	350	145	4082	13	1973
124	16	8	400	230	4278	9.5	1973
125	29	4	68	49	1867	19.5	1973
126	24	4	116	75	2158	15.5	1973
127	20	4	114	91	2582	14	1973
128	19	4	121	112	2868	15.5	1973
129	15	8	318	150	3399	11	1973
130	24	4	121	110	2660	14	1973
131	20	6	156	122	2807	13.5	1973
132	11	8	350	180	3664	11	1973
133	20	6	198	95	3102	16.5	1974
135	19	6	232	100	2901	16	1974
136	15	6	250	100	3336	17	1974
137	31	4	79	67	1950	19	1974
138	26	4	122	80	2451	16.5	1974
139	32	4	71	65	1836	21	1974
140	25	4	140	75	2542	17	1974
141	16	6	250	100	3781	17	1974
142	16	6	258	110	3632	18	1974
143	18	6	225	105	3613	16.5	1974
144	16	8	302	140	4141	14	1974
145	13	8	350	150	4699	14.5	1974
146	14	8	318	150	4457	13.5	1974
147	14	8	302	140	4638	16	1974
148	14	8	304	150	4257	15.5	1974
149	29	4	98	83	2219	16.5	1974
150	26	4	79	67	1963	15.5	1974
151	26	4	97	78	2300	14.5	1974
152	31	4	76	52	1649	16.5	1974
153	32	4	83	61	2003	19	1974
154	28	4	90	75	2125	14.5	1974
155	24	4	90	75	2108	15.5	1974
156	26	4	116	75	2246	14	1974
157	24	4	120	97	2489	15	1974
158	26	4	108	93	2391	15.5	1974
159	31	4	79	67	2000	16	1974
160	19	6	225	95	3264	16	1975
161	18	6	250	105	3459	16	1975
162	15	6	250	72	3432	21	1975
163	15	6	250	72	3158	19.5	1975
164	16	8	400	170	4668	11.5	1975
165	15	8	350	145	4440	14	1975
166	16	8	318	150	4498	14.5	1975
167	14	8	351	148	4657	13.5	1975
168	17	6	231	110	3907	21	1975
169	16	6	250	105	3897	18.5	1975
170	15	6	258	110	3730	19	1975
171	18	6	225	95	3785	19	1975
172	21	6	231	110	3039	15	1975
173	20	8	262	110	3221	13.5	1975
174	13	8	302	129	3169	12	1975
175	29	4	97	75	2171	16	1975
176	23	4	140	83	2639	17	1975
177	20	6	232	100	2914	16	1975
178	23	4	140	78	2592	18.5	1975
179	24	4	134	96	2702	13.5	1975
180	25	4	90	71	2223	16.5	1975
181	24	4	119	97	2545	17	1975
182	18	6	171	97	2984	14.5	1975
183	29	4	90	70	1937	14	1975
184	19	6	232	90	3211	17	1975
185	23	4	115	95	2694	15	1975
186	23	4	120	88	2957	17	1975
187	22	4	121	98	2945	14.5	1975
188	25	4	121	115	2671	13.5	1975
189	33	4	91	53	1795	17.5	1975
190	28	4	107	86	2464	15.5	1976
191	25	4	116	81	2220	16.9	1976
192	25	4	140	92	2572	14.9	1976
193	26	4	98	79	2255	17.7	1976
194	27	4	101	83	2202	15.3	1976
195	17.5	8	305	140	4215	13	1976
196	16	8	318	150	4190	13	1976
197	15.5	8	304	120	3962	13.9	1976
198	14.5	8	351	152	4215	12.8	1976
199	22	6	225	100	3233	15.4	1976
200	22	6	250	105	3353	14.5	1976
201	24	6	200	81	3012	17.6	1976
202	22.5	6	232	90	3085	17.6	1976
203	29	4	85	52	2035	22.2	1976
204	24.5	4	98	60	2164	22.1	1976
205	29	4	90	70	1937	14.2	1976
206	33	4	91	53	1795	17.4	1976
207	20	6	225	100	3651	17.7	1976
208	18	6	250	78	3574	21	1976
209	18.5	6	250	110	3645	16.2	1976
210	17.5	6	258	95	3193	17.8	1976
211	29.5	4	97	71	1825	12.2	1976
212	32	4	85	70	1990	17	1976
213	28	4	97	75	2155	16.4	1976
214	26.5	4	140	72	2565	13.6	1976
215	20	4	130	102	3150	15.7	1976
216	13	8	318	150	3940	13.2	1976
217	19	4	120	88	3270	21.9	1976
218	19	6	156	108	2930	15.5	1976
219	16.5	6	168	120	3820	16.7	1976
220	16.5	8	350	180	4380	12.1	1976
221	13	8	350	145	4055	12	1976
222	13	8	302	130	3870	15	1976
223	13	8	318	150	3755	14	1976
224	31.5	4	98	68	2045	18.5	1977
225	30	4	111	80	2155	14.8	1977
226	36	4	79	58	1825	18.6	1977
227	25.5	4	122	96	2300	15.5	1977
228	33.5	4	85	70	1945	16.8	1977
229	17.5	8	305	145	3880	12.5	1977
230	17	8	260	110	4060	19	1977
231	15.5	8	318	145	4140	13.7	1977
232	15	8	302	130	4295	14.9	1977
233	17.5	6	250	110	3520	16.4	1977
234	20.5	6	231	105	3425	16.9	1977
235	19	6	225	100	3630	17.7	1977
236	18.5	6	250	98	3525	19	1977
237	16	8	400	180	4220	11.1	1977
238	15.5	8	350	170	4165	11.4	1977
239	15.5	8	400	190	4325	12.2	1977
240	16	8	351	149	4335	14.5	1977
241	29	4	97	78	1940	14.5	1977
242	24.5	4	151	88	2740	16	1977
243	26	4	97	75	2265	18.2	1977
244	25.5	4	140	89	2755	15.8	1977
245	30.5	4	98	63	2051	17	1977
246	33.5	4	98	83	2075	15.9	1977
247	30	4	97	67	1985	16.4	1977
248	30.5	4	97	78	2190	14.1	1977
249	22	6	146	97	2815	14.5	1977
250	21.5	4	121	110	2600	12.8	1977
251	21.5	3	80	110	2720	13.5	1977
252	43.1	4	90	48	1985	21.5	1978
253	36.1	4	98	66	1800	14.4	1978
254	32.8	4	78	52	1985	19.4	1978
255	39.4	4	85	70	2070	18.6	1978
256	36.1	4	91	60	1800	16.4	1978
257	19.9	8	260	110	3365	15.5	1978
258	19.4	8	318	140	3735	13.2	1978
259	20.2	8	302	139	3570	12.8	1978
260	19.2	6	231	105	3535	19.2	1978
261	20.5	6	200	95	3155	18.2	1978
262	20.2	6	200	85	2965	15.8	1978
263	25.1	4	140	88	2720	15.4	1978
264	20.5	6	225	100	3430	17.2	1978
265	19.4	6	232	90	3210	17.2	1978
266	20.6	6	231	105	3380	15.8	1978
267	20.8	6	200	85	3070	16.7	1978
268	18.6	6	225	110	3620	18.7	1978
269	18.1	6	258	120	3410	15.1	1978
270	19.2	8	305	145	3425	13.2	1978
271	17.7	6	231	165	3445	13.4	1978
272	18.1	8	302	139	3205	11.2	1978
273	17.5	8	318	140	4080	13.7	1978
274	30	4	98	68	2155	16.5	1978
275	27.5	4	134	95	2560	14.2	1978
276	27.2	4	119	97	2300	14.7	1978
277	30.9	4	105	75	2230	14.5	1978
278	21.1	4	134	95	2515	14.8	1978
279	23.2	4	156	105	2745	16.7	1978
280	23.8	4	151	85	2855	17.6	1978
281	23.9	4	119	97	2405	14.9	1978
282	20.3	5	131	103	2830	15.9	1978
283	17	6	163	125	3140	13.6	1978
284	21.6	4	121	115	2795	15.7	1978
285	16.2	6	163	133	3410	15.8	1978
286	31.5	4	89	71	1990	14.9	1978
287	29.5	4	98	68	2135	16.6	1978
288	21.5	6	231	115	3245	15.4	1979
289	19.8	6	200	85	2990	18.2	1979
290	22.3	4	140	88	2890	17.3	1979
291	20.2	6	232	90	3265	18.2	1979
292	20.6	6	225	110	3360	16.6	1979
293	17	8	305	130	3840	15.4	1979
294	17.6	8	302	129	3725	13.4	1979
295	16.5	8	351	138	3955	13.2	1979
296	18.2	8	318	135	3830	15.2	1979
297	16.9	8	350	155	4360	14.9	1979
298	15.5	8	351	142	4054	14.3	1979
299	19.2	8	267	125	3605	15	1979
300	18.5	8	360	150	3940	13	1979
301	31.9	4	89	71	1925	14	1979
302	34.1	4	86	65	1975	15.2	1979
303	35.7	4	98	80	1915	14.4	1979
304	27.4	4	121	80	2670	15	1979
305	25.4	5	183	77	3530	20.1	1979
306	23	8	350	125	3900	17.4	1979
307	27.2	4	141	71	3190	24.8	1979
308	23.9	8	260	90	3420	22.2	1979
309	34.2	4	105	70	2200	13.2	1979
310	34.5	4	105	70	2150	14.9	1979
311	31.8	4	85	65	2020	19.2	1979
312	37.3	4	91	69	2130	14.7	1979
313	28.4	4	151	90	2670	16	1979
314	28.8	6	173	115	2595	11.3	1979
315	26.8	6	173	115	2700	12.9	1979
316	33.5	4	151	90	2556	13.2	1979
317	41.5	4	98	76	2144	14.7	1980
318	38.1	4	89	60	1968	18.8	1980
319	32.1	4	98	70	2120	15.5	1980
320	37.2	4	86	65	2019	16.4	1980
321	28	4	151	90	2678	16.5	1980
322	26.4	4	140	88	2870	18.1	1980
323	24.3	4	151	90	3003	20.1	1980
324	19.1	6	225	90	3381	18.7	1980
325	34.3	4	97	78	2188	15.8	1980
326	29.8	4	134	90	2711	15.5	1980
327	31.3	4	120	75	2542	17.5	1980
328	37	4	119	92	2434	15	1980
329	32.2	4	108	75	2265	15.2	1980
330	46.6	4	86	65	2110	17.9	1980
331	27.9	4	156	105	2800	14.4	1980
332	40.8	4	85	65	2110	19.2	1980
333	44.3	4	90	48	2085	21.7	1980
334	43.4	4	90	48	2335	23.7	1980
335	36.4	5	121	67	2950	19.9	1980
336	30	4	146	67	3250	21.8	1980
337	44.6	4	91	67	1850	13.8	1980
339	33.8	4	97	67	2145	18	1980
340	29.8	4	89	62	1845	15.3	1980
341	32.7	6	168	132	2910	11.4	1980
342	23.7	3	70	100	2420	12.5	1980
343	35	4	122	88	2500	15.1	1980
345	32.4	4	107	72	2290	17	1980
346	27.2	4	135	84	2490	15.7	1981
347	26.6	4	151	84	2635	16.4	1981
348	25.8	4	156	92	2620	14.4	1981
349	23.5	6	173	110	2725	12.6	1981
350	30	4	135	84	2385	12.9	1981
351	39.1	4	79	58	1755	16.9	1981
352	39	4	86	64	1875	16.4	1981
353	35.1	4	81	60	1760	16.1	1981
354	32.3	4	97	67	2065	17.8	1981
355	37	4	85	65	1975	19.4	1981
356	37.7	4	89	62	2050	17.3	1981
357	34.1	4	91	68	1985	16	1981
358	34.7	4	105	63	2215	14.9	1981
359	34.4	4	98	65	2045	16.2	1981
360	29.9	4	98	65	2380	20.7	1981
361	33	4	105	74	2190	14.2	1981
363	33.7	4	107	75	2210	14.4	1981
364	32.4	4	108	75	2350	16.8	1981
365	32.9	4	119	100	2615	14.8	1981
366	31.6	4	120	74	2635	18.3	1981
367	28.1	4	141	80	3230	20.4	1981
369	30.7	6	145	76	3160	19.6	1981
370	25.4	6	168	116	2900	12.6	1981
371	24.2	6	146	120	2930	13.8	1981
372	22.4	6	231	110	3415	15.8	1981
373	26.6	8	350	105	3725	19	1981
374	20.2	6	200	88	3060	17.1	1981
375	17.6	6	225	85	3465	16.6	1981
376	28	4	112	88	2605	19.6	1982
377	27	4	112	88	2640	18.6	1982
378	34	4	112	88	2395	18	1982
379	31	4	112	85	2575	16.2	1982
380	29	4	135	84	2525	16	1982
381	27	4	151	90	2735	18	1982
382	24	4	140	92	2865	16.4	1982
384	36	4	105	74	1980	15.3	1982
385	37	4	91	68	2025	18.2	1982
386	31	4	91	68	1970	17.6	1982
387	38	4	105	63	2125	14.7	1982
388	36	4	98	70	2125	17.3	1982
389	36	4	120	88	2160	14.5	1982
390	36	4	107	75	2205	14.5	1982
391	34	4	108	70	2245	16.9	1982
392	38	4	91	67	1965	15	1982
393	32	4	91	67	1965	15.7	1982
394	38	4	91	67	1995	16.2	1982
395	25	6	181	110	2945	16.4	1982
396	38	6	262	85	3015	17	1982
397	26	4	156	92	2585	14.5	1982
398	22	6	232	112	2835	14.7	1982
399	32	4	144	96	2665	13.9	1982
400	36	4	135	84	2370	13	1982
401	27	4	151	90	2950	17.3	1982
402	27	4	140	86	2790	15.6	1982
403	44	4	97	52	2130	24.6	1982
404	32	4	135	84	2295	11.6	1982
405	28	4	120	79	2625	18.6	1982
406	31	4	119	82	2720	19.4	1982
11	0	4	133	115	3090	17.5	1970
12	0	8	350	165	4142	11.5	1970
13	0	8	351	153	4034	11	1970
14	0	8	383	175	4166	10.5	1970
15	0	8	360	175	3850	11	1970
18	0	8	302	140	3353	8	1970
40	0	4	97	48	1978	20	1971
368	0	4	121	110	2800	15.4	1981
39	25	4	98	0	2046	19	1971
134	21	6	200	0	2875	17	1974
338	40.9	4	85	0	1835	17.3	1980
344	23.6	4	140	0	2905	14.3	1980
362	34.5	4	100	0	2320	15.8	1981
383	23	4	151	0	3035	20.5	1982
\.


--
-- TOC entry 3225 (class 0 OID 34443)
-- Dependencies: 202
-- Data for Name: continents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.continents (contid, continent) FROM stdin;
1	america
2	europe
3	asia
4	africa
5	australia
0	NA
\.


--
-- TOC entry 3226 (class 0 OID 34451)
-- Dependencies: 203
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (countryid, countryname, continent) FROM stdin;
1	usa	1
2	germany	2
3	france	2
4	japan	3
5	italy	2
6	sweden	2
7	uk	2
8	korea	3
9	russia	2
10	nigeria	4
11	australia	5
12	new zealand	5
13	egypt	4
14	mexico	1
15	brazil	1
0	NA	0
\.


--
-- TOC entry 3228 (class 0 OID 34477)
-- Dependencies: 205
-- Data for Name: model_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_list (modelid, maker, model) FROM stdin;
1	1	amc
2	2	audi
3	3	bmw
4	4	buick
5	4	cadillac
6	5	capri
7	4	chevrolet
8	6	chrysler
9	7	citroen
10	8	datsun
11	6	dodge
12	9	fiat
13	5	ford
14	10	hi
15	11	honda
16	12	mazda
17	13	mercedes
18	13	mercedes-benz
19	5	mercury
20	8	nissan
21	4	oldsmobile
22	14	opel
23	15	peugeot
24	6	plymouth
25	4	pontiac
26	16	renault
27	17	saab
28	18	subaru
29	19	toyota
30	20	triumph
31	2	volkswagen
32	21	volvo
33	22	kia
34	23	hyundai
35	6	jeep
36	19	scion
\.


--
-- TOC entry 3085 (class 2606 OID 34471)
-- Name: car_makers car_makers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_makers
    ADD CONSTRAINT car_makers_pkey PRIMARY KEY (id);


--
-- TOC entry 3091 (class 2606 OID 34499)
-- Name: car_names car_names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_names
    ADD CONSTRAINT car_names_pkey PRIMARY KEY (makeid);


--
-- TOC entry 3093 (class 2606 OID 34512)
-- Name: cars_data cars_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars_data
    ADD CONSTRAINT cars_data_pkey PRIMARY KEY (id);


--
-- TOC entry 3081 (class 2606 OID 34450)
-- Name: continents continents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.continents
    ADD CONSTRAINT continents_pkey PRIMARY KEY (contid);


--
-- TOC entry 3083 (class 2606 OID 34458)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countryid);


--
-- TOC entry 3087 (class 2606 OID 34486)
-- Name: model_list model_list_Model_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_list
    ADD CONSTRAINT "model_list_Model_key" UNIQUE (model);


--
-- TOC entry 3089 (class 2606 OID 34484)
-- Name: model_list model_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_list
    ADD CONSTRAINT model_list_pkey PRIMARY KEY (modelid);


--
-- TOC entry 3095 (class 2606 OID 34472)
-- Name: car_makers car_makers_Country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_makers
    ADD CONSTRAINT "car_makers_Country_fkey" FOREIGN KEY (country) REFERENCES public.countries(countryid);


--
-- TOC entry 3097 (class 2606 OID 34500)
-- Name: car_names car_names_Model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_names
    ADD CONSTRAINT "car_names_Model_fkey" FOREIGN KEY (model) REFERENCES public.model_list(model);


--
-- TOC entry 3098 (class 2606 OID 34513)
-- Name: cars_data cars_data_Id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars_data
    ADD CONSTRAINT "cars_data_Id_fkey" FOREIGN KEY (id) REFERENCES public.car_names(makeid);


--
-- TOC entry 3094 (class 2606 OID 34459)
-- Name: countries countries_Continent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "countries_Continent_fkey" FOREIGN KEY (continent) REFERENCES public.continents(contid);


--
-- TOC entry 3096 (class 2606 OID 34487)
-- Name: model_list model_list_Maker_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_list
    ADD CONSTRAINT "model_list_Maker_fkey" FOREIGN KEY (maker) REFERENCES public.car_makers(id);


-- Completed on 2021-08-03 19:17:06 CEST

--
-- PostgreSQL database dump complete
--

