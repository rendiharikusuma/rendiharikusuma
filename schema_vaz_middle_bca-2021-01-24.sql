--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.3

-- Started on 2021-01-24 14:01:03 WIB

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
-- TOC entry 205 (class 1259 OID 168921)
-- Name: bank_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_account (
    id integer NOT NULL,
    account_number character varying(25),
    account_name character varying(50),
    status integer,
    currency_id integer,
    create_date timestamp with time zone,
    update_date timestamp with time zone
);


ALTER TABLE public.bank_account OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 168919)
-- Name: bank_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_account_id_seq OWNER TO postgres;

--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 204
-- Name: bank_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_account_id_seq OWNED BY public.bank_account.id;


--
-- TOC entry 208 (class 1259 OID 168952)
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 168954)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer DEFAULT nextval('public.client_id_seq'::regclass) NOT NULL,
    client_id character varying(100),
    name character varying(100),
    status integer,
    create_date timestamp with time zone,
    update_date timestamp with time zone,
    partner_client_id character varying(25),
    partner_name character varying,
    shared_key character varying
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 168963)
-- Name: client_bank_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_bank_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_bank_account_id_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 168965)
-- Name: client_bank_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_bank_account (
    id integer DEFAULT nextval('public.client_bank_account_id_seq'::regclass) NOT NULL,
    client_id integer,
    bank_account_id integer,
    status integer,
    create_date timestamp with time zone,
    update_date timestamp with time zone
);


ALTER TABLE public.client_bank_account OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 168939)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 168941)
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    id integer DEFAULT nextval('public.currency_id_seq'::regclass) NOT NULL,
    code character varying(10),
    alpha2_code character varying(2),
    alpha3_code character varying(3),
    numeric_code integer,
    description character varying(50),
    create_date timestamp with time zone,
    update_date timestamp with time zone
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 168892)
-- Name: generator_postfix_amount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.generator_postfix_amount (
    id integer NOT NULL,
    bank_account_id integer,
    postfix_amount numeric(17,6),
    order_id bigint,
    create_date timestamp with time zone,
    update_date timestamp with time zone
);


ALTER TABLE public.generator_postfix_amount OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 169052)
-- Name: order_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_history (
    id bigint NOT NULL,
    client_id integer,
    bank_account_id integer,
    invoice_number character varying,
    amount numeric(17,6),
    postfix_amount numeric(17,6),
    total_amount numeric(17,6),
    customer_name character varying,
    customer_email character varying,
    customer_phone character varying,
    sender_account_number character varying,
    sender_account_name character varying,
    partner_client_id character varying,
    partner_client_name character varying,
    status integer,
    info1 character varying,
    info2 character varying,
    info3 character varying,
    expired_date timestamp with time zone,
    create_date timestamp with time zone,
    update_date timestamp with time zone,
    order_date timestamp with time zone,
    jdm_uuid numeric(40,0)
);


ALTER TABLE public.order_history OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 169050)
-- Name: order_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_history_id_seq OWNER TO postgres;

--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 212
-- Name: order_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_history_id_seq OWNED BY public.order_history.id;


--
-- TOC entry 203 (class 1259 OID 168895)
-- Name: postfix_unique_amount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.postfix_unique_amount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.postfix_unique_amount_id_seq OWNER TO postgres;

--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 203
-- Name: postfix_unique_amount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.postfix_unique_amount_id_seq OWNED BY public.generator_postfix_amount.id;


--
-- TOC entry 214 (class 1259 OID 169061)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 169070)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id bigint DEFAULT nextval('public.transaction_id_seq'::regclass) NOT NULL,
    client_id integer,
    bank_account_id integer,
    invoice_number character varying,
    amount numeric(17,6),
    postfix_amount numeric(17,6),
    total_amount numeric(17,6),
    customer_name character varying,
    customer_email character varying,
    customer_phone character varying,
    sender_account_number character varying,
    sender_account_name character varying,
    partner_client_id character varying,
    partner_client_name character varying,
    status integer,
    info1 character varying,
    info2 character varying,
    info3 character varying,
    create_date timestamp with time zone,
    update_date timestamp with time zone,
    order_history_id bigint,
    transaction_name character varying,
    transaction_type character varying,
    transaction_amount character varying,
    branch_code character varying,
    transaction_date character varying,
    trailer character varying,
    order_date timestamp with time zone,
    jdm_uuid numeric(40,0)
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 3044 (class 2604 OID 168924)
-- Name: bank_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account ALTER COLUMN id SET DEFAULT nextval('public.bank_account_id_seq'::regclass);


--
-- TOC entry 3043 (class 2604 OID 168897)
-- Name: generator_postfix_amount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generator_postfix_amount ALTER COLUMN id SET DEFAULT nextval('public.postfix_unique_amount_id_seq'::regclass);


--
-- TOC entry 3048 (class 2604 OID 169055)
-- Name: order_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history ALTER COLUMN id SET DEFAULT nextval('public.order_history_id_seq'::regclass);


--
-- TOC entry 3053 (class 2606 OID 168926)
-- Name: bank_account bank_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_pkey PRIMARY KEY (id);


--
-- TOC entry 3059 (class 2606 OID 168970)
-- Name: client_bank_account client_bank_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_bank_account
    ADD CONSTRAINT client_bank_account_pkey PRIMARY KEY (id);


--
-- TOC entry 3057 (class 2606 OID 168959)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 3055 (class 2606 OID 168946)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- TOC entry 3061 (class 2606 OID 169060)
-- Name: order_history order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 3051 (class 2606 OID 168902)
-- Name: generator_postfix_amount postfix_unique_amount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generator_postfix_amount
    ADD CONSTRAINT postfix_unique_amount_pkey PRIMARY KEY (id);


--
-- TOC entry 3063 (class 2606 OID 169078)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 3066 (class 2606 OID 168971)
-- Name: client_bank_account fk_bank_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_bank_account
    ADD CONSTRAINT fk_bank_account_id FOREIGN KEY (bank_account_id) REFERENCES public.bank_account(id);


--
-- TOC entry 3068 (class 2606 OID 169088)
-- Name: order_history fk_bank_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT fk_bank_account_id FOREIGN KEY (bank_account_id) REFERENCES public.bank_account(id);


--
-- TOC entry 3070 (class 2606 OID 169098)
-- Name: transaction fk_bank_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_bank_account_id FOREIGN KEY (bank_account_id) REFERENCES public.bank_account(id);


--
-- TOC entry 3067 (class 2606 OID 168976)
-- Name: client_bank_account fk_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_bank_account
    ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3069 (class 2606 OID 169093)
-- Name: order_history fk_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3071 (class 2606 OID 169103)
-- Name: transaction fk_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3065 (class 2606 OID 168947)
-- Name: bank_account fk_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT fk_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(id);


--
-- TOC entry 3064 (class 2606 OID 169083)
-- Name: generator_postfix_amount fk_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generator_postfix_amount
    ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES public.order_history(id);


--
-- TOC entry 3072 (class 2606 OID 169108)
-- Name: transaction fk_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_order_id FOREIGN KEY (order_history_id) REFERENCES public.order_history(id);


-- Completed on 2021-01-24 14:01:25 WIB

--
-- PostgreSQL database dump complete
--

