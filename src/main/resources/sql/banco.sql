--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-04-20 10:57:48 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12431)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 16526)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE address (
    id bigint NOT NULL,
    city character varying(255),
    street character varying(255),
    suite character varying(255),
    zipcode character varying(255)
);


ALTER TABLE address OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16524)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_id_seq OWNER TO postgres;

--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 185
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE address_id_seq OWNED BY address.id;


--
-- TOC entry 188 (class 1259 OID 16537)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pedidos (
    idpedidos bigint NOT NULL,
    datapedido date DEFAULT now(),
    fkpessoas bigint,
    fkprodutos bigint,
    status character varying DEFAULT 'Pedido'::character varying
);


ALTER TABLE pedidos OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16535)
-- Name: pedidos_idpedidos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pedidos_idpedidos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pedidos_idpedidos_seq OWNER TO postgres;

--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 187
-- Name: pedidos_idpedidos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedidos_idpedidos_seq OWNED BY pedidos.idpedidos;


--
-- TOC entry 190 (class 1259 OID 16545)
-- Name: pessoas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pessoas (
    idpessoa bigint NOT NULL,
    cpf character varying(255),
    datacadastro date DEFAULT now(),
    email character varying(255),
    nome character varying(255),
    status character varying(255),
    telefone character varying(255)
);


ALTER TABLE pessoas OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16543)
-- Name: pessoas_idpessoa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pessoas_idpessoa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pessoas_idpessoa_seq OWNER TO postgres;

--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 189
-- Name: pessoas_idpessoa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pessoas_idpessoa_seq OWNED BY pessoas.idpessoa;


--
-- TOC entry 192 (class 1259 OID 16556)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produtos (
    idprodutos bigint NOT NULL,
    datacadastro date DEFAULT now(),
    descricao character varying(255),
    estoque character varying(255),
    quantidade character varying(255),
    status character varying(255) DEFAULT 'P'::character varying,
    valorunitario character varying(255)
);


ALTER TABLE produtos OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16554)
-- Name: produtos_idprodutos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produtos_idprodutos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produtos_idprodutos_seq OWNER TO postgres;

--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 191
-- Name: produtos_idprodutos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produtos_idprodutos_seq OWNED BY produtos.idprodutos;


