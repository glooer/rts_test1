--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-09-11 22:31:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 190 (class 1259 OID 16440)
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cars_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 189 (class 1259 OID 16434)
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cars (
    id bigint DEFAULT nextval('cars_id_seq'::regclass) NOT NULL,
    name character varying(40),
    gos character varying(10),
    owner_id bigint NOT NULL
);


ALTER TABLE cars OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16411)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE city (
    id bigint NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE city OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16409)
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE city_id_seq OWNER TO postgres;

--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 187
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE city_id_seq OWNED BY city.id;


--
-- TOC entry 185 (class 1259 OID 16395)
-- Name: humans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE humans (
    id bigint NOT NULL,
    last_name character varying(40),
    first_name character varying(40),
    city_id bigint,
    middle_name character varying(40)
);


ALTER TABLE humans OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16398)
-- Name: humans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE humans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humans_id_seq OWNER TO postgres;

--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 186
-- Name: humans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE humans_id_seq OWNED BY humans.id;


--
-- TOC entry 192 (class 1259 OID 16448)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16443)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id bigint DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    email character varying(40) NOT NULL,
    pass character varying(64) NOT NULL,
    auth_hash character varying(64)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2021 (class 2604 OID 16414)
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY city ALTER COLUMN id SET DEFAULT nextval('city_id_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 16400)
-- Name: humans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY humans ALTER COLUMN id SET DEFAULT nextval('humans_id_seq'::regclass);


--
-- TOC entry 2154 (class 0 OID 16434)
-- Dependencies: 189
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cars (id, name, gos, owner_id) FROM stdin;
1	red car	a111aa123	2
2	electro car	b222ba123	2
\.


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 190
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cars_id_seq', 2, true);


--
-- TOC entry 2153 (class 0 OID 16411)
-- Dependencies: 188
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY city (id, name) FROM stdin;
1	Курган
2	Екатеринбург
3	Архангельск
4	Москва
5	Новосибирск
6	Абакан
7	Норильск
8	Казань
9	Астана
10	Кострома
\.


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 187
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('city_id_seq', 10, true);


--
-- TOC entry 2150 (class 0 OID 16395)
-- Dependencies: 185
-- Data for Name: humans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY humans (id, last_name, first_name, city_id, middle_name) FROM stdin;
2	Tesla	Nikola	2	\N
1	Einstein	Albert	1	\N
3	Newton	Isaac	3	\N
4	Galilei	Galileo	2	\N
5	Hawking	Stephen	3	William
6	Ганди	Махатма	5	\N
7	Фрейд	Зигмунд	3	\N
8	Edison	Thomas	5	Alva
9	Darwin	Charles	3	Robert
10	Curie	Marie	6	\N
\.


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 186
-- Name: humans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('humans_id_seq', 10, true);


--
-- TOC entry 2156 (class 0 OID 16443)
-- Dependencies: 191
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, pass, auth_hash) FROM stdin;
1	dwq	fdsaf	\N
2	kostya14@gmail.com	3918fb3a6b3d2033f42f2d354de0f7ba	sIESbbEruHBNr3aEX8kmDsFvrMJjGMH
\.


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 192
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- TOC entry 2029 (class 2606 OID 16438)
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- TOC entry 2027 (class 2606 OID 16416)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 2025 (class 2606 OID 16405)
-- Name: humans humans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY humans
    ADD CONSTRAINT humans_pkey PRIMARY KEY (id);


--
-- TOC entry 2031 (class 2606 OID 16447)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 16417)
-- Name: humans city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY humans
    ADD CONSTRAINT city_id FOREIGN KEY (city_id) REFERENCES city(id);


-- Completed on 2017-09-11 22:31:39

--
-- PostgreSQL database dump complete
--

