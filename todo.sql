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
-- Name: access_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.access_levels (
    id integer NOT NULL,
    level character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: access_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.access_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: access_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.access_levels_id_seq OWNED BY public.access_levels.id;


--
-- Name: priorities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.priorities (
    id integer NOT NULL,
    priority character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: priorities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.priorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.priorities_id_seq OWNED BY public.priorities.id;


--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migration (
    version character varying(14) NOT NULL
);


--
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id integer NOT NULL,
    state character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: task_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_lists (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) DEFAULT ''::character varying NOT NULL,
    state_id integer NOT NULL,
    priority_id integer NOT NULL,
    due_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: task_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: task_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.task_lists_id_seq OWNED BY public.task_lists.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    task_list_id integer NOT NULL,
    title character varying(255) NOT NULL,
    content character varying(255) DEFAULT ''::character varying NOT NULL,
    state_id integer NOT NULL,
    priority_id integer NOT NULL,
    due_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    done boolean DEFAULT false NOT NULL
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: access_levels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_levels ALTER COLUMN id SET DEFAULT nextval('public.access_levels_id_seq'::regclass);


--
-- Name: priorities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.priorities ALTER COLUMN id SET DEFAULT nextval('public.priorities_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: task_lists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_lists ALTER COLUMN id SET DEFAULT nextval('public.task_lists_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: access_levels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.access_levels (id, level, created_at, updated_at) FROM stdin;
1	basic	2024-07-13 08:18:00	2024-07-13 08:18:00
2	user	2024-07-13 08:20:00	2024-07-13 08:20:00
3	admin	2024-07-13 08:21:00	2024-07-13 08:21:00
4	master of the universe	2024-07-13 08:22:00	2024-07-13 08:22:00
\.


--
-- Data for Name: priorities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.priorities (id, priority, created_at, updated_at) FROM stdin;
1	low	2024-07-13 08:22:00	2024-07-13 08:22:00
2	normal	2024-07-13 08:22:20	2024-07-13 08:22:20
4	highest	2024-08-17 08:52:50	2024-08-18 09:00:30
3	high	2024-07-13 08:22:50	2024-08-18 09:00:30
\.


--
-- Data for Name: schema_migration; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migration (version) FROM stdin;
20240704172309
20240704173810
20240704175026
20240704175832
20240704180031
20240704180215
20240705053906
20240705055923
20240705154830
20240706063644
20240713064651
20240714063044
20240714065933
20240714070719
20240718143850
20240827060742
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.states (id, state, created_at, updated_at) FROM stdin;
1	new	2024-07-13 08:25:00	2024-07-13 08:25:00
2	active	2024-07-13 08:25:30	2024-07-13 08:25:30
3	deferred	2024-07-13 08:26:00	2024-07-13 08:26:00
4	deleted	2024-07-13 08:26:30	2024-07-13 08:26:30
\.


--
-- Data for Name: task_lists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.task_lists (id, user_id, name, description, state_id, priority_id, due_date, created_at, updated_at) FROM stdin;
1	1	My Happy Tasks	My favorite tasks	1	1	\N	2024-07-13 09:20:00	2024-07-13 09:20:00
2	1	My Unhappy Tasks	My least favorite tasks	1	1	\N	2024-07-18 09:20:00	2024-07-18 09:20:00
3	2	My Secret Tasks	Strictly forbidden	1	1	\N	2024-07-18 16:30:00	2024-07-18 16:30:00
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tasks (id, task_list_id, title, content, state_id, priority_id, due_date, created_at, updated_at, user_id, done) FROM stdin;
1	1	Finish wireless project	nRF24L01 and Arduino nano	1	1	\N	2024-07-14 08:25:00	2024-07-14 08:25:00	1	f
4	1	Go  swiming	Make a trip to a lake with.the family	1	1	\N	2024-07-14 08:35:00	2024-07-14 08:35:00	1	f
6	2	Clean windows	Splishy splashy	1	1	\N	2024-07-18 09:30:00	2024-07-18 09:30:00	1	f
3	1	Bake a cake	Bake a delicious apple pie	1	1	\N	2024-07-14 08:30:00	2024-07-14 08:30:00	1	f
7	2	Dentist appointment	Ouch!	1	1	\N	2024-07-18 09:34:00	2024-07-18 09:34:00	1	f
5	2	Take out the trash	Stinky winnky	1	1	2024-11-10 09:20:00	2024-07-18 09:20:00	2024-07-18 10:20:00	1	f
9	3	Rob bank	Get money	1	1	2024-11-20 16:30:00	2024-07-18 16:30:00	2024-07-18 16:30:00	2	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, first_name, last_name, email, password, access_level_id, created_at, updated_at) FROM stdin;
1	Daniel	Dytert	ddytert@yahoo.com	rambazamba	4	2024-07-13 08:30:00	2024-07-13 08:30:00
2	Ruby	Scheuer	ruby@scheuer.com	schuidu	2	2024-07-18 16:30:00	2024-07-18 16:30:00
\.


--
-- Name: access_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.access_levels_id_seq', 2, true);


--
-- Name: priorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.priorities_id_seq', 2, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 1, false);


--
-- Name: task_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.task_lists_id_seq', 3, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tasks_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: access_levels access_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_levels
    ADD CONSTRAINT access_levels_pkey PRIMARY KEY (id);


--
-- Name: priorities priorities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT priorities_pkey PRIMARY KEY (id);


--
-- Name: schema_migration schema_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migration
    ADD CONSTRAINT schema_migration_pkey PRIMARY KEY (version);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: task_lists task_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_lists
    ADD CONSTRAINT task_lists_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: schema_migration_version_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX schema_migration_version_idx ON public.schema_migration USING btree (version);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: task_lists task_lists_priorities_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_lists
    ADD CONSTRAINT task_lists_priorities_id_fk FOREIGN KEY (priority_id) REFERENCES public.priorities(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: task_lists task_lists_states_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_lists
    ADD CONSTRAINT task_lists_states_id_fk FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: task_lists task_lists_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_lists
    ADD CONSTRAINT task_lists_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tasks tasks_priorities_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_priorities_id_fk FOREIGN KEY (priority_id) REFERENCES public.priorities(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: tasks tasks_states_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_states_id_fk FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: tasks tasks_task_lists_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_task_lists_id_fk FOREIGN KEY (task_list_id) REFERENCES public.task_lists(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: tasks tasks_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_access_levels_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_access_levels_id_fk FOREIGN KEY (access_level_id) REFERENCES public.access_levels(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