--
-- TOC entry 194 (class 1259 OID 16567)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying(255),
    name character varying(255),
    phone character varying(255)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16565)
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
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 193
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2072 (class 2604 OID 16529)
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- TOC entry 2073 (class 2604 OID 16540)
-- Name: pedidos idpedidos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos ALTER COLUMN idpedidos SET DEFAULT nextval('pedidos_idpedidos_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 16548)
-- Name: pessoas idpessoa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pessoas ALTER COLUMN idpessoa SET DEFAULT nextval('pessoas_idpessoa_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 16559)
-- Name: produtos idprodutos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos ALTER COLUMN idprodutos SET DEFAULT nextval('produtos_idprodutos_seq'::regclass);


--
-- TOC entry 2081 (class 2604 OID 16570)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2212 (class 0 OID 16526)
-- Dependencies: 186
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO address (id, city, street, suite, zipcode) VALUES (1, 'CURITIBA', 'RUA', '111', '60060440');


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 185
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('address_id_seq', 1, false);


--
-- TOC entry 2214 (class 0 OID 16537)
-- Dependencies: 188
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedidos (idpedidos, datapedido, fkpessoas, fkprodutos, status) VALUES (1, '2017-02-02', 1, 1, 'Pago');
INSERT INTO pedidos (idpedidos, datapedido, fkpessoas, fkprodutos, status) VALUES (2, '2018-03-03', 1, 1, 'Cancelado');
INSERT INTO pedidos (idpedidos, datapedido, fkpessoas, fkprodutos, status) VALUES (3, '2017-04-20', 2, 2, 'Pago');
INSERT INTO pedidos (idpedidos, datapedido, fkpessoas, fkprodutos, status) VALUES (4, '2018-02-02', 3, 3, 'Pedido');
INSERT INTO pedidos (idpedidos, datapedido, fkpessoas, fkprodutos, status) VALUES (5, '2018-03-02', 4, 4, 'Pedido');


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 187
-- Name: pedidos_idpedidos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pedidos_idpedidos_seq', 1, false);


--
-- TOC entry 2216 (class 0 OID 16545)
-- Dependencies: 190
-- Data for Name: pessoas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (1, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (2, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (3, '64525430248', '2017-04-20', 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (4, '64525430248', '2017-04-20', 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (5, '64525430248', '2017-04-20', 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (6, '64525430248', '2017-04-20', 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (7, '64525430248', '2017-04-20', 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (8, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (9, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (10, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (11, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (12, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (13, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (14, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (15, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (16, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (17, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (18, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (19, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (20, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (21, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (22, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (23, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (24, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (25, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (26, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (27, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (28, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (29, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (30, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (31, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (32, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (33, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (34, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (35, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (36, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (37, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (38, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (39, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (40, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (41, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (42, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (43, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (44, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (45, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (46, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (47, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (48, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (49, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (50, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (51, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (52, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (53, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (54, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (55, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (56, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (57, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (58, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (59, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (60, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (61, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (62, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (63, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (64, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (65, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (66, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (67, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (68, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (69, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (70, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (224, '64525430248', '2017-04-20', 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (97, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (98, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (99, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (100, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (142, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (155, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (156, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (157, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (158, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (159, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (160, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (161, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (162, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (163, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (164, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (165, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (166, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (167, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (168, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (169, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (170, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (171, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (172, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (173, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (174, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (175, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (176, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (177, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (178, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (179, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (180, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (181, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (182, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (183, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (184, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (185, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (186, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (187, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (188, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (189, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (190, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (191, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (192, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (193, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (194, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (195, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (196, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (197, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (198, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (199, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (200, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (201, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (202, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (203, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (204, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (205, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (217, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (221, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (223, '64525430248', NULL, 'web2ajax@gmail.com', 'ANTONIO CARLOS SILVA', 'A', '4131015485');


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 189
-- Name: pessoas_idpessoa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pessoas_idpessoa_seq', 254, true);


--
-- TOC entry 2218 (class 0 OID 16556)
-- Dependencies: 192
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produtos (idprodutos, datacadastro, descricao, estoque, quantidade, status, valorunitario) VALUES (4, '2018-03-01', 'CELULAR', '10', '10', 'P', '20');
INSERT INTO produtos (idprodutos, datacadastro, descricao, estoque, quantidade, status, valorunitario) VALUES (3, '2017-04-20', 'HD', '10', '10', 'R', '10');
INSERT INTO produtos (idprodutos, datacadastro, descricao, estoque, quantidade, status, valorunitario) VALUES (1, '2016-01-01', 'TECLADO', '10', '10', 'P', '35');
INSERT INTO produtos (idprodutos, datacadastro, descricao, estoque, quantidade, status, valorunitario) VALUES (2, '2017-04-20', 'MOUSE', '10', '10', 'N', '20');
INSERT INTO produtos (idprodutos, datacadastro, descricao, estoque, quantidade, status, valorunitario) VALUES (5, '20018-02-02', 'NOTEBOOK', '10', '10', 'P', '20');


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 191
-- Name: produtos_idprodutos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produtos_idprodutos_seq', 1, false);


--
-- TOC entry 2220 (class 0 OID 16567)
-- Dependencies: 194
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, email, name, phone) VALUES (17, 'email@gmail.com', 'ANDERELA ANNE LIMA', '8531254030');
INSERT INTO users (id, email, name, phone) VALUES (34, 'email@gmail.com', 'MMMMMMMMMMMMMMMMMMMMM', '8531254030');
INSERT INTO users (id, email, name, phone) VALUES (35, 'web2ajax@gmail.com', 'ANDERELA MOTADELA', '8531015176');


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 193
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 35, true);


--
-- TOC entry 2083 (class 2606 OID 16534)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 2085 (class 2606 OID 16542)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (idpedidos);


--
-- TOC entry 2087 (class 2606 OID 16553)
-- Name: pessoas pessoas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (idpessoa);


--
-- TOC entry 2089 (class 2606 OID 16564)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (idprodutos);


--
-- TOC entry 2091 (class 2606 OID 16575)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2093 (class 2606 OID 16581)
-- Name: pedidos fk5xnot9ypecfe49tf9kmk9s0fl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT fk5xnot9ypecfe49tf9kmk9s0fl FOREIGN KEY (fkpessoas) REFERENCES pessoas(idpessoa);


--
-- TOC entry 2092 (class 2606 OID 16576)
-- Name: pedidos fkcirme5d4mj7phdnrq6rvqxip9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT fkcirme5d4mj7phdnrq6rvqxip9 FOREIGN KEY (fkprodutos) REFERENCES produtos(idprodutos);


-- Completed on 2017-04-20 10:57:49 -03

--
-- PostgreSQL database dump complete
--
CREATE VIEW pessoasativas AS
SELECT 
  pessoas.idpessoa, 
  pessoas.cpf, 
  pessoas.datacadastro, 
  pessoas.email, 
  pessoas.nome, 
  pessoas.status, 
  pessoas.telefone
FROM 
  public.pessoas
WHERE 
  pessoas.status = 'A';



CREATE OR REPLACE VIEW public.vwpedidos AS 
 SELECT 
  produtos.descricao, 
  produtos.quantidade, 
  produtos.valorunitario, 
  pessoas.nome, 
  pedidos.datapedido, 
  pessoas.cpf
FROM 
  public.pessoas, 
  public.produtos, 
  public.pedidos
WHERE 
  pessoas.idpessoa = pedidos.fkpessoas AND
  produtos.idprodutos = pedidos.fkprodutos AND
  pedidos.datapedido = pedidos.datapedido;

ALTER TABLE public.vwpedidos
  OWNER TO postgres;
