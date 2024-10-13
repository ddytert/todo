--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8 (Postgres.app)
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: access_levels; Type: TABLE; Schema: public; Owner: ddytert
--

CREATE TABLE public.access_levels (
    id integer NOT NULL,
    level character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.access_levels OWNER TO ddytert;

--
-- Name: access_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: ddytert
--

CREATE SEQUENCE public.access_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.access_levels_id_seq OWNER TO ddytert;

--
-- Name: access_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddytert
--

ALTER SEQUENCE public.access_levels_id_seq OWNED BY public.access_levels.id;


--
-- Name: priorities; Type: TABLE; Schema: public; Owner: ddytert
--

CREATE TABLE public.priorities (
    id integer NOT NULL,
    priority character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.priorities OWNER TO ddytert;

--
-- Name: priorities_id_seq; Type: SEQUENCE; Schema: public; Owner: ddytert
--

CREATE SEQUENCE public.priorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.priorities_id_seq OWNER TO ddytert;

--
-- Name: priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddytert
--

ALTER SEQUENCE public.priorities_id_seq OWNED BY public.priorities.id;


--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: ddytert
--

CREATE TABLE public.schema_migration (
    version character varying(14) NOT NULL
);


ALTER TABLE public.schema_migration OWNER TO ddytert;

--
-- Name: states; Type: TABLE; Schema: public; Owner: ddytert
--

CREATE TABLE public.states (
    id integer NOT NULL,
    state character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.states OWNER TO ddytert;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: ddytert
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.states_id_seq OWNER TO ddytert;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddytert
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: todo_lists; Type: TABLE; Schema: public; Owner: ddytert
--

CREATE TABLE public.todo_lists (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) DEFAULT ''::character varying NOT NULL,
    done boolean DEFAULT false NOT NULL,
    state_id integer NOT NULL,
    priority_id integer NOT NULL,
    due_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.todo_lists OWNER TO ddytert;

--
-- Name: todo_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: ddytert
--

CREATE SEQUENCE public.todo_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.todo_lists_id_seq OWNER TO ddytert;

--
-- Name: todo_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddytert
--

ALTER SEQUENCE public.todo_lists_id_seq OWNED BY public.todo_lists.id;


--
-- Name: todos; Type: TABLE; Schema: public; Owner: ddytert
--

CREATE TABLE public.todos (
    id integer NOT NULL,
    todo_list_id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) NOT NULL,
    content character varying(255) DEFAULT ''::character varying NOT NULL,
    done boolean DEFAULT false NOT NULL,
    state_id integer NOT NULL,
    priority_id integer NOT NULL,
    due_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.todos OWNER TO ddytert;

--
-- Name: todos_id_seq; Type: SEQUENCE; Schema: public; Owner: ddytert
--

CREATE SEQUENCE public.todos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.todos_id_seq OWNER TO ddytert;

--
-- Name: todos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddytert
--

ALTER SEQUENCE public.todos_id_seq OWNED BY public.todos.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ddytert
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(255) DEFAULT ''::character varying NOT NULL,
    last_name character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(60) NOT NULL,
    access_level_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO ddytert;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ddytert
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO ddytert;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddytert
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: access_levels id; Type: DEFAULT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.access_levels ALTER COLUMN id SET DEFAULT nextval('public.access_levels_id_seq'::regclass);


--
-- Name: priorities id; Type: DEFAULT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.priorities ALTER COLUMN id SET DEFAULT nextval('public.priorities_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: todo_lists id; Type: DEFAULT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todo_lists ALTER COLUMN id SET DEFAULT nextval('public.todo_lists_id_seq'::regclass);


--
-- Name: todos id; Type: DEFAULT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todos ALTER COLUMN id SET DEFAULT nextval('public.todos_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: access_levels access_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.access_levels
    ADD CONSTRAINT access_levels_pkey PRIMARY KEY (id);


--
-- Name: priorities priorities_pkey; Type: CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT priorities_pkey PRIMARY KEY (id);


--
-- Name: schema_migration schema_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.schema_migration
    ADD CONSTRAINT schema_migration_pkey PRIMARY KEY (version);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: todo_lists todo_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todo_lists
    ADD CONSTRAINT todo_lists_pkey PRIMARY KEY (id);


--
-- Name: todos todos_pkey; Type: CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT todos_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: schema_migration_version_idx; Type: INDEX; Schema: public; Owner: ddytert
--

CREATE UNIQUE INDEX schema_migration_version_idx ON public.schema_migration USING btree (version);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: ddytert
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: todo_lists todo_lists_priorities_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todo_lists
    ADD CONSTRAINT todo_lists_priorities_id_fk FOREIGN KEY (priority_id) REFERENCES public.priorities(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: todo_lists todo_lists_states_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todo_lists
    ADD CONSTRAINT todo_lists_states_id_fk FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: todo_lists todo_lists_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todo_lists
    ADD CONSTRAINT todo_lists_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: todos todos_priorities_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT todos_priorities_id_fk FOREIGN KEY (priority_id) REFERENCES public.priorities(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: todos todos_states_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT todos_states_id_fk FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: todos todos_todo_lists_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT todos_todo_lists_id_fk FOREIGN KEY (todo_list_id) REFERENCES public.todo_lists(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: todos todos_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT todos_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_access_levels_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ddytert
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_access_levels_id_fk FOREIGN KEY (access_level_id) REFERENCES public.access_levels(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

