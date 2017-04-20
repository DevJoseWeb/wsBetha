--Em (SqlInitialization.java), existe uma anotação que gera as tabelas.
--hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");


-- Table: public.address

-- DROP TABLE public.address;

CREATE TABLE public.address
(
  id bigint NOT NULL DEFAULT nextval('address_id_seq'::regclass),
  city character varying(255),
  street character varying(255),
  suite character varying(255),
  zipcode character varying(255),
  CONSTRAINT address_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.address
  OWNER TO postgres;


-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
  id bigint NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  email character varying(255),
  name character varying(255),
  phone character varying(255),
  addressfk bigint,
  CONSTRAINT users_pkey PRIMARY KEY (id),
  CONSTRAINT fkl3lu7c5my4yuwaha2hdxbjl9s FOREIGN KEY (addressfk)
      REFERENCES public.address (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.users
  OWNER TO postgres;

-- Table: public.pessoas

-- DROP TABLE public.pessoas;

CREATE TABLE public.pessoas
(
  idpessoa bigint NOT NULL DEFAULT nextval('pessoas_idpessoa_seq'::regclass),
  cpf character varying(255),
  datacadastro date DEFAULT now(),
  email character varying(255),
  nome character varying(255),
  status character varying(255),
  telefone character varying(255),
  CONSTRAINT pessoas_pkey PRIMARY KEY (idpessoa)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.pessoas
  OWNER TO postgres;


-- Table: public.produtos

-- DROP TABLE public.produtos;

CREATE TABLE public.produtos
(
  idprodutos bigint NOT NULL DEFAULT nextval('produtos_idprodutos_seq'::regclass),
  datacadastro date DEFAULT now(),
  descricao character varying(255),
  estoque character varying(255),
  quantidade character varying(255),
  status character varying(255),
  valorunitario character varying(255),
  CONSTRAINT produtos_pkey PRIMARY KEY (idprodutos)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.produtos
  OWNER TO postgres;


-- Table: public.pedidos

-- DROP TABLE public.pedidos;

CREATE TABLE public.pedidos
(
  idpedidos bigint NOT NULL DEFAULT nextval('pedidos_idpedidos_seq'::regclass),
  datapedido date DEFAULT now(),
  fkpessoas bigint,
  fkprodutos bigint,
  CONSTRAINT pedidos_pkey PRIMARY KEY (idpedidos),
  CONSTRAINT fk5xnot9ypecfe49tf9kmk9s0fl FOREIGN KEY (fkpessoas)
      REFERENCES public.pessoas (idpessoa) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkcirme5d4mj7phdnrq6rvqxip9 FOREIGN KEY (fkprodutos)
      REFERENCES public.produtos (idprodutos) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.pedidos
  OWNER TO postgres;
