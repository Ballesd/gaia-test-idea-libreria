--
-- PostgreSQL database cluster dump
--

-- Started on 2024-02-16 18:40:45

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE bodegadatos;
ALTER ROLE bodegadatos WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE master_database;
ALTER ROLE master_database WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-16 18:40:45

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

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-02-16 18:40:45

--
-- PostgreSQL database dump complete
--

--
-- Database "idea-test-biblio" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-16 18:40:45

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

--
-- TOC entry 2185 (class 1262 OID 52231)
-- Name: idea-test-biblio; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "idea-test-biblio" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "idea-test-biblio" OWNER TO postgres;

\connect -reuse-previous=on "dbname='idea-test-biblio'"

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

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 185 (class 1259 OID 52234)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 52260)
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    id integer NOT NULL,
    name text NOT NULL,
    lastname text NOT NULL,
    nacionality text NOT NULL,
    birthdate timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 52258)
-- Name: autor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autor_id_seq OWNER TO postgres;

--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 188
-- Name: autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autor_id_seq OWNED BY public.autor.id;


--
-- TOC entry 191 (class 1259 OID 52272)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id integer NOT NULL,
    title text NOT NULL,
    year_pub integer NOT NULL,
    category text NOT NULL,
    description text NOT NULL,
    disponibility boolean NOT NULL,
    "autorId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 52270)
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 190
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- TOC entry 193 (class 1259 OID 52284)
-- Name: loan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "bookId" integer NOT NULL,
    loan_date timestamp(3) without time zone NOT NULL,
    return_date timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.loan OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 52282)
-- Name: loan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loan_id_seq OWNER TO postgres;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 192
-- Name: loan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_id_seq OWNED BY public.loan.id;


--
-- TOC entry 187 (class 1259 OID 52248)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name text NOT NULL,
    lastname text NOT NULL,
    email text NOT NULL,
    register_date timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 52246)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 186
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 2035 (class 2604 OID 52263)
-- Name: autor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor ALTER COLUMN id SET DEFAULT nextval('public.autor_id_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 52275)
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 52287)
-- Name: loan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan ALTER COLUMN id SET DEFAULT nextval('public.loan_id_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 52251)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 2171 (class 0 OID 52234)
-- Dependencies: 185
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
100d4d01-b1e9-4d88-a597-aa8cbc10d167	51b4fd56311a4734d6d3cc499a7032d81f44fc9cdbf73659e859e85cd0312733	2024-02-16 01:10:49.013421+00	20240216011048_init	\N	\N	2024-02-16 01:10:48.959529+00	1
\.


--
-- TOC entry 2175 (class 0 OID 52260)
-- Dependencies: 189
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor (id, name, lastname, nacionality, birthdate, "createdAt", "updatedAt") FROM stdin;
2	juanito	pedrito	Colombian	2003-01-12 00:00:00	2024-02-16 03:22:21.164	2024-02-16 03:22:21.164
4	wilson	chanty	florda	2003-01-12 00:00:00	2024-02-16 03:26:06.157	2024-02-16 03:26:06.157
5	caral	sii	honkong	2003-01-12 00:00:00	2024-02-16 03:26:09.471	2024-02-16 03:26:09.471
6	caral	sii	honkong	2003-01-12 00:00:00	2024-02-16 03:28:30.277	2024-02-16 03:28:30.277
\.


--
-- TOC entry 2177 (class 0 OID 52272)
-- Dependencies: 191
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id, title, year_pub, category, description, disponibility, "autorId", "createdAt", "updatedAt") FROM stdin;
1	Libro 1	2020	Comedy	libro de Comedy	t	2	2024-02-16 03:41:03.838	2024-02-16 03:41:03.838
3	Libro 2	2010	Dangerous	-------- aaa -- 	f	4	2024-02-16 03:41:53.111	2024-02-16 03:41:53.111
4	Libro 3	2000	Yes	asdsafwefiun 	t	4	2024-02-16 03:42:21.574	2024-02-16 03:42:21.574
5	Libro 3	2000	Yes	asdsafwefiun 	t	4	2024-02-16 03:42:22.402	2024-02-16 03:42:22.402
\.


--
-- TOC entry 2179 (class 0 OID 52284)
-- Dependencies: 193
-- Data for Name: loan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan (id, "userId", "bookId", loan_date, return_date, "createdAt", "updatedAt") FROM stdin;
1	3	4	2003-01-12 00:00:00	2003-04-12 00:00:00	2024-02-16 04:02:27.499	2024-02-16 04:02:27.499
2	3	4	2003-01-12 00:00:00	2003-04-12 00:00:00	2024-02-16 04:02:30.877	2024-02-16 04:02:30.877
3	3	4	2003-01-12 00:00:00	2003-04-12 00:00:00	2024-02-16 04:02:31.665	2024-02-16 04:02:31.665
4	3	4	2003-01-12 00:00:00	2003-04-12 00:00:00	2024-02-16 04:02:32.529	2024-02-16 04:02:32.529
5	3	4	2003-01-12 00:00:00	2003-04-12 00:00:00	2024-02-16 04:02:33.075	2024-02-16 04:02:33.075
\.


--
-- TOC entry 2173 (class 0 OID 52248)
-- Dependencies: 187
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name, lastname, email, register_date, "createdAt", "updatedAt") FROM stdin;
1	usuario 1	apellido last name	usuario@apellido.com	2003-01-12 00:00:00	2024-02-16 03:59:18.598	2024-02-16 03:59:18.598
2	usuario 2	apellido user2 name	usuari2o@apellido.com	2003-01-12 00:00:00	2024-02-16 03:59:29.98	2024-02-16 03:59:29.98
3	usuario 3	appelid user 3	usser4@apel.com	2006-02-12 00:00:00	2024-02-16 04:00:01.129	2024-02-16 04:00:01.129
4	usuario 4	appelid u-- 4	usser4@apelva4.com	2006-02-12 00:00:00	2024-02-16 04:00:21.744	2024-02-16 04:00:21.744
5	usuario 5	appeli-u-- 5	usser4@apelli5.com	2008-02-12 00:00:00	2024-02-16 04:00:34.926	2024-02-16 04:00:34.926
\.


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 188
-- Name: autor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_id_seq', 6, true);


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 190
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 6, true);


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 192
-- Name: loan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_id_seq', 5, true);


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 186
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- TOC entry 2042 (class 2606 OID 52243)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2046 (class 2606 OID 52269)
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id);


--
-- TOC entry 2048 (class 2606 OID 52281)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2050 (class 2606 OID 52290)
-- Name: loan loan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (id);


--
-- TOC entry 2044 (class 2606 OID 52257)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2051 (class 2606 OID 52291)
-- Name: book book_autorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT "book_autorId_fkey" FOREIGN KEY ("autorId") REFERENCES public.autor(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2052 (class 2606 OID 52301)
-- Name: loan loan_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT "loan_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public.book(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2053 (class 2606 OID 52296)
-- Name: loan loan_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT "loan_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-02-16 18:40:46

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-02-16 18:40:46

--
-- PostgreSQL database cluster dump complete
--

