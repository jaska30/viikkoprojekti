--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-03-03 08:47:32

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
-- TOC entry 203 (class 1259 OID 16512)
-- Name: topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topic (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    timetomaster integer,
    timespent integer,
    source character varying(255),
    startlearningdate timestamp without time zone,
    inprogress bit(1)
);


ALTER TABLE public.topic OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16510)
-- Name: topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_id_seq OWNER TO postgres;

--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 202
-- Name: topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topic_id_seq OWNED BY public.topic.id;


--
-- TOC entry 2687 (class 2604 OID 16515)
-- Name: topic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topic ALTER COLUMN id SET DEFAULT nextval('public.topic_id_seq'::regclass);


--
-- TOC entry 2817 (class 0 OID 16512)
-- Dependencies: 203
-- Data for Name: topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topic (id, title, description, timetomaster, timespent, source, startlearningdate, inprogress) FROM stdin;
2	testi	testi	3	2	testi	\N	\N
3	testi	testi	3	2	testi	\N	\N
1	toimiiko muokkaus	toimiiko muokkaus	4	6	toimiiko api	\N	\N
5	uusi postaus	uusi postaus	4	6	toimiiko api	\N	\N
\.


--
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 202
-- Name: topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topic_id_seq', 5, true);


--
-- TOC entry 2689 (class 2606 OID 16520)
-- Name: topic topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);


-- Completed on 2020-03-03 08:47:33

--
-- PostgreSQL database dump complete
--

