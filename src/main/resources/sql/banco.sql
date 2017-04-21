--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-04-21 12:48:01 -03

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
-- TOC entry 2237 (class 0 OID 0)
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
-- TOC entry 2238 (class 0 OID 0)
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
    status character varying DEFAULT 'Pedido'::character varying,
    quantidade numeric,
    nota numeric
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
-- TOC entry 2239 (class 0 OID 0)
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
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 189
-- Name: pessoas_idpessoa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pessoas_idpessoa_seq OWNED BY pessoas.idpessoa;


--
-- TOC entry 193 (class 1259 OID 16616)
-- Name: pessoasativas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW pessoasativas AS
 SELECT pessoas.idpessoa,
    pessoas.cpf,
    pessoas.datacadastro,
    pessoas.email,
    pessoas.nome,
    pessoas.status,
    pessoas.telefone
   FROM pessoas
  WHERE ((pessoas.status)::text = 'A'::text);


ALTER TABLE pessoasativas OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16733)
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
-- TOC entry 195 (class 1259 OID 16735)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produtos (
    idprodutos bigint DEFAULT nextval('produtos_idprodutos_seq'::regclass) NOT NULL,
    datacadastro date DEFAULT now(),
    descricao character varying(255),
    estoque character varying(255),
    quantidade character varying(255),
    status character varying(255) DEFAULT 'P'::character varying,
    valorunitario numeric
);


ALTER TABLE produtos OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16567)
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
-- TOC entry 191 (class 1259 OID 16565)
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
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 191
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 196 (class 1259 OID 16766)
-- Name: vwpedidos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vwpedidos AS
 SELECT pedidos.datapedido,
    pedidos.quantidade,
    pedidos.nota,
    pessoas.nome,
    pessoas.cpf,
    produtos.descricao,
    produtos.valorunitario,
    (produtos.valorunitario * pedidos.quantidade) AS total
   FROM ((pedidos
     JOIN pessoas ON ((pedidos.fkpessoas = pessoas.idpessoa)))
     JOIN produtos ON ((pedidos.fkprodutos = produtos.idprodutos)))
  GROUP BY pessoas.nome, produtos.descricao, pedidos.datapedido, pedidos.quantidade, produtos.valorunitario, pessoas.cpf, pedidos.nota;


ALTER TABLE vwpedidos OWNER TO postgres;

--
-- TOC entry 2080 (class 2604 OID 16529)
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- TOC entry 2081 (class 2604 OID 16540)
-- Name: pedidos idpedidos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos ALTER COLUMN idpedidos SET DEFAULT nextval('pedidos_idpedidos_seq'::regclass);


--
-- TOC entry 2084 (class 2604 OID 16548)
-- Name: pessoas idpessoa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pessoas ALTER COLUMN idpessoa SET DEFAULT nextval('pessoas_idpessoa_seq'::regclass);


--
-- TOC entry 2086 (class 2604 OID 16570)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2222 (class 0 OID 16526)
-- Dependencies: 186
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO address (id, city, street, suite, zipcode) VALUES (1, 'CURITIBA', 'RUA', '111', '60060440');


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 185
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('address_id_seq', 1, false);


--
-- TOC entry 2224 (class 0 OID 16537)
-- Dependencies: 188
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedidos (idpedidos, datapedido, fkpessoas, fkprodutos, status, quantidade, nota) VALUES (1, '2017-04-21', 1, 1, 'P', 10, 1);
INSERT INTO pedidos (idpedidos, datapedido, fkpessoas, fkprodutos, status, quantidade, nota) VALUES (2, '2018-05-21', 1, 1, 'P', 30, 1);
INSERT INTO pedidos (idpedidos, datapedido, fkpessoas, fkprodutos, status, quantidade, nota) VALUES (3, '2018-05-21', 1, 1, 'P', 40, 1);


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 187
-- Name: pedidos_idpedidos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pedidos_idpedidos_seq', 5, true);


--
-- TOC entry 2226 (class 0 OID 16545)
-- Dependencies: 190
-- Data for Name: pessoas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (1, '64525430248', '2018-02-02', 'email@gmail.com', 'MARIA', 'A', '8591254360');
INSERT INTO pessoas (idpessoa, cpf, datacadastro, email, nome, status, telefone) VALUES (2, '64525430248', '2018-02-02', 'email@gmail.com', 'JOAO', 'A', '8591254360');


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 189
-- Name: pessoas_idpessoa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pessoas_idpessoa_seq', 254, true);


--
-- TOC entry 2230 (class 0 OID 16735)
-- Dependencies: 195
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produtos (idprodutos, datacadastro, descricao, estoque, quantidade, status, valorunitario) VALUES (2, '2017-04-21', 'FEIJAO', '10', '10', 'A', 1);
INSERT INTO produtos (idprodutos, datacadastro, descricao, estoque, quantidade, status, valorunitario) VALUES (1, '2017-04-21', 'FARINHA', '10', '10', 'A', 1);


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 194
-- Name: produtos_idprodutos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produtos_idprodutos_seq', 1, false);


--
-- TOC entry 2228 (class 0 OID 16567)
-- Dependencies: 192
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, email, name, phone) VALUES (17, 'email@gmail.com', 'maria', '8531254030');
INSERT INTO users (id, email, name, phone) VALUES (34, 'email@gmail.com', 'joao', '8531254030');
INSERT INTO users (id, email, name, phone) VALUES (35, 'web2ajax@gmail.com', 'pedro', '8531015176');


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 191
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 35, true);


--
-- TOC entry 2091 (class 2606 OID 16534)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 2093 (class 2606 OID 16542)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (idpedidos);


--
-- TOC entry 2095 (class 2606 OID 16553)
-- Name: pessoas pessoas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (idpessoa);


--
-- TOC entry 2099 (class 2606 OID 16745)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (idprodutos);


--
-- TOC entry 2097 (class 2606 OID 16575)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2100 (class 2606 OID 16581)
-- Name: pedidos fk5xnot9ypecfe49tf9kmk9s0fl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT fk5xnot9ypecfe49tf9kmk9s0fl FOREIGN KEY (fkpessoas) REFERENCES pessoas(idpessoa);


--
-- TOC entry 2101 (class 2606 OID 16746)
-- Name: pedidos fkprodutosfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT fkprodutosfk FOREIGN KEY (fkprodutos) REFERENCES produtos(idprodutos);


-- Completed on 2017-04-21 12:48:02 -03

--
-- PostgreSQL database dump complete
--

