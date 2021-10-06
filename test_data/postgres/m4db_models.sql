--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

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
-- Name: anisotropy_form; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.anisotropy_form (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.anisotropy_form OWNER TO lnagy2;

--
-- Name: anisotropy_form_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.anisotropy_form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anisotropy_form_id_seq OWNER TO lnagy2;

--
-- Name: anisotropy_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.anisotropy_form_id_seq OWNED BY public.anisotropy_form.id;


--
-- Name: db_user; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.db_user (
    id integer NOT NULL,
    user_name character varying NOT NULL,
    password character varying NOT NULL,
    first_name character varying NOT NULL,
    initials character varying,
    surname character varying NOT NULL,
    email character varying NOT NULL,
    telephone character varying,
    ticket_hash character varying,
    ticket_length integer NOT NULL,
    ticket_timeout timestamp without time zone NOT NULL,
    access_level integer NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.db_user OWNER TO lnagy2;

--
-- Name: db_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.db_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_user_id_seq OWNER TO lnagy2;

--
-- Name: db_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.db_user_id_seq OWNED BY public.db_user.id;


--
-- Name: field; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.field (
    id integer NOT NULL,
    type character varying NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.field OWNER TO lnagy2;

--
-- Name: field_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.field_id_seq OWNER TO lnagy2;

--
-- Name: field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.field_id_seq OWNED BY public.field.id;


--
-- Name: geometry; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.geometry (
    id integer NOT NULL,
    unique_id character varying NOT NULL,
    name character varying NOT NULL,
    size numeric(10,5) NOT NULL,
    element_size numeric(10,5),
    description character varying,
    nelements integer NOT NULL,
    nvertices integer NOT NULL,
    nsubmeshes integer NOT NULL,
    volume_total double precision,
    has_patran boolean NOT NULL,
    has_exodus boolean NOT NULL,
    has_mesh_gen_script boolean NOT NULL,
    has_mesh_gen_output boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    size_unit_id integer NOT NULL,
    element_size_unit_id integer,
    size_convention_id integer NOT NULL,
    software_id integer
);


ALTER TABLE public.geometry OWNER TO lnagy2;

--
-- Name: geometry_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.geometry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geometry_id_seq OWNER TO lnagy2;

--
-- Name: geometry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.geometry_id_seq OWNED BY public.geometry.id;


--
-- Name: legacy_model_info; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.legacy_model_info (
    id integer NOT NULL,
    legacy_model_id integer NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.legacy_model_info OWNER TO lnagy2;

--
-- Name: legacy_model_info_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.legacy_model_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.legacy_model_info_id_seq OWNER TO lnagy2;

--
-- Name: legacy_model_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.legacy_model_info_id_seq OWNED BY public.legacy_model_info.id;


--
-- Name: material; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.material (
    id integer NOT NULL,
    name character varying NOT NULL,
    temperature numeric(8,3) NOT NULL,
    k1 double precision NOT NULL,
    aex double precision NOT NULL,
    ms double precision NOT NULL,
    kd double precision NOT NULL,
    lambda_ex double precision,
    q_hardness double precision,
    axis_theta double precision,
    axis_phi double precision,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    anisotropy_form_id integer NOT NULL
);


ALTER TABLE public.material OWNER TO lnagy2;

--
-- Name: material_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.material_id_seq OWNER TO lnagy2;

--
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.material_id_seq OWNED BY public.material.id;


--
-- Name: metadata; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.metadata (
    id integer NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    project_id integer NOT NULL,
    db_user_id integer NOT NULL,
    software_id integer
);


ALTER TABLE public.metadata OWNER TO lnagy2;

--
-- Name: metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metadata_id_seq OWNER TO lnagy2;

--
-- Name: metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.metadata_id_seq OWNED BY public.metadata.id;


--
-- Name: model; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.model (
    id integer NOT NULL,
    unique_id character varying NOT NULL,
    mx_tot double precision,
    my_tot double precision,
    mz_tot double precision,
    vx_tot double precision,
    vy_tot double precision,
    vz_tot double precision,
    h_tot double precision,
    rh_tot double precision,
    adm_tot double precision,
    e_typical double precision,
    e_anis double precision,
    e_ext double precision,
    e_demag double precision,
    e_exch1 double precision,
    e_exch2 double precision,
    e_exch3 double precision,
    e_exch4 double precision,
    e_tot double precision,
    volume double precision,
    max_energy_evaluations integer NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    geometry_id integer NOT NULL,
    model_materials_text_id integer NOT NULL,
    start_magnetization_id integer NOT NULL,
    external_field_id integer,
    running_status_id integer NOT NULL,
    model_run_data_id integer NOT NULL,
    model_report_data_id integer NOT NULL,
    mdata_id integer NOT NULL,
    legacy_model_info_id integer
);


ALTER TABLE public.model OWNER TO lnagy2;

--
-- Name: model_field; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.model_field (
    id integer NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.model_field OWNER TO lnagy2;

--
-- Name: model_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_id_seq OWNER TO lnagy2;

--
-- Name: model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.model_id_seq OWNED BY public.model.id;


--
-- Name: model_material_association; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.model_material_association (
    model_id integer NOT NULL,
    material_id integer NOT NULL,
    submesh_id integer NOT NULL
);


ALTER TABLE public.model_material_association OWNER TO lnagy2;

--
-- Name: model_materials_text; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.model_materials_text (
    id integer NOT NULL,
    materials character varying NOT NULL,
    submeshidxs_materials character varying NOT NULL,
    submeshidxs_materials_temperatures character varying NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.model_materials_text OWNER TO lnagy2;

--
-- Name: model_materials_text_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.model_materials_text_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_materials_text_id_seq OWNER TO lnagy2;

--
-- Name: model_materials_text_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.model_materials_text_id_seq OWNED BY public.model_materials_text.id;


--
-- Name: model_report_data; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.model_report_data (
    id integer NOT NULL,
    has_xy_thumb_png boolean NOT NULL,
    has_yz_thumb_png boolean NOT NULL,
    has_xz_thumb_png boolean NOT NULL,
    has_xy_png boolean NOT NULL,
    has_yz_png boolean NOT NULL,
    has_xz_png boolean NOT NULL
);


ALTER TABLE public.model_report_data OWNER TO lnagy2;

--
-- Name: model_report_data_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.model_report_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_report_data_id_seq OWNER TO lnagy2;

--
-- Name: model_report_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.model_report_data_id_seq OWNED BY public.model_report_data.id;


--
-- Name: model_run_data; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.model_run_data (
    id integer NOT NULL,
    has_script boolean NOT NULL,
    has_stdout boolean NOT NULL,
    has_stderr boolean NOT NULL,
    has_energy_log boolean NOT NULL,
    has_tecplot boolean NOT NULL,
    has_json boolean NOT NULL,
    has_dat boolean NOT NULL,
    has_helicity_dat boolean NOT NULL,
    has_vorticity_dat boolean NOT NULL,
    has_adm_dat boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.model_run_data OWNER TO lnagy2;

--
-- Name: model_run_data_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.model_run_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_run_data_id_seq OWNER TO lnagy2;

--
-- Name: model_run_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.model_run_data_id_seq OWNED BY public.model_run_data.id;


--
-- Name: neb; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.neb (
    id integer NOT NULL,
    unique_id character varying NOT NULL,
    spring_constant double precision,
    curvature_weight double precision,
    no_of_points integer,
    max_energy_evaluations integer NOT NULL,
    max_path_evaluations integer NOT NULL,
    energy_barrier double precision,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    external_field_id integer,
    start_model_id integer NOT NULL,
    end_model_id integer NOT NULL,
    parent_neb_id integer,
    neb_calculation_type_id integer NOT NULL,
    neb_run_data_id integer NOT NULL,
    neb_report_data_id integer NOT NULL,
    running_status_id integer NOT NULL,
    mdata_id integer NOT NULL
);


ALTER TABLE public.neb OWNER TO lnagy2;

--
-- Name: neb_calculation_type; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.neb_calculation_type (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.neb_calculation_type OWNER TO lnagy2;

--
-- Name: neb_calculation_type_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.neb_calculation_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.neb_calculation_type_id_seq OWNER TO lnagy2;

--
-- Name: neb_calculation_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.neb_calculation_type_id_seq OWNED BY public.neb_calculation_type.id;


--
-- Name: neb_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.neb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.neb_id_seq OWNER TO lnagy2;

--
-- Name: neb_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.neb_id_seq OWNED BY public.neb.id;


--
-- Name: neb_model_split; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.neb_model_split (
    id integer NOT NULL,
    image_number integer NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    neb_id integer NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.neb_model_split OWNER TO lnagy2;

--
-- Name: neb_report_data; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.neb_report_data (
    id integer NOT NULL,
    has_x_thumb_png boolean NOT NULL,
    has_y_thumb_png boolean NOT NULL,
    has_z_thumb_png boolean NOT NULL,
    has_x_png boolean NOT NULL,
    has_y_png boolean NOT NULL,
    has_z_png boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.neb_report_data OWNER TO lnagy2;

--
-- Name: neb_report_data_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.neb_report_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.neb_report_data_id_seq OWNER TO lnagy2;

--
-- Name: neb_report_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.neb_report_data_id_seq OWNED BY public.neb_report_data.id;


--
-- Name: neb_run_data; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.neb_run_data (
    id integer NOT NULL,
    has_script boolean NOT NULL,
    has_stdout boolean NOT NULL,
    has_stderr boolean NOT NULL,
    has_energy_log boolean NOT NULL,
    has_tecplot boolean NOT NULL,
    has_neb_energies boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.neb_run_data OWNER TO lnagy2;

--
-- Name: neb_run_data_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.neb_run_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.neb_run_data_id_seq OWNER TO lnagy2;

--
-- Name: neb_run_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.neb_run_data_id_seq OWNED BY public.neb_run_data.id;


--
-- Name: physical_constant; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.physical_constant (
    id integer NOT NULL,
    symbol character varying NOT NULL,
    name character varying NOT NULL,
    value double precision NOT NULL,
    unit character varying NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.physical_constant OWNER TO lnagy2;

--
-- Name: physical_constant_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.physical_constant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physical_constant_id_seq OWNER TO lnagy2;

--
-- Name: physical_constant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.physical_constant_id_seq OWNED BY public.physical_constant.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.project (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.project OWNER TO lnagy2;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO lnagy2;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: random_field; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.random_field (
    id integer NOT NULL,
    seed integer,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.random_field OWNER TO lnagy2;

--
-- Name: running_status; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.running_status (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.running_status OWNER TO lnagy2;

--
-- Name: running_status_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.running_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.running_status_id_seq OWNER TO lnagy2;

--
-- Name: running_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.running_status_id_seq OWNED BY public.running_status.id;


--
-- Name: size_convention; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.size_convention (
    id integer NOT NULL,
    symbol character varying NOT NULL,
    description character varying NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.size_convention OWNER TO lnagy2;

--
-- Name: size_convention_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.size_convention_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.size_convention_id_seq OWNER TO lnagy2;

--
-- Name: size_convention_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.size_convention_id_seq OWNED BY public.size_convention.id;


--
-- Name: software; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.software (
    id integer NOT NULL,
    name character varying NOT NULL,
    version character varying NOT NULL,
    executable character varying,
    description character varying,
    url character varying,
    citation character varying,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.software OWNER TO lnagy2;

--
-- Name: software_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.software_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.software_id_seq OWNER TO lnagy2;

--
-- Name: software_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.software_id_seq OWNED BY public.software.id;


--
-- Name: uniform_field; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.uniform_field (
    id integer NOT NULL,
    theta double precision NOT NULL,
    phi double precision NOT NULL,
    dir_x double precision NOT NULL,
    dir_y double precision NOT NULL,
    dir_z double precision NOT NULL,
    magnitude double precision NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    unit_id integer NOT NULL
);


ALTER TABLE public.uniform_field OWNER TO lnagy2;

--
-- Name: unit; Type: TABLE; Schema: public; Owner: lnagy2
--

CREATE TABLE public.unit (
    id integer NOT NULL,
    symbol character varying NOT NULL,
    name character varying NOT NULL,
    power double precision NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.unit OWNER TO lnagy2;

--
-- Name: unit_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagy2
--

CREATE SEQUENCE public.unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_id_seq OWNER TO lnagy2;

--
-- Name: unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagy2
--

ALTER SEQUENCE public.unit_id_seq OWNED BY public.unit.id;


--
-- Name: anisotropy_form id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.anisotropy_form ALTER COLUMN id SET DEFAULT nextval('public.anisotropy_form_id_seq'::regclass);


--
-- Name: db_user id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.db_user ALTER COLUMN id SET DEFAULT nextval('public.db_user_id_seq'::regclass);


--
-- Name: field id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.field ALTER COLUMN id SET DEFAULT nextval('public.field_id_seq'::regclass);


--
-- Name: geometry id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.geometry ALTER COLUMN id SET DEFAULT nextval('public.geometry_id_seq'::regclass);


--
-- Name: legacy_model_info id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.legacy_model_info ALTER COLUMN id SET DEFAULT nextval('public.legacy_model_info_id_seq'::regclass);


--
-- Name: material id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.material ALTER COLUMN id SET DEFAULT nextval('public.material_id_seq'::regclass);


--
-- Name: metadata id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.metadata ALTER COLUMN id SET DEFAULT nextval('public.metadata_id_seq'::regclass);


--
-- Name: model id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model ALTER COLUMN id SET DEFAULT nextval('public.model_id_seq'::regclass);


--
-- Name: model_materials_text id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_materials_text ALTER COLUMN id SET DEFAULT nextval('public.model_materials_text_id_seq'::regclass);


--
-- Name: model_report_data id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_report_data ALTER COLUMN id SET DEFAULT nextval('public.model_report_data_id_seq'::regclass);


--
-- Name: model_run_data id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_run_data ALTER COLUMN id SET DEFAULT nextval('public.model_run_data_id_seq'::regclass);


--
-- Name: neb id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb ALTER COLUMN id SET DEFAULT nextval('public.neb_id_seq'::regclass);


--
-- Name: neb_calculation_type id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb_calculation_type ALTER COLUMN id SET DEFAULT nextval('public.neb_calculation_type_id_seq'::regclass);


--
-- Name: neb_report_data id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb_report_data ALTER COLUMN id SET DEFAULT nextval('public.neb_report_data_id_seq'::regclass);


--
-- Name: neb_run_data id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb_run_data ALTER COLUMN id SET DEFAULT nextval('public.neb_run_data_id_seq'::regclass);


--
-- Name: physical_constant id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.physical_constant ALTER COLUMN id SET DEFAULT nextval('public.physical_constant_id_seq'::regclass);


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: running_status id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.running_status ALTER COLUMN id SET DEFAULT nextval('public.running_status_id_seq'::regclass);


--
-- Name: size_convention id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.size_convention ALTER COLUMN id SET DEFAULT nextval('public.size_convention_id_seq'::regclass);


--
-- Name: software id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.software ALTER COLUMN id SET DEFAULT nextval('public.software_id_seq'::regclass);


--
-- Name: unit id; Type: DEFAULT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.unit ALTER COLUMN id SET DEFAULT nextval('public.unit_id_seq'::regclass);


--
-- Data for Name: anisotropy_form; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.anisotropy_form (id, name, description, last_modified, created) FROM stdin;
1	cubic	Cubic anisotorpy form	2021-09-30 21:46:24.018951	2021-09-30 21:46:24.018961
2	uniaxial	Uniaxial anisotropy form	2021-09-30 21:46:24.018966	2021-09-30 21:46:24.01897
\.


--
-- Data for Name: db_user; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.db_user (id, user_name, password, first_name, initials, surname, email, telephone, ticket_hash, ticket_length, ticket_timeout, access_level, last_modified, created) FROM stdin;
1	lnagy2	441ee72a9e3546049789dbfc1930d60d	Lesleis	\N	Nagy	l1nagy@ucsd.edu	\N	\N	3600	1970-01-01 00:00:00	4	2021-09-30 21:46:24.730019	2021-09-30 21:46:24.730026
\.


--
-- Data for Name: field; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.field (id, type, last_modified, created) FROM stdin;
1	random_field	2021-09-30 21:46:28.061715	2021-09-30 21:46:28.061726
2	random_field	2021-09-30 21:46:28.08102	2021-09-30 21:46:28.081026
3	random_field	2021-09-30 21:46:28.08735	2021-09-30 21:46:28.087356
4	random_field	2021-09-30 21:46:28.093283	2021-09-30 21:46:28.093288
5	random_field	2021-09-30 21:46:28.09926	2021-09-30 21:46:28.099264
6	random_field	2021-09-30 21:46:28.105504	2021-09-30 21:46:28.105509
7	random_field	2021-09-30 21:46:28.112042	2021-09-30 21:46:28.112047
8	random_field	2021-09-30 21:46:28.118175	2021-09-30 21:46:28.11818
9	random_field	2021-09-30 21:46:28.124125	2021-09-30 21:46:28.12413
10	random_field	2021-09-30 21:46:28.130384	2021-09-30 21:46:28.130389
11	random_field	2021-09-30 21:46:28.136597	2021-09-30 21:46:28.136601
12	random_field	2021-09-30 21:46:28.142855	2021-09-30 21:46:28.14286
13	random_field	2021-09-30 21:46:28.149059	2021-09-30 21:46:28.149064
14	random_field	2021-09-30 21:46:28.155229	2021-09-30 21:46:28.155234
15	random_field	2021-09-30 21:46:28.161342	2021-09-30 21:46:28.161347
16	random_field	2021-09-30 21:46:28.167701	2021-09-30 21:46:28.167706
17	random_field	2021-09-30 21:46:28.174271	2021-09-30 21:46:28.174276
18	random_field	2021-09-30 21:46:28.180859	2021-09-30 21:46:28.180865
19	random_field	2021-09-30 21:46:28.187741	2021-09-30 21:46:28.187746
20	random_field	2021-09-30 21:46:28.194038	2021-09-30 21:46:28.194044
21	random_field	2021-09-30 21:46:28.199995	2021-09-30 21:46:28.2
22	random_field	2021-09-30 21:46:28.206141	2021-09-30 21:46:28.206146
23	random_field	2021-09-30 21:46:28.212616	2021-09-30 21:46:28.212621
24	random_field	2021-09-30 21:46:28.219635	2021-09-30 21:46:28.21964
25	random_field	2021-09-30 21:46:28.226083	2021-09-30 21:46:28.226088
26	random_field	2021-09-30 21:46:28.232436	2021-09-30 21:46:28.232442
27	random_field	2021-09-30 21:46:28.238954	2021-09-30 21:46:28.238959
28	random_field	2021-09-30 21:46:28.245609	2021-09-30 21:46:28.245617
29	random_field	2021-09-30 21:46:28.25277	2021-09-30 21:46:28.252776
30	random_field	2021-09-30 21:46:28.259013	2021-09-30 21:46:28.259019
31	random_field	2021-09-30 21:46:28.265513	2021-09-30 21:46:28.265518
32	random_field	2021-09-30 21:46:28.271749	2021-09-30 21:46:28.271755
33	random_field	2021-09-30 21:46:28.278153	2021-09-30 21:46:28.278158
34	random_field	2021-09-30 21:46:28.285591	2021-09-30 21:46:28.285596
35	random_field	2021-09-30 21:46:28.293114	2021-09-30 21:46:28.293119
36	random_field	2021-09-30 21:46:28.300692	2021-09-30 21:46:28.300697
37	random_field	2021-09-30 21:46:28.308008	2021-09-30 21:46:28.308013
38	random_field	2021-09-30 21:46:28.315127	2021-09-30 21:46:28.315132
39	random_field	2021-09-30 21:46:28.322872	2021-09-30 21:46:28.322878
40	random_field	2021-09-30 21:46:28.33049	2021-09-30 21:46:28.330496
41	random_field	2021-09-30 21:46:28.337412	2021-09-30 21:46:28.337418
42	random_field	2021-09-30 21:46:28.344617	2021-09-30 21:46:28.344623
43	random_field	2021-09-30 21:46:28.352596	2021-09-30 21:46:28.352602
44	random_field	2021-09-30 21:46:28.35935	2021-09-30 21:46:28.359356
45	random_field	2021-09-30 21:46:28.366606	2021-09-30 21:46:28.366612
46	random_field	2021-09-30 21:46:28.374069	2021-09-30 21:46:28.374074
47	random_field	2021-09-30 21:46:28.381107	2021-09-30 21:46:28.381112
48	random_field	2021-09-30 21:46:28.388454	2021-09-30 21:46:28.38846
49	random_field	2021-09-30 21:46:28.396224	2021-09-30 21:46:28.396233
50	random_field	2021-09-30 21:46:28.402823	2021-09-30 21:46:28.402828
\.


--
-- Data for Name: geometry; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.geometry (id, unique_id, name, size, element_size, description, nelements, nvertices, nsubmeshes, volume_total, has_patran, has_exodus, has_mesh_gen_script, has_mesh_gen_output, last_modified, created, size_unit_id, element_size_unit_id, size_convention_id, software_id) FROM stdin;
1	8f762d74-9a99-4680-8095-dee97f060a6f	trunc_cubo_elong_30	0.10000	0.02539	\N	44960	8298	1	0.0005235987757205221	t	f	f	f	2021-09-30 21:46:27.598214	2021-09-30 21:46:27.598222	5	5	1	\N
\.


--
-- Data for Name: legacy_model_info; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.legacy_model_info (id, legacy_model_id, last_modified, created) FROM stdin;
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.material (id, name, temperature, k1, aex, ms, kd, lambda_ex, q_hardness, axis_theta, axis_phi, last_modified, created, anisotropy_form_id) FROM stdin;
1	magnetite	0.000	-14842.26010914978	1.3635263799132512e-11	487563.7278137676	149362.86869984312	9.554554657798783e-09	-0.09937048101945949	0	0	2021-09-30 21:46:24.179639	2021-09-30 21:46:24.179645	1
2	magnetite	1.000	-14760.52697587167	1.362104711886952e-11	487227.3028840391	149156.8154050905	9.55616624673167e-09	-0.09895978896964244	0	0	2021-09-30 21:46:24.179647	2021-09-30 21:46:24.179649	1
3	magnetite	2.000	-14679.103810992738	1.360681869379626e-11	486890.5291465169	148950.69092242804	9.557780180673333e-09	-0.0985500887581479	0	0	2021-09-30 21:46:24.179651	2021-09-30 21:46:24.179652	1
4	magnetite	3.000	-14597.989972202502	1.3592578494756346e-11	486553.40563514066	148744.49510403487	9.55939646612688e-09	-0.09814137969941258	0	0	2021-09-30 21:46:24.179655	2021-09-30 21:46:24.179656	1
5	magnetite	4.000	-14517.184817412694	1.3578326492472592e-11	486215.9313794948	148538.22780152663	9.561015109621568e-09	-0.09773366110716106	0	0	2021-09-30 21:46:24.179658	2021-09-30 21:46:24.17966	1
6	magnetite	5.000	-14436.687704757564	1.3564062657546263e-11	485878.105404781	148331.8888659521	9.56263611771294e-09	-0.09732693229440391	0	0	2021-09-30 21:46:24.179662	2021-09-30 21:46:24.179663	1
7	magnetite	6.000	-14356.497992594199	1.3549786960456373e-11	485539.92673179106	148125.47814779	9.564259496982949e-09	-0.0969211925734357	0	0	2021-09-30 21:46:24.179665	2021-09-30 21:46:24.179666	1
8	magnetite	7.000	-14276.615039502823	1.3535499371559e-11	485201.39437687874	147918.99549694586	9.565885254040106e-09	-0.09651644125583315	0	0	2021-09-30 21:46:24.179668	2021-09-30 21:46:24.17967	1
9	magnetite	8.000	-14197.038204287117	1.3521199861086518e-11	484862.5073519325	147712.44076274903	9.567513395519595e-09	-0.09611267765245274	0	0	2021-09-30 21:46:24.179672	2021-09-30 21:46:24.179673	1
10	magnetite	9.000	-14117.766845974522	1.3506888399146924e-11	484523.26466434664	147505.81379394894	9.569143928083446e-09	-0.09570990107342921	0	0	2021-09-30 21:46:24.179675	2021-09-30 21:46:24.179677	1
11	magnetite	10.000	-14038.800323816558	1.3492564955723092e-11	484183.66531699366	147299.11443871242	9.570776858420638e-09	-0.09530811082817311	0	0	2021-09-30 21:46:24.179679	2021-09-30 21:46:24.17968	1
12	magnetite	11.000	-13960.13799728914	1.347822950067201e-11	483843.7083081951	147092.34254462004	9.57241219324725e-09	-0.09490730622536908	0	0	2021-09-30 21:46:24.179682	2021-09-30 21:46:24.179684	1
13	magnetite	12.000	-13881.779226092882	1.3463882003724082e-11	483503.392631693	146885.49795866292	9.574049939306608e-09	-0.09450748657297363	0	0	2021-09-30 21:46:24.179686	2021-09-30 21:46:24.179687	1
14	magnetite	13.000	-13803.723370153424	1.3449522434482371e-11	483162.71727662114	146678.58052723965	9.575690103369416e-09	-0.09410865117821302	0	0	2021-09-30 21:46:24.179689	2021-09-30 21:46:24.179691	1
15	magnetite	14.000	-13725.969789621746	1.343515076242182e-11	482821.6812274752	146471.59009615247	9.577332692233893e-09	-0.09371079934758147	0	0	2021-09-30 21:46:24.179693	2021-09-30 21:46:24.179694	1
16	magnetite	15.000	-13648.517844874481	1.3420766956888533e-11	482480.28346408345	146264.52651060422	9.578977712725934e-09	-0.09331393038683894	0	0	2021-09-30 21:46:24.179696	2021-09-30 21:46:24.179697	1
17	magnetite	16.000	-13571.366896514239	1.340637098709899e-11	482138.52296157746	146057.38961519508	9.580625171699224e-09	-0.09291804360100889	0	0	2021-09-30 21:46:24.1797	2021-09-30 21:46:24.179701	1
18	magnetite	17.000	-13494.516305369929	1.3391962822139278e-11	481796.39869036124	145850.1792539186	9.58227507603541e-09	-0.0925231382943766	0	0	2021-09-30 21:46:24.179703	2021-09-30 21:46:24.179704	1
19	magnetite	18.000	-13417.96543249707	1.337754243096433e-11	481453.90961608186	145642.89527015903	9.583927432644221e-09	-0.09212921377048658	0	0	2021-09-30 21:46:24.179706	2021-09-30 21:46:24.179708	1
20	magnetite	19.000	-13341.713639178128	1.336310978239714e-11	481111.0546995983	145435.53750668705	9.585582248463638e-09	-0.09173626933214094	0	0	2021-09-30 21:46:24.17971	2021-09-30 21:46:24.179711	1
21	magnetite	20.000	-13265.76028692282	1.3348664845127952e-11	480767.8328969511	145228.10580565687	9.587239530460013e-09	-0.09134430428139687	0	0	2021-09-30 21:46:24.179713	2021-09-30 21:46:24.179715	1
22	magnetite	21.000	-13190.104737468457	1.3334207587713521e-11	480424.24315933115	145020.60000860228	9.588899285628241e-09	-0.09095331791956487	0	0	2021-09-30 21:46:24.179717	2021-09-30 21:46:24.179718	1
23	magnetite	22.000	-13114.746352780256	1.3319737978576254e-11	480080.28443304857	144813.01995643353	9.590561520991889e-09	-0.09056330954720632	0	0	2021-09-30 21:46:24.179722	2021-09-30 21:46:24.179724	1
24	magnetite	23.000	-13039.68449505167	1.3305255986003448e-11	479735.95565950125	144605.36548943337	9.59222624360335e-09	-0.09017427846413145	0	0	2021-09-30 21:46:24.179726	2021-09-30 21:46:24.179727	1
25	magnetite	24.000	-12964.918526704721	1.3290761578146469e-11	479391.2557751429	144397.63644725367	9.593893460544005e-09	-0.08978622396939728	0	0	2021-09-30 21:46:24.179729	2021-09-30 21:46:24.17973	1
26	magnetite	25.000	-12890.447810390317	1.3276254723019917e-11	479046.1837114512	144189.83266891164	9.595563178924353e-09	-0.08939914536130528	0	0	2021-09-30 21:46:24.179732	2021-09-30 21:46:24.179734	1
27	magnetite	26.000	-12816.27170898859	1.326173538850082e-11	478700.7383948953	143981.9539927863	9.59723540588417e-09	-0.08901304193739935	0	0	2021-09-30 21:46:24.179736	2021-09-30 21:46:24.179737	1
28	magnetite	27.000	-12742.389585609222	1.3247203542327807e-11	478354.91874690354	143774.00025661476	9.59891014859267e-09	-0.08862791299446347	0	0	2021-09-30 21:46:24.179739	2021-09-30 21:46:24.179741	1
29	magnetite	28.000	-12668.800803591785	1.323265915210026e-11	478008.72368383023	143565.97129748834	9.600587414248653e-09	-0.08824375782851979	0	0	2021-09-30 21:46:24.179743	2021-09-30 21:46:24.179744	1
30	magnetite	29.000	-12595.504726506055	1.321810218527748e-11	477662.15211692307	143357.86695184917	9.60226721008065e-09	-0.08786057573482602	0	0	2021-09-30 21:46:24.179746	2021-09-30 21:46:24.179748	1
31	magnetite	30.000	-12522.500718152363	1.3203532609177826e-11	477315.20295228926	143149.68705548605	9.603949543347086e-09	-0.08747836600787352	0	0	2021-09-30 21:46:24.17975	2021-09-30 21:46:24.179751	1
32	magnetite	31.000	-12449.788142561927	1.3188950390977881e-11	476967.87509086216	142941.43144353095	9.60563442133644e-09	-0.087097127941385	0	0	2021-09-30 21:46:24.179753	2021-09-30 21:46:24.179754	1
33	magnetite	32.000	-12377.36636399718	1.3174355497711549e-11	476620.167428367	142733.09995045493	9.607321851367386e-09	-0.08671686082831223	0	0	2021-09-30 21:46:24.179756	2021-09-30 21:46:24.179758	1
34	magnetite	33.000	-12305.234746952112	1.3159747896269247e-11	476272.07885528717	142524.6924100644	9.60901184078898e-09	-0.08633756396083389	0	0	2021-09-30 21:46:24.17976	2021-09-30 21:46:24.179761	1
35	magnetite	34.000	-12233.39265615261	1.314512755339696e-11	475923.6082568292	142316.20865549735	9.610704396980773e-09	-0.08595923663035315	0	0	2021-09-30 21:46:24.179763	2021-09-30 21:46:24.179765	1
36	magnetite	35.000	-12161.839456556789	1.3130494435695416e-11	475574.75451288826	142107.6485192192	9.612399527353022e-09	-0.08558187812749554	0	0	2021-09-30 21:46:24.179767	2021-09-30 21:46:24.179768	1
37	magnetite	36.000	-12090.574513355343	1.3115848509619148e-11	475225.5164980128	141899.0118330189	9.614097239346805e-09	-0.08520548774210668	0	0	2021-09-30 21:46:24.17977	2021-09-30 21:46:24.179772	1
38	magnetite	37.000	-12019.59719197188	1.3101189741475643e-11	474875.89308136964	141690.29842800525	9.615797540434218e-09	-0.08483006476324982	0	0	2021-09-30 21:46:24.179774	2021-09-30 21:46:24.179775	1
39	magnetite	38.000	-11948.906858063263	1.3086518097424402e-11	474525.8831267076	141481.5081346024	9.617500438118514e-09	-0.08445560847920378	0	0	2021-09-30 21:46:24.179777	2021-09-30 21:46:24.179779	1
40	magnetite	39.000	-11878.50287751996	1.3071833543476035e-11	474175.4854923218	141272.64078254616	9.619205939934271e-09	-0.08408211817746042	0	0	2021-09-30 21:46:24.179781	2021-09-30 21:46:24.179782	1
41	magnetite	40.000	-11808.384616466381	1.3057136045491359e-11	473824.6990310175	141063.69620087976	9.62091405344757e-09	-0.0837095931447225	0	0	2021-09-30 21:46:24.179784	2021-09-30 21:46:24.179786	1
42	magnetite	41.000	-11738.55144126123	1.3042425569180461e-11	473473.5225900735	140854.67421794997	9.62262478625614e-09	-0.08333803266690112	0	0	2021-09-30 21:46:24.179788	2021-09-30 21:46:24.179789	1
43	magnetite	42.000	-11669.002718497852	1.302770208010176e-11	473121.9550112049	140645.57466140267	9.624338145989536e-09	-0.08296743602911363	0	0	2021-09-30 21:46:24.179791	2021-09-30 21:46:24.179792	1
44	magnetite	43.000	-11599.73781500457	1.3012965543661077e-11	472769.9951305258	140436.39735817874	9.626054140309307e-09	-0.08259780251568112	0	0	2021-09-30 21:46:24.179794	2021-09-30 21:46:24.179796	1
45	magnetite	44.000	-11530.756097845055	1.299821592511067e-11	472417.6417785123	140227.1421345101	9.627772776909155e-09	-0.08222913141012606	0	0	2021-09-30 21:46:24.179798	2021-09-30 21:46:24.179799	1
46	magnetite	45.000	-11462.056934318654	1.2983453189548292e-11	472064.8937799641	140017.8088159153	9.629494063515106e-09	-0.08186142199516984	0	0	2021-09-30 21:46:24.179801	2021-09-30 21:46:24.179803	1
47	magnetite	46.000	-11393.639691960763	1.296867730191624e-11	471711.7499539664	139808.3972271951	9.631218007885703e-09	-0.0814946735527307	0	0	2021-09-30 21:46:24.179805	2021-09-30 21:46:24.179806	1
48	magnetite	47.000	-11325.50373854316	1.2953888227000355e-11	471358.2091138515	139598.90719242848	9.632944617812135e-09	-0.08112888536392088	0	0	2021-09-30 21:46:24.179808	2021-09-30 21:46:24.17981	1
49	magnetite	48.000	-11257.648442074376	1.2939085929429049e-11	471004.27006715967	139389.33853496815	9.634673901118441e-09	-0.08076405670904455	0	0	2021-09-30 21:46:24.179812	2021-09-30 21:46:24.179813	1
50	magnetite	49.000	-11190.073170800037	1.2924270373672338e-11	470649.93161560013	139179.69107743603	9.636405865661678e-09	-0.08040018686759526	0	0	2021-09-30 21:46:24.179815	2021-09-30 21:46:24.179817	1
51	magnetite	50.000	-11122.777293203226	1.2909441524040836e-11	470295.19255501137	138969.96464171918	9.638140519332085e-09	-0.0800372751182534	0	0	2021-09-30 21:46:24.179819	2021-09-30 21:46:24.17982	1
52	magnetite	51.000	-11055.76017800485	1.2894599344684735e-11	469940.0516753216	138760.15904896514	9.63987787005326e-09	-0.07967532073888396	0	0	2021-09-30 21:46:24.179822	2021-09-30 21:46:24.179824	1
53	magnetite	52.000	-10989.021194163977	1.2879743799592815e-11	469584.5077605078	138550.2741195774	9.641617925782348e-09	-0.0793143230065339	0	0	2021-09-30 21:46:24.179826	2021-09-30 21:46:24.179827	1
54	magnetite	53.000	-10922.55971087822	1.2864874852591432e-11	469228.5595885559	138340.30967321113	9.643360694510207e-09	-0.07895428119742974	0	0	2021-09-30 21:46:24.179829	2021-09-30 21:46:24.17983	1
55	magnetite	54.000	-10856.37509758408	1.284999246734346e-11	468872.20593141916	138130.26552876833	9.645106184261589e-09	-0.07859519458697506	0	0	2021-09-30 21:46:24.179832	2021-09-30 21:46:24.179834	1
56	magnetite	55.000	-10790.46672395732	1.2835096607347273e-11	468515.4455549775	137920.14150439357	9.646854403095312e-09	-0.07823706244974798	0	0	2021-09-30 21:46:24.179836	2021-09-30 21:46:24.179837	1
57	magnetite	56.000	-10724.833959913321	1.2820187235935715e-11	468158.2772189954	137709.93741746916	9.64860535910446e-09	-0.07787988405949871	0	0	2021-09-30 21:46:24.179839	2021-09-30 21:46:24.179841	1
58	magnetite	57.000	-10659.476175607453	1.2805264316275013e-11	467800.6996770797	137499.65308461047	9.65035906041654e-09	-0.07752365868914694	0	0	2021-09-30 21:46:24.179843	2021-09-30 21:46:24.179844	1
59	magnetite	58.000	-10594.392741435444	1.2790327811363745e-11	467442.7116766379	137289.28832166144	9.652115515193681e-09	-0.0771683856107794	0	0	2021-09-30 21:46:24.179846	2021-09-30 21:46:24.179848	1
60	magnetite	59.000	-10529.58302803373	1.2775377684031746e-11	467084.3119588345	137078.84294368964	9.65387473163281e-09	-0.07681406409564719	0	0	2021-09-30 21:46:24.17985	2021-09-30 21:46:24.179851	1
61	magnetite	60.000	-10465.04640627985	1.276041389693906e-11	466725.4992585486	136868.31676498157	9.655636717965842e-09	-0.07646069341416334	0	0	2021-09-30 21:46:24.179853	2021-09-30 21:46:24.179854	1
62	magnetite	61.000	-10400.782247292795	1.2745436412574813e-11	466366.27230432996	136657.70959903797	9.657401482459851e-09	-0.07610827283590016	0	0	2021-09-30 21:46:24.179856	2021-09-30 21:46:24.179858	1
63	magnetite	62.000	-10336.789922433389	1.2730445193256159e-11	466006.62981835497	136447.02125856868	9.659169033417288e-09	-0.07575680162958671	0	0	2021-09-30 21:46:24.17986	2021-09-30 21:46:24.179861	1
64	magnetite	63.000	-10273.068803304659	1.2715440201127123e-11	465646.57051638275	136236.2515554882	9.660939379176119e-09	-0.07540627906310604	0	0	2021-09-30 21:46:24.179863	2021-09-30 21:46:24.179865	1
65	magnetite	64.000	-10209.61826175221	1.2700421398157532e-11	465286.09310771007	136025.40030091032	9.662712528110067e-09	-0.07505670440349282	0	0	2021-09-30 21:46:24.179869	2021-09-30 21:46:24.17987	1
66	magnetite	65.000	-10146.437669864603	1.2685388746141879e-11	464925.1962951262	135814.4673051433	9.664488488628768e-09	-0.0747080769169306	0	0	2021-09-30 21:46:24.179872	2021-09-30 21:46:24.179873	1
67	magnetite	66.000	-10083.526399973724	1.2670342206698157e-11	464563.878774868	135603.45237768517	9.666267269177964e-09	-0.07436039586874901	0	0	2021-09-30 21:46:24.179875	2021-09-30 21:46:24.179877	1
68	magnetite	67.000	-10020.883824655168	1.2655281741266763e-11	464202.13923657313	135392.3553272182	9.668048878239714e-09	-0.07401366052342137	0	0	2021-09-30 21:46:24.179879	2021-09-30 21:46:24.17988	1
69	magnetite	68.000	-9958.50931672862	1.2640207311109311e-11	463839.97636323434	135181.17596160402	9.669833324332565e-09	-0.07366787014456191	0	0	2021-09-30 21:46:24.179882	2021-09-30 21:46:24.179884	1
70	magnetite	69.000	-9896.402249258226	1.2625118877307488e-11	463477.3888311525	134969.9140878787	9.671620616011759e-09	-0.073323023994923	0	0	2021-09-30 21:46:24.179886	2021-09-30 21:46:24.179887	1
71	magnetite	70.000	-9834.56199555299	1.2610016400761874e-11	463114.37530988944	134758.5695122471	9.673410761869429e-09	-0.07297912133639269	0	0	2021-09-30 21:46:24.179889	2021-09-30 21:46:24.179891	1
72	magnetite	71.000	-9772.987929167137	1.2594899842190762e-11	462750.93446222035	134547.14204007827	9.675203770534784e-09	-0.07263616142999162	0	0	2021-09-30 21:46:24.179893	2021-09-30 21:46:24.179894	1
73	magnetite	72.000	-9711.679423900521	1.2579769162128957e-11	462387.06494408567	134335.63147589948	9.67699965067432e-09	-0.0722941435358708	0	0	2021-09-30 21:46:24.179896	2021-09-30 21:46:24.179898	1
74	magnetite	73.000	-9650.63585379899	1.2564624320926595e-11	462022.7654045429	134124.03762339166	9.67879841099201e-09	-0.07195306691330838	0	0	2021-09-30 21:46:24.1799	2021-09-30 21:46:24.179901	1
75	magnetite	74.000	-9589.856593154791	1.2549465278747906e-11	461658.0344857174	133912.36028538345	9.680600060229501e-09	-0.07161293082070726	0	0	2021-09-30 21:46:24.179903	2021-09-30 21:46:24.179904	1
76	magnetite	75.000	-9529.34101650694	1.2534291995570012e-11	461292.87082275323	133700.5992638461	9.682404607166329e-09	-0.07127373451559214	0	0	2021-09-30 21:46:24.179906	2021-09-30 21:46:24.179908	1
77	magnetite	76.000	-9469.088498641631	1.251910443118168e-11	460927.27304376324	133488.75435988812	9.684212060620102e-09	-0.07093547725460675	0	0	2021-09-30 21:46:24.17991	2021-09-30 21:46:24.179911	1
78	magnetite	77.000	-9409.098414592612	1.2503902545182093e-11	460561.2397697788	133276.82537374945	9.686022429446722e-09	-0.07059815829351118	0	0	2021-09-30 21:46:24.179913	2021-09-30 21:46:24.179915	1
79	magnetite	78.000	-9349.37013964159	1.2488686296979572e-11	460194.76961469924	133064.81210479635	9.68783572254057e-09	-0.07026177688717895	0	0	2021-09-30 21:46:24.179917	2021-09-30 21:46:24.179918	1
80	magnetite	79.000	-9289.903049318618	1.2473455645790342e-11	459827.86118524056	132852.71435151558	9.68965194883473e-09	-0.0699263322895942	0	0	2021-09-30 21:46:24.17992	2021-09-30 21:46:24.179922	1
81	magnetite	80.000	-9230.696519402489	1.2458210550637235e-11	459460.5130808837	132640.53191150867	9.69147111730118e-09	-0.06959182375384895	0	0	2021-09-30 21:46:24.179924	2021-09-30 21:46:24.179925	1
82	magnetite	81.000	-9171.749925921142	1.2442950970348409e-11	459092.72389382275	132428.26458148673	9.693293236951007e-09	-0.06925825053214009	0	0	2021-09-30 21:46:24.179927	2021-09-30 21:46:24.179928	1
83	magnetite	82.000	-9113.062645152051	1.2427676863556061e-11	458724.4922089117	132215.91215726404	9.695118316834627e-09	-0.06892561187576675	0	0	2021-09-30 21:46:24.17993	2021-09-30 21:46:24.179932	1
84	magnetite	83.000	-9054.634053622633	1.2412388188695095e-11	458355.8166036123	132003.47443375303	9.696946366041963e-09	-0.0685939070351271	0	0	2021-09-30 21:46:24.179934	2021-09-30 21:46:24.179935	1
85	magnetite	84.000	-8996.463528110642	1.2397084904001833e-11	457986.69564793946	131790.9512049579	9.69877739370269e-09	-0.06826313525971577	0	0	2021-09-30 21:46:24.179937	2021-09-30 21:46:24.179939	1
86	magnetite	85.000	-8938.550445644578	1.2381766967512655e-11	457617.127904408	131578.3422639691	9.700611408986428e-09	-0.06793329579812069	0	0	2021-09-30 21:46:24.179941	2021-09-30 21:46:24.179942	1
87	magnetite	86.000	-8880.894183504088	1.2366434337062675e-11	457247.1119279775	131365.64740295717	9.702448421102963e-09	-0.06760438789802037	0	0	2021-09-30 21:46:24.179944	2021-09-30 21:46:24.179946	1
88	magnetite	87.000	-8823.494119220373	1.2351086970284387e-11	456876.6462659975	131152.86641316698	9.70428843930246e-09	-0.0672764108061808	0	0	2021-09-30 21:46:24.179948	2021-09-30 21:46:24.179949	1
89	magnetite	88.000	-8766.349630576595	1.2335724824606286e-11	456505.72945815185	130939.9990849116	9.70613147287568e-09	-0.06694936376845258	0	0	2021-09-30 21:46:24.179951	2021-09-30 21:46:24.179952	1
90	magnetite	89.000	-8709.460095608283	1.23203478572515e-11	456134.36003640253	130727.04520756633	9.707977531154189e-09	-0.06662324602976791	0	0	2021-09-30 21:46:24.179954	2021-09-30 21:46:24.179956	1
91	magnetite	90.000	-8652.82489260375	1.2304956025236397e-11	455762.53652493306	130514.00456956254	9.709826623510587e-09	-0.06629805683413759	0	0	2021-09-30 21:46:24.179958	2021-09-30 21:46:24.179959	1
92	magnetite	91.000	-8596.4434001045	1.2289549285369193e-11	455390.2574400912	130300.87695838146	9.711678759358727e-09	-0.06597379542464808	0	0	2021-09-30 21:46:24.179961	2021-09-30 21:46:24.179963	1
93	magnetite	92.000	-8540.314996905638	1.2274127594248516e-11	455017.5212903315	130087.66216054802	9.713533948153923e-09	-0.06565046104345842	0	0	2021-09-30 21:46:24.179965	2021-09-30 21:46:24.179966	1
94	magnetite	93.000	-8484.439062056294	1.2258690908262003e-11	454644.32657615666	129874.35996162462	9.715392199393184e-09	-0.06532805293179718	0	0	2021-09-30 21:46:24.179968	2021-09-30 21:46:24.17997	1
95	magnetite	94.000	-8428.814974860032	1.224323918358485e-11	454270.67179005896	129660.9701462047	9.717253522615436e-09	-0.06500657032995948	0	0	2021-09-30 21:46:24.179972	2021-09-30 21:46:24.179973	1
96	magnetite	95.000	-8373.442114875272	1.2227772376178358e-11	453896.5554164608	129447.49249790629	9.719117927401745e-09	-0.06468601247730392	0	0	2021-09-30 21:46:24.179975	2021-09-30 21:46:24.179976	1
97	magnetite	96.000	-8318.319861915703	1.2212290441788473e-11	453521.9759316549	129233.92679936597	9.720985423375529e-09	-0.06436637861224931	0	0	2021-09-30 21:46:24.179979	2021-09-30 21:46:24.17998	1
98	magnetite	97.000	-8263.447596050712	1.2196793335944309e-11	453146.93180374365	129020.27283223186	9.72285602020281e-09	-0.06404766797227185	0	0	2021-09-30 21:46:24.179982	2021-09-30 21:46:24.179983	1
99	magnetite	98.000	-8208.824697605805	1.2181281013956658e-11	452771.42149257794	128806.53037715737	9.724729727592423e-09	-0.06372987979390185	0	0	2021-09-30 21:46:24.179985	2021-09-30 21:46:24.179987	1
100	magnetite	99.000	-8154.450547163025	1.2165753430916486e-11	452395.4434496957	128592.69921379455	9.726606555296253e-09	-0.06341301331272056	0	0	2021-09-30 21:46:24.179989	2021-09-30 21:46:24.17999	1
101	magnetite	100.000	-8100.324525561382	1.2150210541693406e-11	452018.99611825956	128378.77912078737	9.728486513109459e-09	-0.06309706776335716	0	0	2021-09-30 21:46:24.179992	2021-09-30 21:46:24.179994	1
102	magnetite	101.000	-8046.446013897282	1.2134652300934171e-11	451642.07793299406	128164.76987576517	9.730369610870707e-09	-0.0627820423794854	0	0	2021-09-30 21:46:24.179996	2021-09-30 21:46:24.179997	1
103	magnetite	102.000	-7992.814393524956	1.2119078663061103e-11	451264.687320122	127950.6712553356	9.732255858462409e-09	-0.06246793639382062	0	0	2021-09-30 21:46:24.179999	2021-09-30 21:46:24.180001	1
104	magnetite	103.000	-7939.429046056885	1.210348958227056e-11	450886.82269730046	127736.48303507797	9.734145265810956e-09	-0.06215474903811641	0	0	2021-09-30 21:46:24.180003	2021-09-30 21:46:24.180004	1
105	magnetite	104.000	-7886.28935336424	1.2087885012531344e-11	450508.48247355636	127522.2049895363	9.736037842886942e-09	-0.06184247954316145	0	0	2021-09-30 21:46:24.180006	2021-09-30 21:46:24.180008	1
106	magnetite	105.000	-7833.394697577304	1.2072264907583127e-11	450129.6650492207	127307.83689221244	9.737933599705412e-09	-0.06153112713877618	0	0	2021-09-30 21:46:24.18001	2021-09-30 21:46:24.180011	1
107	magnetite	106.000	-7780.744461085922	1.2056629220934845e-11	449750.36881586304	127093.37851555887	9.739832546326097e-09	-0.06122069105380968	0	0	2021-09-30 21:46:24.180015	2021-09-30 21:46:24.180016	1
108	magnetite	107.000	-7728.338026539928	1.204097790586309e-11	449370.5921562246	126878.82963097176	9.74173469285365e-09	-0.06091117051613631	0	0	2021-09-30 21:46:24.180018	2021-09-30 21:46:24.18002	1
109	magnetite	108.000	-7676.174776849588	1.202531091541048e-11	448990.33344415104	126664.19000878373	9.743640049437889e-09	-0.06060256475265244	0	0	2021-09-30 21:46:24.180022	2021-09-30 21:46:24.180023	1
110	magnetite	109.000	-7624.254095186038	1.2009628202384007e-11	448609.5910445251	126449.45941825691	9.74554862627403e-09	-0.06029487298927306	0	0	2021-09-30 21:46:24.180025	2021-09-30 21:46:24.180027	1
111	magnetite	110.000	-7572.575364981729	1.199392971935338e-11	448228.3633131971	126234.6376275751	9.747460433602948e-09	-0.05998809445092867	0	0	2021-09-30 21:46:24.180029	2021-09-30 21:46:24.18003	1
112	magnetite	111.000	-7521.137969930864	1.1978215418649374e-11	447846.6485969166	126019.72440383697	9.749375481711401e-09	-0.059682228361561666	0	0	2021-09-30 21:46:24.180032	2021-09-30 21:46:24.180034	1
113	magnetite	112.000	-7469.941293989854	1.1962485252362101e-11	447464.44523326185	125804.71951304846	9.751293780932284e-09	-0.05937727394412315	0	0	2021-09-30 21:46:24.180036	2021-09-30 21:46:24.180037	1
114	magnetite	113.000	-7418.984721377757	1.1946739172339348e-11	447081.7515505699	125589.62272011527	9.75321534164488e-09	-0.05907323042056948	0	0	2021-09-30 21:46:24.180039	2021-09-30 21:46:24.180041	1
115	magnetite	114.000	-7368.267636576728	1.1930977130184817e-11	446698.5658678644	125374.43378883529	9.755140174275092e-09	-0.05877009701185888	0	0	2021-09-30 21:46:24.180043	2021-09-30 21:46:24.180044	1
116	magnetite	115.000	-7317.7894243324745	1.1915199077256427e-11	446314.8864947845	125159.15248189114	9.75706828929571e-09	-0.058467872937948036	0	0	2021-09-30 21:46:24.180046	2021-09-30 21:46:24.180047	1
117	magnetite	116.000	-7267.549469654702	1.1899404964664535e-11	445930.7117315116	124943.7785608424	9.758999697226647e-09	-0.05816655741778859	0	0	2021-09-30 21:46:24.180049	2021-09-30 21:46:24.180051	1
118	magnetite	117.000	-7217.547157817574	1.1883594743270184e-11	445546.0398686959	124728.31178611779	9.760934408635198e-09	-0.05786614966932378	0	0	2021-09-30 21:46:24.180053	2021-09-30 21:46:24.180054	1
119	magnetite	118.000	-7167.781874360163	1.1867768363683316e-11	445160.86918738275	124512.75191700748	9.762872434136292e-09	-0.0575666489094849	0	0	2021-09-30 21:46:24.180056	2021-09-30 21:46:24.180058	1
120	magnetite	119.000	-7118.253005086911	1.1851925776260963e-11	444775.1979589372	124297.09871165517	9.764813784392738e-09	-0.05726805435418777	0	0	2021-09-30 21:46:24.18006	2021-09-30 21:46:24.180061	1
121	magnetite	120.000	-7068.9599360680895	1.1836066931105443e-11	444389.0244449686	124081.35192705007	9.76675847011549e-09	-0.056970365218329294	0	0	2021-09-30 21:46:24.180063	2021-09-30 21:46:24.180065	1
122	magnetite	121.000	-7019.902053640259	1.1820191778062514e-11	444002.34689725435	123865.51131901896	9.768706502063892e-09	-0.05667358071578384	0	0	2021-09-30 21:46:24.180067	2021-09-30 21:46:24.180068	1
123	magnetite	122.000	-6971.078744406732	1.1804300266719548e-11	443615.1635576622	123649.57664221789	9.770657891045956e-09	-0.056377700059399835	0	0	2021-09-30 21:46:24.18007	2021-09-30 21:46:24.180072	1
124	magnetite	123.000	-6922.489395238039	1.1788392346403628e-11	443227.47265807324	123433.54765012444	9.772612647918586e-09	-0.056082722460995875	0	0	2021-09-30 21:46:24.180074	2021-09-30 21:46:24.180075	1
125	magnetite	124.000	-6874.133393272395	1.1772467966179685e-11	442839.272420302	123217.4240950288	9.774570783587875e-09	-0.05578864713135755	0	0	2021-09-30 21:46:24.180077	2021-09-30 21:46:24.180079	1
126	magnetite	125.000	-6826.010125916166	1.1756527074848596e-11	442450.5610560179	123001.20572802608	9.77653230900934e-09	-0.05549547328023342	0	0	2021-09-30 21:46:24.180081	2021-09-30 21:46:24.180082	1
127	magnetite	126.000	-6778.1189808443405	1.1740569620945252e-11	442061.3367666646	122784.89229900754	9.778497235188193e-09	-0.05520320011633164	0	0	2021-09-30 21:46:24.180084	2021-09-30 21:46:24.180085	1
128	magnetite	127.000	-6730.4593460010055	1.1724595552736633e-11	441671.5977433786	122568.48355665217	9.780465573179608e-09	-0.05491182684731619	0	0	2021-09-30 21:46:24.180087	2021-09-30 21:46:24.180089	1
129	magnetite	128.000	-6683.030609599813	1.170860481821984e-11	441281.3421669076	122351.9792484181	9.782437334088983e-09	-0.054621352679803246	0	0	2021-09-30 21:46:24.180091	2021-09-30 21:46:24.180092	1
130	magnetite	129.000	-6635.832160124464	1.1692597365120125e-11	440890.56820752774	122135.3791205341	9.7844125290722e-09	-0.054331776819357414	0	0	2021-09-30 21:46:24.180094	2021-09-30 21:46:24.180096	1
131	magnetite	130.000	-6588.86338632918	1.1676573140888893e-11	440499.27402495965	121918.68291799075	9.786391169335897e-09	-0.05404309847048802	0	0	2021-09-30 21:46:24.180098	2021-09-30 21:46:24.180099	1
132	magnetite	131.000	-6542.123677239184	1.16605320927017e-11	440107.457768284	121701.89038453148	9.78837326613774e-09	-0.05375531683664545	0	0	2021-09-30 21:46:24.180101	2021-09-30 21:46:24.180103	1
133	magnetite	132.000	-6495.612422151186	1.1644474167456206e-11	439715.11757585674	121485.00126264407	9.790358830786685e-09	-0.053468431120217215	0	0	2021-09-30 21:46:24.180105	2021-09-30 21:46:24.180106	1
134	magnetite	133.000	-6449.329010633864	1.1628399311770142e-11	439322.25157522183	121268.01529355129	9.792347874643254e-09	-0.05318244052252434	0	0	2021-09-30 21:46:24.180108	2021-09-30 21:46:24.18011	1
135	magnetite	134.000	-6403.272832528348	1.1612307471979216e-11	438928.85788302484	121050.93221720199	9.794340409119803e-09	-0.052897344243817465	0	0	2021-09-30 21:46:24.180112	2021-09-30 21:46:24.180113	1
136	magnetite	135.000	-6357.443277948711	1.1596198594135055e-11	438534.93460492487	120833.75177226204	9.796336445680798e-09	-0.052613141483272986	0	0	2021-09-30 21:46:24.180115	2021-09-30 21:46:24.180117	1
137	magnetite	136.000	-6311.839737282451	1.1580072624003061e-11	438140.4798355054	120616.47369610508	9.798335995843082e-09	-0.05232983143898918	0	0	2021-09-30 21:46:24.180119	2021-09-30 21:46:24.18012	1
138	magnetite	137.000	-6266.461601190997	1.1563929507060307e-11	437745.4916581844	120399.09772480295	9.80033907117617e-09	-0.052047413307982515	0	0	2021-09-30 21:46:24.180122	2021-09-30 21:46:24.180123	1
139	magnetite	138.000	-6221.308260610185	1.1547769188493363e-11	437349.9681451237	120181.62359311669	9.802345683302492e-09	-0.05176588628618349	0	0	2021-09-30 21:46:24.180125	2021-09-30 21:46:24.180127	1
140	magnetite	139.000	-6176.379106750767	1.153159161319615e-11	436953.90735713707	119964.05103448666	9.804355843897706e-09	-0.0514852495684329	0	0	2021-09-30 21:46:24.180129	2021-09-30 21:46:24.18013	1
141	magnetite	140.000	-6131.673531098904	1.151539672576773e-11	436557.30734359793	119746.37978102338	9.80636956469095e-09	-0.051205502348477774	0	0	2021-09-30 21:46:24.180132	2021-09-30 21:46:24.180134	1
142	magnetite	141.000	-6087.1909254166585	1.1499184470510097e-11	436160.16614234506	119528.6095634974	9.808386857465139e-09	-0.05092664381896745	0	0	2021-09-30 21:46:24.180136	2021-09-30 21:46:24.180137	1
143	magnetite	142.000	-6042.9306817425095	1.1482954791425942e-11	435762.4817795884	119310.74011132981	9.810407734057235e-09	-0.05064867317144963	0	0	2021-09-30 21:46:24.180139	2021-09-30 21:46:24.180141	1
144	magnetite	143.000	-5998.892192391845	1.1466707632216398e-11	435364.2522698132	119092.77115258234	9.812432206358537e-09	-0.05037158959636626	0	0	2021-09-30 21:46:24.180143	2021-09-30 21:46:24.180144	1
145	magnetite	144.000	-5955.074849957473	1.145044293627876e-11	434965.47561568365	118874.70241394738	9.814460286314954e-09	-0.050095392283049565	0	0	2021-09-30 21:46:24.180146	2021-09-30 21:46:24.180148	1
146	magnetite	145.000	-5911.4780473101255	1.1434160646704187e-11	434566.1498079447	118656.5336207379	9.816491985927302e-09	-0.04982008041971792	0	0	2021-09-30 21:46:24.18015	2021-09-30 21:46:24.180151	1
147	magnetite	146.000	-5868.1011775989755	1.1417860706275375e-11	434166.272825324	118438.26449687737	9.818527317251578e-09	-0.049545653193471845	0	0	2021-09-30 21:46:24.180153	2021-09-30 21:46:24.180155	1
148	magnetite	147.000	-5824.943634252139	1.1401543057464214e-11	433765.8426344312	118219.89476488931	9.82056629239926e-09	-0.04927210979028986	0	0	2021-09-30 21:46:24.180157	2021-09-30 21:46:24.180158	1
149	magnetite	148.000	-5782.004810977198	1.1385207642429414e-11	433364.8571896585	118001.42414588737	9.822608923537572e-09	-0.04899944939502422	0	0	2021-09-30 21:46:24.180163	2021-09-30 21:46:24.180165	1
150	magnetite	149.000	-5739.284101761711	1.1368854403014123e-11	432963.31443307735	117782.85235956438	9.824655222889796e-09	-0.048727671191396996	0	0	2021-09-30 21:46:24.180167	2021-09-30 21:46:24.180168	1
151	magnetite	150.000	-5696.780900873735	1.1352483280743506e-11	432561.21229433647	117564.17912418216	9.82670520273555e-09	-0.04845677436199566	0	0	2021-09-30 21:46:24.18017	2021-09-30 21:46:24.180172	1
152	magnetite	151.000	-5654.494602862341	1.1336094216822297e-11	432158.54869055713	117345.40415656062	9.828758875411081e-09	-0.04818675808826899	0	0	2021-09-30 21:46:24.180174	2021-09-30 21:46:24.180175	1
153	magnetite	152.000	-5612.424602558143	1.1319687152132349e-11	431755.32152622857	117126.52717206729	9.830816253309545e-09	-0.04791762155052278	0	0	2021-09-30 21:46:24.180177	2021-09-30 21:46:24.180179	1
154	magnetite	153.000	-5570.5702950738205	1.1303262027230143e-11	431351.528693101	116907.54788460612	9.832877348881328e-09	-0.04764936392791563	0	0	2021-09-30 21:46:24.180181	2021-09-30 21:46:24.180182	1
155	magnetite	154.000	-5528.931075804641	1.1286818782344274e-11	430947.16807007877	116688.46600660682	9.834942174634308e-09	-0.04738198439845458	0	0	2021-09-30 21:46:24.180184	2021-09-30 21:46:24.180186	1
156	magnetite	155.000	-5487.5063404289995	1.1270357357372901e-11	430542.2375231111	116469.28124901353	9.837010743134166e-09	-0.047115482138990854	0	0	2021-09-30 21:46:24.180188	2021-09-30 21:46:24.180189	1
157	magnetite	156.000	-5446.2954849089365	1.1253877691881212e-11	430136.7349050829	116249.99332127388	9.839083067004677e-09	-0.04684985632521545	0	0	2021-09-30 21:46:24.180191	2021-09-30 21:46:24.180192	1
158	magnetite	157.000	-5405.297905490686	1.1237379725098803e-11	429730.6580557031	116030.60193132733	9.841159158928014e-09	-0.0465851061316549	0	0	2021-09-30 21:46:24.180194	2021-09-30 21:46:24.180196	1
159	magnetite	158.000	-5364.512998705201	1.1220863395917088e-11	429324.0048013932	115811.10678559425	9.843239031645031e-09	-0.04632123073166669	0	0	2021-09-30 21:46:24.180198	2021-09-30 21:46:24.180199	1
160	magnetite	159.000	-5323.940161368697	1.1204328642886652e-11	428916.7729551731	115591.507588964	9.845322697955569e-09	-0.04605822929743496	0	0	2021-09-30 21:46:24.180201	2021-09-30 21:46:24.180203	1
161	magnetite	160.000	-5283.57879058319	1.1187775404214575e-11	428508.9603165469	115371.80404478338	9.847410170718758e-09	-0.04579610099996604	0	0	2021-09-30 21:46:24.180205	2021-09-30 21:46:24.180206	1
162	magnetite	161.000	-5243.428283737042	1.1171203617761746e-11	428100.56467138673	115151.99585484496	9.849501462853311e-09	-0.04553484500908394	0	0	2021-09-30 21:46:24.180208	2021-09-30 21:46:24.18021	1
163	magnetite	162.000	-5203.488038505506	1.1154613221040139e-11	427691.5837918158	114932.08271937526	9.851596587337827e-09	-0.04527446049342584	0	0	2021-09-30 21:46:24.180212	2021-09-30 21:46:24.180213	1
164	magnetite	163.000	-5163.7574528512705	1.1138004151210068e-11	427282.01543608936	114712.06433702249	9.85369555721109e-09	-0.0450149466204376	0	0	2021-09-30 21:46:24.180215	2021-09-30 21:46:24.180217	1
165	magnetite	164.000	-5124.235925025013	1.1121376345077404e-11	426871.8573484758	114491.94040484479	9.855798385572373e-09	-0.044756302556369094	0	0	2021-09-30 21:46:24.180219	2021-09-30 21:46:24.18022	1
166	magnetite	165.000	-5084.9228535659495	1.1104729739090771e-11	426461.1072591345	114271.71061829767	9.857905085581741e-09	-0.04449852746626977	0	0	2021-09-30 21:46:24.180222	2021-09-30 21:46:24.180224	1
167	magnetite	166.000	-5045.817637302393	1.1088064269338713e-11	426049.762883994	114051.37467122187	9.860015670460352e-09	-0.0442416205139839	0	0	2021-09-30 21:46:24.180226	2021-09-30 21:46:24.180227	1
168	magnetite	167.000	-5006.919675352309	1.107137987154684e-11	425637.82192462805	113830.93225583076	9.862130153490769e-09	-0.04398558086214602	0	0	2021-09-30 21:46:24.180229	2021-09-30 21:46:24.18023	1
169	magnetite	168.000	-4968.228367123871	1.1054676481074922e-11	425225.2820681302	113610.38306269774	9.864248548017254e-09	-0.04373040767217617	0	0	2021-09-30 21:46:24.180232	2021-09-30 21:46:24.180234	1
170	magnetite	169.000	-4929.743112316029	1.1037954032913969e-11	424812.1409869875	113389.72678074366	9.866370867446073e-09	-0.043476100104275224	0	0	2021-09-30 21:46:24.180236	2021-09-30 21:46:24.180237	1
171	magnetite	170.000	-4891.46331091907	1.1021212461683286e-11	424398.3963389522	113168.96309722366	9.868497125245818e-09	-0.04322265731742019	0	0	2021-09-30 21:46:24.180239	2021-09-30 21:46:24.180241	1
172	magnetite	171.000	-4853.388363215186	1.1004451701627497e-11	423984.0457669122	112948.0916977144	9.870627334947696e-09	-0.04297007846935937	0	0	2021-09-30 21:46:24.180243	2021-09-30 21:46:24.180244	1
173	magnetite	172.000	-4815.517669779044	1.0987671686613507e-11	423569.0868987606	112727.11226610086	9.872761510145842e-09	-0.042718362716607616	0	0	2021-09-30 21:46:24.180246	2021-09-30 21:46:24.180248	1
174	magnetite	173.000	-4777.850631478356	1.0970872350127487e-11	423153.51734726265	112506.02448456302	9.874899664497632e-09	-0.04246750921444146	0	0	2021-09-30 21:46:24.18025	2021-09-30 21:46:24.180251	1
175	magnetite	174.000	-4740.386649474458	1.0954053625271772e-11	422737.3347099224	112284.8280335625	9.87704181172398e-09	-0.0422175171168943	0	0	2021-09-30 21:46:24.180253	2021-09-30 21:46:24.180255	1
176	magnetite	175.000	-4703.125125222879	1.093721544476178e-11	422320.5365688468	112063.52259182895	9.879187965609662e-09	-0.0419683855767515	0	0	2021-09-30 21:46:24.180257	2021-09-30 21:46:24.180258	1
177	magnetite	176.000	-4666.06546047393	1.0920357740922842e-11	421903.12049060926	111842.10783634655	9.881338140003607e-09	-0.04172011374554538	0	0	2021-09-30 21:46:24.18026	2021-09-30 21:46:24.180262	1
178	magnetite	177.000	-4629.207057273278	1.0903480445687053e-11	421485.0840261106	111620.58344233982	9.88349234881922e-09	-0.04147270077355044	0	0	2021-09-30 21:46:24.180264	2021-09-30 21:46:24.180265	1
179	magnetite	178.000	-4592.549317962537	1.0886583490590054e-11	421066.42471043946	111398.94908326017	9.885650606034679e-09	-0.04122614580977816	0	0	2021-09-30 21:46:24.180267	2021-09-30 21:46:24.180268	1
180	magnetite	179.000	-4556.091645179852	1.0869666806767792e-11	420647.14006273	111177.20443077116	9.887812925693264e-09	-0.04098044800197221	0	0	2021-09-30 21:46:24.18027	2021-09-30 21:46:24.180272	1
181	magnetite	180.000	-4519.833441860487	1.085273032495325e-11	420227.2275860191	110955.34915473475	9.889979321903648e-09	-0.04073560649660318	0	0	2021-09-30 21:46:24.180274	2021-09-30 21:46:24.180275	1
182	magnetite	181.000	-4483.774111237422	1.0835773975473133e-11	419806.684767101	110733.38292319662	9.892149808840213e-09	-0.04049162043886364	0	0	2021-09-30 21:46:24.180277	2021-09-30 21:46:24.180279	1
183	magnetite	182.000	-4447.913056841949	1.0818797688244525e-11	419385.50907638104	110511.30540237165	9.894324400743366e-09	-0.040248488972663005	0	0	2021-09-30 21:46:24.180281	2021-09-30 21:46:24.180282	1
184	magnetite	183.000	-4412.249682504263	1.0801801392771518e-11	418963.69796772685	110289.11625662929	9.89650311191984e-09	-0.0400062112406223	0	0	2021-09-30 21:46:24.180284	2021-09-30 21:46:24.180286	1
185	magnetite	184.000	-4376.783392354069	1.078478501814178e-11	418541.24887831847	110066.81514847846	9.89868595674301e-09	-0.03976478638406912	0	0	2021-09-30 21:46:24.180288	2021-09-30 21:46:24.180289	1
186	magnetite	185.000	-4341.513590821184	1.0767748493023124e-11	418118.1592284967	109844.40173855275	9.900872949653213e-09	-0.03952421354303227	0	0	2021-09-30 21:46:24.180291	2021-09-30 21:46:24.180293	1
187	magnetite	186.000	-4306.4396826361435	1.0750691745659995e-11	417694.4264216092	109621.87568559506	9.903064105158034e-09	-0.03928449185623663	0	0	2021-09-30 21:46:24.180295	2021-09-30 21:46:24.180296	1
188	magnetite	187.000	-4271.561072830807	1.0733614703869968e-11	417270.0478438554	109399.23664644246	9.905259437832634e-09	-0.03904562046109773	0	0	2021-09-30 21:46:24.180298	2021-09-30 21:46:24.180299	1
189	magnetite	188.000	-4236.877166738972	1.0716517295040167e-11	416845.02086412895	109176.4842760102	9.907458962320065e-09	-0.03880759849371664	0	0	2021-09-30 21:46:24.180301	2021-09-30 21:46:24.180303	1
190	magnetite	189.000	-4202.387369996992	1.0699399446123675e-11	416419.34283385915	108953.61822727669	9.909662693331558e-09	-0.038570425088874365	0	0	2021-09-30 21:46:24.180305	2021-09-30 21:46:24.180306	1
191	magnetite	190.000	-4168.091088544388	1.068226108363588e-11	415993.01108684944	108730.63815126699	9.911870645646858e-09	-0.03833409938002667	0	0	2021-09-30 21:46:24.18031	2021-09-30 21:46:24.180312	1
192	magnetite	191.000	-4133.987728624472	1.0665102133650806e-11	415566.0229391151	108507.54369703728	9.914082834114512e-09	-0.0380986204992985	0	0	2021-09-30 21:46:24.180314	2021-09-30 21:46:24.180315	1
193	magnetite	192.000	-4100.076696784967	1.0647922521797391e-11	415138.37568871834	108284.33451165837	9.916299273652187e-09	-0.037863987577478574	0	0	2021-09-30 21:46:24.180317	2021-09-30 21:46:24.180319	1
194	magnetite	193.000	-4066.3573998786396	1.0630722173255714e-11	414710.06661560124	108061.01024019932	9.918519979246982e-09	-0.03763019974401397	0	0	2021-09-30 21:46:24.180321	2021-09-30 21:46:24.180322	1
195	magnetite	194.000	-4032.829245063919	1.061350101275321e-11	414281.0929814177	107837.57052571115	9.920744965955726e-09	-0.03739725612700439	0	0	2021-09-30 21:46:24.180324	2021-09-30 21:46:24.180325	1
196	magnetite	195.000	-3999.4916398055375	1.0596258964560821e-11	413851.4520293622	107614.01500920976	9.922974248905296e-09	-0.037165155853196775	0	0	2021-09-30 21:46:24.180328	2021-09-30 21:46:24.180329	1
197	magnetite	196.000	-3966.3439918751596	1.0578995952489105e-11	413421.1409839972	107390.34332965917	9.925207843292916e-09	-0.03693389804797962	0	0	2021-09-30 21:46:24.180331	2021-09-30 21:46:24.180332	1
198	magnetite	197.000	-3933.3857093520232	1.0561711899884316e-11	412990.1570510787	107166.55512395463	9.927445764386453e-09	-0.03670348183537725	0	0	2021-09-30 21:46:24.180334	2021-09-30 21:46:24.180336	1
199	magnetite	198.000	-3900.616200623577	1.0544406729624429e-11	412558.49741737865	106942.65002690486	9.929688027524754e-09	-0.03647390633804429	0	0	2021-09-30 21:46:24.180338	2021-09-30 21:46:24.180339	1
200	magnetite	199.000	-3868.0348743861255	1.0527080364115118e-11	412126.15925050655	106718.62767121498	9.931934648117907e-09	-0.036245170677259776	0	0	2021-09-30 21:46:24.180341	2021-09-30 21:46:24.180343	1
201	magnetite	200.000	-3835.6411396454782	1.050973272528572e-11	411693.13969872775	106494.48768746863	9.93418564164758e-09	-0.03601727397292155	0	0	2021-09-30 21:46:24.180345	2021-09-30 21:46:24.180346	1
202	magnetite	201.000	-3803.434405717595	1.04923637345851e-11	411259.4358907805	106270.22970411017	9.9364410236673e-09	-0.035790215343540294	0	0	2021-09-30 21:46:24.180348	2021-09-30 21:46:24.18035	1
203	magnetite	202.000	-3771.414082229241	1.047497331297753e-11	410825.0449356898	106045.85334742656	9.938700809802768e-09	-0.0355639939062338	0	0	2021-09-30 21:46:24.180352	2021-09-30 21:46:24.180353	1
204	magnetite	203.000	-3739.579579118644	1.0457561380938469e-11	410389.96392257995	105821.35824152917	9.940965015752141e-09	-0.035338608776721035	0	0	2021-09-30 21:46:24.180355	2021-09-30 21:46:24.180357	1
205	magnetite	204.000	-3707.9303066361485	1.0440127858450336e-11	409954.18992048415	105596.74400833527	9.943233657286349e-09	-0.03511405906931622	0	0	2021-09-30 21:46:24.180359	2021-09-30 21:46:24.18036	1
206	magnetite	205.000	-3676.4656753448853	1.0422672664998215e-11	409517.7199781522	105372.01026754934	9.945506750249378e-09	-0.03489034389692288	0	0	2021-09-30 21:46:24.180362	2021-09-30 21:46:24.180364	1
207	magnetite	206.000	-3645.1850961214295	1.0405195719565516e-11	409080.55112385517	105147.15663664418	9.947784310558568e-09	-0.03466746237102781	0	0	2021-09-30 21:46:24.180366	2021-09-30 21:46:24.180367	1
208	magnetite	207.000	-3614.087980156474	1.0387696940629586e-11	408642.6803651886	104922.18273084179	9.950066354204917e-09	-0.03444541360169508	0	0	2021-09-30 21:46:24.180369	2021-09-30 21:46:24.180371	1
209	magnetite	208.000	-3583.1737389554983	1.0370176246157276e-11	408204.1046888724	104697.0881630941	9.952352897253349e-09	-0.034224196697559855	0	0	2021-09-30 21:46:24.180373	2021-09-30 21:46:24.180374	1
210	magnetite	209.000	-3552.4417843394453	1.035263355360046e-11	407764.8210605492	104471.8725440635	9.954643955843027e-09	-0.03400381076582234	0	0	2021-09-30 21:46:24.180376	2021-09-30 21:46:24.180378	1
211	magnetite	210.000	-3521.8915284453997	1.0335068779891478e-11	407324.82642457896	104246.53548210292	9.956939546187623e-09	-0.03378425491224156	0	0	2021-09-30 21:46:24.18038	2021-09-30 21:46:24.180381	1
212	magnetite	211.000	-3491.522383727267	1.031748184143857e-11	406884.1177038324	104021.076583236	9.959239684575613e-09	-0.033565528241129156	0	0	2021-09-30 21:46:24.180383	2021-09-30 21:46:24.180384	1
213	magnetite	212.000	-3461.3337629564608	1.0299872654121218e-11	406442.6917994805	103795.49545113674	9.961544387370564e-09	-0.03334762985534314	0	0	2021-09-30 21:46:24.180386	2021-09-30 21:46:24.180388	1
214	magnetite	213.000	-3431.3250792225895	1.0282241133285464e-11	406000.5455907828	103569.79168710929	9.963853671011395e-09	-0.03313055885628151	0	0	2021-09-30 21:46:24.18039	2021-09-30 21:46:24.180391	1
215	magnetite	214.000	-3401.495745934151	1.026458719373915e-11	405557.67593487154	103343.96489006691	9.966167552012682e-09	-0.03291431434387604	0	0	2021-09-30 21:46:24.180393	2021-09-30 21:46:24.180395	1
216	magnetite	215.000	-3371.8451768192203	1.0246910749747122e-11	405114.0796665345	103118.01465651156	9.968486046964913e-09	-0.032698895416585674	0	0	2021-09-30 21:46:24.180397	2021-09-30 21:46:24.180398	1
217	magnetite	216.000	-3342.372785926159	1.0229211715026381e-11	404669.7535979939	102891.94058051231	9.970809172534766e-09	-0.03248430117139032	0	0	2021-09-30 21:46:24.1804	2021-09-30 21:46:24.180402	1
218	magnetite	217.000	-3313.0779876243064	1.0211490002741146e-11	404224.69451868336	102665.74225368412	9.973136945465387e-09	-0.03227053070378418	0	0	2021-09-30 21:46:24.180404	2021-09-30 21:46:24.180405	1
219	magnetite	218.000	-3283.9601966046894	1.0193745525497905e-11	403778.8991950216	102439.41926516625	9.975469382576647e-09	-0.03205758310776929	0	0	2021-09-30 21:46:24.180407	2021-09-30 21:46:24.180409	1
220	magnetite	219.000	-3255.018827880734	1.0175978195340387e-11	403332.3643701833	102212.97120160029	9.977806500765413e-09	-0.03184545747584894	0	0	2021-09-30 21:46:24.180411	2021-09-30 21:46:24.180412	1
221	magnetite	220.000	-3226.253296788971	1.0158187923744448e-11	402885.0867638674	101986.39764710808	9.980148317005796e-09	-0.03163415289902098	0	0	2021-09-30 21:46:24.180414	2021-09-30 21:46:24.180415	1
222	magnetite	221.000	-3197.6630189897583	1.0140374621612966e-11	402437.0630720618	101759.69818326925	9.982494848349427e-09	-0.031423668466771255	0	0	2021-09-30 21:46:24.180417	2021-09-30 21:46:24.180419	1
223	magnetite	222.000	-3169.2474104679955	1.0122538199270599e-11	401988.28996680555	101532.87238909857	9.984846111925693e-09	-0.03121400326706676	0	0	2021-09-30 21:46:24.180421	2021-09-30 21:46:24.180422	1
224	magnetite	223.000	-3141.00588753385	1.0104678566458546e-11	401538.76409594784	101305.919841023	9.987202124941999e-09	-0.03100515638634896	0	0	2021-09-30 21:46:24.180424	2021-09-30 21:46:24.180426	1
225	magnetite	224.000	-3112.9378668234826	1.008679563232919e-11	401088.4820829037	101078.84011285845	9.989562904684005e-09	-0.030797126909526927	0	0	2021-09-30 21:46:24.180428	2021-09-30 21:46:24.180429	1
226	magnetite	225.000	-3085.042765299778	1.0068889305440734e-11	400637.440526407	100851.63277578652	9.991928468515866e-09	-0.030589913919970426	0	0	2021-09-30 21:46:24.180431	2021-09-30 21:46:24.180433	1
227	magnetite	226.000	-3057.320000253077	1.0050959493751733e-11	400185.63600025955	100624.29739833037	9.994298833880488e-09	-0.030383516499503094	0	0	2021-09-30 21:46:24.180435	2021-09-30 21:46:24.180436	1
228	magnetite	227.000	-3029.7689893019174	1.0033006104615566e-11	399733.0650530779	100396.83354633112	9.996674018299729e-09	-0.030177933728395327	0	0	2021-09-30 21:46:24.180438	2021-09-30 21:46:24.18044	1
229	magnetite	228.000	-3002.389150393774	1.0015029044774872e-11	399279.7242080356	100169.24078292317	9.999054039374649e-09	-0.02997316468535739	0	0	2021-09-30 21:46:24.180442	2021-09-30 21:46:24.180443	1
230	magnetite	229.000	-2975.1799018058023	9.997028220355874e-12	398825.60996260337	99941.51866850974	1.000143891478573e-08	-0.02976920844753225	0	0	2021-09-30 21:46:24.180445	2021-09-30 21:46:24.180447	1
231	magnetite	230.000	-2948.140662145589	9.97900353686268e-12	398370.71878828475	99713.66676073795	1.0003828662293089e-08	-0.02956606409048848	0	0	2021-09-30 21:46:24.180449	2021-09-30 21:46:24.18045	1
232	magnetite	231.000	-2921.2708503519075	9.960954899171487e-12	397915.04713034915	99485.68461447363	1.0006223299736692e-08	-0.02936373068821308	0	0	2021-09-30 21:46:24.180452	2021-09-30 21:46:24.180453	1
233	magnetite	232.000	-2894.56988569547	9.94288221152472e-12	397458.5914075609	99257.57178177581	1.0008622845036561e-08	-0.029162207313104222	0	0	2021-09-30 21:46:24.180457	2021-09-30 21:46:24.180459	1
234	magnetite	233.000	-2868.0371877796906	9.924785377525118e-12	397001.34801190475	99029.32781187083	1.0011027316192974e-08	-0.028961493035963976	0	0	2021-09-30 21:46:24.180461	2021-09-30 21:46:24.180462	1
235	magnetite	234.000	-2841.6721765414486	9.906664300129712e-12	396543.3133083077	98800.95225112626	1.0013436731286661e-08	-0.028761586925990942	0	0	2021-09-30 21:46:24.180464	2021-09-30 21:46:24.180466	1
236	magnetite	235.000	-2815.4742722518604	9.888518881643785e-12	396084.4836343577	98572.44464302456	1.001585110847899e-08	-0.028562488050772883	0	0	2021-09-30 21:46:24.180468	2021-09-30 21:46:24.180469	1
237	magnetite	236.000	-2789.4428955170483	9.870349023714703e-12	395624.85530001746	98343.80452813607	1.001827046601216e-08	-0.028364195476279254	0	0	2021-09-30 21:46:24.180471	2021-09-30 21:46:24.180473	1
238	magnetite	237.000	-2763.5774672789184	9.852154627325695e-12	395164.4245873357	98115.0314440922	1.0020694822209354e-08	-0.02816670826685366	0	0	2021-09-30 21:46:24.180475	2021-09-30 21:46:24.180476	1
239	magnetite	238.000	-2737.877408815942	9.833935592789583e-12	394703.1877501534	97886.12492555765	1.0023124195474936e-08	-0.02797002548520637	0	0	2021-09-30 21:46:24.180478	2021-09-30 21:46:24.180479	1
240	magnetite	239.000	-2712.34214174394	9.815691819742377e-12	394241.14101380704	97657.08450420304	1.0025558604294588e-08	-0.027774146192406594	0	0	2021-09-30 21:46:24.180482	2021-09-30 21:46:24.180483	1
241	magnetite	240.000	-2686.971088016871	9.797423207136845e-12	393778.2805748272	97427.90970867655	1.0027998067235475e-08	-0.02757906944787485	0	0	2021-09-30 21:46:24.180485	2021-09-30 21:46:24.180486	1
242	magnetite	241.000	-2661.7636699276245	9.779129653235977e-12	393314.6026006332	97198.60006457547	1.0030442602946389e-08	-0.027384794309375224	0	0	2021-09-30 21:46:24.180488	2021-09-30 21:46:24.18049	1
243	magnetite	242.000	-2636.71931010882	9.760811055606375e-12	392850.10322922404	96969.15509441755	1.0032892230157885e-08	-0.02719131983300754	0	0	2021-09-30 21:46:24.180492	2021-09-30 21:46:24.180493	1
244	magnetite	243.000	-2611.837431533607	9.742467311111572e-12	392384.77856886416	96739.57431761161	1.0035346967682419e-08	-0.026998645073199556	0	0	2021-09-30 21:46:24.180495	2021-09-30 21:46:24.180497	1
245	magnetite	244.000	-2587.117457516469	9.724098315905233e-12	391918.6246977662	96509.85725042825	1.003780683441445e-08	-0.02680676908269895	0	0	2021-09-30 21:46:24.180499	2021-09-30 21:46:24.1805	1
246	magnetite	245.000	-2562.5588117140373	9.70570396542432e-12	391451.63766376826	96280.0034059698	1.0040271849330572e-08	-0.026615690912565413	0	0	2021-09-30 21:46:24.180502	2021-09-30 21:46:24.180504	1
247	magnetite	246.000	-2538.160918125903	9.687284154382135e-12	390983.8134840073	96050.01229414002	1.0042742031489598e-08	-0.026425409612162595	0	0	2021-09-30 21:46:24.180506	2021-09-30 21:46:24.180507	1
248	magnetite	247.000	-2513.9232010954365	9.66883877676129e-12	390515.14814458805	95819.88342161357	1.0045217400032665e-08	-0.026235924229149964	0	0	2021-09-30 21:46:24.180509	2021-09-30 21:46:24.180511	1
249	magnetite	248.000	-2489.845085310609	9.6503677258066e-12	390045.63760024717	95589.616291805	1.004769797418331e-08	-0.026047233809474622	0	0	2021-09-30 21:46:24.180513	2021-09-30 21:46:24.180514	1
250	magnetite	249.000	-2465.9259958048237	9.63187089401785e-12	389575.2777740126	95359.210404837	1.0050183773247548e-08	-0.025859337397363163	0	0	2021-09-30 21:46:24.180516	2021-09-30 21:46:24.180517	1
251	magnetite	250.000	-2442.1653579577446	9.613348173142522e-12	389104.06455685885	95128.66525750907	1.0052674816613914e-08	-0.02567223403531324	0	0	2021-09-30 21:46:24.180519	2021-09-30 21:46:24.180521	1
252	magnetite	251.000	-2418.5625974961345	9.594799454168388e-12	388631.99380735634	94897.98034326476	1.0055171123753546e-08	-0.02548592276408534	0	0	2021-09-30 21:46:24.180523	2021-09-30 21:46:24.180524	1
253	magnetite	252.000	-2395.117140494696	9.576224627316028e-12	388159.0613513171	94667.1551521594	1.005767271422019e-08	-0.025300402622694236	0	0	2021-09-30 21:46:24.180526	2021-09-30 21:46:24.180528	1
254	magnetite	253.000	-2371.8284133769175	9.557623582031251e-12	387685.2629814347	94436.18917082691	1.0060179607650244e-08	-0.025115672648400547	0	0	2021-09-30 21:46:24.18053	2021-09-30 21:46:24.180531	1
255	magnetite	254.000	-2348.695842915923	9.538996206977416e-12	387210.5944569191	94205.08188244622	1.0062691823762766e-08	-0.024931731876702178	0	0	2021-09-30 21:46:24.180533	2021-09-30 21:46:24.180535	1
256	magnetite	255.000	-2325.7188562353294	9.520342390027663e-12	386735.05150312686	93973.83276670748	1.0065209382359482e-08	-0.024748579341325665	0	0	2021-09-30 21:46:24.180537	2021-09-30 21:46:24.180538	1
257	magnetite	256.000	-2302.8968808101026	9.501662018257024e-12	386258.62981118564	93742.44129977768	1.006773230332475e-08	-0.02456621407421746	0	0	2021-09-30 21:46:24.18054	2021-09-30 21:46:24.180542	1
258	magnetite	257.000	-2280.2293444674247	9.482954977934473e-12	385781.3250376134	93510.90695426567	1.0070260606625578e-08	-0.024384635105535225	0	0	2021-09-30 21:46:24.180544	2021-09-30 21:46:24.180545	1
259	magnetite	258.000	-2257.7156753875634	9.464221154514819e-12	385303.13280393265	93279.22919918718	1.0072794312311534e-08	-0.024203841463638905	0	0	2021-09-30 21:46:24.180547	2021-09-30 21:46:24.180549	1
260	magnetite	259.000	-2235.3553021047455	9.445460432630535e-12	384824.04869627854	93047.40749992887	1.0075333440514719e-08	-0.02402383217508187	0	0	2021-09-30 21:46:24.180551	2021-09-30 21:46:24.180552	1
261	magnetite	260.000	-2213.1476535080365	9.426672696083483e-12	384344.0682650017	92815.4413182123	1.0077878011449695e-08	-0.023844606264601918	0	0	2021-09-30 21:46:24.180554	2021-09-30 21:46:24.180556	1
262	magnetite	261.000	-2191.092158842223	9.407857827836493e-12	383863.1870242652	92583.33011205704	1.0080428045413396e-08	-0.02366616275511221	0	0	2021-09-30 21:46:24.180558	2021-09-30 21:46:24.180559	1
263	magnetite	262.000	-2169.1882477087056	9.389015710004869e-12	383381.40045163594	92351.07333574384	1.0082983562785013e-08	-0.023488500667692147	0	0	2021-09-30 21:46:24.180561	2021-09-30 21:46:24.180562	1
264	magnetite	263.000	-2147.4353500663883	9.370146223847775e-12	382898.70398766996	92118.67043977675	1.0085544584025897e-08	-0.023311619021578148	0	0	2021-09-30 21:46:24.180564	2021-09-30 21:46:24.180566	1
265	magnetite	264.000	-2125.832896232581	9.351249249759501e-12	382415.0930354916	91886.1208708451	1.0088111129679402e-08	-0.02313551683415438	0	0	2021-09-30 21:46:24.180568	2021-09-30 21:46:24.180569	1
266	magnetite	265.000	-2104.3803168839017	9.332324667260617e-12	381930.5629603665	91653.42407178471	1.009068322037075e-08	-0.022960193120943422	0	0	2021-09-30 21:46:24.180571	2021-09-30 21:46:24.180573	1
267	magnetite	266.000	-2083.0770430571874	9.313372354989002e-12	381445.10908926907	91420.57948153903	1.0093260876806829e-08	-0.02278564689559677	0	0	2021-09-30 21:46:24.180575	2021-09-30 21:46:24.180576	1
268	magnetite	267.000	-2061.922506150408	9.294392190690791e-12	380958.7267104425	91187.5865351191	1.0095844119776035e-08	-0.02261187716988539	0	0	2021-09-30 21:46:24.180578	2021-09-30 21:46:24.18058	1
269	magnetite	268.000	-2040.9161379235848	9.275384051211145e-12	380471.4110729531	90954.44466356358	1.0098432970148036e-08	-0.022438882953690082	0	0	2021-09-30 21:46:24.180582	2021-09-30 21:46:24.180583	1
270	magnetite	269.000	-2020.0573704997184	9.256347812484943e-12	379983.15738623764	90721.15329389785	1.0101027448873549e-08	-0.022266663254991853	0	0	2021-09-30 21:46:24.180585	2021-09-30 21:46:24.180587	1
271	magnetite	270.000	-1999.3456363657162	9.23728334952733e-12	379493.9608196447	90487.71184909288	1.0103627576984078e-08	-0.02209521707986209	0	0	2021-09-30 21:46:24.180589	2021-09-30 21:46:24.18059	1
272	magnetite	271.000	-1978.7803683733307	9.218190536424146e-12	379003.816501968	90254.11974802322	1.0106233375591643e-08	-0.021924543432452797	0	0	2021-09-30 21:46:24.180592	2021-09-30 21:46:24.180593	1
273	magnetite	272.000	-1958.3609997400986	9.199069246322223e-12	378512.71952097374	90020.3764054245	1.0108844865888491e-08	-0.021754641314986667	0	0	2021-09-30 21:46:24.180596	2021-09-30 21:46:24.180597	1
274	magnetite	273.000	-1938.086964050289	9.179919351419548e-12	378020.6649229208	89786.48123185064	1.0111462069146756e-08	-0.02158550972774704	0	0	2021-09-30 21:46:24.180599	2021-09-30 21:46:24.1806	1
275	magnetite	274.000	-1917.957695255855	9.1607407229553e-12	377527.6477120732	89552.43363363005	1.0114085006718124e-08	-0.02141714766906787	0	0	2021-09-30 21:46:24.180604	2021-09-30 21:46:24.180606	1
276	magnetite	275.000	-1897.9726276773915	9.141533231199749e-12	377033.6628502055	89318.23301282144	1.0116713700033465e-08	-0.02124955413532354	0	0	2021-09-30 21:46:24.180608	2021-09-30 21:46:24.180609	1
277	magnetite	276.000	-1878.1311960050994	9.122296745444021e-12	376538.70525610144	89083.87876716924	1.0119348170602426e-08	-0.021082728120918565	0	0	2021-09-30 21:46:24.180611	2021-09-30 21:46:24.180613	1
278	magnetite	277.000	-1858.432835299753	9.103031133989714e-12	376042.76980504347	88849.37029005784	1.012198844001302e-08	-0.020916668618277307	0	0	2021-09-30 21:46:24.180615	2021-09-30 21:46:24.180616	1
279	magnetite	278.000	-1838.8769809936775	9.083736264138379e-12	375545.85132829583	88614.70697046569	1.0124634529931165e-08	-0.020751374617833527	0	0	2021-09-30 21:46:24.180618	2021-09-30 21:46:24.18062	1
280	magnetite	279.000	-1819.4630688917273	9.06441200218087e-12	375047.94461257954	88379.88819291872	1.0127286462100215e-08	-0.020586845108019818	0	0	2021-09-30 21:46:24.180622	2021-09-30 21:46:24.180623	1
281	magnetite	280.000	-1800.1905351722737	9.045058213386505e-12	374549.04439953837	88144.91333744267	1.0129944258340442e-08	-0.020423079075257075	0	0	2021-09-30 21:46:24.180625	2021-09-30 21:46:24.180626	1
282	magnetite	281.000	-1781.0588163881969	9.025674761992144e-12	374049.14538519824	87909.78177951544	1.0132607940548514e-08	-0.020260075503943698	0	0	2021-09-30 21:46:24.180628	2021-09-30 21:46:24.18063	1
283	magnetite	282.000	-1762.0673494678845	9.006261511191043e-12	373548.24221941683	87674.49289001808	1.0135277530696903e-08	-0.020097833376444878	0	0	2021-09-30 21:46:24.180632	2021-09-30 21:46:24.180633	1
284	magnetite	283.000	-1743.2155717162361	8.98681832312161e-12	373046.32950532564	87439.04603518572	1.01379530508333e-08	-0.019936351673081627	0	0	2021-09-30 21:46:24.180635	2021-09-30 21:46:24.180637	1
285	magnetite	284.000	-1724.5029208156736	8.96734505885598e-12	372543.4017987626	87203.44057655714	1.0140634523079986e-08	-0.019775629372119876	0	0	2021-09-30 21:46:24.180639	2021-09-30 21:46:24.18064	1
286	magnetite	285.000	-1705.928834827157	8.947841578388419e-12	372039.4536076967	86967.67587092427	1.0143321969633143e-08	-0.019615665449759328	0	0	2021-09-30 21:46:24.180642	2021-09-30 21:46:24.180644	1
287	magnetite	286.000	-1687.4927521912089	8.928307740623601e-12	371534.4793916431	86731.75127028057	1.0146015412762168e-08	-0.019456458880122297	0	0	2021-09-30 21:46:24.180646	2021-09-30 21:46:24.180647	1
288	magnetite	287.000	-1669.1941117289412	8.90874340336469e-12	371028.4735610692	86495.66612176885	1.0148714874808921e-08	-0.019298008635242427	0	0	2021-09-30 21:46:24.180649	2021-09-30 21:46:24.180651	1
289	magnetite	288.000	-1651.032352643093	8.889148423301255e-12	370521.4304767912	86259.4197676281	1.0151420378186962e-08	-0.019140313685053343	0	0	2021-09-30 21:46:24.180653	2021-09-30 21:46:24.180654	1
290	magnetite	289.000	-1633.0069145190691	8.869522655997035e-12	370013.3444493617	86023.01154513992	1.0154131945380713e-08	-0.018983372997377117	0	0	2021-09-30 21:46:24.180656	2021-09-30 21:46:24.180658	1
291	magnetite	290.000	-1615.117237325992	8.849865955877511e-12	369504.20973844704	85786.44078657395	1.0156849598944616e-08	-0.01882718553791273	0	0	2021-09-30 21:46:24.18066	2021-09-30 21:46:24.180661	1
292	magnetite	291.000	-1597.362761417751	8.830178176217311e-12	368994.0205521948	85549.70681913245	1.0159573361502234e-08	-0.018671750270224358	0	0	2021-09-30 21:46:24.180663	2021-09-30 21:46:24.180665	1
293	magnetite	292.000	-1579.74292753407	8.810459169127427e-12	368482.7710465916	85312.80896489424	1.0162303255745304e-08	-0.018517066155729626	0	0	2021-09-30 21:46:24.180667	2021-09-30 21:46:24.180668	1
294	magnetite	293.000	-1562.257176801569	8.790708785542261e-12	367970.4553248103	85075.74654075781	1.016503930443275e-08	-0.01836313215368763	0	0	2021-09-30 21:46:24.18067	2021-09-30 21:46:24.180671	1
295	magnetite	294.000	-1544.9049507348427	8.770926875206474e-12	367457.0674365469	84838.5188583834	1.0167781530389665e-08	-0.018209947221187038	0	0	2021-09-30 21:46:24.180673	2021-09-30 21:46:24.180675	1
296	magnetite	295.000	-1527.6856912375392	8.75111328666165e-12	366942.60137734667	84601.12522413448	1.0170529956506218e-08	-0.018057510313133882	0	0	2021-09-30 21:46:24.180677	2021-09-30 21:46:24.180678	1
297	magnetite	296.000	-1510.5988406034487	8.731267867232764e-12	366427.0510879193	84363.56493901821	1.0173284605736536e-08	-0.017905820382239392	0	0	2021-09-30 21:46:24.18068	2021-09-30 21:46:24.180682	1
298	magnetite	297.000	-1493.643841517599	8.711390463014463e-12	365910.41045344324	84125.83729862515	1.0176045501097526e-08	-0.017754876379007634	0	0	2021-09-30 21:46:24.180684	2021-09-30 21:46:24.180685	1
299	magnetite	298.000	-1476.8201370573552	8.691480918857134e-12	365392.6733028584	83887.9415930678	1.0178812665667645e-08	-0.017604677251723082	0	0	2021-09-30 21:46:24.180687	2021-09-30 21:46:24.180689	1
300	magnetite	299.000	-1460.1271706935306	8.671539078352781e-12	364873.8334081476	83649.87710691859	1.0181586122585628e-08	-0.017455221946438042	0	0	2021-09-30 21:46:24.180691	2021-09-30 21:46:24.180692	1
301	magnetite	300.000	-1443.5643862915015	8.651564783820679e-12	364353.88448360574	83411.64311914667	1.0184365895049138e-08	-0.01730650940695999	0	0	2021-09-30 21:46:24.180694	2021-09-30 21:46:24.180696	1
302	magnetite	301.000	-1427.1312281123298	8.631557876292845e-12	363832.8201850978	83173.23890305398	1.0187152006313383e-08	-0.01715853857483874	0	0	2021-09-30 21:46:24.180698	2021-09-30 21:46:24.180699	1
303	magnetite	302.000	-1410.8271408138937	8.61151819549926e-12	363310.6341093038	82934.6637262101	1.0189944479689655e-08	-0.017011308389353552	0	0	2021-09-30 21:46:24.180701	2021-09-30 21:46:24.180703	1
304	magnetite	303.000	-1394.6515694520244	8.591445579852899e-12	362787.3197929515	82695.91685038622	1.019274333854383e-08	-0.01686481778750012	0	0	2021-09-30 21:46:24.180705	2021-09-30 21:46:24.180706	1
305	magnetite	304.000	-1378.6039594816523	8.571339866434525e-12	362262.8707120364	82456.9975314882	1.0195548606294786e-08	-0.016719065703977385	0	0	2021-09-30 21:46:24.180708	2021-09-30 21:46:24.18071	1
306	magnetite	305.000	-1362.6837567579573	8.551200890977271e-12	361737.2802810288	82217.90501948858	1.0198360306412764e-08	-0.01657405107117425	0	0	2021-09-30 21:46:24.180712	2021-09-30 21:46:24.180713	1
307	magnetite	306.000	-1346.8904075375306	8.531028487850972e-12	361210.5418520677	81978.63855835744	1.0201178462417666e-08	-0.01642977281915619	0	0	2021-09-30 21:46:24.180715	2021-09-30 21:46:24.180716	1
308	magnetite	307.000	-1331.2233584795401	8.510822490046267e-12	360682.6487141404	81739.19738599229	1.0204003097877277e-08	-0.016286229875651714	0	0	2021-09-30 21:46:24.180718	2021-09-30 21:46:24.18072	1
309	magnetite	308.000	-1315.6820566469066	8.490582729158488e-12	360153.5940922493	81499.58073414682	1.0206834236405425e-08	-0.016143421166038712	0	0	2021-09-30 21:46:24.180722	2021-09-30 21:46:24.180723	1
310	magnetite	309.000	-1300.2659495074865	8.47030903537126e-12	359623.3711465638	81259.78782835869	1.0209671901660055e-08	-0.016001345613330647	0	0	2021-09-30 21:46:24.180725	2021-09-30 21:46:24.180727	1
311	magnetite	310.000	-1284.9744849352617	8.4500012374399e-12	359091.97297155834	81019.81788787607	1.0212516117341246e-08	-0.015860002138162636	0	0	2021-09-30 21:46:24.180729	2021-09-30 21:46:24.18073	1
312	magnetite	311.000	-1269.8071112115383	8.429659162674522e-12	358559.3925951352	80779.67012558294	1.0215366907189136e-08	-0.0157193896587774	0	0	2021-09-30 21:46:24.180732	2021-09-30 21:46:24.180734	1
313	magnetite	312.000	-1254.7632770261537	8.409282636922922e-12	358025.6229777329	80539.34374792359	1.0218224294981768e-08	-0.015579507091011071	0	0	2021-09-30 21:46:24.180736	2021-09-30 21:46:24.180737	1
314	magnetite	313.000	-1239.8424314786898	8.38887148455316e-12	357490.6570114187	80298.83795482553	1.0221088304532847e-08	-0.015440353348278833	0	0	2021-09-30 21:46:24.180739	2021-09-30 21:46:24.180741	1
315	magnetite	314.000	-1225.0440240796977	8.368425528435928e-12	356954.48751896573	80058.15193962136	1.0223958959689445e-08	-0.01530192734156051	0	0	2021-09-30 21:46:24.180743	2021-09-30 21:46:24.180744	1
316	magnetite	315.000	-1210.3675047519257	8.347944589926586e-12	356417.1072529142	79817.28488896949	1.0226836284329567e-08	-0.01516422797938589	0	0	2021-09-30 21:46:24.180746	2021-09-30 21:46:24.180748	1
317	magnetite	316.000	-1195.812323831562	8.327428488846976e-12	355878.50889461616	79576.23598277343	1.0229720302359663e-08	-0.015027254167820027	0	0	2021-09-30 21:46:24.180751	2021-09-30 21:46:24.180753	1
318	magnetite	317.000	-1181.3779320694794	8.306877043466913e-12	355338.6850532635	79335.00439409992	1.0232611037712037e-08	-0.014891004810448307	0	0	2021-09-30 21:46:24.180755	2021-09-30 21:46:24.180756	1
319	magnetite	318.000	-1167.0637806324928	8.286290070485404e-12	354797.62826489937	79093.58928909572	1.0235508514342144e-08	-0.01475547880836141	0	0	2021-09-30 21:46:24.180758	2021-09-30 21:46:24.18076	1
320	magnetite	319.000	-1152.869321104624	8.265667385011585e-12	354255.33099141176	78851.98982690308	1.0238412756225805e-08	-0.014620675060140116	0	0	2021-09-30 21:46:24.180762	2021-09-30 21:46:24.180763	1
321	magnetite	320.000	-1138.7940054883752	8.24500880054534e-12	353711.7856195093	78610.20515957371	1.024132378735632e-08	-0.014486592461839984	0	0	2021-09-30 21:46:24.180765	2021-09-30 21:46:24.180767	1
322	magnetite	321.000	-1124.8372862060105	8.224314128957618e-12	353166.9844596796	78368.23443198166	1.0244241631741445e-08	-0.014353229906975809	0	0	2021-09-30 21:46:24.180768	2021-09-30 21:46:24.18077	1
323	magnetite	322.000	-1110.9986161008476	8.203583180470457e-12	352620.9197451278	78126.0767817344	1.02471663134003e-08	-0.014220586286506007	0	0	2021-09-30 21:46:24.180772	2021-09-30 21:46:24.180773	1
324	magnetite	323.000	-1097.2774484385577	8.182815763636673e-12	352073.58363069786	77883.73133908286	1.025009785636013e-08	-0.014088660488816776	0	0	2021-09-30 21:46:24.180775	2021-09-30 21:46:24.180777	1
325	magnetite	324.000	-1083.6732369084748	8.162011685319231e-12	351524.9681917729	77641.19722682964	1.0253036284652967e-08	-0.013957451399706153	0	0	2021-09-30 21:46:24.180779	2021-09-30 21:46:24.18078	1
326	magnetite	325.000	-1070.1854356249135	8.14117075067029e-12	350975.0654231567	77398.47356023591	1.0255981622312152e-08	-0.013826957902367855	0	0	2021-09-30 21:46:24.180782	2021-09-30 21:46:24.180784	1
327	magnetite	326.000	-1056.8134991284971	8.120292763109917e-12	350423.86723793496	77155.55944692683	1.025893389336876e-08	-0.013697178877374998	0	0	2021-09-30 21:46:24.180786	2021-09-30 21:46:24.180787	1
328	magnetite	327.000	-1043.5568823874942	8.099377524304443e-12	349871.3654663153	76912.45398679512	1.0261893121847862e-08	-0.013568113202663634	0	0	2021-09-30 21:46:24.180789	2021-09-30 21:46:24.18079	1
329	magnetite	328.000	-1030.4150407991651	8.078424834144492e-12	349317.55185444676	76669.15627190337	1.0264859331764686e-08	-0.013439759753516124	0	0	2021-09-30 21:46:24.180792	2021-09-30 21:46:24.180794	1
330	magnetite	329.000	-1017.3874301911186	8.057434490722634e-12	348762.41806321783	76425.66538638459	1.0267832547120596e-08	-0.01331211740254431	0	0	2021-09-30 21:46:24.180796	2021-09-30 21:46:24.180797	1
331	magnetite	330.000	-1004.473506822676	8.036406290310697e-12	348205.95566703146	76181.98040634088	1.0270812791898993e-08	-0.013185185019672582	0	0	2021-09-30 21:46:24.180799	2021-09-30 21:46:24.180801	1
332	magnetite	331.000	-991.672727386248	8.015340027336678e-12	347648.15615255875	75938.10039974084	1.027380009006099e-08	-0.013058961472120684	0	0	2021-09-30 21:46:24.180803	2021-09-30 21:46:24.180804	1
333	magnetite	332.000	-978.9845490087192	7.994235494361315e-12	347089.01091746875	75694.02442631483	1.0276794465541006e-08	-0.012933445624386405	0	0	2021-09-30 21:46:24.180806	2021-09-30 21:46:24.180808	1
334	magnetite	333.000	-966.4084292528446	7.973092482054248e-12	346528.5112691349	75449.75153744873	1.0279795942242153e-08	-0.012808636338228065	0	0	2021-09-30 21:46:24.18081	2021-09-30 21:46:24.180811	1
335	magnetite	334.000	-953.943826118653	7.95191077916979e-12	345966.6484233173	75205.28077607561	1.028280454403149e-08	-0.012684532472646823	0	0	2021-09-30 21:46:24.180813	2021-09-30 21:46:24.180815	1
336	magnetite	335.000	-941.5901980448648	7.930690172522309e-12	345403.4135028207	74960.61117656599	1.0285820294735087e-08	-0.012561132883868783	0	0	2021-09-30 21:46:24.180817	2021-09-30 21:46:24.180818	1
337	magnetite	336.000	-929.3470039103173	7.909430446961191e-12	344838.7975361266	74715.74176461578	1.0288843218132932e-08	-0.012438436425326927	0	0	2021-09-30 21:46:24.18082	2021-09-30 21:46:24.180821	1
338	magnetite	337.000	-917.2137030354008	7.888131385345389e-12	344272.79145600006	74470.6715571325	1.0291873337953652e-08	-0.012316441947642861	0	0	2021-09-30 21:46:24.180823	2021-09-30 21:46:24.180825	1
339	magnetite	338.000	-905.1897551835065	7.866792768517552e-12	343705.38609806966	74225.39956211945	1.0294910677869053e-08	-0.012195148298608356	0	0	2021-09-30 21:46:24.180827	2021-09-30 21:46:24.180828	1
340	magnetite	339.000	-893.2746205624835	7.84541437527771e-12	343136.5721993812	73979.92477855811	1.0297955261488446e-08	-0.012074554323166665	0	0	2021-09-30 21:46:24.18083	2021-09-30 21:46:24.180832	1
341	magnetite	340.000	-881.4677598261086	7.823995982356525e-12	342566.34039692266	73734.24619628808	1.0301007112352816e-08	-0.011954658863393702	0	0	2021-09-30 21:46:24.180834	2021-09-30 21:46:24.180835	1
342	magnetite	341.000	-869.7686340755649	7.80253736438808e-12	341994.6812261218	73488.36279588519	1.0304066253928753e-08	-0.01183546075847897	0	0	2021-09-30 21:46:24.180837	2021-09-30 21:46:24.180839	1
343	magnetite	342.000	-858.176704860933	7.781038293882227e-12	341421.5851193144	73242.27354853755	1.0307132709602182e-08	-0.01171695884470627	0	0	2021-09-30 21:46:24.180841	2021-09-30 21:46:24.180842	1
344	magnetite	343.000	-846.6914341826933	7.759498541196429e-12	340847.0424041826	72995.977415919	1.031020650267188e-08	-0.011599151955434279	0	0	2021-09-30 21:46:24.180844	2021-09-30 21:46:24.180846	1
345	magnetite	344.000	-835.3122844932385	7.737917874507155e-12	340271.0433021637	72749.47335006089	1.0313287656342747e-08	-0.0114820389210768	0	0	2021-09-30 21:46:24.180848	2021-09-30 21:46:24.180849	1
346	magnetite	345.000	-824.0387186983994	7.716296059780767e-12	339693.5779268271	72502.76029322113	1.0316376193718877e-08	-0.011365618569082886	0	0	2021-09-30 21:46:24.180851	2021-09-30 21:46:24.180852	1
347	magnetite	346.000	-812.8702001589807	7.694632860743913e-12	339114.6362822199	72255.83717775109	1.0319472137796352e-08	-0.011249889723916705	0	0	2021-09-30 21:46:24.180854	2021-09-30 21:46:24.180856	1
348	magnetite	347.000	-801.806192692309	7.672928038853392e-12	338534.2082611792	72008.70292595991	1.0322575511455819e-08	-0.011134851207037215	0	0	2021-09-30 21:46:24.180858	2021-09-30 21:46:24.180859	1
349	magnetite	348.000	-790.8461605737936	7.651181353265518e-12	337952.2836436124	71761.35644997675	1.0325686337454778e-08	-0.011020501836877552	0	0	2021-09-30 21:46:24.180861	2021-09-30 21:46:24.180863	1
350	magnetite	349.000	-779.9895685384984	7.629392560804936e-12	337368.8520947422	71513.79665161025	1.0328804638419621e-08	-0.010906840428824243	0	0	2021-09-30 21:46:24.180865	2021-09-30 21:46:24.180866	1
351	magnetite	350.000	-769.235881782726	7.607561415932896e-12	336783.90316331654	71266.02242220528	1.0331930436837407e-08	-0.010793865795196186	0	0	2021-09-30 21:46:24.180868	2021-09-30 21:46:24.18087	1
352	magnetite	351.000	-758.5845659656147	7.585687670714974e-12	336197.42627978424	71018.03264249775	1.0335063755047305e-08	-0.01068157674522332	0	0	2021-09-30 21:46:24.180872	2021-09-30 21:46:24.180873	1
353	magnetite	352.000	-748.0350872107475	7.563771074788213e-12	335609.41075443145	70769.8261824658	1.0338204615231803e-08	-0.01056997208502518	0	0	2021-09-30 21:46:24.180875	2021-09-30 21:46:24.180877	1
354	magnetite	353.000	-737.5869121077739	7.541811375327696e-12	335019.8457754828	70521.40190117904	1.034135303940757e-08	-0.010459050617589073	0	0	2021-09-30 21:46:24.180879	2021-09-30 21:46:24.18088	1
355	magnetite	354.000	-727.2395077140446	7.519808317012513e-12	334428.72040716273	70272.75864664464	1.034450904941601e-08	-0.01034881114274811	0	0	2021-09-30 21:46:24.180882	2021-09-30 21:46:24.180884	1
356	magnetite	355.000	-716.9923415562594	7.49776164199113e-12	333836.0235877174	70023.89525565052	1.0347672666913501e-08	-0.010239252457158933	0	0	2021-09-30 21:46:24.180886	2021-09-30 21:46:24.180887	1
357	magnetite	356.000	-706.844881632127	7.475671089846129e-12	333241.7441273968	69774.81055360599	1.0350843913361274e-08	-0.010130373354279168	0	0	2021-09-30 21:46:24.180889	2021-09-30 21:46:24.18089	1
358	magnetite	357.000	-696.7965964120402	7.453536397558324e-12	332645.87070639443	69525.50335437874	1.0354022810014975e-08	-0.0100221726243447	0	0	2021-09-30 21:46:24.180892	2021-09-30 21:46:24.180894	1
359	magnetite	358.000	-686.8469548407621	7.431357299470225e-12	332048.3918727453	69275.97246012953	1.035720937791383e-08	-0.009914649054346568	0	0	2021-09-30 21:46:24.180898	2021-09-30 21:46:24.180899	1
360	magnetite	359.000	-676.9954263391282	7.409133527248833e-12	331449.29604017944	69026.216661143	1.0360403637869461e-08	-0.009807801428007716	0	0	2021-09-30 21:46:24.180901	2021-09-30 21:46:24.180903	1
361	magnetite	360.000	-667.2414808057606	7.38686480984776e-12	330848.5714859314	68776.23473565587	1.0363605610454303e-08	-0.009701628525759357	0	0	2021-09-30 21:46:24.180905	2021-09-30 21:46:24.180906	1
362	magnetite	361.000	-657.5845886187966	7.364550873468674e-12	330246.2063485038	68526.02544968166	1.0366815315989607e-08	-0.009596129124717117	0	0	2021-09-30 21:46:24.180908	2021-09-30 21:46:24.180909	1
363	magnetite	362.000	-648.0242206376324	7.342191441522008e-12	329642.1886253832	68275.58755683173	1.0370032774533066e-08	-0.009491301998656918	0	0	2021-09-30 21:46:24.180911	2021-09-30 21:46:24.180913	1
364	magnetite	363.000	-638.5598482046795	7.319786234586967e-12	329036.50617070834	68024.91979813336	1.0373258005865972e-08	-0.009387145917990511	0	0	2021-09-30 21:46:24.180915	2021-09-30 21:46:24.180916	1
365	magnetite	364.000	-629.1909431471374	7.297334970370788e-12	328429.1466928891	67774.02090184412	1.0376491029479939e-08	-0.009283659649740764	0	0	2021-09-30 21:46:24.180918	2021-09-30 21:46:24.18092	1
366	magnetite	365.000	-619.9169777787788	7.2748373636672365e-12	327820.0977521735	67522.8895832624	1.0379731864563182e-08	-0.009180841957516641	0	0	2021-09-30 21:46:24.180922	2021-09-30 21:46:24.180923	1
367	magnetite	366.000	-610.7374249017521	7.2522931263143445e-12	327209.34675816406	67271.5245445346	1.0382980529986296e-08	-0.009078691601487882	0	0	2021-09-30 21:46:24.180925	2021-09-30 21:46:24.180927	1
368	magnetite	367.000	-601.651757808397	7.229701967151341e-12	326596.8809672796	67019.92447445834	1.0386237044287547e-08	-0.008977207338359352	0	0	2021-09-30 21:46:24.180929	2021-09-30 21:46:24.18093	1
369	magnetite	368.000	-592.6594502830765	7.207063591974776e-12	325982.6874801628	66768.0880482818	1.0389501425657663e-08	-0.008876387921345126	0	0	2021-09-30 21:46:24.180932	2021-09-30 21:46:24.180934	1
370	magnetite	369.000	-583.759976604024	7.184377703493826e-12	325366.75323903066	66516.01392749904	1.0392773691924077e-08	-0.00877623210014222	0	0	2021-09-30 21:46:24.180936	2021-09-30 21:46:24.180937	1
371	magnetite	370.000	-574.9528115452061	7.161644001284745e-12	324749.0650249684	66263.70075964145	1.0396053860534634e-08	-0.008676738620903991	0	0	2021-09-30 21:46:24.180939	2021-09-30 21:46:24.180941	1
372	magnetite	371.000	-566.2374303782015	7.138862181744433e-12	324129.60945516254	66011.14717806473	1.0399341948540721e-08	-0.008577906226213263	0	0	2021-09-30 21:46:24.180943	2021-09-30 21:46:24.180944	1
373	magnetite	372.000	-557.613308874095	7.1160319380431485e-12	323508.3729800741	65758.3518017319	1.0402637972579802e-08	-0.008479733655055036	0	0	2021-09-30 21:46:24.180946	2021-09-30 21:46:24.180947	1
374	magnetite	373.000	-549.0799233053896	7.093152960076284e-12	322885.3418805483	65505.313234991525	1.0405941948857374e-08	-0.008382219642788959	0	0	2021-09-30 21:46:24.180949	2021-09-30 21:46:24.180951	1
375	magnetite	374.000	-540.6367504479335	7.070224934415218e-12	322260.5022648609	65252.03006735194	1.040925389312823e-08	-0.008285362921121356	0	0	2021-09-30 21:46:24.180953	2021-09-30 21:46:24.180954	1
376	magnetite	375.000	-532.283267582865	7.047247544257228e-12	321633.84006569785	64998.50087325049	1.0412573820677123e-08	-0.008189162218076957	0	0	2021-09-30 21:46:24.180956	2021-09-30 21:46:24.180958	1
377	magnetite	376.000	-524.0189524985732	7.0242204693744145e-12	321005.3410370669	64744.72421181806	1.0415901746298727e-08	-0.008093616257970289	0	0	2021-09-30 21:46:24.18096	2021-09-30 21:46:24.180961	1
378	magnetite	377.000	-515.8432834926768	7.001143386061627e-12	320374.99075114017	64490.698626639074	1.0419237684276872e-08	-0.007998723761376626	0	0	2021-09-30 21:46:24.180963	2021-09-30 21:46:24.180965	1
379	magnetite	378.000	-507.75573937402106	6.9780159670833766e-12	319742.77459502453	64236.422645506136	1.0422581648363086e-08	-0.007904483445102663	0	0	2021-09-30 21:46:24.180967	2021-09-30 21:46:24.180968	1
380	magnetite	379.000	-499.75579946468974	6.954837881619694e-12	319108.67776745814	63981.89478016969	1.042593365175436e-08	-0.007810894022156752	0	0	2021-09-30 21:46:24.18097	2021-09-30 21:46:24.180972	1
381	magnetite	380.000	-491.8429436020382	6.931608795210921e-12	318472.6852754322	63727.113526082714	1.0429293707070104e-08	-0.007717954201718755	0	0	2021-09-30 21:46:24.180974	2021-09-30 21:46:24.180975	1
382	magnetite	381.000	-484.01665214074296	6.908328369701397e-12	317834.7819307339	63472.07736213966	1.0432661826328326e-08	-0.007625662689109545	0	0	2021-09-30 21:46:24.180977	2021-09-30 21:46:24.180978	1
383	magnetite	382.000	-476.27640595486946	6.884996263182028e-12	317194.9523464095	63216.78475040999	1.0436038020920943e-08	-0.007534018185760081	0	0	2021-09-30 21:46:24.18098	2021-09-30 21:46:24.180982	1
384	magnetite	383.000	-468.62168643995955	6.861612129931699e-12	316553.1809331458	62961.23413586627	1.0439422301588217e-08	-0.0074430193891800835	0	0	2021-09-30 21:46:24.180984	2021-09-30 21:46:24.180985	1
385	magnetite	384.000	-461.05197551513726	6.838175620357501e-12	315909.45189556637	62705.42394610628	1.0442814678392264e-08	-0.007352664992926285	0	0	2021-09-30 21:46:24.180987	2021-09-30 21:46:24.180989	1
386	magnetite	385.000	-453.566755625234	6.814686380933762e-12	315263.7492284407	62449.35259106913	1.0446215160689655e-08	-0.007262953686570299	0	0	2021-09-30 21:46:24.180991	2021-09-30 21:46:24.180992	1
387	magnetite	386.000	-446.1655097429331	6.7911440541398205e-12	314616.0567128039	62193.0184627453	1.0449623757103001e-08	-0.007173884155666026	0	0	2021-09-30 21:46:24.180994	2021-09-30 21:46:24.180996	1
388	magnetite	387.000	-438.8477213709347	6.767548278396533e-12	313966.3579119847	61936.41993488058	1.0453040475491518e-08	-0.007085455081716629	0	0	2021-09-30 21:46:24.180998	2021-09-30 21:46:24.180999	1
389	magnetite	388.000	-431.6128745441397	6.7438986880014916e-12	313314.6361675377	61679.55536267315	1.0456465322920578e-08	-0.006997665142141094	0	0	2021-09-30 21:46:24.181001	2021-09-30 21:46:24.181003	1
390	magnetite	389.000	-424.46045383185526	6.7201949130628846e-12	312660.87459507905	61422.42308246462	1.0459898305630092e-08	-0.00691051301024029	0	0	2021-09-30 21:46:24.181005	2021-09-30 21:46:24.181006	1
391	magnetite	390.000	-417.3899443400198	6.6964365794319995e-12	312005.0560800207	61165.02141142361	1.046333942900182e-08	-0.006823997355162621	0	0	2021-09-30 21:46:24.181008	2021-09-30 21:46:24.18101	1
392	magnetite	391.000	-410.4008317134501	6.672623308634322e-12	311347.16327320185	60907.34864722285	1.0466788697525452e-08	-0.0067381168418691765	0	0	2021-09-30 21:46:24.181012	2021-09-30 21:46:24.181013	1
393	magnetite	392.000	-403.4926021381086	6.648754717799186e-12	310687.17858641397	60649.403067708874	1.0470246114763471e-08	-0.00665287013109841	0	0	2021-09-30 21:46:24.181015	2021-09-30 21:46:24.181016	1
394	magnetite	393.000	-396.6647423433933	6.624830419587959e-12	310025.08418781555	60391.18293056436	1.047371168331475e-08	-0.006568255879330338	0	0	2021-09-30 21:46:24.181018	2021-09-30 21:46:24.18102	1
395	magnetite	394.000	-389.9167396044484	6.600850022120694e-12	309360.8619972344	60132.68647296287	1.04771854047768e-08	-0.006484272738750239	0	0	2021-09-30 21:46:24.181022	2021-09-30 21:46:24.181023	1
396	magnetite	395.000	-383.24808174449873	6.576813128901246e-12	308694.49368135334	59873.91191121583	1.048066727970666e-08	-0.006400919357211853	0	0	2021-09-30 21:46:24.181025	2021-09-30 21:46:24.181027	1
397	magnetite	396.000	-376.6582571372049	6.552719338740775e-12	308025.9606487763	59614.85744041153	1.0484157307580318e-08	-0.006318194378200039	0	0	2021-09-30 21:46:24.181029	2021-09-30 21:46:24.18103	1
398	magnetite	397.000	-370.1467547090431	6.528568245679627e-12	307355.24404497014	59355.52123404561	1.0487655486750696e-08	-0.006236096440792965	0	0	2021-09-30 21:46:24.181032	2021-09-30 21:46:24.181034	1
399	magnetite	398.000	-363.71306394170665	6.504359438907522e-12	306682.32474708004	59095.90144364356	1.049116181440402e-08	-0.0061546241796236805	0	0	2021-09-30 21:46:24.181036	2021-09-30 21:46:24.181037	1
400	magnetite	399.000	-357.35667487453287	6.480092502682029e-12	306007.1833586131	58835.996198374014	1.0494676286514632e-08	-0.006073776224841227	0	0	2021-09-30 21:46:24.181039	2021-09-30 21:46:24.181041	1
401	magnetite	400.000	-351.077078106952	6.455767016245259e-12	305329.80020398647	58575.80360465327	1.0498198897798096e-08	-0.0059935512020711295	0	0	2021-09-30 21:46:24.181046	2021-09-30 21:46:24.181047	1
402	magnetite	401.000	-344.87376480096196	6.43138255373875e-12	304650.1553229364	58315.32174574071	1.0501729641662566e-08	-0.005913947732375346	0	0	2021-09-30 21:46:24.181049	2021-09-30 21:46:24.181051	1
403	magnetite	402.000	-338.74622668362724	6.406938684116478e-12	303968.22846478305	58054.54868132441	1.0505268510158349e-08	-0.005834964432211642	0	0	2021-09-30 21:46:24.181053	2021-09-30 21:46:24.181054	1
404	magnetite	403.000	-332.69395604960283	6.382434971055958e-12	303283.9990825467	57793.48244709727	1.0508815493925568e-08	-0.005756599913392357	0	0	2021-09-30 21:46:24.181056	2021-09-30 21:46:24.181058	1
405	magnetite	404.000	-326.7164457636839	6.357870972867377e-12	302597.4463269112	57532.12105432288	1.0512370582139876e-08	-0.005678852783042577	0	0	2021-09-30 21:46:24.18106	2021-09-30 21:46:24.181061	1
406	magnetite	405.000	-320.8131892633814	6.333246242400691e-12	301908.5490400291	57270.4624893911	1.051593376245611e-08	-0.005601721643557697	0	0	2021-09-30 21:46:24.181063	2021-09-30 21:46:24.181065	1
407	magnetite	406.000	-314.9836805615236	6.308560326950664e-12	301217.2857491637	57008.50471336299	1.0519505020949828e-08	-0.005525205092560345	0	0	2021-09-30 21:46:24.181067	2021-09-30 21:46:24.181068	1
408	magnetite	407.000	-309.2274142488851	6.28381276815976e-12	300523.6346601626	56746.245661504676	1.0523084342056628e-08	-0.005449301722856667	0	0	2021-09-30 21:46:24.18107	2021-09-30 21:46:24.181072	1
409	magnetite	408.000	-303.5438854968422	6.259003101918846e-12	299827.5736507578	56483.683242809944	1.0526671708509162e-08	-0.005374010122391968	0	0	2021-09-30 21:46:24.181074	2021-09-30 21:46:24.181075	1
410	magnetite	409.000	-297.9325900600563	6.234130858265644e-12	299129.0802636858	56220.81533951117	1.053026710127175e-08	-0.005299328874205665	0	0	2021-09-30 21:46:24.181077	2021-09-30 21:46:24.181079	1
411	magnetite	410.000	-292.39302427918574	6.209195561280853e-12	298428.13169962267	55957.63980657821	1.0533870499472474e-08	-0.005225256556385584	0	0	2021-09-30 21:46:24.181081	2021-09-30 21:46:24.181082	1
412	magnetite	411.000	-286.92468508362515	6.184196728981911e-12	297724.70480992744	55694.1544712049	1.0537481880332694e-08	-0.005151791742021535	0	0	2021-09-30 21:46:24.181084	2021-09-30 21:46:24.181085	1
413	magnetite	412.000	-281.52706999427477	6.159133873214282e-12	297018.7760891877	55430.3571322828	1.0541101219093824e-08	-0.005078932999158192	0	0	2021-09-30 21:46:24.181087	2021-09-30 21:46:24.181089	1
414	magnetite	413.000	-276.19967712633905	6.134006499540251e-12	296310.32166756067	55166.245559861796	1.0544728488941286e-08	-0.0050066788907472464	0	0	2021-09-30 21:46:24.181091	2021-09-30 21:46:24.181092	1
415	magnetite	414.000	-270.9420051921546	6.108814107125102e-12	295599.3173029028	54901.817494597075	1.0548363660925498e-08	-0.004935027974598805	0	0	2021-09-30 21:46:24.181094	2021-09-30 21:46:24.181096	1
416	magnetite	415.000	-265.75355350404936	6.0835561886206575e-12	294885.73837268114	54637.07064718212	1.055200670387982e-08	-0.004863978803332046	0	0	2021-09-30 21:46:24.181098	2021-09-30 21:46:24.181099	1
417	magnetite	416.000	-260.6338219772324	6.0582322300460604e-12	294169.55986565864	54372.00269776728	1.0555657584335246e-08	-0.004793529924325098	0	0	2021-09-30 21:46:24.181101	2021-09-30 21:46:24.181103	1
418	magnetite	417.000	-255.58231113271523	6.032841710665738e-12	293450.7563733458	54106.611295363466	1.0559316266431769e-08	-0.0047236798796641095	0	0	2021-09-30 21:46:24.181105	2021-09-30 21:46:24.181106	1
419	magnetite	418.000	-250.5985221002652	6.007384102864472e-12	292729.3020812106	53840.89405723037	1.056298271182626e-08	-0.004654427206091537	0	0	2021-09-30 21:46:24.181108	2021-09-30 21:46:24.18111	1
420	magnetite	419.000	-245.68195662139155	5.981858872019471e-12	292005.17075963836	53574.84856824885	1.0566656879596698e-08	-0.004585770434953595	0	0	2021-09-30 21:46:24.181112	2021-09-30 21:46:24.181113	1
421	magnetite	420.000	-240.83211705236448	5.9562654763693796e-12	291278.3357546332	53308.47238027714	1.0570338726142575e-08	-0.004517708092146843	0	0	2021-09-30 21:46:24.181115	2021-09-30 21:46:24.181116	1
422	magnetite	421.000	-236.04850636726823	5.930603366880111e-12	290548.7699782508	53041.76301148973	1.0574028205081367e-08	-0.004450238698063942	0	0	2021-09-30 21:46:24.181118	2021-09-30 21:46:24.18112	1
423	magnetite	422.000	-231.330628161088	5.904871987107426e-12	289816.4458987549	52774.717945699245	1.0577725267140823e-08	-0.004383360767538498	0	0	2021-09-30 21:46:24.181122	2021-09-30 21:46:24.181123	1
424	magnetite	423.000	-226.67798665283237	5.8790707730561594e-12	289081.3355304856	52507.334631659796	1.0581429860046963e-08	-0.004317072809789029	0	0	2021-09-30 21:46:24.181125	2021-09-30 21:46:24.181127	1
425	magnetite	424.000	-222.09008668869083	5.85319915303598e-12	288343.4104234313	52239.61048235215	1.0585141928407512e-08	-0.004251373328361979	0	0	2021-09-30 21:46:24.181129	2021-09-30 21:46:24.18113	1
426	magnetite	425.000	-217.56643374522773	5.827256547513594e-12	287602.6416524917	51971.54287424936	1.0588861413590636e-08	-0.004186260821073808	0	0	2021-09-30 21:46:24.181132	2021-09-30 21:46:24.181134	1
427	magnetite	426.000	-213.10653393261293	5.801242368961277e-12	286858.99980642187	51703.12914656253	1.0592588253598727e-08	-0.004121733779952103	0	0	2021-09-30 21:46:24.181136	2021-09-30 21:46:24.181137	1
428	magnetite	427.000	-208.70989399789005	5.775156021701627e-12	286112.4549764453	51434.36660046597	1.0596322382937057e-08	-0.004057790691175718	0	0	2021-09-30 21:46:24.181139	2021-09-30 21:46:24.18114	1
429	magnetite	428.000	-204.37602132828277	5.74899690174842e-12	285362.97674452444	51165.252498301306	1.060006373247697e-08	-0.003994430035013862	0	0	2021-09-30 21:46:24.181142	2021-09-30 21:46:24.181144	1
430	magnetite	429.000	-200.10442395454027	5.722764396643435e-12	284610.5341712745	50895.78406275912	1.0603812229313512e-08	-0.003931650285764207	0	0	2021-09-30 21:46:24.181146	2021-09-30 21:46:24.181147	1
431	magnetite	430.000	-195.89461055432173	5.6964578852891536e-12	283855.09578350943	50625.95847603829	1.06075677966171e-08	-0.0038694499116898764	0	0	2021-09-30 21:46:24.181149	2021-09-30 21:46:24.181151	1
432	magnetite	431.000	-191.7460904556219	5.67007673777718e-12	283096.6295614045	50355.772878981516	1.0611330353479039e-08	-0.0038078273749553877	0	0	2021-09-30 21:46:24.181153	2021-09-30 21:46:24.181154	1
433	magnetite	432.000	-187.65837364023696	5.64362031521225e-12	282335.10292526206	50085.224370186435	1.0615099814750577e-08	-0.0037467811315614642	0	0	2021-09-30 21:46:24.181156	2021-09-30 21:46:24.181158	1
434	magnetite	433.000	-183.63097074727293	5.6170879695316995e-12	281570.48272186477	49814.310005091655	1.0618876090875195e-08	-0.003686309631278713	0	0	2021-09-30 21:46:24.18116	2021-09-30 21:46:24.181161	1
435	magnetite	434.000	-179.6633930766962	5.590479043320249e-12	280802.73521040153	49543.026795036545	1.0622659087713813e-08	-0.0036264113175801306	0	0	2021-09-30 21:46:24.181163	2021-09-30 21:46:24.181165	1
436	magnetite	435.000	-175.75515259292771	5.563792869619931e-12	280031.82604794845	49271.37170629401	1.0626448706362582e-08	-0.003567084627572413	0	0	2021-09-30 21:46:24.181167	2021-09-30 21:46:24.181168	1
437	magnetite	436.000	-171.90576192848158	5.537028771735045e-12	279257.72027448844	48999.34165907516	1.063024484296291e-08	-0.00350832799192605	0	0	2021-09-30 21:46:24.18117	2021-09-30 21:46:24.181172	1
438	magnetite	437.000	-168.11473438764853	5.510186063031937e-12	278480.3822974513	48726.93352650495	1.0634047388503349e-08	-0.0034501398348041486	0	0	2021-09-30 21:46:24.181174	2021-09-30 21:46:24.181175	1
439	magnetite	438.000	-164.38158395022552	5.483264046733466e-12	277699.77587575564	48454.14413356789	1.0637856228612943e-08	-0.0033925185737899727	0	0	2021-09-30 21:46:24.181177	2021-09-30 21:46:24.181178	1
440	magnetite	439.000	-160.70582527529245	5.456262015707971e-12	276915.86410333205	48180.97025602214	1.0641671243345657e-08	-0.0033354626198131786	0	0	2021-09-30 21:46:24.18118	2021-09-30 21:46:24.181182	1
441	magnetite	440.000	-157.08697370503629	5.429179252252558e-12	276128.60939210857	47907.40861928178	1.0645492306955388e-08	-0.0032789703770746623	0	0	2021-09-30 21:46:24.181184	2021-09-30 21:46:24.181185	1
442	magnetite	441.000	-153.5245452686244	5.4020150278705134e-12	275337.9734544348	47633.4558972649	1.0649319287661202e-08	-0.003223040242970062	0	0	2021-09-30 21:46:24.181187	2021-09-30 21:46:24.181189	1
443	magnetite	442.000	-150.0180566861274	5.37476860304267e-12	274543.917284924	47359.10871120753	1.0653152047402179e-08	-0.0031676706080117937	0	0	2021-09-30 21:46:24.181193	2021-09-30 21:46:24.181194	1
444	magnetite	443.000	-146.5670253724929	5.347439226992498e-12	273746.4011416883	47084.36362844086	1.065699044158149e-08	-0.0031128598557496594	0	0	2021-09-30 21:46:24.181196	2021-09-30 21:46:24.181198	1
445	magnetite	444.000	-143.17096944157095	5.320026137444719e-12	272945.3845269418	46809.21716113124	1.0660834318799071e-08	-0.003058606362689936	0	0	2021-09-30 21:46:24.1812	2021-09-30 21:46:24.181201	1
446	magnetite	445.000	-139.82940771019238	5.292528560377231e-12	272140.82616694755	46533.6657649813	1.0664683520572377e-08	-0.00300490849821293	0	0	2021-09-30 21:46:24.181203	2021-09-30 21:46:24.181204	1
447	magnetite	446.000	-136.54185970230108	5.264945709766107e-12	271332.6839912778	46257.70583789029	1.0668537881044593e-08	-0.002951764624488962	0	0	2021-09-30 21:46:24.181206	2021-09-30 21:46:24.181208	1
448	magnetite	447.000	-133.3078456531414	5.237276787323425e-12	270520.91511136276	45981.333718572874	1.0672397226679646e-08	-0.0028991730963927095	0	0	2021-09-30 21:46:24.18121	2021-09-30 21:46:24.181211	1
449	magnetite	448.000	-130.1268865135017	5.2095209822276986e-12	269705.47579829383	45704.54568513384	1.0676261375943414e-08	-0.002847132261415906	0	0	2021-09-30 21:46:24.181213	2021-09-30 21:46:24.181215	1
450	magnetite	449.000	-126.99850395401508	5.181677470846637e-12	268886.3214598529	45427.337953597686	1.0680130138970339e-08	-0.002795640459578311	0	0	2021-09-30 21:46:24.181217	2021-09-30 21:46:24.181218	1
451	magnetite	450.000	-123.92222036951931	5.153745416451972e-12	268063.40661673236	45149.70667639089	1.068400331721476e-08	-0.0027446960233369387	0	0	2021-09-30 21:46:24.18122	2021-09-30 21:46:24.181222	1
452	magnetite	451.000	-120.8975588834759	5.12572396892606e-12	267236.6848779119	44871.64794077518	1.0687880703086104e-08	-0.0026942972774934666	0	0	2021-09-30 21:46:24.181224	2021-09-30 21:46:24.181225	1
453	magnetite	452.000	-117.92404335245085	5.097612264460001e-12	266406.10891515546	44593.157767229786	1.0691762079567166e-08	-0.002644442539099794	0	0	2021-09-30 21:46:24.181227	2021-09-30 21:46:24.181229	1
454	magnetite	453.000	-115.00119837065762	5.069409425242924e-12	265571.6304365892	44314.2321077804	1.0695647219814516e-08	-0.0025951301173616965	0	0	2021-09-30 21:46:24.181231	2021-09-30 21:46:24.181232	1
455	magnetite	454.000	-112.128549274564	5.041114559142166e-12	264733.20015932	44034.86684427301	1.0699535886740138e-08	-0.002546358313540511	0	0	2021-09-30 21:46:24.181234	2021-09-30 21:46:24.181235	1
456	magnetite	455.000	-109.30562214756421	5.0127267593739915e-12	263890.7677810524	43755.057786590056	1.0703427832573275e-08	-0.002498125420852808	0	0	2021-09-30 21:46:24.181237	2021-09-30 21:46:24.181239	1
457	magnetite	456.000	-106.53194382471781	4.984245104164504e-12	263044.2819506579	43474.80067080662	1.0707322798401389e-08	-0.0024504297243679867	0	0	2021-09-30 21:46:24.181241	2021-09-30 21:46:24.181242	1
458	magnetite	457.000	-103.80704189755664	4.95566865640042e-12	262193.69023765024	43194.091157284085	1.0711220513689192e-08	-0.002403269500903737	0	0	2021-09-30 21:46:24.181249	2021-09-30 21:46:24.181251	1
459	magnetite	458.000	-101.1304447189615	4.926996463269293e-12	261338.93910051606	42912.9248286987	1.0715120695774438e-08	-0.0023566430189193004	0	0	2021-09-30 21:46:24.181253	2021-09-30 21:46:24.181254	1
460	magnetite	459.000	-98.50168140811026	4.898227555888825e-12	260479.97385384847	42631.29718800214	1.0719023049339301e-08	-0.0023105485384064713	0	0	2021-09-30 21:46:24.181256	2021-09-30 21:46:24.181258	1
461	magnetite	460.000	-95.92028185549893	4.8693609489248465e-12	259616.73863422798	42349.203656311256	1.0722927265855924e-08	-0.0022649843107782745	0	0	2021-09-30 21:46:24.181259	2021-09-30 21:46:24.181261	1
462	magnetite	461.000	-93.38577672803711	4.84039564019754e-12	258749.17636479237	42066.63957072394	1.072683302300474e-08	-0.0022199485787552297	0	0	2021-09-30 21:46:24.181263	2021-09-30 21:46:24.181264	1
463	magnetite	462.000	-90.89769747422012	4.811330610275462e-12	257877.2287184333	41783.600182057795	1.0730739984064005e-08	-0.00217543957624916	0	0	2021-09-30 21:46:24.181266	2021-09-30 21:46:24.181268	1
464	magnetite	463.000	-88.4555763293792	4.782164822056895e-12	257000.8360795544	41500.080652508135	1.0734647797268969e-08	-0.0021314555282444547	0	0	2021-09-30 21:46:24.18127	2021-09-30 21:46:24.181271	1
465	magnetite	464.000	-86.05894632101162	4.752897220338058e-12	256119.93750432215	41216.076053222074	1.0738556095138895e-08	-0.0020879946506766976	0	0	2021-09-30 21:46:24.181273	2021-09-30 21:46:24.181275	1
466	magnetite	465.000	-83.70734127419284	4.723526731367634e-12	255234.47067933631	40931.58136178452	1.0742464493770123e-08	-0.0020450551503085976	0	0	2021-09-30 21:46:24.181277	2021-09-30 21:46:24.181278	1
467	magnetite	466.000	-81.40029581707269	4.694052262387127e-12	254344.37187864239	40646.59145961229	1.074637259209322e-08	-0.002002635224603139	0	0	2021-09-30 21:46:24.18128	2021-09-30 21:46:24.181282	1
468	magnetite	467.000	-79.13734538645718	4.664472701156451e-12	253449.57591900526	40361.101129252165	1.075027997109212e-08	-0.00196073306159384	0	0	2021-09-30 21:46:24.181283	2021-09-30 21:46:24.181285	1
469	magnetite	468.000	-76.91802623347878	4.634786915464198e-12	252550.01611335724	40075.10505157848	1.0754186192982997e-08	-0.0019193468397520554	0	0	2021-09-30 21:46:24.181287	2021-09-30 21:46:24.181288	1
470	magnetite	469.000	-74.74187542935661	4.60499375262195e-12	251645.62422232833	39788.597802885335	1.0758090800350556e-08	-0.0018784747278512183	0	0	2021-09-30 21:46:24.18129	2021-09-30 21:46:24.181292	1
471	magnetite	470.000	-72.60843087124935	4.575092038942025e-12	250736.330403763	39501.573851868925	1.0761993315239144e-08	-0.001838114884827913	0	0	2021-09-30 21:46:24.181294	2021-09-30 21:46:24.181295	1
472	magnetite	471.000	-70.51723128820282	4.5450805791979515e-12	249822.06316011935	39214.0275564943	1.0765893238196027e-08	-0.0017982654596396933	0	0	2021-09-30 21:46:24.181297	2021-09-30 21:46:24.181299	1
473	magnetite	472.000	-68.467816247195	4.514958156067006e-12	248902.74928364286	38925.953160741505	1.0769790047263863e-08	-0.0017589245911195242	0	0	2021-09-30 21:46:24.181301	2021-09-30 21:46:24.181302	1
474	magnetite	473.000	-66.45972615928056	4.484723529554055e-12	247978.31379919735	38637.34479122478	1.0773683196919402e-08	-0.0017200904078267494	0	0	2021-09-30 21:46:24.181304	2021-09-30 21:46:24.181306	1
475	magnetite	474.000	-64.49250228583793	4.454375436395933e-12	247048.67990463218	38348.19645367924	1.0777572116954934e-08	-0.0016817610278944508	0	0	2021-09-30 21:46:24.181308	2021-09-30 21:46:24.181309	1
476	magnetite	475.000	-62.56568674492119	4.423912589445557e-12	246113.76890855355	38058.50202930795	1.078145621129912e-08	-0.001643934558873096	0	0	2021-09-30 21:46:24.181311	2021-09-30 21:46:24.181313	1
477	magnetite	476.000	-60.67882251771987	4.393333677034917e-12	245173.50016536153	37768.25527098286	1.0785334856773286e-08	-0.0016066090975703363	0	0	2021-09-30 21:46:24.181314	2021-09-30 21:46:24.181316	1
478	magnetite	477.000	-58.83145345512932	4.36263736231605e-12	244227.79100740567	37477.449799292124	1.0789207401779166e-08	-0.0015697827298868274	0	0	2021-09-30 21:46:24.181318	2021-09-30 21:46:24.181319	1
479	magnetite	478.000	-57.02312428443471	4.331822282579078e-12	243276.55667410122	37186.07909842606	1.0793073164913754e-08	-0.001533453530647932	0	0	2021-09-30 21:46:24.181321	2021-09-30 21:46:24.181323	1
480	magnetite	479.000	-55.25338061611174	4.300887048546305e-12	242319.71023783935	36894.136511893594	1.079693143350657e-08	-0.001497619563431161	0	0	2021-09-30 21:46:24.181325	2021-09-30 21:46:24.181326	1
481	magnetite	480.000	-53.52176895074727	4.2698302436413454e-12	241357.16252651237	36601.615238060265	1.0800781462074317e-08	-0.0014622788803892062	0	0	2021-09-30 21:46:24.181328	2021-09-30 21:46:24.18133	1
482	magnetite	481.000	-51.82783668608313	4.238650423232194e-12	240388.82204246454	36308.50832549879	1.0804622470687552e-08	-0.0014274295220683964	0	0	2021-09-30 21:46:24.181332	2021-09-30 21:46:24.181333	1
483	magnetite	482.000	-50.17113212418669	4.207346113847112e-12	239414.59487766481	36014.80866814199	1.0808453643243636e-08	-0.0013930695172224285	0	0	2021-09-30 21:46:24.181335	2021-09-30 21:46:24.181337	1
484	magnetite	483.000	-48.551204478751586	4.175915812362088e-12	238434.38462488592	35720.50900022788	1.0812274125639639e-08	-0.0013591968826211812	0	0	2021-09-30 21:46:24.181339	2021-09-30 21:46:24.18134	1
485	magnetite	484.000	-46.967603882532515	4.144357985158643e-12	237448.09228465747	35425.60189102561	1.0816083023838578e-08	-0.0013258096228544488	0	0	2021-09-30 21:46:24.181344	2021-09-30 21:46:24.181346	1
486	magnetite	485.000	-45.419881394917766	4.11267106725062e-12	236455.61616774657	35130.07973933036	1.0819879401821766e-08	-0.0012929057301303908	0	0	2021-09-30 21:46:24.181348	2021-09-30 21:46:24.18135	1
487	magnetite	486.000	-43.907589009643665	4.080853461378564e-12	235456.8517929011	34833.93476771465	1.082366227941947e-08	-0.001260483184068508	0	0	2021-09-30 21:46:24.181352	2021-09-30 21:46:24.181354	1
488	magnetite	487.000	-42.43027966265509	4.048903537070198e-12	234451.6917795726	34537.159016522455	1.0827430630011529e-08	-0.001228539951486936	0	0	2021-09-30 21:46:24.181356	2021-09-30 21:46:24.181357	1
489	magnetite	488.000	-40.98750724011626	4.016819629665453e-12	233440.0257353151	34239.744337591736	1.0831183378088892e-08	-0.0011970739861838328	0	0	2021-09-30 21:46:24.181359	2021-09-30 21:46:24.181361	1
490	magnetite	489.000	-39.57882658657649	3.984600039304373e-12	232421.74013753555	33941.68238769014	1.083491939666629e-08	-0.0011660832287126348	0	0	2021-09-30 21:46:24.181363	2021-09-30 21:46:24.181364	1
491	magnetite	490.000	-38.20379351329555	3.9522430298761754e-12	231396.71820924612	33642.964621647305	1.0838637504535501e-08	-0.00113556560615094	0	0	2021-09-30 21:46:24.181366	2021-09-30 21:46:24.181367	1
492	magnetite	491.000	-36.861964806733525	3.919746827927627e-12	230364.83978844463	33343.58228516633	1.0842336463347804e-08	-0.001105519031862765	0	0	2021-09-30 21:46:24.181369	2021-09-30 21:46:24.181371	1
493	magnetite	492.000	-35.552898237210314	3.887109621528774e-12	229325.98119072017	33043.52640729549	1.0846014974513288e-08	-0.0010759414052539137	0	0	2021-09-30 21:46:24.181373	2021-09-30 21:46:24.181374	1
494	magnetite	493.000	-34.2761525677401	3.854329559094001e-12	228280.01506465193	32742.787792540395	1.084967167590357e-08	-0.0010468306115201662	0	0	2021-09-30 21:46:24.181376	2021-09-30 21:46:24.181377	1
495	magnetite	494.000	-33.03128756304627	3.821404748156235e-12	227226.81023953506	32441.35701259469	1.0853305138343535e-08	-0.0010181845213880095	0	0	2021-09-30 21:46:24.181379	2021-09-30 21:46:24.181381	1
496	magnetite	495.000	-31.817863998762807	3.788333254091981e-12	226166.23156493247	32139.224397666498	1.085691386187624e-08	-0.000990000990847588	0	0	2021-09-30 21:46:24.181383	2021-09-30 21:46:24.181384	1
497	magnetite	496.000	-30.63544367082791	3.755113098794799e-12	225098.13974151216	31836.380027375708	1.0860496271783993e-08	-0.0009622778608775519	0	0	2021-09-30 21:46:24.181386	2021-09-30 21:46:24.181388	1
498	magnetite	497.000	-29.483589405076444	3.721742259294608e-12	224022.39114258677	31532.81372119555	1.0864050714346986e-08	-0.0009350129571614578	0	0	2021-09-30 21:46:24.181389	2021-09-30 21:46:24.181391	1
499	magnetite	498.000	-28.361865067037673	3.688218666320112e-12	222938.83762572557	31228.51502840982	1.0867575452319297e-08	-0.0009082040897953604	0	0	2021-09-30 21:46:24.181393	2021-09-30 21:46:24.181394	1
500	magnetite	499.000	-27.269835571945258	3.654540202801458e-12	221847.3263337588	30923.473217555074	1.0871068660100279e-08	-0.0008818490529862063	0	0	2021-09-30 21:46:24.181396	2021-09-30 21:46:24.181398	1
501	magnetite	500.000	-26.20706689496675	3.620704702310052e-12	220747.69948443776	30617.67726531461	1.0874528418577363e-08	-0.0008559456247406317	0	0	2021-09-30 21:46:24.1814	2021-09-30 21:46:24.181401	1
502	magnetite	501.000	-25.173126081660175	3.586709947432268e-12	219639.79414795362	30311.115844828608	1.0877952709614097e-08	-0.0008304915665437296	0	0	2021-09-30 21:46:24.181403	2021-09-30 21:46:24.181405	1
503	magnetite	502.000	-24.167581258665603	3.5525536680736362e-12	218523.4420114509	30003.77731338189	1.0881339410154943e-08	-0.0008054846230273379	0	0	2021-09-30 21:46:24.181406	2021-09-30 21:46:24.181408	1
504	magnetite	503.000	-23.190001644640095	3.518233539689788e-12	217398.46912959832	29695.649699427802	1.0884686285915561e-08	-0.0007809225216273661	0	0	2021-09-30 21:46:24.18141	2021-09-30 21:46:24.181411	1
505	magnetite	504.000	-22.239957561444655	3.4837471814403e-12	216264.69566019857	29386.72068890332	1.0887990984624474e-08	-0.0007568029722296526	0	0	2021-09-30 21:46:24.181413	2021-09-30 21:46:24.181415	1
506	magnetite	505.000	-21.317020445592455	3.4490921542612547e-12	215121.93558373055	29076.977610786696	1.089125102877871e-08	-0.0007331236668038178	0	0	2021-09-30 21:46:24.181417	2021-09-30 21:46:24.181418	1
507	magnetite	506.000	-20.420762859967848	3.4142659588521317e-12	213969.996405619	28766.407421845277	1.0894463807872424e-08	-0.0007098822790245359	0	0	2021-09-30 21:46:24.18142	2021-09-30 21:46:24.181421	1
508	magnetite	507.000	-19.55075850582635	3.379266033572303e-12	212808.67883991916	28454.99669051626	1.089762657005348e-08	-0.0006870764638796253	0	0	2021-09-30 21:46:24.181423	2021-09-30 21:46:24.181425	1
509	magnetite	508.000	-18.706582235086127	3.3440897522421352e-12	211637.7764729844	28142.731579858664	1.0900736413158562e-08	-0.0006647038572643087	0	0	2021-09-30 21:46:24.181427	2021-09-30 21:46:24.181428	1
510	magnetite	509.000	-17.88781006292224	3.3087344218433555e-12	210457.0754055537	27829.597829509337	1.090379027507234e-08	-0.0006427620755609612	0	0	2021-09-30 21:46:24.18143	2021-09-30 21:46:24.181431	1
511	magnetite	510.000	-17.094019180675346	3.2731972801129805e-12	209266.3538715488	27515.580736569867	1.0906784923350816e-08	-0.0006212487152036141	0	0	2021-09-30 21:46:24.181433	2021-09-30 21:46:24.181435	1
512	magnetite	511.000	-16.32478796908726	3.237475493024725e-12	208065.38183170988	27200.665135344923	1.0909716944042673e-08	-0.0006001613522264426	0	0	2021-09-30 21:46:24.181437	2021-09-30 21:46:24.181438	1
513	magnetite	512.000	-15.579696011876468	3.201566152151392e-12	206853.9205400183	26884.83537584522	1.0912582729635665e-08	-0.0005794975417954057	0	0	2021-09-30 21:46:24.18144	2021-09-30 21:46:24.181441	1
514	magnetite	513.000	-14.858324109667318	3.1654662719012955e-12	205631.72208065522	26568.075300960652	1.0915378466047269e-08	-0.000559254817722158	0	0	2021-09-30 21:46:24.181443	2021-09-30 21:46:24.181445	1
515	magnetite	514.000	-14.160254294287462	3.129172786621286e-12	204398.5288730216	26250.36822220004	1.091810011857025e-08	-0.0005394306919592876	0	0	2021-09-30 21:46:24.181447	2021-09-30 21:46:24.181448	1
516	magnetite	515.000	-13.485069843448931	3.0926825475584245e-12	203154.07314209713	25931.69689388443	1.0920743416674e-08	-0.000520022654075876	0	0	2021-09-30 21:46:24.18145	2021-09-30 21:46:24.181452	1
517	magnetite	516.000	-12.83235529582908	3.055992319671778e-12	201898.0763511373	25612.04348567006	1.0923303837551608e-08	-0.0005010281707122973	0	0	2021-09-30 21:46:24.181454	2021-09-30 21:46:24.181455	1
518	magnetite	517.000	-12.20169646656861	3.019098778285201e-12	200630.24859339723	25291.389553264937	1.0925776588290259e-08	-0.0004824446850131039	0	0	2021-09-30 21:46:24.181457	2021-09-30 21:46:24.181458	1
519	magnetite	518.000	-11.592680463204893	2.9819985055713142e-12	199350.28793922215	24969.716007189785	1.0928156586528726e-08	-0.000464269616036758	0	0	2021-09-30 21:46:24.18146	2021-09-30 21:46:24.181462	1
520	magnetite	519.000	-11.004895702059931	2.944687986856124e-12	198057.87973445212	24647.00307941881	1.0930438439449896e-08	-0.00044650035814088247	0	0	2021-09-30 21:46:24.181464	2021-09-30 21:46:24.181465	1
521	magnetite	520.000	-10.437931925103447	2.9071636067330207e-12	196752.69584564972	24323.23028771958	1.093261642093849e-08	-0.00042913428034159576	0	0	2021-09-30 21:46:24.181467	2021-09-30 21:46:24.181468	1
522	magnetite	521.000	-9.891380217312877	2.8694216449739523e-12	195434.39384716016	23998.376397491797	1.0934684446713996e-08	-0.0004121687256454016	0	0	2021-09-30 21:46:24.18147	2021-09-30 21:46:24.181472	1
523	magnetite	522.000	-9.364833024553445	2.8314582722246995e-12	194102.61614445449	23672.419380884447	1.0936636047225649e-08	-0.0003956010103519701	0	0	2021-09-30 21:46:24.181474	2021-09-30 21:46:24.181475	1
524	magnetite	523.000	-8.857884172002969	2.7932695454701776e-12	192756.9890275698	23345.336372946575	1.0938464338070386e-08	-0.0003794284233260313	0	0	2021-09-30 21:46:24.181477	2021-09-30 21:46:24.181479	1
525	magnetite	524.000	-8.370128883147625	2.7548514032545204e-12	191397.12164774176	23017.103624540778	1.0940161987664447e-08	-0.00036364822523644614	0	0	2021-09-30 21:46:24.18148	2021-09-30 21:46:24.181482	1
526	magnetite	525.000	-7.901163799376725	2.7161996606395802e-12	190022.60490950418	22687.696451717864	1.0941721181865407e-08	-0.00034825764776037744	0	0	2021-09-30 21:46:24.181484	2021-09-30 21:46:24.181485	1
527	magnetite	526.000	-7.450587000206391	2.6773100038841195e-12	188633.01026960078	22357.089181217696	1.0943133585201941e-08	-0.00033325389275029897	0	0	2021-09-30 21:46:24.181489	2021-09-30 21:46:24.18149	1
528	magnetite	527.000	-7.017998024164098	2.638177984824544e-12	187227.88843298773	22025.255091722236	1.0944390298323628e-08	-0.00031863413136139684	0	0	2021-09-30 21:46:24.181492	2021-09-30 21:46:24.181494	1
529	magnetite	528.000	-6.6029978903683215	2.598799014936448e-12	185806.76793498916	21692.166350443054	1.0945481811231082e-08	-0.00030439550313670987	0	0	2021-09-30 21:46:24.181496	2021-09-30 21:46:24.181497	1
530	magnetite	529.000	-6.205189120839941	2.5591683590545518e-12	184369.1535972705	21357.79394457582	1.0946397951786764e-08	-0.00029053511504711633	0	0	2021-09-30 21:46:24.181499	2021-09-30 21:46:24.1815	1
531	magnetite	530.000	-5.824175763584754	2.5192811287266797e-12	182914.52484368873	21022.10760709712	1.0947127828937178e-08	-0.00027705004048302447	0	0	2021-09-30 21:46:24.181502	2021-09-30 21:46:24.181504	1
532	magnetite	531.000	-5.459563416489373	2.479132275175379e-12	181442.333860226	20685.075736313822	1.0947659769996585e-08	-0.00026393731819433465	0	0	2021-09-30 21:46:24.181506	2021-09-30 21:46:24.181507	1
533	magnetite	532.000	-5.110959252075989	2.438716581838498e-12	179952.00358107258	20346.665308500487	1.0947981251248364e-08	-0.00025119395117492385	0	0	2021-09-30 21:46:24.181509	2021-09-30 21:46:24.18151	1
534	magnetite	533.000	-4.777972043165	2.3980286564575176e-12	178442.9254804419	20006.841782873926	1.094807882101048e-08	-0.00023881690548755154	0	0	2021-09-30 21:46:24.181512	2021-09-30 21:46:24.181514	1
535	magnetite	534.000	-4.460212189498397	2.357062922679657e-12	176914.45714681537	19665.568998055332	1.094793801418293e-08	-0.00022680310902468438	0	0	2021-09-30 21:46:24.181516	2021-09-30 21:46:24.181517	1
536	magnetite	535.000	-4.157291745381031	2.315813611136751e-12	175365.9196129463	19322.809059054853	1.0947543257144356e-08	-0.0002151494502003002	0	0	2021-09-30 21:46:24.181519	2021-09-30 21:46:24.181521	1
537	magnetite	536.000	-3.8688244484016523	2.274274749960465e-12	173796.59441101324	18978.522213680702	1.0946877761686888e-08	-0.0002038527765672294	0	0	2021-09-30 21:46:24.181522	2021-09-30 21:46:24.181524	1
538	magnetite	537.000	-3.594425749300773	2.232440154689717e-12	172205.72031768892	18632.666717119522	1.0945923406468059e-08	-0.00019290989335403333	0	0	2021-09-30 21:46:24.181526	2021-09-30 21:46:24.181527	1
539	magnetite	538.000	-3.3337128430582395	2.1903034175220086e-12	170592.4897484413	18285.198683253468	1.0944660604209023e-08	-0.00018231756191478666	0	0	2021-09-30 21:46:24.181529	2021-09-30 21:46:24.181531	1
540	magnetite	539.000	-3.086304701279789	2.147857895855777e-12	168956.04475394194	17936.07192106727	1.0943068152570841e-08	-0.00017207249808441565	0	0	2021-09-30 21:46:24.181532	2021-09-30 21:46:24.181534	1
541	magnetite	540.000	-2.8518221059690636	2.1050967000657452e-12	167295.4725638106	17585.237754248505	1.0941123066285084e-08	-0.00016217137043143348	0	0	2021-09-30 21:46:24.181536	2021-09-30 21:46:24.181537	1
542	magnetite	541.000	-2.629887684779524	2.0620126804475796e-12	165609.80061381523	17232.644821789567	1.093880038768812e-08	-0.00015261079839898984	0	0	2021-09-30 21:46:24.181539	2021-09-30 21:46:24.181541	1
543	magnetite	542.000	-2.420125947849692	2.0185984132618097e-12	163897.99098174617	16878.238857050288	1.0936072972293585e-08	-0.00014338735032409913	0	0	2021-09-30 21:46:24.181543	2021-09-30 21:46:24.181544	1
544	magnetite	543.000	-2.2221633263351976	1.9748461857998446e-12	162158.93414408356	16521.96244232409	1.0932911245414202e-08	-0.0001344975413237057	0	0	2021-09-30 21:46:24.181546	2021-09-30 21:46:24.181547	1
545	magnetite	544.000	-2.0356282127624374	1.9307479803870336e-12	160391.4419497635	16163.754735453376	1.0929282925085462e-08	-0.0001259378310348595	0	0	2021-09-30 21:46:24.181549	2021-09-30 21:46:24.181551	1
546	magnetite	545.000	-1.860151003341459	1.8862954572288036e-12	158594.23968816697	15803.55116444296	1.0925152705616068e-08	-0.00011770462119467724	0	0	2021-09-30 21:46:24.181553	2021-09-30 21:46:24.181554	1
547	magnetite	546.000	-1.6953641423901795	1.841479935995932e-12	156765.95710506564	15441.28308529975	1.0920481894949863e-08	-0.00010979425304391851	0	0	2021-09-30 21:46:24.181556	2021-09-30 21:46:24.181557	1
548	magnetite	547.000	-1.5409021690385385	1.7962923760337984e-12	154905.11819159638	15076.87739745381	1.0915227997614704e-08	-0.00010220300453585745	0	0	2021-09-30 21:46:24.181559	2021-09-30 21:46:24.181561	1
549	magnetite	548.000	-1.3964017664000008	1.750723355067829e-12	153010.129536	14710.256110050856	1.0909344233282099e-08	-9.492708732962863e-05	0	0	2021-09-30 21:46:24.181563	2021-09-30 21:46:24.181564	1
550	magnetite	549.000	-1.2615018134193738	1.704763046263042e-12	151079.2669840485	14341.335851101017	1.0902778978770442e-08	-8.796264354429196e-05	0	0	2021-09-30 21:46:24.181566	2021-09-30 21:46:24.181567	1
551	magnetite	550.000	-1.1358434396306754	1.658401193479522e-12	149110.66029941643	13970.02730985877	1.0895475118566857e-08	-8.130574224640927e-05	0	0	2021-09-30 21:46:24.181569	2021-09-30 21:46:24.181571	1
552	magnetite	551.000	-1.0190700830873933	1.6116270845473047e-12	147102.27544657915	13596.234600810945	1.0887369285446818e-08	-7.495237563984156e-05	0	0	2021-09-30 21:46:24.181573	2021-09-30 21:46:24.181574	1
553	magnetite	552.000	-0.9108275517606653	1.5644295223633955e-12	145051.89403194404	13219.85453515314	1.087839096830745e-08	-6.889845492162326e-05	0	0	2021-09-30 21:46:24.181576	2021-09-30 21:46:24.181578	1
554	magnetite	553.000	-0.8107640887395565	1.5167967935900174e-12	142957.08932817998	12840.775782493387	1.0868461458586925e-08	-6.313980576196344e-05	0	0	2021-09-30 21:46:24.181579	2021-09-30 21:46:24.181581	1
555	magnetite	554.000	-0.7185304416129076	1.46871663470616e-12	140815.19816440804	12458.877901537986	1.0857492599190017e-08	-5.767216335944737e-05	0	0	2021-09-30 21:46:24.181583	2021-09-30 21:46:24.181584	1
556	magnetite	555.000	-0.6337799364655426	1.4201761951336592e-12	138623.2877804784	12074.030213421558	1.0845385290083665e-08	-5.249116701406208e-05	0	0	2021-09-30 21:46:24.181586	2021-09-30 21:46:24.181588	1
557	magnetite	556.000	-0.556168556984786	1.371161997123675e-12	136378.1165022851	11686.090484774873	1.0832027691831808e-08	-4.759235415037951e-05	0	0	2021-09-30 21:46:24.181589	2021-09-30 21:46:24.181591	1
558	magnetite	557.000	-0.4853550292485085	1.3216598920487366e-12	134076.08677631099	11294.903379073425	1.081729305112016e-08	-4.2971153710597255e-05	0	0	2021-09-30 21:46:24.181593	2021-09-30 21:46:24.181594	1
559	magnetite	558.000	-0.42100091285623437	1.2716550126986754e-12	131713.1886759306	10900.298623564855	1.0801037049073533e-08	-3.862287882151153e-05	0	0	2021-09-30 21:46:24.181596	2021-09-30 21:46:24.181598	1
560	magnetite	559.000	-0.36277069917398413	1.2211317211246357e-12	129284.93141698386	10502.088824123603	1.0783094541401927e-08	-3.454271862000342e-05	0	0	2021-09-30 21:46:24.1816	2021-09-30 21:46:24.181601	1
561	magnetite	560.000	-0.3103319175964634	1.1700735515125629e-12	126786.25963357676	10100.06684026851	1.0763275515438324e-08	-3.072572909707727e-05	0	0	2021-09-30 21:46:24.181603	2021-09-30 21:46:24.181604	1
562	magnetite	561.000	-0.2633552508935144	1.1184631474946564e-12	124211.45007440225	9694.00260517035	1.0741360027395344e-08	-2.716682278928339e-05	0	0	2021-09-30 21:46:24.181606	2021-09-30 21:46:24.181608	1
563	magnetite	562.000	-0.22151466091022773	1.0662821932222269e-12	121553.98284487368	9283.639237595413	1.0717091795146753e-08	-2.3860757106240482e-05	0	0	2021-09-30 21:46:24.18161	2021-09-30 21:46:24.181611	1
564	magnetite	563.000	-0.18448752614372765	1.0135113374239272e-12	118806.3791245032	8868.688239563682	1.0690169994199545e-08	-2.080212103078775e-05	0	0	2021-09-30 21:46:24.181613	2021-09-30 21:46:24.181614	1
565	magnetite	564.000	-0.1519547930409029	9.60130109556608e-13	115959.99409080858	8448.823497600251	1.0660238615944473e-08	-1.7985319859512173e-05	0	0	2021-09-30 21:46:24.181616	2021-09-30 21:46:24.181618	1
566	magnetite	565.000	-0.12360114327333643	9.061168270185748e-13	113004.74902956489	8023.67369504921	1.0626872462847286e-08	-1.540455755941336e-05	0	0	2021-09-30 21:46:24.18162	2021-09-30 21:46:24.181621	1
567	magnetite	566.000	-0.0991151797813596	8.514484922325248e-13	109928.77939396419	7592.812578915255	1.0589558416259149e-08	-1.3053816191459274e-05	0	0	2021-09-30 21:46:24.181623	2021-09-30 21:46:24.181624	1
568	magnetite	567.000	-0.07818963508644118	7.961006782126528e-13	106717.96433711894	7155.746275302799	1.0547669917272637e-08	-1.092683167880104e-05	0	0	2021-09-30 21:46:24.181626	2021-09-30 21:46:24.181628	1
569	magnetite	568.000	-0.06052160632133724	7.400474010007513e-13	103355.2852459993	6711.896458103698	1.0500431467332699e-08	-9.01706495312002e-06	0	0	2021-09-30 21:46:24.181631	2021-09-30 21:46:24.181633	1
570	magnetite	569.000	-0.04581282272939715	6.832609770813193e-13	99819.9310520089	6260.577548932698	1.0446868044149038e-08	-7.317667159511076e-06	0	0	2021-09-30 21:46:24.181635	2021-09-30 21:46:24.181636	1
571	magnetite	570.000	-0.03376995320904594	6.257118635556036e-13	96086.01706625041	5800.965082388267	1.0385730981198484e-08	-5.821437076318824e-06	0	0	2021-09-30 21:46:24.181638	2021-09-30 21:46:24.181639	1
572	iron	0.000	49496.16567356748	1.9598870162334014e-11	1714292.1522854988	1846500.9796716142	3.257922482627801e-09	0.026805382839477282	0	0	2021-09-30 21:46:24.181641	2021-09-30 21:46:24.181643	1
573	iron	1.000	49419.36293474717	1.9585107863344286e-11	1714210.3377345384	1846324.735449325	3.256933864556434e-09	0.02676634396208768	0	0	2021-09-30 21:46:24.181645	2021-09-30 21:46:24.181646	1
574	iron	2.000	49342.376554279654	1.957124140499267e-11	1714129.6936265815	1846151.0208173876	3.2559338626886705e-09	0.026727161536564438	0	0	2021-09-30 21:46:24.181648	2021-09-30 21:46:24.18165	1
575	iron	3.000	49265.20763791686	1.9557273514060488e-11	1714050.1647457792	1845979.7164883933	3.254922799591362e-09	0.026687838007036203	0	0	2021-09-30 21:46:24.181651	2021-09-30 21:46:24.181653	1
576	iron	4.000	49187.85728657476	1.9543206881741934e-11	1713971.6953273106	1845810.7020194535	3.2539009961219126e-09	0.026648375823566092	0	0	2021-09-30 21:46:24.181655	2021-09-30 21:46:24.181656	1
577	iron	5.000	49110.32659638408	1.9529044163884997e-11	1713894.2290822084	1845643.8558651845	3.252868771394521e-09	0.026608777441172463	0	0	2021-09-30 21:46:24.181658	2021-09-30 21:46:24.18166	1
578	iron	6.000	49032.61665874104	1.9514787981231088e-11	1713817.7092221368	1845479.055430596	3.251826442746467e-09	0.026569045318859237	0	0	2021-09-30 21:46:24.181661	2021-09-30 21:46:24.181663	1
579	iron	7.000	48954.7285603576	1.9500440919654415e-11	1713742.0784841217	1845316.1771238975	3.2507743257045276e-09	0.026529181918655397	0	0	2021-09-30 21:46:24.181665	2021-09-30 21:46:24.181666	1
580	iron	8.000	48876.66338331161	1.9486005530400287e-11	1713667.279155184	1845155.0964091136	3.2497127339515612e-09	0.026489189704665628	0	0	2021-09-30 21:46:24.181668	2021-09-30 21:46:24.18167	1
581	iron	9.000	48798.42220509686	1.9471484330323012e-11	1713593.2530969607	1844995.6878586921	3.2486419792931694e-09	0.026449071142129587	0	0	2021-09-30 21:46:24.181672	2021-09-30 21:46:24.181673	1
582	iron	10.000	48720.006098672675	1.9456879802122828e-11	1713519.9417701927	1844837.8252058467	3.2475623716246223e-09	0.02640882869649342	0	0	2021-09-30 21:46:24.181675	2021-09-30 21:46:24.181676	1
583	iron	11.000	48641.41613251345	1.9442194394582186e-11	1713447.2862591771	1844681.3813968457	3.246474218897905e-09	0.026368464832490893	0	0	2021-09-30 21:46:24.181678	2021-09-30 21:46:24.18168	1
584	iron	12.000	48562.65337065798	1.942743052280154e-11	1713375.227296088	1844526.2286430446	3.2453778270890843e-09	0.026327982013237012	0	0	2021-09-30 21:46:24.181682	2021-09-30 21:46:24.181683	1
585	iron	13.000	48483.71887275831	1.9412590568433958e-11	1713303.705285255	1844372.2384728524	3.2442735001657735e-09	0.026287382699331358	0	0	2021-09-30 21:46:24.181685	2021-09-30 21:46:24.181686	1
586	iron	14.000	48404.61369412883	1.9397676879919553e-11	1713232.660327283	1844219.28178338	3.243161540055024e-09	0.02624666934797528	0	0	2021-09-30 21:46:24.181688	2021-09-30 21:46:24.18169	1
587	iron	15.000	48325.338885794656	1.9382691772718683e-11	1713162.0322431107	1844067.2288919943	3.242042246611354e-09	0.02620584441209927	0	0	2021-09-30 21:46:24.181691	2021-09-30 21:46:24.181693	1
588	iron	16.000	48245.895494540186	1.9367637529544904e-11	1713091.7605979433	1843915.949587622	3.2409159175851443e-09	0.026164910339503283	0	0	2021-09-30 21:46:24.181695	2021-09-30 21:46:24.181696	1
589	iron	17.000	48166.28456295717	1.9352516400596867e-11	1713021.7847250546	1843765.3131818075	3.239782848591343e-09	0.026123869572009704	0	0	2021-09-30 21:46:24.181698	2021-09-30 21:46:24.1817	1
590	iron	18.000	48086.50712949264	1.9337330603789594e-11	1712952.0437494793	1843615.1885595673	3.2386433330784813e-09	0.02608272454462856	0	0	2021-09-30 21:46:24.181701	2021-09-30 21:46:24.181703	1
591	iron	19.000	48006.56422849679	1.9322082324985163e-11	1712882.4766115749	1843465.444229994	3.237497662298046e-09	0.02604147768473571	0	0	2021-09-30 21:46:24.181705	2021-09-30 21:46:24.181706	1
592	iron	20.000	47926.456890270216	1.930677371822247e-11	1712813.0220904301	1843315.9483765645	3.2363461252742314e-09	0.02600013141126444	0	0	2021-09-30 21:46:24.181708	2021-09-30 21:46:24.18171	1
593	iron	21.000	47846.18614111149	1.9291406905946475e-11	1712743.61882718	1843166.5689072818	3.2351890087739974e-09	0.025958688133909145	0	0	2021-09-30 21:46:24.181711	2021-09-30 21:46:24.181713	1
594	iron	22.000	47765.753003363985	1.9275983979236544e-11	1712674.205348103	1843017.1735043814	3.234026597277636e-09	0.025917150252344315	0	0	2021-09-30 21:46:24.181715	2021-09-30 21:46:24.181716	1
595	iron	23.000	47685.1584954629	1.926050699803427e-11	1712604.7200876444	1842867.629673914	3.2328591729496133e-09	0.025875520155454974	0	0	2021-09-30 21:46:24.181718	2021-09-30 21:46:24.18172	1
596	iron	24.000	47604.403631981775	1.924497799137028e-11	1712535.1014112197	1842717.8047948938	3.2316870156099205e-09	0.02583380022058258	0	0	2021-09-30 21:46:24.181722	2021-09-30 21:46:24.181723	1
597	iron	25.000	47523.48942367892	1.9229398957590828e-11	1712465.2876379038	1842567.5661682307	3.2305104027058107e-09	0.02579199281278346	0	0	2021-09-30 21:46:24.181725	2021-09-30 21:46:24.181726	1
598	iron	26.000	47442.41687754364	1.9213771864583057e-11	1712395.217062926	1842416.7810652854	3.229329609283978e-09	0.025750100284102077	0	0	2021-09-30 21:46:24.181728	2021-09-30 21:46:24.18173	1
599	iron	27.000	47361.186996842094	1.919809865e-11	1712324.8279799996	1842265.316776105	3.2281449079632085e-09	0.025708124972858085	0	0	2021-09-30 21:46:24.181732	2021-09-30 21:46:24.181733	1
600	iron	28.000	47279.80078116318	1.9182381221484756e-11	1712254.0587034917	1842113.0406573452	3.226956568907463e-09	0.025666069202947346	0	0	2021-09-30 21:46:24.181735	2021-09-30 21:46:24.181736	1
601	iron	29.000	47198.25922646392	1.9166621456893778e-11	1712182.8475903932	1841959.8201798059	3.2257648597994488e-09	0.025623935283157578	0	0	2021-09-30 21:46:24.181738	2021-09-30 21:46:24.18174	1
602	iron	30.000	47116.563325114825	1.9150821204519672e-11	1712111.1330621117	1841805.5229756164	3.2245700458146743e-09	0.025581725506498332	0	0	2021-09-30 21:46:24.181742	2021-09-30 21:46:24.181743	1
603	iron	31.000	47034.714065945045	1.913498228331314e-11	1712038.8536260824	1841650.0168850678	3.2233723895959747e-09	0.025539442149545153	0	0	2021-09-30 21:46:24.181745	2021-09-30 21:46:24.181746	1
604	iron	32.000	46952.71243428702	1.9119106483104244e-11	1711965.9478971672	1841493.1700030202	3.2221721512285664e-09	0.02549708747179878	0	0	2021-09-30 21:46:24.181748	2021-09-30 21:46:24.18175	1
605	iron	33.000	46870.55941202141	1.9103195564823014e-11	1711892.3546188846	1841334.8507249872	3.220969588215562e-09	0.02545466371505818	0	0	2021-09-30 21:46:24.181752	2021-09-30 21:46:24.181753	1
606	iron	34.000	46788.25597762121	1.9087251260719182e-11	1711818.0126844111	1841174.9277927564	3.219764955454033e-09	0.025412173102808903	0	0	2021-09-30 21:46:24.181755	2021-09-30 21:46:24.181756	1
607	iron	35.000	46705.80310619619	1.9071275274581452e-11	1711742.861157385	1841013.2703396245	3.2185585052115952e-09	0.025369617839625918	0	0	2021-09-30 21:46:24.181758	2021-09-30 21:46:24.18176	1
608	iron	36.000	46623.20176953673	1.9055269281955675e-11	1711666.8392925183	1840849.7479352462	3.2173504871034593e-09	0.02532700011059064	0	0	2021-09-30 21:46:24.181762	2021-09-30 21:46:24.181763	1
609	iron	37.000	46540.452936157686	1.9039234930362873e-11	1711589.8865559471	1840684.2306299575	3.216141148070145e-09	0.0252843220807241	0	0	2021-09-30 21:46:24.181765	2021-09-30 21:46:24.181766	1
610	iron	38.000	46457.55757134176	1.9023173839515758e-11	1711511.9426454308	1840516.5889988018	3.2149307323555406e-09	0.025241585894432816	0	0	2021-09-30 21:46:24.181768	2021-09-30 21:46:24.18177	1
611	iron	39.000	46374.51663718299	1.900708760153544e-11	1711432.9475102776	1840346.694185002	3.2137194814856814e-09	0.025198793674971093	0	0	2021-09-30 21:46:24.181773	2021-09-30 21:46:24.181775	1
612	iron	40.000	46291.33109262979	1.899097778116668e-11	1711352.8413710766	1840174.4179430376	3.2125076342479506e-09	0.025155947523917126	0	0	2021-09-30 21:46:24.181777	2021-09-30 21:46:24.181778	1
613	iron	41.000	46208.00189352778	1.8974845915992738e-11	1711271.5647391628	1839999.632681185	3.211295426670928e-09	0.025113049520664874	0	0	2021-09-30 21:46:24.18178	2021-09-30 21:46:24.181782	1
614	iron	42.000	46124.52999266247	1.8958693516649614e-11	1711189.058435898	1839822.211503682	3.2100830920047124e-09	0.02507010172192943	0	0	2021-09-30 21:46:24.181784	2021-09-30 21:46:24.181785	1
615	iron	43.000	46040.91633980169	1.8942522067039263e-11	1711105.2636116822	1839642.0282523423	3.208870860701839e-09	0.025027106161267965	0	0	2021-09-30 21:46:24.181787	2021-09-30 21:46:24.181788	1
616	iron	44.000	45957.16188173785	1.892633302454239e-11	1711020.1217647623	1839458.957547756	3.2076589603987134e-09	0.02498406484861444	0	0	2021-09-30 21:46:24.18179	2021-09-30 21:46:24.181792	1
617	iron	45.000	45873.26756232984	1.89101278202304e-11	1710933.5747597245	1839272.8748298343	3.2064476158977342e-09	0.02494097976983102	0	0	2021-09-30 21:46:24.181794	2021-09-30 21:46:24.181795	1
618	iron	46.000	45789.23432254489	1.8893907859076518e-11	1710845.5648458498	1839083.6563980817	3.2052370491497728e-09	0.02489785288627105	0	0	2021-09-30 21:46:24.181797	2021-09-30 21:46:24.181798	1
619	iron	47.000	45705.06310050007	1.887767452016639e-11	1710756.0346751262	1838891.1794511504	3.2040274792374053e-09	0.024854686134359268	0	0	2021-09-30 21:46:24.1818	2021-09-30 21:46:24.181802	1
620	iron	48.000	45620.75483150363	1.886142915690802e-11	1710664.9273200557	1838695.3221259713	3.2028191223586407e-09	0.024811481425185297	0	0	2021-09-30 21:46:24.181804	2021-09-30 21:46:24.181805	1
621	iron	49.000	45536.310448096156	1.8845173097240526e-11	1710572.1862912164	1838495.9635363761	3.2016121918111514e-09	0.024768240644111254	0	0	2021-09-30 21:46:24.181807	2021-09-30 21:46:24.181808	1
622	iron	50.000	45451.73088009139	1.8828907643842848e-11	1710477.7555545229	1838292.9838110856	3.2004068979772216e-09	0.02472496565039509	0	0	2021-09-30 21:46:24.18181	2021-09-30 21:46:24.181812	1
623	iron	51.000	45367.0170546169	1.8812634074341225e-11	1710381.5795482844	1838086.2641312804	3.199203448309107e-09	0.024681658276826494	0	0	2021-09-30 21:46:24.181814	2021-09-30 21:46:24.181815	1
624	iron	52.000	45282.16989615465	1.8796353641516128e-11	1710283.6031999565	1837875.6867675192	3.1980020473150674e-09	0.024638320329378505	0	0	2021-09-30 21:46:24.181817	2021-09-30 21:46:24.181819	1
625	iron	53.000	45197.190326581076	1.878006757350858e-11	1710183.7719426493	1837661.1351161506	3.196802896545935e-09	0.024594953586872456	0	0	2021-09-30 21:46:24.181821	2021-09-30 21:46:24.181822	1
626	iron	54.000	45112.07926520718	1.8763777074025586e-11	1710082.0317313592	1837442.4937351327	3.1956061945822564e-09	0.024551559800657406	0	0	2021-09-30 21:46:24.181824	2021-09-30 21:46:24.181825	1
627	iron	55.000	45026.837628818284	1.874748332254499e-11	1709978.3290589529	1837219.6483793338	3.1944121370219707e-09	0.024508140694302828	0	0	2021-09-30 21:46:24.181827	2021-09-30 21:46:24.181829	1
628	iron	56.000	44941.46633171366	1.8731187474519373e-11	1709872.6109718455	1836992.486035175	3.1932209164687025e-09	0.024464697963306265	0	0	2021-09-30 21:46:24.181831	2021-09-30 21:46:24.181832	1
629	iron	57.000	44855.96628574573	1.8714890661579666e-11	1709764.8250854367	1836760.894954759	3.1920327225205934e-09	0.02442123327481369	0	0	2021-09-30 21:46:24.181834	2021-09-30 21:46:24.181835	1
630	iron	58.000	44770.3384003594	1.869859399173756e-11	1709654.919599252	1836524.764689366	3.190847741759695e-09	0.024377748267354265	0	0	2021-09-30 21:46:24.181837	2021-09-30 21:46:24.181839	1
631	iron	59.000	44684.58358263079	1.868229854958763e-11	1709542.8433117967	1836283.9861223304	3.189666157741977e-09	0.024334244550588795	0	0	2021-09-30 21:46:24.181841	2021-09-30 21:46:24.181842	1
632	iron	60.000	44598.70273730599	1.8666005396508322e-11	1709428.5456351996	1836038.4515014654	3.1884881509877267e-09	0.024290723705069635	0	0	2021-09-30 21:46:24.181844	2021-09-30 21:46:24.181845	1
633	iron	61.000	44512.69676683956	1.8649715570862672e-11	1709311.976609443	1835788.054470591	3.1873138989727974e-09	0.024247187282017826	0	0	2021-09-30 21:46:24.181847	2021-09-30 21:46:24.181849	1
634	iron	62.000	44426.56657143266	1.8633430088197817e-11	1709193.0869164523	1835532.6901007546	3.1861435761200983e-09	0.0242036368031092	0	0	2021-09-30 21:46:24.181851	2021-09-30 21:46:24.181852	1
635	iron	63.000	44340.31304907122	1.861714994144436e-11	1709071.8278938057	1835272.2549206307	3.1849773537918636e-09	0.024160073760276395	0	0	2021-09-30 21:46:24.181854	2021-09-30 21:46:24.181856	1
636	iron	64.000	44253.93709556368	1.8600876101114475e-11	1708948.151548187	1835006.6469463531	3.18381540028237e-09	0.024116499615522893	0	0	2021-09-30 21:46:24.181857	2021-09-30 21:46:24.181859	1
637	iron	65.000	44167.439604578474	1.8584609515499578e-11	1708822.0105685592	1834735.7657107364	3.1826578808112114e-09	0.02407291580074964	0	0	2021-09-30 21:46:24.181861	2021-09-30 21:46:24.181862	1
638	iron	66.000	44080.82146768159	1.8568351110867284e-11	1708693.358339027	1834459.5122918175	3.1815049575171487e-09	0.024029323717595037	0	0	2021-09-30 21:46:24.181864	2021-09-30 21:46:24.181866	1
639	iron	67.000	43994.08357437352	1.855210179165763e-11	1708562.148951433	1834177.7893408025	3.180356789452467e-09	0.0239857247372867	0	0	2021-09-30 21:46:24.181867	2021-09-30 21:46:24.181869	1
640	iron	68.000	43907.22681212632	1.8535862440678388e-11	1708428.3372176385	1833890.501109328	3.1792135325778782e-09	0.02394212020050633	0	0	2021-09-30 21:46:24.181871	2021-09-30 21:46:24.181872	1
641	iron	69.000	43820.25206642023	1.85196339193e-11	1708291.8786815149	1833597.5534760668	3.178075339757994e-09	0.023898511417266788	0	0	2021-09-30 21:46:24.181874	2021-09-30 21:46:24.181876	1
642	iron	70.000	43733.1602207802	1.8503417067649573e-11	1708152.729630656	1833298.853972726	3.1769423607572704e-09	0.02385489966680076	0	0	2021-09-30 21:46:24.181877	2021-09-30 21:46:24.181879	1
643	iron	71.000	43645.952156812105	1.848721270480411e-11	1708010.847107783	1832994.3118093482	3.1758147422365016e-09	0.0238112861974619	0	0	2021-09-30 21:46:24.181881	2021-09-30 21:46:24.181882	1
644	iron	72.000	43558.628754238816	1.8471021628983178e-11	1707866.1889218118	1832683.8378988723	3.1746926277499176e-09	0.02376767222663879	0	0	2021-09-30 21:46:24.181884	2021-09-30 21:46:24.181885	1
645	iron	73.000	43471.19089093607	1.8454844617740882e-11	1707718.7136587268	1832367.3448812433	3.1735761577426175e-09	0.023724058940677892	0	0	2021-09-30 21:46:24.181887	2021-09-30 21:46:24.181889	1
646	iron	74.000	43383.63944296791	1.8438682428156936e-11	1707568.3806920277	1832044.747146578	3.1724654695487293e-09	0.023680447494821413	0	0	2021-09-30 21:46:24.181891	2021-09-30 21:46:24.181892	1
647	iron	75.000	43295.97528462226	1.842253579702711e-11	1707415.1501929746	1831715.9608578645	3.171360697389914e-09	0.023636839013154123	0	0	2021-09-30 21:46:24.181894	2021-09-30 21:46:24.181896	1
648	iron	76.000	43208.199288445925	1.840640544105305e-11	1707258.983140476	1831380.9039728655	3.170261972374481e-09	0.02359323458856275	0	0	2021-09-30 21:46:24.181897	2021-09-30 21:46:24.181899	1
649	iron	77.000	43120.3123252796	1.8390292057031258e-11	1707099.8413307017	1831039.496265389	3.1691694224969543e-09	0.023549635282705986	0	0	2021-09-30 21:46:24.181901	2021-09-30 21:46:24.181902	1
650	iron	78.000	43032.3152642926	1.8374196322041422e-11	1706937.6873863854	1830691.6593458622	3.1680831726381465e-09	0.023506042125995587	0	0	2021-09-30 21:46:24.181904	2021-09-30 21:46:24.181905	1
651	iron	79.000	42944.20897301729	1.8358118893633968e-11	1706772.4847658076	1830337.3166811755	3.167003344565764e-09	0.023462456117588786	0	0	2021-09-30 21:46:24.181907	2021-09-30 21:46:24.181909	1
652	iron	80.000	42855.99431738347	1.8342060410016994e-11	1706604.197771515	1829976.3936139222	3.16593005693543e-09	0.023418878225390363	0	0	2021-09-30 21:46:24.181911	2021-09-30 21:46:24.181912	1
653	iron	81.000	42767.672161752256	1.8326021490242365e-11	1706432.7915586822	1829608.8173808286	3.164863425292282e-09	0.02337530938606658	0	0	2021-09-30 21:46:24.181916	2021-09-30 21:46:24.181917	1
654	iron	82.000	42679.243368950134	1.8310002734391208e-11	1706258.2321432275	1829234.517130612	3.1638035620729505e-09	0.023331750505068086	0	0	2021-09-30 21:46:24.181919	2021-09-30 21:46:24.181921	1
655	iron	83.000	42590.708800302375	1.8294004723758654e-11	1706080.486409575	1828853.4239410341	3.162750576608107e-09	0.023288202456664228	0	0	2021-09-30 21:46:24.181923	2021-09-30 21:46:24.181924	1
656	iron	84.000	42502.069315666544	1.8278028021037742e-11	1705899.5221181216	1828465.4708352734	3.161704575125452e-09	0.023244666083987297	0	0	2021-09-30 21:46:24.181926	2021-09-30 21:46:24.181927	1
657	iron	85.000	42413.32577346563	1.8262073170502854e-11	1705715.3079124535	1828070.5927977145	3.160665660753085e-09	0.023201142199085135	0	0	2021-09-30 21:46:24.181929	2021-09-30 21:46:24.181931	1
658	iron	86.000	42324.479030721035	1.8246140698192197e-11	1705527.8133261406	1827668.7267887774	3.159633933523545e-09	0.023157631582986785	0	0	2021-09-30 21:46:24.181933	2021-09-30 21:46:24.181934	1
659	iron	87.000	42235.52994308527	1.8230231112089622e-11	1705337.008789352	1827259.8117593166	3.1586094903780676e-09	0.023114134985774238	0	0	2021-09-30 21:46:24.181936	2021-09-30 21:46:24.181937	1
660	iron	88.000	42146.47936487443	1.8214344902305952e-11	1705142.8656350863	1826843.7886641382	3.1575924251714716e-09	0.023070653126665876	0	0	2021-09-30 21:46:24.181939	2021-09-30 21:46:24.181941	1
661	iron	89.000	42057.32814910059	1.819848254125922e-11	1704945.3561051362	1826420.6004748936	3.1565828286773844e-09	0.023027186694108207	0	0	2021-09-30 21:46:24.181943	2021-09-30 21:46:24.181944	1
662	iron	90.000	41968.07714750379	1.8182644483854508e-11	1704744.453355703	1825990.1921921675	3.1555807885940266e-09	0.022983736345877952	0	0	2021-09-30 21:46:24.181946	2021-09-30 21:46:24.181947	1
663	iron	91.000	41878.727210583915	1.816683116766281e-11	1704540.1314627533	1825552.5108569595	3.154586389550322e-09	0.02294030270919186	0	0	2021-09-30 21:46:24.181949	2021-09-30 21:46:24.181951	1
664	iron	92.000	41789.2791876323	1.8151043013099434e-11	1704332.3654270628	1825107.5055614319	3.153599713112485e-09	0.022896886380825692	0	0	2021-09-30 21:46:24.181953	2021-09-30 21:46:24.181954	1
665	iron	93.000	41699.73392676319	1.8135280423601467e-11	1704121.1311789027	1824655.127458837	3.152620837791117e-09	0.02285348792724334	0	0	2021-09-30 21:46:24.181956	2021-09-30 21:46:24.181958	1
666	iron	94.000	41610.09227494489	1.8119543785804743e-11	1703906.4055825213	1824195.3297729478	3.15164983904856e-09	0.022810107884731826	0	0	2021-09-30 21:46:24.181959	2021-09-30 21:46:24.181961	1
667	iron	95.000	41520.3550780307	1.810383346971985e-11	1703688.1664402261	1823728.067806564	3.150686789306839e-09	0.02276674675954738	0	0	2021-09-30 21:46:24.181963	2021-09-30 21:46:24.181964	1
668	iron	96.000	41430.52318078975	1.8088149828907598e-11	1703466.3924961742	1823253.2989493422	3.1497317579560078e-09	0.02272340502806948	0	0	2021-09-30 21:46:24.181966	2021-09-30 21:46:24.181968	1
669	iron	97.000	41340.59742693744	1.8072493200653686e-11	1703241.0634399524	1822770.982685105	3.1487848113627313e-09	0.02268008313696054	0	0	2021-09-30 21:46:24.181969	2021-09-30 21:46:24.181971	1
670	iron	98.000	41250.578659165825	1.805686390614266e-11	1703012.159909747	1822281.0805982135	3.1478460128794834e-09	0.022636781503336575	0	0	2021-09-30 21:46:24.181973	2021-09-30 21:46:24.181974	1
671	iron	99.000	41160.46771917361	1.8041262250631423e-11	1702779.6634952417	1821783.5563792915	3.146915422854114e-09	0.022593500514944867	0	0	2021-09-30 21:46:24.181976	2021-09-30 21:46:24.181978	1
672	iron	100.000	41070.26544769608	1.8025688523621232e-11	1702543.5567402758	1821278.3758303751	3.145993098639636e-09	0.02255024053034777	0	0	2021-09-30 21:46:24.18198	2021-09-30 21:46:24.181981	1
673	iron	101.000	40979.97268453479	1.8010142999030182e-11	1702303.823145077	1820765.5068690812	3.14507909460475e-09	0.022507001879117527	0	0	2021-09-30 21:46:24.181983	2021-09-30 21:46:24.181984	1
674	iron	102.000	40889.590268586806	1.7994625935363786e-11	1702060.4471683502	1820244.9195324108	3.1441734621443628e-09	0.022463784862034188	0	0	2021-09-30 21:46:24.181986	2021-09-30 21:46:24.181988	1
675	iron	103.000	40799.11903787414	1.7979137575885723e-11	1701813.414228942	1819716.585979572	3.143276249690816e-09	0.022420589751294462	0	0	2021-09-30 21:46:24.18199	2021-09-30 21:46:24.181991	1
676	iron	104.000	40708.55982957256	1.796367814878734e-11	1701562.7107072454	1819180.4804941854	3.1423875027253752e-09	0.02237741679072654	0	0	2021-09-30 21:46:24.181993	2021-09-30 21:46:24.181994	1
677	iron	105.000	40617.91348004044	1.7948247867356616e-11	1701308.3239463428	1818636.5794858611	3.1415072637900564e-09	0.022334266196011168	0	0	2021-09-30 21:46:24.181996	2021-09-30 21:46:24.181998	1
678	iron	106.000	40527.1808248473	1.7932846930146512e-11	1701050.2422528383	1818084.8614910468	3.140635572499867e-09	0.022291138154909983	0	0	2021-09-30 21:46:24.182	2021-09-30 21:46:24.182001	1
679	iron	107.000	40436.36269880204	1.791747552114243e-11	1700788.4548973294	1817525.3071730384	3.1397724655555237e-09	0.022248032827502345	0	0	2021-09-30 21:46:24.182003	2021-09-30 21:46:24.182004	1
680	iron	108.000	40345.4599359812	1.790213380992901e-11	1700522.9521146817	1816957.8993215011	3.138917976756373e-09	0.022204950346426427	0	0	2021-09-30 21:46:24.182006	2021-09-30 21:46:24.182008	1
681	iron	109.000	40254.47336975661	1.7886821951856246e-11	1700253.7251039785	1816382.6228512328	3.138072137013739e-09	0.022161890817127453	0	0	2021-09-30 21:46:24.18201	2021-09-30 21:46:24.182011	1
682	iron	110.000	40163.40383282333	1.7871540088205014e-11	1699980.7660281446	1815799.4648001615	3.1372349743647115e-09	0.022118854318113553	0	0	2021-09-30 21:46:24.182013	2021-09-30 21:46:24.182014	1
683	iron	111.000	40072.2521572269	1.7856288346351353e-11	1699704.0680133046	1815208.4143267134	3.136406513986198e-09	0.022075840901216993	0	0	2021-09-30 21:46:24.182016	2021-09-30 21:46:24.182018	1
684	iron	112.000	39981.01917439056	1.7841066839930857e-11	1699423.6251478884	1814609.462706571	3.13558677820935e-09	0.022032850591860734	0	0	2021-09-30 21:46:24.18202	2021-09-30 21:46:24.182021	1
685	iron	113.000	39889.7057151423	1.7825875669001573e-11	1699139.4324813886	1814002.6033286264	3.1347757865343745e-09	0.021989883389332623	0	0	2021-09-30 21:46:24.182023	2021-09-30 21:46:24.182024	1
686	iron	114.000	39798.312609741704	1.7810714920206833e-11	1698851.4860228675	1813387.8316903336	3.1339735556456938e-09	0.021946939267064595	0	0	2021-09-30 21:46:24.182026	2021-09-30 21:46:24.182028	1
687	iron	115.000	39706.84068790638	1.7795584666936667e-11	1698559.782739201	1812765.145392434	3.1331800994273538e-09	0.021904018172916987	0	0	2021-09-30 21:46:24.18203	2021-09-30 21:46:24.182031	1
688	iron	116.000	39615.29077883832	1.778048496948917e-11	1698264.320552924	1812134.5441327682	3.132395428979042e-09	0.02186112002947164	0	0	2021-09-30 21:46:24.182033	2021-09-30 21:46:24.182034	1
689	iron	117.000	39523.66371125014	1.7765415875230862e-11	1697965.0983400168	1811496.0296999023	3.131619552632017e-09	0.021818244734324782	0	0	2021-09-30 21:46:24.182036	2021-09-30 21:46:24.182038	1
690	iron	118.000	39431.96031339079	1.7750377418756112e-11	1697662.1159271812	1810849.6059655952	3.130852475965779e-09	0.02177539216039124	0	0	2021-09-30 21:46:24.18204	2021-09-30 21:46:24.182041	1
691	iron	119.000	39340.181413071405	1.773536962204628e-11	1697355.3740889803	1810195.2788769226	3.1300942018248543e-09	0.021732562156210437	0	0	2021-09-30 21:46:24.182043	2021-09-30 21:46:24.182044	1
692	iron	120.000	39248.327837690624	1.7720392494627913e-11	1697044.8745446422	1809533.0564476175	3.129344730335999e-09	0.02168975454625898	0	0	2021-09-30 21:46:24.182046	2021-09-30 21:46:24.182048	1
693	iron	121.000	39156.400414259864	1.7705446033730122e-11	1696730.619954618	1808862.948748831	3.1286040589256756e-09	0.021646969131267728	0	0	2021-09-30 21:46:24.18205	2021-09-30 21:46:24.182051	1
694	iron	122.000	39064.39996942844	1.769053022444152e-11	1696412.613916863	1808184.9678992415	3.1278721823378842e-09	0.021604205688543945	0	0	2021-09-30 21:46:24.182053	2021-09-30 21:46:24.182054	1
695	iron	123.000	38972.32732950818	1.7675645039866122e-11	1696090.8609628421	1807499.1280545194	3.1271490926523e-09	0.02156146397229834	0	0	2021-09-30 21:46:24.182058	2021-09-30 21:46:24.182059	1
696	iron	124.000	38880.18332049811	1.7660790441278918e-11	1695765.3665532726	1806805.445396179	3.126434779302756e-09	0.021518743713976815	0	0	2021-09-30 21:46:24.182061	2021-09-30 21:46:24.182063	1
697	iron	125.000	38787.96876810879	1.7645966378280153e-11	1695436.1370735562	1806103.9381197086	3.125729229096074e-09	0.021476044622597973	0	0	2021-09-30 21:46:24.182065	2021-09-30 21:46:24.182066	1
698	iron	126.000	38695.68449778645	1.7631172788949765e-11	1695103.1798290638	1805394.626422335	3.125032426231074e-09	0.021433366385092138	0	0	2021-09-30 21:46:24.182068	2021-09-30 21:46:24.182069	1
699	iron	127.000	38603.331334736846	1.761640960000006e-11	1694766.5030400031	1804677.5324898495	3.1243443523180865e-09	0.021390708666648717	0	0	2021-09-30 21:46:24.182071	2021-09-30 21:46:24.182073	1
700	iron	128.000	38510.91010394901	1.7601676726928317e-11	1694426.1158361644	1803952.6804831205	3.123664986398583e-09	0.021348071111064466	0	0	2021-09-30 21:46:24.182075	2021-09-30 21:46:24.182076	1
701	iron	129.000	38418.42163021879	1.758697407416893e-11	1694082.0282513248	1803220.0965238304	3.122994304965287e-09	0.02130545334109805	0	0	2021-09-30 21:46:24.182078	2021-09-30 21:46:24.18208	1
702	iron	130.000	38325.866738171826	1.7572301535244164e-11	1693734.2512174342	1802479.8086797013	3.1223322819824654e-09	0.02126285495882761	0	0	2021-09-30 21:46:24.182082	2021-09-30 21:46:24.182083	1
703	iron	131.000	38233.246252287	1.75576589929142e-11	1693382.7965584719	1801731.8469489717	3.1216788889066634e-09	0.021220275546014605	0	0	2021-09-30 21:46:24.182085	2021-09-30 21:46:24.182086	1
704	iron	132.000	38140.560996918815	1.7543046319327368e-11	1693027.6769842375	1800976.2432446918	3.1210340947074776e-09	0.021177714664466454	0	0	2021-09-30 21:46:24.182088	2021-09-30 21:46:24.18209	1
705	iron	133.000	38047.811796320275	1.7528463376168728e-11	1692668.9060836737	1800213.0313779754	3.120397865888956e-09	0.021135171856408865	0	0	2021-09-30 21:46:24.182091	2021-09-30 21:46:24.182093	1
706	iron	134.000	37954.999474665165	1.7513910014808072e-11	1692306.4983180463	1799442.247040913	3.119770166511108e-09	0.02109264664485906	0	0	2021-09-30 21:46:24.182095	2021-09-30 21:46:24.182096	1
707	iron	135.000	37862.12485607015	1.7499386076447676e-11	1691940.4690139468	1798663.927789064	3.1191509582116376e-09	0.021050138534000992	0	0	2021-09-30 21:46:24.182098	2021-09-30 21:46:24.1821	1
708	iron	136.000	37769.188764616774	1.7484891392269093e-11	1691570.8343558784	1797878.1130230285	3.118540200228263e-09	0.02100764700956844	0	0	2021-09-30 21:46:24.182102	2021-09-30 21:46:24.182103	1
709	iron	137.000	37676.19202437311	1.7470425783578848e-11	1691197.6113787778	1797084.8439698452	3.1179378494209784e-09	0.020965171539227175	0	0	2021-09-30 21:46:24.182105	2021-09-30 21:46:24.182106	1
710	iron	138.000	37583.13545941531	1.7455989061954143e-11	1690820.8179602162	1796284.1636636776	3.1173438602948206e-09	0.020922711572962507	0	0	2021-09-30 21:46:24.182108	2021-09-30 21:46:24.18211	1
711	iron	139.000	37490.019893848825	1.7441581029387228e-11	1690440.4728123276	1795476.1169258854	3.116758185022945e-09	0.02088026654347102	0	0	2021-09-30 21:46:24.182112	2021-09-30 21:46:24.182113	1
712	iron	140.000	37396.846151829384	1.7427201478429277e-11	1690056.5954736478	1794660.750344881	3.1161807734697396e-09	0.02083783586655183	0	0	2021-09-30 21:46:24.182115	2021-09-30 21:46:24.182116	1
713	iron	141.000	37303.615057584015	1.7412850192333708e-11	1689669.2063005434	1793838.1122550839	3.1156115732145764e-09	0.0207954189415056	0	0	2021-09-30 21:46:24.182118	2021-09-30 21:46:24.18212	1
714	iron	142.000	37210.3274354314	1.7398526945198472e-11	1689278.3264585345	1793008.2527156293	3.1150505295755955e-09	0.02075301515153313	0	0	2021-09-30 21:46:24.182122	2021-09-30 21:46:24.182123	1
715	iron	143.000	37116.984109802484	1.738423150210789e-11	1688883.977913355	1792171.2234884945	3.1144975856338638e-09	0.02071062386413815	0	0	2021-09-30 21:46:24.182125	2021-09-30 21:46:24.182127	1
716	iron	144.000	37023.58590526048	1.7369963619273682e-11	1688486.1834218595	1791327.078016277	3.113952682257686e-09	0.020668244431530924	0	0	2021-09-30 21:46:24.182128	2021-09-30 21:46:24.18213	1
717	iron	145.000	36930.133646520895	1.7355723044175275e-11	1688084.966522532	1790475.8713991148	3.113415758127517e-09	0.020625876191039047	0	0	2021-09-30 21:46:24.182132	2021-09-30 21:46:24.182133	1
718	iron	146.000	36836.62815847118	1.7341509515699313e-11	1687680.3515260215	1789617.6603716419	3.1128867497607068e-09	0.020583518465514854	0	0	2021-09-30 21:46:24.182135	2021-09-30 21:46:24.182137	1
719	iron	147.000	36743.070266190334	1.7327322764278398e-11	1687272.3635052543	1788752.5032790382	3.1123655915368963e-09	0.020541170563750464	0	0	2021-09-30 21:46:24.182139	2021-09-30 21:46:24.18214	1
720	iron	148.000	36649.46079496814	1.731316251202967e-11	1686861.0282854615	1787880.4600528842	3.111852215723509e-09	0.020498831780892148	0	0	2021-09-30 21:46:24.182142	2021-09-30 21:46:24.182143	1
721	iron	149.000	36555.80057032409	1.7299028472891875e-11	1686446.372433983	1787001.5921865331	3.1113465525014775e-09	0.02045650139885733	0	0	2021-09-30 21:46:24.182145	2021-09-30 21:46:24.182147	1
722	iron	150.000	36462.09041802652	1.728492035276216e-11	1686028.4232497534	1786115.962709806	3.1108485299914827e-09	0.020414178686756743	0	0	2021-09-30 21:46:24.182149	2021-09-30 21:46:24.18215	1
723	iron	151.000	36368.33116411089	1.7270837849632143e-11	1685607.2087528468	1785223.6361638017	3.110358074279994e-09	0.020371862901312127	0	0	2021-09-30 21:46:24.182152	2021-09-30 21:46:24.182153	1
724	iron	152.000	36274.52363489849	1.7256780653723167e-11	1685182.7576734615	1784324.6785745267	3.109875109446219e-09	0.020329553287284984	0	0	2021-09-30 21:46:24.182155	2021-09-30 21:46:24.182157	1
725	iron	153.000	36180.66865701438	1.7242748447620927e-11	1684755.099441073	1783419.1574268735	3.109399557588674e-09	0.02028724907789823	0	0	2021-09-30 21:46:24.182159	2021-09-30 21:46:24.18216	1
726	iron	154.000	36086.76705740547	1.722874090640907e-11	1684324.2641731105	1782507.1416375986	3.1089313388525054e-09	0.020244949495266746	0	0	2021-09-30 21:46:24.182162	2021-09-30 21:46:24.182163	1
727	iron	155.000	35992.819663358285	1.7214757697802854e-11	1683890.282663638	1781588.701528315	3.1084703714567895e-09	0.020202653750824907	0	0	2021-09-30 21:46:24.182165	2021-09-30 21:46:24.182167	1
728	iron	156.000	35898.82730251632	1.7200798482280982e-11	1683453.1863716915	1780663.9087977645	3.1080165717222856e-09	0.020160361045759512	0	0	2021-09-30 21:46:24.182169	2021-09-30 21:46:24.18217	1
729	iron	157.000	35804.79080289756	1.718686291321765e-11	1683013.0074096187	1779732.836494106	3.10756985409919e-09	0.020118070571440026	0	0	2021-09-30 21:46:24.182172	2021-09-30 21:46:24.182173	1
730	iron	158.000	35710.71099291139	1.717295063701354e-11	1682569.7785310736	1778795.5589864876	3.1071301311954246e-09	0.020075781509854028	0	0	2021-09-30 21:46:24.182175	2021-09-30 21:46:24.182177	1
731	iron	159.000	35616.58870137547	1.7159061293225875e-11	1682123.5331188142	1777852.1519362167	3.106697313805196e-09	0.020033493034044638	0	0	2021-09-30 21:46:24.182179	2021-09-30 21:46:24.18218	1
732	iron	160.000	35522.42475753241	1.714519451469826e-11	1681674.3051726092	1776902.6922681797	3.106271310937339e-09	0.019991204308542506	0	0	2021-09-30 21:46:24.182182	2021-09-30 21:46:24.182183	1
733	iron	161.000	35428.21999106624	1.713134992768922e-11	1681222.1292965743	1775947.2581410771	3.1058520298445944e-09	0.019948914489808515	0	0	2021-09-30 21:46:24.182185	2021-09-30 21:46:24.182187	1
734	iron	162.000	35333.975232118486	1.7117527152000508e-11	1680767.0406866805	1774985.9289180434	3.1054393760525606e-09	0.019906622726669494	0	0	2021-09-30 21:46:24.182189	2021-09-30 21:46:24.18219	1
735	iron	163.000	35239.691311304174	1.7103725801104606e-11	1680309.0751178353	1774018.7851363902	3.1050332533893723e-09	0.019864328160761204	0	0	2021-09-30 21:46:24.182192	2021-09-30 21:46:24.182194	1
736	iron	164.000	35145.36905972766	1.7089945482271148e-11	1679848.2689310634	1773045.908477592	3.10463356401511e-09	0.019822029926966116	0	0	2021-09-30 21:46:24.182195	2021-09-30 21:46:24.182197	1
737	iron	165.000	35051.00930899804	1.7076185796692983e-11	1679384.6590202497	1772067.3817363707	3.104240208452015e-09	0.019779727153858617	0	0	2021-09-30 21:46:24.1822	2021-09-30 21:46:24.182202	1
738	iron	166.000	34956.612891244586	1.7062446339611635e-11	1678918.2828190797	1771083.2887902353	3.1038530856143042e-09	0.019737418964142685	0	0	2021-09-30 21:46:24.182204	2021-09-30 21:46:24.182205	1
739	iron	167.000	34862.180639131744	1.704872670044165e-11	1678449.1782872933	1770093.7145676063	3.1034720928391836e-09	0.019695104475102768	0	0	2021-09-30 21:46:24.182207	2021-09-30 21:46:24.182209	1
740	iron	168.000	34767.71338587407	1.7035026462894263e-11	1677977.3838974643	1769098.7450170862	3.103097125916864e-09	0.01965278279903945	0	0	2021-09-30 21:46:24.182211	2021-09-30 21:46:24.182212	1
741	iron	169.000	34673.21196525081	1.7021345205101007e-11	1677502.9386210993	1768098.4670753353	3.102728079121864e-09	0.0196104530437181	0	0	2021-09-30 21:46:24.182214	2021-09-30 21:46:24.182215	1
742	iron	170.000	34578.67721162038	1.7007682499735468e-11	1677025.8819148606	1767092.9686352499	3.1023648452439633e-09	0.019568114312811715	0	0	2021-09-30 21:46:24.182217	2021-09-30 21:46:24.182219	1
743	iron	171.000	34484.10995993458	1.699403791413563e-11	1676546.2537064883	1766082.3385135536	3.102007315619806e-09	0.019525765706347863	0	0	2021-09-30 21:46:24.182221	2021-09-30 21:46:24.182222	1
744	iron	172.000	34389.511045752595	1.6980411010424043e-11	1676064.0943808677	1765066.666418739	3.1016553801640927e-09	0.019483406321149196	0	0	2021-09-30 21:46:24.182224	2021-09-30 21:46:24.182225	1
745	iron	173.000	34294.881305254654	1.6966801345629046e-11	1675579.4447655382	1764046.0429178835	3.101308927401954e-09	0.01944103525128402	0	0	2021-09-30 21:46:24.182227	2021-09-30 21:46:24.182229	1
746	iron	174.000	34200.221575255695	1.695320847180328e-11	1675092.3461165538	1763020.5594042572	3.100967844500485e-09	0.019398651588505754	0	0	2021-09-30 21:46:24.182231	2021-09-30 21:46:24.182232	1
747	iron	175.000	34105.53269321868	1.6939631936143133e-11	1674602.840103812	1761990.3080638635	3.100632017301415e-09	0.019356254422701693	0	0	2021-09-30 21:46:24.182234	2021-09-30 21:46:24.182235	1
748	iron	176.000	34010.81549726764	1.6926071281106772e-11	1674110.968796534	1760955.381842356	3.1003013303534287e-09	0.019313842842335203	0	0	2021-09-30 21:46:24.182237	2021-09-30 21:46:24.182239	1
749	iron	177.000	33916.07082620065	1.6912526044531285e-11	1673616.774648514	1759915.8744115252	3.0999756669449125e-09	0.019271415934890294	0	0	2021-09-30 21:46:24.182241	2021-09-30 21:46:24.182242	1
750	iron	178.000	33821.29951950237	1.6898995759749446e-11	1673120.300483243	1758871.8801355835	3.0996549091369647e-09	0.019228972787315946	0	0	2021-09-30 21:46:24.182244	2021-09-30 21:46:24.182245	1
751	iron	179.000	33726.502417356605	1.688547995570581e-11	1672621.5894790215	1757823.4940374868	3.099338937796451e-09	0.019186512486467747	0	0	2021-09-30 21:46:24.182247	2021-09-30 21:46:24.182249	1
752	iron	180.000	33631.68036065849	1.6871978157071643e-11	1672120.6851537812	1756770.8117647092	3.0990276326295706e-09	0.019144034119553042	0	0	2021-09-30 21:46:24.182251	2021-09-30 21:46:24.182252	1
753	iron	181.000	33536.83419102647	1.6858489884359667e-11	1671617.6313501087	1755713.9295555076	3.0987208722151175e-09	0.01910153677456837	0	0	2021-09-30 21:46:24.182254	2021-09-30 21:46:24.182255	1
754	iron	182.000	33441.964750814106	1.6845014654037793e-11	1671112.4722198208	1754652.9442043137	3.0984185340385708e-09	0.019059019540744057	0	0	2021-09-30 21:46:24.182257	2021-09-30 21:46:24.182259	1
755	iron	183.000	33347.07288312167	1.6831551978642228e-11	1670605.2522087216	1753587.9530275732	3.098120494525882e-09	0.01901648150898156	0	0	2021-09-30 21:46:24.182261	2021-09-30 21:46:24.182262	1
756	iron	184.000	33252.1594318074	1.6818101366889607e-11	1670096.0160410604	1752519.053829034	3.097826629077827e-09	0.018973921772294348	0	0	2021-09-30 21:46:24.182264	2021-09-30 21:46:24.182265	1
757	iron	185.000	33157.22524149871	1.6804662323788993e-11	1669584.808704121	1751446.34486538	3.0975368121041983e-09	0.01893133942624274	0	0	2021-09-30 21:46:24.182267	2021-09-30 21:46:24.182269	1
758	iron	186.000	33062.27115760306	1.679123435075244e-11	1669071.6754325689	1750369.9248114298	3.09725091705842e-09	0.01888873356937101	0	0	2021-09-30 21:46:24.182271	2021-09-30 21:46:24.182272	1
759	iron	187.000	32967.298026318604	1.6777816945705693e-11	1668556.66169268	1749289.89272517	3.0969688164725003e-09	0.018846103303643842	0	0	2021-09-30 21:46:24.182274	2021-09-30 21:46:24.182275	1
760	iron	188.000	32872.30669464471	1.6764409603196938e-11	1668039.8131666987	1748206.3480131275	3.096690381991679e-09	0.018803447734876813	0	0	2021-09-30 21:46:24.182277	2021-09-30 21:46:24.182279	1
761	iron	189.000	32777.29801039214	1.67510118145065e-11	1667521.1757369258	1747119.3903952693	3.0964154844097636e-09	0.018760765973169464	0	0	2021-09-30 21:46:24.182281	2021-09-30 21:46:24.182282	1
762	iron	190.000	32682.272822193165	1.6737623067754008e-11	1667000.79546986	1746029.1198700797	3.096143993704267e-09	0.018718057133334076	0	0	2021-09-30 21:46:24.182284	2021-09-30 21:46:24.182286	1
763	iron	191.000	32587.23197951121	1.6724242848006375e-11	1666478.7186001048	1744935.6366792407	3.095875779072154e-09	0.01867532033532621	0	0	2021-09-30 21:46:24.182287	2021-09-30 21:46:24.182289	1
764	iron	192.000	32492.176332650564	1.6710870637384167e-11	1665954.991514608	1743839.041273089	3.0956107089649575e-09	0.018632554704664524	0	0	2021-09-30 21:46:24.182291	2021-09-30 21:46:24.182292	1
765	iron	193.000	32397.10673276567	1.6697505915167525e-11	1665429.660736173	1742739.4342746288	3.0953486511253234e-09	0.018589759372863533	0	0	2021-09-30 21:46:24.182294	2021-09-30 21:46:24.182296	1
766	iron	194.000	32302.02403187037	1.6684148157901335e-11	1664902.7729077374	1741636.916445247	3.0950894726221847e-09	0.018546933477845737	0	0	2021-09-30 21:46:24.182298	2021-09-30 21:46:24.182299	1
767	iron	195.000	32206.92908284664	1.6670796839499768e-11	1664374.3747758875	1740531.5886489048	3.094833039887432e-09	0.01850407616436735	0	0	2021-09-30 21:46:24.182301	2021-09-30 21:46:24.182302	1
768	iron	196.000	32111.82273945343	1.665745143135018e-11	1663844.5131747394	1739423.5518171976	3.094579218751967e-09	0.018461186584432417	0	0	2021-09-30 21:46:24.182304	2021-09-30 21:46:24.182306	1
769	iron	197.000	32016.705856335084	1.6644111402415718e-11	1663313.2350096968	1738312.9069142353	3.094327874482002e-09	0.018418263897706146	0	0	2021-09-30 21:46:24.182308	2021-09-30 21:46:24.182309	1
770	iron	198.000	31921.579289029614	1.6630776219338055e-11	1662780.5872409728	1737199.7549011274	3.0940788718159463e-09	0.01837530727192995	0	0	2021-09-30 21:46:24.182311	2021-09-30 21:46:24.182312	1
771	iron	199.000	31826.44389397674	1.6617445346539002e-11	1662246.6168674119	1736084.1967011832	3.0938320750007636e-09	0.018332315883326216	0	0	2021-09-30 21:46:24.182314	2021-09-30 21:46:24.182316	1
772	iron	200.000	31731.300528525644	1.6604118246321066e-11	1661711.3709100708	1734966.3331647036	3.0935873478288182e-09	0.018289288917004785	0	0	2021-09-30 21:46:24.182318	2021-09-30 21:46:24.182319	1
773	iron	201.000	31636.15005094268	1.6590794378968165e-11	1661174.8963957443	1733846.2650337464	3.0933445536749838e-09	0.018246225567367092	0	0	2021-09-30 21:46:24.182321	2021-09-30 21:46:24.182322	1
774	iron	202.000	31540.993320418627	1.6577473202844245e-11	1660637.2403406089	1732724.0929072374	3.093103555533472e-09	0.018203125038503864	0	0	2021-09-30 21:46:24.182324	2021-09-30 21:46:24.182326	1
775	iron	203.000	31445.831197075906	1.656415417449303e-11	1660098.4497336233	1731599.9172056627	3.092864216055369e-09	0.01815998654459457	0	0	2021-09-30 21:46:24.182328	2021-09-30 21:46:24.182329	1
776	iron	204.000	31350.66454197551	1.6550836748735348e-11	1659558.5715203716	1730473.8381367843	3.09262639758526e-09	0.01811680931029332	0	0	2021-09-30 21:46:24.182331	2021-09-30 21:46:24.182332	1
777	iron	205.000	31255.49421712371	1.6537520378766725e-11	1659017.652586216	1729345.9556600077	3.0923899621993154e-09	0.018073592571126118	0	0	2021-09-30 21:46:24.182334	2021-09-30 21:46:24.182336	1
778	iron	206.000	31160.321085478514	1.6524204516253807e-11	1658475.7397400923	1728216.3694521862	3.0921547717422135e-09	0.018030335573870175	0	0	2021-09-30 21:46:24.182338	2021-09-30 21:46:24.182339	1
779	iron	207.000	31065.146010955985	1.6510888611430433e-11	1657932.879697866	1727085.1788726083	3.0919206878649966e-09	0.01798703757693898	0	0	2021-09-30 21:46:24.182344	2021-09-30 21:46:24.182346	1
780	iron	208.000	30969.969858436274	1.649757211319274e-11	1657389.119065964	1725952.482928653	3.0916875720624725e-09	0.017943697850757404	0	0	2021-09-30 21:46:24.182348	2021-09-30 21:46:24.182349	1
781	iron	209.000	30874.793493769455	1.6484254469193527e-11	1656844.504324713	1724818.3802409305	3.09145528571124e-09	0.01790031567813924	0	0	2021-09-30 21:46:24.182351	2021-09-30 21:46:24.182352	1
782	iron	210.000	30779.617783781145	1.6470935125936157e-11	1656299.0818120844	1723682.9690093696	3.091223690107064e-09	0.01785689035465189	0	0	2021-09-30 21:46:24.182354	2021-09-30 21:46:24.182356	1
783	iron	211.000	30684.4435962778	1.645761352886729e-11	1655752.8977070572	1722546.3469786022	3.0909926465030016e-09	0.017813421188985268	0	0	2021-09-30 21:46:24.182358	2021-09-30 21:46:24.182359	1
784	iron	212.000	30589.271800051996	1.6444289122469516e-11	1655205.998013197	1721408.6114039004	3.090762016147263e-09	0.017769907503311963	0	0	2021-09-30 21:46:24.182361	2021-09-30 21:46:24.182362	1
785	iron	213.000	30494.10326488739	1.6430961350352436e-11	1654658.4285424333	1720269.859017616	3.0905316603207108e-09	0.01772634863363907	0	0	2021-09-30 21:46:24.182364	2021-09-30 21:46:24.182366	1
786	iron	214.000	30398.938861563354	1.6417629655344365e-11	1654110.2348982017	1719130.1859944013	3.0903014403757486e-09	0.01768274393016932	0	0	2021-09-30 21:46:24.182368	2021-09-30 21:46:24.182369	1
787	iron	215.000	30303.779461859525	1.6404293479581583e-11	1653561.4624595712	1717989.6879185736	3.0900712177732884e-09	0.01763909275763698	0	0	2021-09-30 21:46:24.182371	2021-09-30 21:46:24.182372	1
788	iron	216.000	30208.62593856009	1.6390952264598193e-11	1653012.1563645657	1716848.4597498977	3.089840854121433e-09	0.01759539449565673	0	0	2021-09-30 21:46:24.182374	2021-09-30 21:46:24.182376	1
789	iron	217.000	30113.479165457822	1.6377605451414904e-11	1652462.3614939176	1715706.595790368	3.0896102112133895e-09	0.017551648539058953	0	0	2021-09-30 21:46:24.182378	2021-09-30 21:46:24.182379	1
790	iron	218.000	30018.34001735804	1.636425248062679e-11	1651912.1224548342	1714564.1896511065	3.0893791510654224e-09	0.017507854298220483	0	0	2021-09-30 21:46:24.182381	2021-09-30 21:46:24.182382	1
791	iron	219.000	29923.209370082073	1.6350892792491183e-11	1651361.4835647494	1713421.334219331	3.089147535954977e-09	0.017464011199391123	0	0	2021-09-30 21:46:24.182384	2021-09-30 21:46:24.182386	1
792	iron	220.000	29828.088100470763	1.633752582701277e-11	1650810.4888351783	1712278.1216256267	3.088915228458507e-09	0.017420118685013714	0	0	2021-09-30 21:46:24.182388	2021-09-30 21:46:24.182389	1
793	iron	221.000	29732.97708638761	1.632415102403149e-11	1650259.1819554595	1711134.6432110812	3.0886820914899125e-09	0.017376176214041986	0	0	2021-09-30 21:46:24.182391	2021-09-30 21:46:24.182393	1
794	iron	222.000	29637.877206721787	1.6310767823305885e-11	1649707.606276692	1709990.9894949168	3.0884479883383285e-09	0.01733218326224981	0	0	2021-09-30 21:46:24.182395	2021-09-30 21:46:24.182396	1
795	iron	223.000	29542.78934139085	1.6297375664598604e-11	1649155.8047958817	1708847.2501426497	3.0882127827058666e-09	0.017288139322531433	0	0	2021-09-30 21:46:24.182398	2021-09-30 21:46:24.182399	1
796	iron	224.000	29447.714371343198	1.6283973987759482e-11	1648603.8201397108	1707703.5139335562	3.0879763387459766e-09	0.017244043905205057	0	0	2021-09-30 21:46:24.182401	2021-09-30 21:46:24.182403	1
797	iron	225.000	29352.653178560493	1.6270562232808905e-11	1648051.6945488108	1706559.8687292782	3.0877385211010253e-09	0.01719989653830122	0	0	2021-09-30 21:46:24.182405	2021-09-30 21:46:24.182406	1
798	iron	226.000	29257.606646059638	1.6257139840019994e-11	1647499.4698619326	1705416.4014423045	3.0874991949400958e-09	0.017155696767848543	0	0	2021-09-30 21:46:24.182408	2021-09-30 21:46:24.182409	1
799	iron	227.000	29162.57565789473	1.6243706250000002e-11	1646947.1874999963	1704273.198004287	3.0872582259970734e-09	0.017111444158157425	0	0	2021-09-30 21:46:24.182411	2021-09-30 21:46:24.182413	1
800	iron	228.000	29067.56109915861	1.6230260903771343e-11	1646394.8884506626	1703130.3433355333	3.0870154806078484e-09	0.017067138292087853	0	0	2021-09-30 21:46:24.182415	2021-09-30 21:46:24.182416	1
801	iron	229.000	28972.563855984346	1.6216803242851487e-11	1645842.6132525397	1701987.921313824	3.0867708257482295e-09	0.017022778771320194	0	0	2021-09-30 21:46:24.182418	2021-09-30 21:46:24.182419	1
802	iron	230.000	28877.5848155464	1.620333270933245e-11	1645290.4019796788	1700846.0147439186	3.0865241290713994e-09	0.016978365216615006	0	0	2021-09-30 21:46:24.182421	2021-09-30 21:46:24.182423	1
803	iron	231.000	28782.62486606162	1.6189848745959817e-11	1644738.2942261803	1699704.7053273714	3.0862752589452543e-09	0.016933897268065715	0	0	2021-09-30 21:46:24.182425	2021-09-30 21:46:24.182426	1
804	iron	232.000	28687.684896789993	1.6176350796210003e-11	1644186.329090993	1698564.0736328333	3.0860240844893247e-09	0.016889374585342377	0	0	2021-09-30 21:46:24.182428	2021-09-30 21:46:24.182429	1
805	iron	233.000	28592.765798035198	1.616283830436804e-11	1643634.545162275	1697424.1990655262	3.0857704756126992e-09	0.016844796847939495	0	0	2021-09-30 21:46:24.182431	2021-09-30 21:46:24.182433	1
806	iron	234.000	28497.8684611449	1.614931071560431e-11	1643082.980502637	1696285.159838625	3.0855143030503064e-09	0.01680016375540067	0	0	2021-09-30 21:46:24.182435	2021-09-30 21:46:24.182436	1
807	iron	235.000	28402.993778510852	1.613576747604954e-11	1642531.6726338766	1695147.032943664	3.0852554384001005e-09	0.016755475027548712	0	0	2021-09-30 21:46:24.182438	2021-09-30 21:46:24.18244	1
808	iron	236.000	28308.14264356878	1.612220803287066e-11	1641980.6585220192	1694009.8941216597	3.084993754159868e-09	0.01671073040470433	0	0	2021-09-30 21:46:24.182441	2021-09-30 21:46:24.182443	1
809	iron	237.000	28213.315950798045	1.6108631834344848e-11	1641429.9745625877	1692873.8178347782	3.084729123763536e-09	0.016665929647895126	0	0	2021-09-30 21:46:24.182445	2021-09-30 21:46:24.182446	1
810	iron	238.000	28118.51459572104	1.609503832993322e-11	1640879.6565659721	1691738.8772382857	3.0844614216173735e-09	0.016621072539057383	0	0	2021-09-30 21:46:24.182448	2021-09-30 21:46:24.18245	1
811	iron	239.000	28023.73947490247	1.6081426970353896e-11	1640329.7397424085	1690605.1441517656	3.0841905231369614e-09	0.01657615888124068	0	0	2021-09-30 21:46:24.182451	2021-09-30 21:46:24.182453	1
812	iron	240.000	27928.99148594826	1.606779720765413e-11	1639780.258687906	1689472.6890323658	3.0839163047823942e-09	0.01653118849878799	0	0	2021-09-30 21:46:24.182455	2021-09-30 21:46:24.182456	1
813	iron	241.000	27834.271527504407	1.6054148495281894e-11	1639231.247369789	1688341.580947321	3.0836386440942463e-09	0.01648616123751849	0	0	2021-09-30 21:46:24.182458	2021-09-30 21:46:24.18246	1
814	iron	242.000	27739.580499255535	1.6040480288156715e-11	1638682.7391122673	1687211.8875465991	3.0833574197295133e-09	0.01644107696490456	0	0	2021-09-30 21:46:24.182462	2021-09-30 21:46:24.182463	1
815	iron	243.000	27644.91930192311	1.6026792042739483e-11	1638134.7665826217	1686083.6750368907	3.083072511496374e-09	0.01639593557023097	0	0	2021-09-30 21:46:24.182465	2021-09-30 21:46:24.182466	1
816	iron	244.000	27550.288837263735	1.601308321710215e-11	1637587.361776927	1684957.0081547007	3.0827838003899093e-09	0.016350736964758368	0	0	2021-09-30 21:46:24.182468	2021-09-30 21:46:24.18247	1
817	iron	245.000	27455.69000806686	1.5999353270996302e-11	1637040.556006432	1683831.950140867	3.0824911686265516e-09	0.016305481081868033	0	0	2021-09-30 21:46:24.182471	2021-09-30 21:46:24.182473	1
818	iron	246.000	27361.123718152583	1.598560166592116e-11	1636494.3798837657	1682708.5627147756	3.0821944996788842e-09	0.016260167877204995	0	0	2021-09-30 21:46:24.182475	2021-09-30 21:46:24.182476	1
819	iron	247.000	27266.59087236905	1.5971827865190427e-11	1635948.8633094765	1681586.9060493258	3.0818936783097787e-09	0.01621479732880915	0	0	2021-09-30 21:46:24.182478	2021-09-30 21:46:24.18248	1
820	iron	248.000	27172.092376589644	1.5958031333999217e-11	1635404.0354584279	1680467.038745658	3.081588590606878e-09	0.016169369437243807	0	0	2021-09-30 21:46:24.182482	2021-09-30 21:46:24.182483	1
821	iron	249.000	27077.629137710115	1.594421153948971e-11	1634859.9247668446	1679349.0178092737	3.0812791240157995e-09	0.01612388422570618	0	0	2021-09-30 21:46:24.182487	2021-09-30 21:46:24.182488	1
822	iron	250.000	26983.202063645258	1.5930367950816134e-11	1634316.5589189972	1678232.8986254698	3.0809651673740156e-09	0.01607834174013954	0	0	2021-09-30 21:46:24.18249	2021-09-30 21:46:24.182491	1
823	iron	251.000	26888.812063325506	1.591650003920911e-11	1633773.9648342347	1677118.7349355407	3.0806466109440725e-09	0.016032742049333176	0	0	2021-09-30 21:46:24.182493	2021-09-30 21:46:24.182495	1
824	iron	252.000	26794.460046693297	1.5902607278039625e-11	1633232.1686543562	1676006.5788137284	3.080323346446191e-09	0.01598708524501039	0	0	2021-09-30 21:46:24.182497	2021-09-30 21:46:24.182498	1
825	iron	253.000	26700.14692469921	1.5888689142881268e-11	1632691.1957310205	1674896.4806442976	3.079995267090677e-09	0.015941371441910383	0	0	2021-09-30 21:46:24.1825	2021-09-30 21:46:24.182501	1
826	iron	254.000	26605.873609297803	1.5874745111573296e-11	1632151.07061305	1673788.4890984453	3.0796622676106537e-09	0.015895600777866836	0	0	2021-09-30 21:46:24.182503	2021-09-30 21:46:24.182505	1
827	iron	255.000	26511.641013443415	1.5860774664281228e-11	1631611.8170344038	1672682.6511126277	3.079324244293336e-09	0.015849773413868146	0	0	2021-09-30 21:46:24.182507	2021-09-30 21:46:24.182508	1
828	iron	256.000	26417.45005108556	1.5846777283558457e-11	1631073.4579020096	1671579.011866641	3.0789810950117092e-09	0.015803889534115035	0	0	2021-09-30 21:46:24.18251	2021-09-30 21:46:24.182511	1
829	iron	257.000	26323.301637164135	1.5832752454405686e-11	1630536.0152838165	1670477.6147621977	3.0786327192556064e-09	0.015757949346068556	0	0	2021-09-30 21:46:24.182513	2021-09-30 21:46:24.182515	1
830	iron	258.000	26229.196687604548	1.5818699664330582e-11	1629999.5103970328	1669378.5014019238	3.078279018162493e-09	0.01571195308048929	0	0	2021-09-30 21:46:24.182517	2021-09-30 21:46:24.182518	1
831	iron	259.000	26135.136119312407	1.580461840340625e-11	1629463.963596669	1668281.7115690173	3.077919894547581e-09	0.015665900991465247	0	0	2021-09-30 21:46:24.18252	2021-09-30 21:46:24.182521	1
832	iron	260.000	26041.1208501682	1.579050816432927e-11	1628929.394364019	1667187.2832068193	3.077555252934039e-09	0.015619793356435844	0	0	2021-09-30 21:46:24.182523	2021-09-30 21:46:24.182525	1
833	iron	261.000	25947.151799021693	1.577636844247669e-11	1628395.8212957066	1666095.2523995782	3.0771849995820453e-09	0.015573630476199694	0	0	2021-09-30 21:46:24.182527	2021-09-30 21:46:24.182528	1
834	iron	262.000	25853.229885685825	1.5762198735962603e-11	1627863.2620923948	1665005.6533525512	3.076809042518458e-09	0.015527412674923583	0	0	2021-09-30 21:46:24.18253	2021-09-30 21:46:24.182531	1
835	iron	263.000	25759.356030930947	1.5747998545694128e-11	1627331.7335483255	1663918.518373843	3.0764272915648574e-09	0.015481140300130628	0	0	2021-09-30 21:46:24.182533	2021-09-30 21:46:24.182535	1
836	iron	264.000	25665.53115647833	1.57337673754261e-11	1626801.251540389	1662833.8778553107	3.0760396583663545e-09	0.015434813722692016	0	0	2021-09-30 21:46:24.182537	2021-09-30 21:46:24.182538	1
837	iron	265.000	25571.756184993716	1.5719504731815328e-11	1626271.8310181964	1661751.7602555424	3.075646056418469e-09	0.015388433336794733	0	0	2021-09-30 21:46:24.18254	2021-09-30 21:46:24.182541	1
838	iron	266.000	25478.032040080594	1.5705210124474718e-11	1625743.485993309	1660672.1920811443	3.0752464010955732e-09	0.015341999559920178	0	0	2021-09-30 21:46:24.182543	2021-09-30 21:46:24.182545	1
839	iron	267.000	25384.359646273148	1.5690883066025633e-11	1625216.2295298884	1659595.1978709553	3.074840609676474e-09	0.015295512832790778	0	0	2021-09-30 21:46:24.182547	2021-09-30 21:46:24.182548	1
840	iron	268.000	25290.739929029118	1.567652307215034e-11	1624690.0737344678	1658520.8001784822	3.074428601371654e-09	0.015248973619328409	0	0	2021-09-30 21:46:24.18255	2021-09-30 21:46:24.182551	1
841	iron	269.000	25197.17381472252	1.5662129661643705e-11	1624165.0297466898	1657449.0195563373	3.0740102973485883e-09	0.015202382406589646	0	0	2021-09-30 21:46:24.182553	2021-09-30 21:46:24.182555	1
842	iron	270.000	25103.662230635848	1.5647702356462894e-11	1623641.1077296687	1656379.8745399253	3.0735856207575604e-09	0.015155739704703079	0	0	2021-09-30 21:46:24.182557	2021-09-30 21:46:24.182558	1
843	iron	271.000	25010.20610495235	1.5633240681778686e-11	1623118.3168614283	1655313.3816333432	3.0731544967555748e-09	0.015109046046781845	0	0	2021-09-30 21:46:24.18256	2021-09-30 21:46:24.182561	1
844	iron	272.000	24916.806366747893	1.5618744166024434e-11	1622596.6653253352	1654249.5552932464	3.0727168525319117e-09	0.01506230198885012	0	0	2021-09-30 21:46:24.182563	2021-09-30 21:46:24.182565	1
845	iron	273.000	24823.463945982712	1.5604212340943762e-11	1622076.1603020644	1653188.4079158544	3.072272617330626e-09	0.015015508109736396	0	0	2021-09-30 21:46:24.182567	2021-09-30 21:46:24.182568	1
846	iron	274.000	24730.179773492877	1.5589644741639554e-11	1621556.8079606704	1652129.949822148	3.071821722474829e-09	0.014968665010978757	0	0	2021-09-30 21:46:24.18257	2021-09-30 21:46:24.182571	1
847	iron	275.000	24636.95478098172	1.5575040906620556e-11	1621038.6134509286	1651074.1892456643	3.071364101388295e-09	0.01492177331670223	0	0	2021-09-30 21:46:24.182573	2021-09-30 21:46:24.182575	1
848	iron	276.000	24543.78990101062	1.556040037784804e-11	1620521.5808947012	1650021.132318315	3.0708996896188727e-09	0.014874833673509422	0	0	2021-09-30 21:46:24.182577	2021-09-30 21:46:24.182578	1
849	iron	277.000	24450.686066990118	1.5545722700781317e-11	1620005.7133788122	1648970.7830592901	3.0704284248588876e-09	0.014827846750339282	0	0	2021-09-30 21:46:24.18258	2021-09-30 21:46:24.182581	1
850	iron	278.000	24357.64421317027	1.5531007424423025e-11	1619491.0129473591	1647923.1433628164	3.0699502469665296e-09	0.01478081323833168	0	0	2021-09-30 21:46:24.182583	2021-09-30 21:46:24.182585	1
851	iron	279.000	24264.665274631276	1.5516254101363017e-11	1618977.480594229	1646878.2129863428	3.069465097986674e-09	0.014733733850684256	0	0	2021-09-30 21:46:24.182586	2021-09-30 21:46:24.182588	1
852	iron	280.000	24171.750187273567	1.550146228782209e-11	1618465.1162565928	1645835.9895407206	3.0689729221697686e-09	0.014686609322487124	0	0	2021-09-30 21:46:24.18259	2021-09-30 21:46:24.182591	1
853	iron	281.000	24078.899887807576	1.5486631543695477e-11	1617953.9188075606	1644796.4684786769	3.068473665992235e-09	0.014639440410568789	0	0	2021-09-30 21:46:24.182593	2021-09-30 21:46:24.182594	1
854	iron	282.000	23986.115313743816	1.5471761432593774e-11	1617443.8860502625	1643759.6430861943	3.0679672781738515e-09	0.014592227893312531	0	0	2021-09-30 21:46:24.182596	2021-09-30 21:46:24.182598	1
855	iron	283.000	23893.39740338215	1.5456851521885486e-11	1616935.0147111937	1642725.5044723933	3.0674537096966253e-09	0.01454497257048199	0	0	2021-09-30 21:46:24.1826	2021-09-30 21:46:24.182601	1
856	iron	284.000	23800.747095801165	1.5441901382736837e-11	1616427.3004343417	1641694.0415610047	3.0669329138218484e-09	0.014497675263029051	0	0	2021-09-30 21:46:24.182603	2021-09-30 21:46:24.182604	1
857	iron	285.000	23708.16533084713	1.542691059015266e-11	1615920.7377756452	1640665.241082516	3.0664048461065597e-09	0.014450336812892072	0	0	2021-09-30 21:46:24.182606	2021-09-30 21:46:24.182608	1
858	iron	286.000	23615.653049123102	1.541187872301498e-11	1615415.3201971408	1639639.0875656807	3.0658694644203e-09	0.01440295808279644	0	0	2021-09-30 21:46:24.18261	2021-09-30 21:46:24.182611	1
859	iron	287.000	23523.21119197723	1.539680536412173e-11	1614911.040061945	1638615.5633307237	3.0653267289602235e-09	0.014355539956036358	0	0	2021-09-30 21:46:24.182613	2021-09-30 21:46:24.182614	1
860	iron	288.000	23430.84070149142	1.538169010022465e-11	1614407.8886292325	1637594.6484825315	3.064776602266061e-09	0.014308083336253868	0	0	2021-09-30 21:46:24.182616	2021-09-30 21:46:24.182618	1
861	iron	289.000	23338.542520469473	1.5366532522066587e-11	1613905.856049871	1636576.320905176	3.064219049233695e-09	0.01426058914720282	0	0	2021-09-30 21:46:24.18262	2021-09-30 21:46:24.182621	1
862	iron	290.000	23246.317592424904	1.5351332224417755e-11	1613404.931361503	1635560.556255304	3.0636540371296114e-09	0.01421305833251964	0	0	2021-09-30 21:46:24.182623	2021-09-30 21:46:24.182624	1
863	iron	291.000	23154.166861568894	1.5336088806111307e-11	1612905.1024846658	1634547.3279576353	3.063081535603222e-09	0.014165491855472912	0	0	2021-09-30 21:46:24.182628	2021-09-30 21:46:24.182629	1
864	iron	292.000	23062.091272797697	1.5320801870078427e-11	1612406.3562188493	1633536.6072003196	3.062501516699185e-09	0.014117890698711232	0	0	2021-09-30 21:46:24.182631	2021-09-30 21:46:24.182633	1
865	iron	293.000	22970.091771679865	1.530547102338263e-11	1611908.6782390028	1632528.3629312045	3.0619139548687006e-09	0.014070255864000469	0	0	2021-09-30 21:46:24.182635	2021-09-30 21:46:24.182636	1
866	iron	294.000	22878.169304443672	1.5290095877253128e-11	1611412.053092027	1631522.5618540598	3.0613188269806682e-09	0.014022588371959107	0	0	2021-09-30 21:46:24.182638	2021-09-30 21:46:24.182639	1
867	iron	295.000	22786.324817963574	1.527467604711792e-11	1610916.464193942	1630519.1684261675	3.0607161123314387e-09	0.01397488926177894	0	0	2021-09-30 21:46:24.182641	2021-09-30 21:46:24.182643	1
868	iron	296.000	22694.559259747082	1.5259211152635888e-11	1610421.8938267007	1629518.1448551845	3.0601057926550576e-09	0.01392715959095009	0	0	2021-09-30 21:46:24.182645	2021-09-30 21:46:24.182646	1
869	iron	297.000	22602.87357792113	1.5243700817727703e-11	1609928.3231362458	1628519.4510985129	3.0594878521309454e-09	0.013879400434962217	0	0	2021-09-30 21:46:24.182648	2021-09-30 21:46:24.182649	1
870	iron	298.000	22511.268721218326	1.5228144670607378e-11	1609435.732130004	1627523.044861525	3.058862277392614e-09	0.013831612887013626	0	0	2021-09-30 21:46:24.182651	2021-09-30 21:46:24.182653	1
871	iron	299.000	22419.74563896284	1.521254234381108e-11	1608944.0996747985	1626528.8815966237	3.0582290575352384e-09	0.013783798057711278	0	0	2021-09-30 21:46:24.182655	2021-09-30 21:46:24.182656	1
872	iron	300.000	22328.30528105626	1.5196893474227653e-11	1608453.4034955986	1625536.914503989	3.057588184121714e-09	0.013735957074754862	0	0	2021-09-30 21:46:24.182658	2021-09-30 21:46:24.182659	1
873	iron	301.000	22236.94859796314	1.518119770312621e-11	1607963.6201741137	1624547.0945319985	3.056939651188632e-09	0.013688091082622129	0	0	2021-09-30 21:46:24.182661	2021-09-30 21:46:24.182663	1
874	iron	302.000	22145.676540696168	1.516545467618416e-11	1607474.7251471896	1623559.3703772414	3.056283455252583e-09	0.013640201242256093	0	0	2021-09-30 21:46:24.182665	2021-09-30 21:46:24.182666	1
875	iron	303.000	22054.490060801516	1.5149664043514464e-11	1606986.6927068904	1622573.6884879286	3.055619595313099e-09	0.013592288730722626	0	0	2021-09-30 21:46:24.182668	2021-09-30 21:46:24.18267	1
876	iron	304.000	21963.39011034347	1.5133825459692024e-11	1606499.495999368	1621589.9930648445	3.0549480728577212e-09	0.013544354740887447	0	0	2021-09-30 21:46:24.182672	2021-09-30 21:46:24.182673	1
877	iron	305.000	21872.37764188936	1.5117938583779267e-11	1606013.1070251074	1620608.2260650715	3.0542688918642867e-09	0.013496400481069216	0	0	2021-09-30 21:46:24.182675	2021-09-30 21:46:24.182676	1
878	iron	306.000	21781.453608493663	1.5102003079350852e-11	1605527.4966385607	1619628.3272044654	3.0535820588042085e-09	0.013448427174701993	0	0	2021-09-30 21:46:24.182678	2021-09-30 21:46:24.18268	1
879	iron	307.000	21690.618963682544	1.5086018614518524e-11	1605042.6345491856	1618650.233962967	3.052887582643011e-09	0.013400436059973906	0	0	2021-09-30 21:46:24.182682	2021-09-30 21:46:24.182683	1
880	iron	308.000	21599.874661437723	1.5069984861953537e-11	1604558.489321649	1617673.8815882115	3.0521854748421286e-09	0.01335242838947937	0	0	2021-09-30 21:46:24.182685	2021-09-30 21:46:24.182686	1
881	iron	309.000	21509.221656180107	1.5053901498911116e-11	1604075.0283771977	1616699.2031014934	3.0514757493586114e-09	0.013304405429851503	0	0	2021-09-30 21:46:24.182688	2021-09-30 21:46:24.18269	1
882	iron	310.000	21418.66090275373	1.5037768207250514e-11	1603592.2179944105	1615726.1293024723	3.0507584226454786e-09	0.013256368461405285	0	0	2021-09-30 21:46:24.182692	2021-09-30 21:46:24.182693	1
883	iron	311.000	21328.193356408683	1.502158467345831e-11	1603110.0233119074	1614754.5887778176	3.050033513648606e-09	0.013208318777747929	0	0	2021-09-30 21:46:24.182695	2021-09-30 21:46:24.182696	1
884	iron	312.000	21237.81997278443	1.5005350588667606e-11	1602628.4083289	1613784.5079055012	3.0493010438072223e-09	0.013160257685425778	0	0	2021-09-30 21:46:24.182698	2021-09-30 21:46:24.1827	1
885	iron	313.000	21147.54170789271	1.498906564867867e-11	1602147.3359085415	1612815.810864721	3.048561037049162e-09	0.013112186503525363	0	0	2021-09-30 21:46:24.182702	2021-09-30 21:46:24.182703	1
886	iron	314.000	21057.359518100224	1.4972729553978184e-11	1601666.7677798867	1611848.419643024	3.04781351978854e-09	0.013064106563298176	0	0	2021-09-30 21:46:24.182705	2021-09-30 21:46:24.182706	1
887	iron	315.000	20967.274360110896	1.4956342009757333e-11	1601186.6645409279	1610882.2540455915	3.047058520921201e-09	0.013016019207768539	0	0	2021-09-30 21:46:24.182708	2021-09-30 21:46:24.18271	1
888	iron	316.000	20877.28719094847	1.4939902725929845e-11	1600706.9856614415	1609917.2317041385	3.046296071820457e-09	0.012967925791346013	0	0	2021-09-30 21:46:24.182712	2021-09-30 21:46:24.182713	1
889	iron	317.000	20787.398967938152	1.492341141714884e-11	1600227.689487055	1608953.2680882711	3.0455262063303143e-09	0.012919827679418782	0	0	2021-09-30 21:46:24.182715	2021-09-30 21:46:24.182716	1
890	iron	318.000	20697.61064868866	1.490686780282383e-11	1599748.733242441	1607990.2765150853	3.044748960760323e-09	0.012871726247963096	0	0	2021-09-30 21:46:24.182718	2021-09-30 21:46:24.18272	1
891	iron	319.000	20607.923191073714	1.4890271607135662e-11	1599270.0730355866	1607028.1681609263	3.0439643738781066e-09	0.012823622883136704	0	0	2021-09-30 21:46:24.182722	2021-09-30 21:46:24.182723	1
892	iron	320.000	20518.337553213292	1.4873622559051206e-11	1598791.6638621353	1606066.8520732997	3.0431724869016826e-09	0.01277551898087294	0	0	2021-09-30 21:46:24.182725	2021-09-30 21:46:24.182726	1
893	iron	321.000	20428.854693454916	1.4856920392338485e-11	1598313.459610356	1605106.2351840418	3.0423733434905753e-09	0.012727415946466957	0	0	2021-09-30 21:46:24.182728	2021-09-30 21:46:24.18273	1
894	iron	322.000	20339.47557035455	1.4840164845579573e-11	1597835.4130658228	1604146.2223219124	3.0415669897372112e-09	0.012679315194168702	0	0	2021-09-30 21:46:24.182732	2021-09-30 21:46:24.182733	1
895	iron	323.000	20250.20114265715	1.482335566218349e-11	1597357.4759166855	1603186.7162263826	3.040753474157143e-09	0.012631218146768666	0	0	2021-09-30 21:46:24.182735	2021-09-30 21:46:24.182736	1
896	iron	324.000	20161.032369277327	1.4806492590397845e-11	1596879.5987597182	1602227.6175629848	3.039932847677627e-09	0.012583126235174123	0	0	2021-09-30 21:46:24.182738	2021-09-30 21:46:24.18274	1
897	iron	325.000	20071.970209279378	1.4789575383320868e-11	1596401.7311057094	1601268.8249373534	3.039105163627457e-09	0.012535040897998282	0	0	2021-09-30 21:46:24.182742	2021-09-30 21:46:24.182743	1
898	iron	326.000	19983.015621857554	1.4772603798911652e-11	1595923.8213862944	1600310.2349121652	3.03827047772384e-09	0.012486963581129844	0	0	2021-09-30 21:46:24.182745	2021-09-30 21:46:24.182746	1
899	iron	327.000	19894.169566315755	1.4755577600000002e-11	1595445.8169599697	1599351.742022449	3.0374288480607594e-09	0.012438895737318373	0	0	2021-09-30 21:46:24.182748	2021-09-30 21:46:24.18275	1
900	iron	328.000	19805.433002047088	1.4738496554295787e-11	1594967.6641195975	1598393.2387938944	3.0365803350944307e-09	0.01239083882573962	0	0	2021-09-30 21:46:24.182752	2021-09-30 21:46:24.182753	1
901	iron	329.000	19716.806888513118	1.4721360434397206e-11	1594489.3080990948	1597434.615759538	3.035725001630178e-09	0.012342794311577063	0	0	2021-09-30 21:46:24.182755	2021-09-30 21:46:24.182756	1
902	iron	330.000	19628.29218522346	1.4704169017798634e-11	1594010.6930808835	1596475.7614779905	3.0348629128078033e-09	0.012294763665595471	0	0	2021-09-30 21:46:24.182758	2021-09-30 21:46:24.18276	1
903	iron	331.000	19539.889851714226	1.468692208689779e-11	1593531.762204269	1595516.5625535347	3.033994136085114e-09	0.012246748363703432	0	0	2021-09-30 21:46:24.182762	2021-09-30 21:46:24.182763	1
904	iron	332.000	19451.600847526875	1.4669619429001915e-11	1593052.4575730972	1594556.9036547998	3.033118741222714e-09	0.012198749886531416	0	0	2021-09-30 21:46:24.182765	2021-09-30 21:46:24.182766	1
905	iron	333.000	19363.42613218698	1.465226083633316e-11	1592572.7202644888	1593596.6675356056	3.0322368002666657e-09	0.012150769718997511	0	0	2021-09-30 21:46:24.18277	2021-09-30 21:46:24.182772	1
906	iron	334.000	19275.366665182002	1.463484610603422e-11	1592092.490337234	1592635.7350551516	3.031348387531826e-09	0.012102809349882202	0	0	2021-09-30 21:46:24.182774	2021-09-30 21:46:24.182775	1
907	iron	335.000	19187.423405939688	1.4617375040171284e-11	1591611.7068414856	1591673.9852008196	3.0304535795824506e-09	0.012054870271388417	0	0	2021-09-30 21:46:24.182777	2021-09-30 21:46:24.182778	1
908	iron	336.000	19099.597313805865	1.4599847445738664e-11	1591130.307827374	1590711.2951088452	3.029552455215031e-09	0.012006953978722434	0	0	2021-09-30 21:46:24.18278	2021-09-30 21:46:24.182782	1
909	iron	337.000	19011.889348021894	1.4582263134661e-11	1590648.2303556297	1589747.5400890266	3.0286450954370885e-09	0.011959061969649106	0	0	2021-09-30 21:46:24.182784	2021-09-30 21:46:24.182785	1
910	iron	338.000	18924.300467702244	1.4564621923795022e-11	1590165.4105065279	1588782.593646103	3.0277315834491374e-09	0.011911195744077733	0	0	2021-09-30 21:46:24.182787	2021-09-30 21:46:24.182788	1
911	iron	339.000	18836.83163181138	1.4546923634931526e-11	1589681.7833913267	1587816.3275061457	3.0268120046219594e-09	0.011863356803615228	0	0	2021-09-30 21:46:24.18279	2021-09-30 21:46:24.182792	1
912	iron	340.000	18749.48379914102	1.4529168094795362e-11	1589197.283161737	1586848.6116390405	3.0258864464774483e-09	0.011815546651154618	0	0	2021-09-30 21:46:24.182794	2021-09-30 21:46:24.182795	1
913	iron	341.000	18662.25792828674	1.4511355135045491e-11	1588711.8430222608	1585879.3142867323	3.024954998664055e-09	0.011767766790425857	0	0	2021-09-30 21:46:24.182797	2021-09-30 21:46:24.182798	1
914	iron	342.000	18575.15497762431	1.4493484592274264e-11	1588225.3952402696	1584908.301986985	3.0240177529364885e-09	0.011720018725586085	0	0	2021-09-30 21:46:24.1828	2021-09-30 21:46:24.182802	1
915	iron	343.000	18488.175905286294	1.4475556308005895e-11	1587737.871157568	1583935.4396001406	3.023074803132571e-09	0.01167230396079374	0	0	2021-09-30 21:46:24.182804	2021-09-30 21:46:24.182805	1
916	iron	344.000	18401.321669137826	1.4457570128693639e-11	1587249.201203823	1582960.5903396336	3.0221262451464576e-09	0.011624623999760924	0	0	2021-09-30 21:46:24.182807	2021-09-30 21:46:24.182808	1
917	iron	345.000	18314.593226752506	1.4439525905717296e-11	1586759.3149065152	1581983.6157955988	3.0211721769085783e-09	0.011576980345363358	0	0	2021-09-30 21:46:24.18281	2021-09-30 21:46:24.182812	1
918	iron	346.000	18227.99153538831	1.4421423495380091e-11	1586268.1409050077	1581004.3759667333	3.0202126983577465e-09	0.011529374499196108	0	0	2021-09-30 21:46:24.182814	2021-09-30 21:46:24.182815	1
919	iron	347.000	18141.517551962475	1.4403262758902565e-11	1585775.6069631018	1580022.7292891725	3.01924791141591e-09	0.01148180796115766	0	0	2021-09-30 21:46:24.182817	2021-09-30 21:46:24.182818	1
920	iron	348.000	18055.172233027082	1.4385043562418745e-11	1585281.6399814337	1579038.5326650906	3.018277919963526e-09	0.011434282229043318	0	0	2021-09-30 21:46:24.18282	2021-09-30 21:46:24.182822	1
921	iron	349.000	17968.956534744008	1.4366765776970037e-11	1584786.1660112962	1578051.6414941808	3.01730282981207e-09	0.011386798798124294	0	0	2021-09-30 21:46:24.182824	2021-09-30 21:46:24.182825	1
922	iron	350.000	17882.871412859346	1.4348429278498838e-11	1584289.1102688946	1577061.9097060398	3.016322748675781e-09	0.011339359160727347	0	0	2021-09-30 21:46:24.182827	2021-09-30 21:46:24.182828	1
923	iron	351.000	17796.917822678275	1.433003394784025e-11	1583790.39714849	1576069.1897903776	3.015337786145424e-09	0.011291964805837822	0	0	2021-09-30 21:46:24.18283	2021-09-30 21:46:24.182832	1
924	iron	352.000	17711.09671903912	1.4311579670715368e-11	1583289.9502372742	1575073.332830719	3.0143480536590246e-09	0.011244617218684522	0	0	2021-09-30 21:46:24.182834	2021-09-30 21:46:24.182835	1
925	iron	353.000	17625.40905628747	1.4293066337721762e-11	1582787.6923292615	1574074.1885361916	3.0133536644742893e-09	0.011197317880346032	0	0	2021-09-30 21:46:24.182837	2021-09-30 21:46:24.182838	1
926	iron	354.000	17539.855788250345	1.4274493844323926e-11	1582283.545441158	1573071.6052772938	3.012354733637369e-09	0.011150068267336439	0	0	2021-09-30 21:46:24.18284	2021-09-30 21:46:24.182842	1
927	iron	355.000	17454.43786820922	1.4255862090844038e-11	1581777.4308265522	1572065.430118368	3.0113513779549733e-09	0.011102869851221775	0	0	2021-09-30 21:46:24.182844	2021-09-30 21:46:24.182845	1
928	iron	356.000	17369.156248874	1.4237170982449628e-11	1581269.2689923532	1571055.508854591	3.010343715962001e-09	0.011055724098213005	0	0	2021-09-30 21:46:24.182847	2021-09-30 21:46:24.182848	1
929	iron	357.000	17284.011882355953	1.4218420429143818e-11	1580758.9797140546	1570041.6860466746	3.0093318678918126e-09	0.011008632468782826	0	0	2021-09-30 21:46:24.18285	2021-09-30 21:46:24.182852	1
930	iron	358.000	17199.005720140747	1.4199610345750789e-11	1580246.4820511974	1569023.8050560113	3.00831595564575e-09	0.010961596417287483	0	0	2021-09-30 21:46:24.182854	2021-09-30 21:46:24.182855	1
931	iron	359.000	17114.138713061096	1.418074065190485e-11	1579731.6943651363	1568001.7080844445	3.007296102758792e-09	0.010914617391564357	0	0	2021-09-30 21:46:24.182857	2021-09-30 21:46:24.182858	1
932	iron	360.000	17029.41181126956	1.4161811272035364e-11	1579214.5343343504	1566975.236209209	3.006272434369592e-09	0.010867696832571987	0	0	2021-09-30 21:46:24.18286	2021-09-30 21:46:24.182862	1
933	iron	361.000	16944.82596421055	1.4142822135353001e-11	1578694.918972265	1565944.2294229069	3.0052450771860264e-09	0.010820836174002941	0	0	2021-09-30 21:46:24.182864	2021-09-30 21:46:24.182865	1
934	iron	362.000	16860.382120592567	1.4123773175834247e-11	1578172.7646434307	1564908.5266702722	3.004214159453836e-09	0.010774036841927865	0	0	2021-09-30 21:46:24.182867	2021-09-30 21:46:24.182868	1
935	iron	363.000	16776.081228360094	1.410466433220509e-11	1577647.9870820493	1563867.9658896427	3.0031798109208747e-09	0.010727300254415423	0	0	2021-09-30 21:46:24.18287	2021-09-30 21:46:24.182872	1
936	iron	364.000	16691.9242346653	1.4085495547925346e-11	1577120.5014093332	1562822.3840521658	3.0021421628038046e-09	0.010680627821176727	0	0	2021-09-30 21:46:24.182874	2021-09-30 21:46:24.182875	1
937	iron	365.000	16607.912085839176	1.4066266771170636e-11	1576590.2221511155	1561771.617201552	3.0011013477542385e-09	0.010634020943214431	0	0	2021-09-30 21:46:24.182877	2021-09-30 21:46:24.182878	1
938	iron	366.000	16524.04572736317	1.4046977954814399e-11	1576057.063256584	1560715.500496107	3.0000574998229103e-09	0.01058748101246553	0	0	2021-09-30 21:46:24.18288	2021-09-30 21:46:24.182882	1
939	iron	367.000	16440.326103839787	1.4027629056409579e-11	1575520.9381169118	1559653.8682506045	2.9990107544241914e-09	0.010541009411453698	0	0	2021-09-30 21:46:24.182884	2021-09-30 21:46:24.182885	1
940	iron	368.000	16356.75415896362	1.4008220038168897e-11	1574981.7595834173	1558586.553977283	2.9979612483015205e-09	0.010494607512956914	0	0	2021-09-30 21:46:24.182887	2021-09-30 21:46:24.182888	1
941	iron	369.000	16273.330835491877	1.3988750866944087e-11	1574439.439987678	1557513.3904307522	2.996909119489196e-09	0.010448276679657476	0	0	2021-09-30 21:46:24.18289	2021-09-30 21:46:24.182892	1
942	iron	370.000	16190.05707521451	1.396922151420583e-11	1573893.891159866	1556434.2096494318	2.99585450727781e-09	0.010402018263824416	0	0	2021-09-30 21:46:24.182894	2021-09-30 21:46:24.182895	1
943	iron	371.000	16106.933818924563	1.3949631956021697e-11	1573345.0244487897	1555348.8430004148	2.994797552176409e-09	0.01035583360698219	0	0	2021-09-30 21:46:24.182897	2021-09-30 21:46:24.182899	1
944	iron	372.000	16023.962006387805	1.3929982173033944e-11	1572792.7507417463	1554257.1212240006	2.9937383958751964e-09	0.0103097240395905	0	0	2021-09-30 21:46:24.1829	2021-09-30 21:46:24.182902	1
945	iron	373.000	15941.14257631278	1.3910272150436749e-11	1572236.9804848954	1553158.874479306	2.9926771812073746e-09	0.01026369088072656	0	0	2021-09-30 21:46:24.182904	2021-09-30 21:46:24.182905	1
946	iron	374.000	15858.47646631979	1.3890501877951655e-11	1571677.623702947	1552053.9323885639	2.991614052112299e-09	0.01021773543778474	0	0	2021-09-30 21:46:24.182907	2021-09-30 21:46:24.182909	1
947	iron	375.000	15775.964612910446	1.3870671349803158e-11	1571114.5900200233	1550942.1240837881	2.9905491535966143e-09	0.010171859006170217	0	0	2021-09-30 21:46:24.182912	2021-09-30 21:46:24.182914	1
948	iron	376.000	15693.607951436637	1.3850780564694756e-11	1570547.7886810265	1549823.2782544787	2.9894826316946787e-09	0.010126062868994905	0	0	2021-09-30 21:46:24.182916	2021-09-30 21:46:24.182917	1
949	iron	377.000	15611.407416069045	1.3830829525781381e-11	1569977.1285716444	1548697.2231926753	2.988414633431398e-09	0.010080348296799917	0	0	2021-09-30 21:46:24.182919	2021-09-30 21:46:24.18292	1
950	iron	378.000	15529.363939766201	1.3810818240643935e-11	1569402.5182407238	1547563.7868427287	2.987345306780986e-09	0.010034716547256848	0	0	2021-09-30 21:46:24.182922	2021-09-30 21:46:24.182924	1
951	iron	379.000	15447.47845424228	1.379074672126121e-11	1568823.8659211434	1546422.7968481453	2.986274800628503e-09	0.009989168864896902	0	0	2021-09-30 21:46:24.182926	2021-09-30 21:46:24.182927	1
952	iron	380.000	15365.7518899357	1.3770614983982366e-11	1568241.0795516074	1545274.080600284	2.985203264729919e-09	0.009943706480837788	0	0	2021-09-30 21:46:24.182929	2021-09-30 21:46:24.18293	1
953	iron	381.000	15284.185175976652	1.3750423049497631e-11	1567654.0667991638	1544117.4652885178	2.9841308496708073e-09	0.00989833061250998	0	0	2021-09-30 21:46:24.182932	2021-09-30 21:46:24.182934	1
954	iron	382.000	15202.779240155041	1.3730170942809355e-11	1567062.7350804508	1542952.7779479155	2.983057706827714e-09	0.00985304246340858	0	0	2021-09-30 21:46:24.182936	2021-09-30 21:46:24.182937	1
955	iron	383.000	15121.535008887746	1.370985869320043e-11	1566466.9915853962	1541779.8455117904	2.9819839883247846e-09	0.009807843222822897	0	0	2021-09-30 21:46:24.182939	2021-09-30 21:46:24.182941	1
956	iron	384.000	15040.453407186136	1.368948633420566e-11	1565866.7432983294	1540598.494859175	2.9809098469958435e-09	0.009762734065608037	0	0	2021-09-30 21:46:24.182943	2021-09-30 21:46:24.182944	1
957	iron	385.000	14959.535358622823	1.3669053903578192e-11	1565261.897021938	1539408.5528679255	2.979835436340739e-09	0.009717716151929347	0	0	2021-09-30 21:46:24.182946	2021-09-30 21:46:24.182947	1
958	iron	386.000	14878.781785298388	1.364856144325784e-11	1564652.3594004735	1538209.8464663618	2.9787609104835333e-09	0.009672790627025649	0	0	2021-09-30 21:46:24.182949	2021-09-30 21:46:24.182951	1
959	iron	387.000	14798.193607808425	1.3628008999337768e-11	1564038.0369408876	1537002.202680863	2.9776864241346624e-09	0.0096279586210073	0	0	2021-09-30 21:46:24.182953	2021-09-30 21:46:24.182954	1
960	iron	388.000	14717.771745209466	1.3607396622030956e-11	1563418.8360398859	1535785.44869511	2.97661213254202e-09	0.009583221248589454	0	0	2021-09-30 21:46:24.182956	2021-09-30 21:46:24.182957	1
961	iron	389.000	14637.51711498523	1.3586724365635542e-11	1562794.6630037948	1534559.4118952097	2.975538191455811e-09	0.009538579608923464	0	0	2021-09-30 21:46:24.182959	2021-09-30 21:46:24.182961	1
962	iron	390.000	14557.430633012662	1.3565992288499826e-11	1562165.4240750298	1533323.9199278054	2.9744647570810035e-09	0.009494034785355777	0	0	2021-09-30 21:46:24.182963	2021-09-30 21:46:24.182964	1
963	iron	391.000	14477.513213527367	1.3545200452985445e-11	1561531.0254541636	1532078.8007495455	2.9733919860381665e-09	0.00944958784524952	0	0	2021-09-30 21:46:24.182966	2021-09-30 21:46:24.182967	1
964	iron	392.000	14397.765769089456	1.352434892543178e-11	1560891.3733264804	1530823.882685359	2.972320035316106e-09	0.009405239839760672	0	0	2021-09-30 21:46:24.182969	2021-09-30 21:46:24.182971	1
965	iron	393.000	14318.18921054852	1.350343777611828e-11	1560246.3738829195	1529558.9944757202	2.971249062235153e-09	0.009360991803690644	0	0	2021-09-30 21:46:24.182973	2021-09-30 21:46:24.182974	1
966	iron	394.000	14238.784447008717	1.348246707922578e-11	1559595.9333477914	1528283.9653371917	2.970179224397648e-09	0.009316844755265855	0	0	2021-09-30 21:46:24.182976	2021-09-30 21:46:24.182977	1
967	iron	395.000	14159.552385793675	1.3461436912798252e-11	1558939.9580016062	1526998.6250133677	2.969110679647974e-09	0.009272799695985134	0	0	2021-09-30 21:46:24.182979	2021-09-30 21:46:24.182981	1
968	iron	396.000	14080.493932410964	1.3440347358702343e-11	1558278.3542064726	1525702.803830845	2.96804358602764e-09	0.009228857610444603	0	0	2021-09-30 21:46:24.182983	2021-09-30 21:46:24.182984	1
969	iron	397.000	14001.609990516632	1.3419198502589764e-11	1557611.0284303129	1524396.3327528494	2.9669781017331285e-09	0.009185019466185449	0	0	2021-09-30 21:46:24.182986	2021-09-30 21:46:24.182988	1
970	iron	398.000	13922.9014618793	1.3397990433852473e-11	1556937.8872735724	1523079.0434377252	2.965914385068376e-09	0.009141286213520521	0	0	2021-09-30 21:46:24.18299	2021-09-30 21:46:24.182991	1
971	iron	399.000	13844.369246343771	1.337672324558377e-11	1556258.8374925405	1521750.7682907565	2.9648525944045423e-09	0.009097658785409312	0	0	2021-09-30 21:46:24.182993	2021-09-30 21:46:24.182994	1
972	iron	400.000	13766.014241795445	1.3355397034535028e-11	1555573.7860260159	1520411.3405225032	2.9637928881331005e-09	0.009054138097302423	0	0	2021-09-30 21:46:24.182996	2021-09-30 21:46:24.182998	1
973	iron	401.000	13687.837344123109	1.3334011901072362e-11	1554882.640020229	1519060.5942036817	2.9627354246224167e-09	0.009010725047014017	0	0	2021-09-30 21:46:24.183	2021-09-30 21:46:24.183001	1
974	iron	402.000	13609.839447182594	1.3312567949133381e-11	1554185.306854628	1517698.3643216914	2.961680362172848e-09	0.00896742051459301	0	0	2021-09-30 21:46:24.183003	2021-09-30 21:46:24.183004	1
975	iron	403.000	13532.021442759724	1.3291065286182185e-11	1553481.6941675171	1516324.4868367976	2.9606278589720977e-09	0.008924225362203874	0	0	2021-09-30 21:46:24.183006	2021-09-30 21:46:24.183008	1
976	iron	404.000	13454.38422053321	1.3269504023163456e-11	1552771.7098819017	1514938.798738665	2.959578073050222e-09	0.008881140434013113	0	0	2021-09-30 21:46:24.18301	2021-09-30 21:46:24.183011	1
977	iron	405.000	13376.928668037097	1.3247884274458449e-11	1552055.26223173	1513541.1381035966	2.958531162234238e-09	0.008838166556079094	0	0	2021-09-30 21:46:24.183013	2021-09-30 21:46:24.183014	1
978	iron	406.000	13299.655670623319	1.3226206157835828e-11	1551332.259787105	1512131.3441496992	2.9574872841042665e-09	0.008795304536261678	0	0	2021-09-30 21:46:24.183016	2021-09-30 21:46:24.183018	1
979	iron	407.000	13222.56611142388	1.3204469794406649e-11	1550602.6114818677	1510709.2572965934	2.956446595945743e-09	0.008752555164112514	0	0	2021-09-30 21:46:24.18302	2021-09-30 21:46:24.183021	1
980	iron	408.000	13145.660871312566	1.3182675308573523e-11	1549866.226637818	1509274.719218488	2.955409254707522e-09	0.008709919210811053	0	0	2021-09-30 21:46:24.183023	2021-09-30 21:46:24.183024	1
981	iron	409.000	13068.940828866971	1.3160822827984547e-11	1549123.0149934143	1507827.5729058965	2.954375416952083e-09	0.008667397429057762	0	0	2021-09-30 21:46:24.183026	2021-09-30 21:46:24.183028	1
982	iron	410.000	12992.406860329933	1.3138912483481883e-11	1548372.8867269382	1506367.6627164702	2.953345238815811e-09	0.008624990553036968	0	0	2021-09-30 21:46:24.18303	2021-09-30 21:46:24.183031	1
983	iron	411.000	12916.059839570624	1.3116944409051963e-11	1547615.7524868026	1504894.8344396467	2.9523188759559326e-09	0.00858269929830676	0	0	2021-09-30 21:46:24.183033	2021-09-30 21:46:24.183035	1
984	iron	412.000	12839.900638045705	1.3094918741775002e-11	1546851.5234147906	1503408.9353474216	2.951296483510948e-09	0.008540524361775555	0	0	2021-09-30 21:46:24.183036	2021-09-30 21:46:24.183038	1
985	iron	413.000	12763.930124760518	1.3072835621772203e-11	1546080.1111742482	1501909.8142546476	2.950278216051442e-09	0.008498466421630563	0	0	2021-09-30 21:46:24.18304	2021-09-30 21:46:24.183041	1
986	iron	414.000	12688.149166229137	1.3050695192154396e-11	1545301.4279761687	1500397.3215751087	2.9492642275351476e-09	0.008456526137296213	0	0	2021-09-30 21:46:24.183043	2021-09-30 21:46:24.183045	1
987	iron	415.000	12612.558626435144	1.3028497598968032e-11	1544515.3866059557	1498871.3093787804	2.948254671260487e-09	0.008414704149392601	0	0	2021-09-30 21:46:24.183047	2021-09-30 21:46:24.183048	1
988	iron	416.000	12537.159366791686	1.3006242991142135e-11	1543721.900449589	1497331.6314477976	2.9472496998214043e-09	0.008373001079706888	0	0	2021-09-30 21:46:24.18305	2021-09-30 21:46:24.183051	1
989	iron	417.000	12461.952246101619	1.2983931520432978e-11	1542920.8835212514	1495778.1433351075	2.946249465059205e-09	0.008331417531155688	0	0	2021-09-30 21:46:24.183055	2021-09-30 21:46:24.183056	1
990	iron	418.000	12386.938120516983	1.296156334136908e-11	1542112.2504891604	1494210.7024194864	2.945254118017888e-09	0.008289954087773265	0	0	2021-09-30 21:46:24.183058	2021-09-30 21:46:24.18306	1
991	iron	419.000	12312.11784349862	1.2939138611195718e-11	1541295.9167025313	1492629.1679625933	2.9442638088972807e-09	0.008248611314694055	0	0	2021-09-30 21:46:24.183062	2021-09-30 21:46:24.183063	1
992	iron	420.000	12237.492265775592	1.2916657489817102e-11	1540471.798218608	1491033.4011659827	2.943278687005794e-09	0.008207389758140842	0	0	2021-09-30 21:46:24.183065	2021-09-30 21:46:24.183066	1
993	iron	421.000	12163.062235304134	1.2894120139739247e-11	1539639.811828144	1489423.26522494	2.9422989007162107e-09	0.008166289945435497	0	0	2021-09-30 21:46:24.183068	2021-09-30 21:46:24.18307	1
994	iron	422.000	12088.82859722669	1.2871526726012836e-11	1538799.8750840798	1487798.6253883187	2.9413245974153573e-09	0.008125312384981858	0	0	2021-09-30 21:46:24.183072	2021-09-30 21:46:24.183073	1
995	iron	423.000	12014.792193830208	1.284887741617282e-11	1537951.9063264504	1486159.3490108892	2.940355923460576e-09	0.008084457566294376	0	0	2021-09-30 21:46:24.183075	2021-09-30 21:46:24.183077	1
996	iron	424.000	11940.95386450499	1.2826172380179857e-11	1537095.8247097284	1484505.3056101995	2.9393930241317137e-09	0.00804372596000707	0	0	2021-09-30 21:46:24.183079	2021-09-30 21:46:24.18308	1
997	iron	425.000	11867.314445702457	1.2803411790360072e-11	1536231.5502289683	1482836.3669209077	2.9384360435851606e-09	0.008003118017900246	0	0	2021-09-30 21:46:24.183082	2021-09-30 21:46:24.183083	1
998	iron	426.000	11793.874770893523	1.2780595821342702e-11	1535359.0037468001	1481152.4069505378	2.937485124805958e-09	0.007962634172924362	0	0	2021-09-30 21:46:24.183085	2021-09-30 21:46:24.183087	1
999	iron	427.000	11720.635670526273	1.2757724650000045e-11	1534478.1070198491	1479453.3020338998	2.936540409561182e-09	0.00792227483923498	0	0	2021-09-30 21:46:24.183089	2021-09-30 21:46:24.18309	1
1000	iron	428.000	11647.597971983103	1.2734798455383692e-11	1533588.7827253118	1477738.9308875757	2.935602038352517e-09	0.007882040412231135	0	0	2021-09-30 21:46:24.183092	2021-09-30 21:46:24.183093	1
1001	iron	429.000	11574.762499538681	1.2711817418662199e-11	1532690.9544858038	1476009.174660834	2.9346701503721864e-09	0.007841931268617213	0	0	2021-09-30 21:46:24.183095	2021-09-30 21:46:24.183097	1
1002	iron	430.000	11502.130074316443	1.2688781723056743e-11	1531784.5468977094	1474263.9169930406	2.9337448834518368e-09	0.007801947766432881	0	0	2021-09-30 21:46:24.183099	2021-09-30 21:46:24.1831	1
1003	iron	431.000	11429.701514245826	1.2665691553776347e-11	1530869.4855565205	1472503.0440650054	2.9328263740169874e-09	0.007762090245119553	0	0	2021-09-30 21:46:24.183102	2021-09-30 21:46:24.183104	1
1004	iron	432.000	11357.477634019036	1.2642547097953253e-11	1529945.697081983	1470726.4446496933	2.931914757041726e-09	0.007722359025593118	0	0	2021-09-30 21:46:24.183105	2021-09-30 21:46:24.183107	1
1005	iron	433.000	11285.459245046934	1.2619348544576181e-11	1529013.1091455296	1468934.0101670593	2.9310101659986047e-09	0.007682754410297477	0	0	2021-09-30 21:46:24.183109	2021-09-30 21:46:24.18311	1
1006	iron	434.000	11213.647155415842	1.2596096084423303e-11	1528071.6504947469	1467125.6347328902	2.93011273281401e-09	0.00764327668329334	0	0	2021-09-30 21:46:24.183112	2021-09-30 21:46:24.183114	1
1007	iron	435.000	11142.042169843318	1.2572789909996581e-11	1527121.2509795278	1465301.215210598	2.9292225878202584e-09	0.007603926110333531	0	0	2021-09-30 21:46:24.183116	2021-09-30 21:46:24.183117	1
1008	iron	436.000	11070.645089633725	1.2549430215450944e-11	1526161.8415790647	1463460.6512643155	2.9283398597052702e-09	0.007564702938934199	0	0	2021-09-30 21:46:24.183119	2021-09-30 21:46:24.18312	1
1009	iron	437.000	10999.45671263415	1.2526017196526923e-11	1525193.3544245213	1461603.8454033926	2.927464675470697e-09	0.007525607398493383	0	0	2021-09-30 21:46:24.183122	2021-09-30 21:46:24.183124	1
1010	iron	438.000	10928.477833189527	1.25025510504814e-11	1524215.7228263766	1459730.7030355376	2.9265971603806288e-09	0.007486639700366342	0	0	2021-09-30 21:46:24.183126	2021-09-30 21:46:24.183127	1
1011	iron	439.000	10857.709242097686	1.2479031976016003e-11	1523228.8812988847	1457841.132514096	2.925737437915291e-09	0.007447800037973412	0	0	2021-09-30 21:46:24.183129	2021-09-30 21:46:24.18313	1
1012	iron	440.000	10787.151726564456	1.2455460173206881e-11	1522232.7655849159	1455935.0451857252	2.9248856297238954e-09	0.007409088586907668	0	0	2021-09-30 21:46:24.183132	2021-09-30 21:46:24.183134	1
1013	iron	441.000	10716.80607015819	1.2431835843432316e-11	1521227.3126800954	1454012.3554363847	2.924041855578286e-09	0.007370505505052476	0	0	2021-09-30 21:46:24.183136	2021-09-30 21:46:24.183137	1
1014	iron	442.000	10646.673052764121	1.2408159189301281e-11	1520212.4608596861	1452072.9807422163	2.9232062333211147e-09	0.007332050932675679	0	0	2021-09-30 21:46:24.183139	2021-09-30 21:46:24.183141	1
1015	iron	443.000	10576.753450538925	1.2384430414579173e-11	1519188.149698034	1450116.8417058503	2.9223788788276456e-09	0.007293724992599163	0	0	2021-09-30 21:46:24.183142	2021-09-30 21:46:24.183144	1
1016	iron	444.000	10507.048035864434	1.2360649724114118e-11	1518154.320099026	1448143.8621133866	2.921559905946109e-09	0.007255527790264359	0	0	2021-09-30 21:46:24.183146	2021-09-30 21:46:24.183147	1
1017	iron	445.000	10437.557577301539	1.233681732376291e-11	1517110.914314866	1446153.9689686804	2.920749426460103e-09	0.007217459413913614	0	0	2021-09-30 21:46:24.183149	2021-09-30 21:46:24.183151	1
1018	iron	446.000	10368.282839543817	1.2312933420314238e-11	1516057.8759718537	1444147.0925406225	2.919947550036834e-09	0.00717951993470649	0	0	2021-09-30 21:46:24.183153	2021-09-30 21:46:24.183154	1
1019	iron	447.000	10299.22458337057	1.228899822141453e-11	1514995.15009439	1442123.1664066375	2.9191543841786644e-09	0.007141709406855532	0	0	2021-09-30 21:46:24.183156	2021-09-30 21:46:24.183157	1
1020	iron	448.000	10230.383565600458	1.2265011935489958e-11	1513922.6831249148	1440082.127488037	2.918370034181627e-09	0.007104027867803284	0	0	2021-09-30 21:46:24.183159	2021-09-30 21:46:24.183161	1
1021	iron	449.000	10161.760539044006	1.2240974771668943e-11	1512840.4229512513	1438023.9160990708	2.917594603079297e-09	0.0070664753383308295	0	0	2021-09-30 21:46:24.183163	2021-09-30 21:46:24.183164	1
1022	iron	450.000	10093.356252456233	1.2216886939704043e-11	1511748.3189260513	1435948.4759805244	2.9168281916013424e-09	0.007029051822743205	0	0	2021-09-30 21:46:24.183166	2021-09-30 21:46:24.183167	1
1023	iron	451.000	10025.171450489801	1.2192748649893314e-11	1510646.321889162	1433855.754338467	2.9160708981259236e-09	0.006991757309029372	0	0	2021-09-30 21:46:24.183169	2021-09-30 21:46:24.183171	1
1024	iron	452.000	9957.206873646377	1.2168560113000618e-11	1509534.3841914833	1431745.7018853968	2.9153228186285932e-09	0.006954591769009128	0	0	2021-09-30 21:46:24.183173	2021-09-30 21:46:24.183174	1
1025	iron	453.000	9889.463258229187	1.2144321540174223e-11	1508412.4597150534	1429618.2728737902	2.9145840466377558e-09	0.0069175551585176544	0	0	2021-09-30 21:46:24.183176	2021-09-30 21:46:24.183177	1
1026	iron	454.000	9821.941336294525	1.2120033142867474e-11	1507280.5038942248	1427473.4251312865	2.913854673187754e-09	0.006880647417580603	0	0	2021-09-30 21:46:24.183179	2021-09-30 21:46:24.183181	1
1027	iron	455.000	9754.641835603834	1.2095695132755346e-11	1506138.4737375826	1425311.1200968355	2.9131347867694716e-09	0.006843868470584236	0	0	2021-09-30 21:46:24.183183	2021-09-30 21:46:24.183184	1
1028	iron	456.000	9687.565479574374	1.2071307721653177e-11	1504986.3278485239	1423131.3228538514	2.912424473283226e-09	0.006807218226458247	0	0	2021-09-30 21:46:24.183186	2021-09-30 21:46:24.183188	1
1029	iron	457.000	9620.712987230914	1.2046871121432088e-11	1503824.0264443606	1420934.0021601194	2.9117238159935333e-09	0.006770696578873756	0	0	2021-09-30 21:46:24.183189	2021-09-30 21:46:24.183191	1
1030	iron	458.000	9554.085073156479	1.2022385543936136e-11	1502651.5313770473	1418719.1304803197	2.911032895480343e-09	0.0067343034064267955	0	0	2021-09-30 21:46:24.183193	2021-09-30 21:46:24.183194	1
1031	iron	459.000	9487.682447443098	1.1997851200897295e-11	1501468.80615367	1416486.6840176254	2.9103517895898465e-09	0.006698038572825046	0	0	2021-09-30 21:46:24.183198	2021-09-30 21:46:24.183199	1
1032	iron	460.000	9421.50581564199	1.1973268303850488e-11	1500275.8159530312	1414236.6427374587	2.9096805733922223e-09	0.006661901927109814	0	0	2021-09-30 21:46:24.183201	2021-09-30 21:46:24.183203	1
1033	iron	461.000	9355.555878714298	1.1948637064046349e-11	1499072.5276459157	1411968.990397729	2.909019319131322e-09	0.00662589330384585	0	0	2021-09-30 21:46:24.183205	2021-09-30 21:46:24.183206	1
1034	iron	462.000	9289.833332980756	1.192395769236519e-11	1497858.9098145962	1409683.7145771445	2.9083680961752978e-09	0.006590012523317955	0	0	2021-09-30 21:46:24.183208	2021-09-30 21:46:24.183209	1
1035	iron	463.000	9224.338870071913	1.1899230399229198e-11	1496634.9327676445	1407380.8066942003	2.9077269709754323e-09	0.006554259391769725	0	0	2021-09-30 21:46:24.183211	2021-09-30 21:46:24.183213	1
1036	iron	464.000	9159.073176876998	1.1874455394514927e-11	1495400.5685584545	1405060.262032681	2.9070960070171075e-09	0.006518633701608425	0	0	2021-09-30 21:46:24.183215	2021-09-30 21:46:24.183216	1
1037	iron	465.000	9094.0369354943	1.1849632887462754e-11	1494155.7910048366	1402722.0797686772	2.906475264767578e-09	0.0064831352316019695	0	0	2021-09-30 21:46:24.183218	2021-09-30 21:46:24.183219	1
1038	iron	466.000	9029.23082317944	1.1824763086588731e-11	1492900.5757006854	1400366.2629822101	2.9058648016387135e-09	0.006447763747143446	0	0	2021-09-30 21:46:24.183221	2021-09-30 21:46:24.183223	1
1039	iron	467.000	8964.655512294772	1.1799846199593824e-11	1491634.9000351578	1397992.8186824867	2.9052646719340586e-09	0.006412519000450483	0	0	2021-09-30 21:46:24.183225	2021-09-30 21:46:24.183226	1
1040	iron	468.000	8900.311670258265	1.1774882433271456e-11	1490358.7432078123	1395601.7578250628	2.904674926802767e-09	0.006377400730799243	0	0	2021-09-30 21:46:24.183228	2021-09-30 21:46:24.183229	1
1041	iron	469.000	8836.199959491174	1.1749871993417828e-11	1489072.0862419754	1393193.095325195	2.904095614196536e-09	0.006342408664772097	0	0	2021-09-30 21:46:24.183231	2021-09-30 21:46:24.183233	1
1042	iron	470.000	8772.321037367403	1.1724815084738146e-11	1487774.912000671	1390766.8500754982	2.9035267788202423e-09	0.006307542516483762	0	0	2021-09-30 21:46:24.183235	2021-09-30 21:46:24.183236	1
1043	iron	471.000	8708.675556160919	1.169971191075234e-11	1486467.2051989436	1388323.0449563568	2.902968462088723e-09	0.006272801987836112	0	0	2021-09-30 21:46:24.183238	2021-09-30 21:46:24.183239	1
1044	iron	472.000	8645.264162993546	1.1674562673703305e-11	1485148.952419445	1385861.7068519401	2.902420702076658e-09	0.0062381867687445755	0	0	2021-09-30 21:46:24.183241	2021-09-30 21:46:24.183243	1
1045	iron	473.000	8582.087499782707	1.1649367574460401e-11	1483820.142121449	1383382.866653443	2.901883533479851e-09	0.00620369653741898	0	0	2021-09-30 21:46:24.183245	2021-09-30 21:46:24.183246	1
1046	iron	474.000	8519.14620318931	1.1624126812425518e-11	1482480.7646567672	1380886.5592747207	2.901356987562479e-09	0.006169330960585059	0	0	2021-09-30 21:46:24.183248	2021-09-30 21:46:24.183249	1
1047	iron	475.000	8456.440904563964	1.159884058543521e-11	1481130.812279731	1378372.8236563508	2.900841092114559e-09	0.006135089693753482	0	0	2021-09-30 21:46:24.183251	2021-09-30 21:46:24.183253	1
1048	iron	476.000	8393.972229894685	1.1573509089664822e-11	1479770.2791560441	1375841.7027671095	2.900335871410994e-09	0.006100972381497542	0	0	2021-09-30 21:46:24.183255	2021-09-30 21:46:24.183256	1
1049	iron	477.000	8331.740799753268	1.1548132519531369e-11	1478399.1613769531	1373293.2436148627	2.899841346159136e-09	0.006066978657684191	0	0	2021-09-30 21:46:24.183258	2021-09-30 21:46:24.183259	1
1050	iron	478.000	8269.747229242072	1.1522711067594276e-11	1477017.4569650292	1370727.4972413564	2.899357533461592e-09	0.006033108145773151	0	0	2021-09-30 21:46:24.183261	2021-09-30 21:46:24.183263	1
1051	iron	479.000	8207.992127939973	1.149724492445705e-11	1475625.16588521	1368144.518726316	2.8988844467679067e-09	0.005999360459069969	0	0	2021-09-30 21:46:24.183265	2021-09-30 21:46:24.183266	1
1052	iron	480.000	8146.47609984892	1.1471734278666724e-11	1474222.2900533378	1365544.3671864066	2.898422095829925e-09	0.005965735200998319	0	0	2021-09-30 21:46:24.183268	2021-09-30 21:46:24.183269	1
1053	iron	481.000	8085.199743339058	1.1446179316614722e-11	1472808.8333417028	1362927.1057681704	2.897970486662254e-09	0.005932231965393405	0	0	2021-09-30 21:46:24.183271	2021-09-30 21:46:24.183273	1
1054	iron	482.000	8024.163651095127	1.1420580222433981e-11	1471384.8015883863	1360292.8016475425	2.8975296214938257e-09	0.0058988503367631735	0	0	2021-09-30 21:46:24.183275	2021-09-30 21:46:24.183276	1
1055	iron	483.000	7963.368410061428	1.1394937177899252e-11	1469950.2025999427	1357641.5260165706	2.897099498731979e-09	0.005865589890599908	0	0	2021-09-30 21:46:24.183278	2021-09-30 21:46:24.18328	1
1056	iron	484.000	7902.81460138711	1.1369250362321835e-11	1468505.0461617708	1354973.354083905	2.896680112909711e-09	0.005832450193627748	0	0	2021-09-30 21:46:24.183281	2021-09-30 21:46:24.183283	1
1057	iron	485.000	7842.502800371255	1.1343519952449341e-11	1467049.3440380841	1352288.3650556067	2.89627145465305e-09	0.005799430804130869	0	0	2021-09-30 21:46:24.183285	2021-09-30 21:46:24.183286	1
1058	iron	486.000	7782.433576407348	1.1317746122359009e-11	1465583.109977305	1349586.6421255555	2.8958735106359273e-09	0.0057665312722347825	0	0	2021-09-30 21:46:24.183288	2021-09-30 21:46:24.18329	1
1059	iron	487.000	7722.607492928111	1.129192904335387e-11	1464106.3597160429	1346868.2724627997	2.8954862635371788e-09	0.005733751140196532	0	0	2021-09-30 21:46:24.183292	2021-09-30 21:46:24.183293	1
1060	iron	488.000	7663.025107349538	1.1266068883857796e-11	1462619.110980153	1344133.3471931044	2.8951096920021456e-09	0.005701089942714317	0	0	2021-09-30 21:46:24.183295	2021-09-30 21:46:24.183296	1
1061	iron	489.000	7603.68697101539	1.1240165809309365e-11	1461121.3834871799	1341381.9613826403	2.8947437706003647e-09	0.005668547207223383	0	0	2021-09-30 21:46:24.183298	2021-09-30 21:46:24.1833	1
1062	iron	490.000	7544.5936291404505	1.1214219982054044e-11	1459613.198945403	1338614.2140150236	2.894388469788727e-09	0.005636122454214262	0	0	2021-09-30 21:46:24.183302	2021-09-30 21:46:24.183303	1
1063	iron	491.000	7485.74562075485	1.1188231561236807e-11	1458094.5810554624	1335830.2079727042	2.8940437558685495e-09	0.005603815197528316	0	0	2021-09-30 21:46:24.183305	2021-09-30 21:46:24.183306	1
1064	iron	492.000	7427.14347864698	1.1162200702694706e-11	1456565.5555087328	1333030.0500120004	2.8937095909480284e-09	0.005571624944674067	0	0	2021-09-30 21:46:24.183308	2021-09-30 21:46:24.18331	1
1065	iron	493.000	7368.787729306879	1.1136127558847041e-11	1455026.1499833614	1330213.8507334946	2.8933859329079836e-09	0.005539551197157997	0	0	2021-09-30 21:46:24.183312	2021-09-30 21:46:24.183313	1
1066	iron	494.000	7310.678892869274	1.1110012278585494e-11	1453476.3941428065	1327381.7245566626	2.8930727353615914e-09	0.005507593450792006	0	0	2021-09-30 21:46:24.183315	2021-09-30 21:46:24.183316	1
1067	iron	495.000	7252.817483056385	1.1083855007164584e-11	1451916.3196336478	1324533.7896928103	2.892769947614536e-09	0.005475751196002692	0	0	2021-09-30 21:46:24.183318	2021-09-30 21:46:24.18332	1
1068	iron	496.000	7195.204007120061	1.1057655886088857e-11	1450345.960077852	1321670.168107561	2.8924775146347163e-09	0.005444023918178121	0	0	2021-09-30 21:46:24.183322	2021-09-30 21:46:24.183323	1
1069	iron	497.000	7137.838965784835	1.1031415053001942e-11	1448765.351068586	1318790.9854895151	2.892195377014093e-09	0.005412411097984096	0	0	2021-09-30 21:46:24.183325	2021-09-30 21:46:24.183326	1
1070	iron	498.000	7080.7228531892715	1.1005132641575685e-11	1447174.5301634371	1315896.371213879	2.891923470934657e-09	0.005380912211694524	0	0	2021-09-30 21:46:24.183328	2021-09-30 21:46:24.18333	1
1071	iron	499.000	7023.8561568282985	1.0978808781392838e-11	1445573.5368762612	1312986.4583033214	2.8916617281352375e-09	0.0053495267315283096	0	0	2021-09-30 21:46:24.183332	2021-09-30 21:46:24.183333	1
1072	iron	500.000	6967.239357494905	1.0952443597836975e-11	1443962.4126684666	1310061.3833875419	2.89141007587935e-09	0.005318254125985376	0	0	2021-09-30 21:46:24.183335	2021-09-30 21:46:24.183337	1
1073	iron	501.000	6910.872929221192	1.0926037211974714e-11	1442341.2009395063	1307121.2866611588	2.891168436922567e-09	0.005287093860183364	0	0	2021-09-30 21:46:24.18334	2021-09-30 21:46:24.183342	1
1074	iron	502.000	6854.757339219995	1.0899589740442425e-11	1440709.9470169246	1304166.3118405577	2.890936729480328e-09	0.005256045396193327	0	0	2021-09-30 21:46:24.183343	2021-09-30 21:46:24.183345	1
1075	iron	503.000	6798.893047825749	1.0873101295327787e-11	1439068.6981410682	1301196.6061108701	2.8907148672047394e-09	0.005225108193408891	0	0	2021-09-30 21:46:24.183347	2021-09-30 21:46:24.183348	1
1076	iron	504.000	6743.280508435043	1.0846571984055763e-11	1437417.5034563243	1298212.3200845956	2.8905027591478495e-09	0.005194281708862253	0	0	2021-09-30 21:46:24.18335	2021-09-30 21:46:24.183352	1
1077	iron	505.000	6687.920167447698	1.0820001909267937e-11	1435756.4139964283	1295213.6077493	2.8903003097349004e-09	0.005163565397578963	0	0	2021-09-30 21:46:24.183353	2021-09-30 21:46:24.183355	1
1078	iron	506.000	6632.812464206424	1.0793391168706919e-11	1434085.4826659262	1292200.6264082482	2.890107418745001e-09	0.005132958712953682	0	0	2021-09-30 21:46:24.183357	2021-09-30 21:46:24.183358	1
1079	iron	507.000	6577.957830937735	1.0766739855094821e-11	1432404.7642265558	1289173.5366298016	2.889923981280125e-09	0.005102461107085739	0	0	2021-09-30 21:46:24.18336	2021-09-30 21:46:24.183362	1
1080	iron	508.000	6523.356692691082	1.0740048056014301e-11	1430714.3152797818	1286132.502189768	2.889749887741191e-09	0.005072072031135533	0	0	2021-09-30 21:46:24.183363	2021-09-30 21:46:24.183365	1
1081	iron	509.000	6469.00946727891	1.0713315853790045e-11	1429014.1942477822	1283077.6900108906	2.8895850238063525e-09	0.005041790935686834	0	0	2021-09-30 21:46:24.183367	2021-09-30 21:46:24.183368	1
1082	iron	510.000	6414.916565216355	1.0686543325364248e-11	1427304.46135208	1280009.2700980594	2.8894292704122903e-09	0.005011617271119387	0	0	2021-09-30 21:46:24.18337	2021-09-30 21:46:24.183371	1
1083	iron	511.000	6361.078389659815	1.0659730542176959e-11	1425585.1785962284	1276927.415480777	2.8892825037270055e-09	0.004981550487945942	0	0	2021-09-30 21:46:24.183373	2021-09-30 21:46:24.183375	1
1084	iron	512.000	6307.4953363464965	1.0632877570042077e-11	1423856.4097378254	1273832.302136477	2.889144595142694e-09	0.004951590037218822	0	0	2021-09-30 21:46:24.183377	2021-09-30 21:46:24.183378	1
1085	iron	513.000	6254.167793533139	1.0605984469025092e-11	1422118.220270723	1270724.1089321573	2.8890154112473044e-09	0.004921735370857785	0	0	2021-09-30 21:46:24.18338	2021-09-30 21:46:24.183382	1
1086	iron	514.000	6201.096141934425	1.0579051293318742e-11	1420370.677395165	1267603.0175444388	2.8888948138193816e-09	0.00489198594205542	0	0	2021-09-30 21:46:24.183384	2021-09-30 21:46:24.183385	1
1087	iron	515.000	6148.280754661551	1.0552078091117566e-11	1418613.8499963582	1264469.2123948054	2.8887826598047757e-09	0.00486234120561717	0	0	2021-09-30 21:46:24.183387	2021-09-30 21:46:24.183388	1
1088	iron	516.000	6095.7219971602435	1.052506490449347e-11	1416847.80861184	1261322.8805649325	2.8886788013154017e-09	0.004832800618371434	0	0	2021-09-30 21:46:24.18339	2021-09-30 21:46:24.183392	1
1089	iron	517.000	6043.420227148177	1.0498011769267202e-11	1415072.6254085302	1258164.211729444	2.8885830856069077e-09	0.004803363639505394	0	0	2021-09-30 21:46:24.183394	2021-09-30 21:46:24.183395	1
1090	iron	518.000	5991.375794554004	1.0470918714884786e-11	1413288.37414667	1254993.3980654674	2.888495355082912e-09	0.004774029730984657	0	0	2021-09-30 21:46:24.183397	2021-09-30 21:46:24.183398	1
1091	iron	519.000	5939.589041453299	1.044378576428751e-11	1411495.130152136	1251810.6341773123	2.8884154472805214e-09	0.0047447983579056155	0	0	2021-09-30 21:46:24.1834	2021-09-30 21:46:24.183402	1
1092	iron	520.000	5888.060302006641	1.0416612933784067e-11	1409692.9702820778	1248616.1170095026	2.8883431948689897e-09	0.004715668988887343	0	0	2021-09-30 21:46:24.183404	2021-09-30 21:46:24.183405	1
1093	iron	521.000	5836.78990239665	1.0389400232921619e-11	1407881.9728904366	1245410.0457598695	2.8882784256477583e-09	0.004686641096455437	0	0	2021-09-30 21:46:24.183407	2021-09-30 21:46:24.183408	1
1094	iron	522.000	5785.778160764572	1.0362147664355313e-11	1406062.2177913487	1242192.6217892014	2.8882209625479073e-09	0.004657714157431545	0	0	2021-09-30 21:46:24.18341	2021-09-30 21:46:24.183412	1
1095	iron	523.000	5735.02538714685	1.0334855223718256e-11	1404233.786225915	1238964.0485371659	2.888170623626082e-09	0.004628887653292398	0	0	2021-09-30 21:46:24.183414	2021-09-30 21:46:24.183415	1
1096	iron	524.000	5684.5318834117215	1.030752289949201e-11	1402396.760816127	1235724.5314158997	2.8881272220842185e-09	0.0046001610706055615	0	0	2021-09-30 21:46:24.183417	2021-09-30 21:46:24.183418	1
1097	iron	525.000	5634.297943195086	1.0280150672870675e-11	1400551.225531429	1232474.2777263296	2.8880905662618124e-09	0.004571533901372163	0	0	2021-09-30 21:46:24.18342	2021-09-30 21:46:24.183422	1
1098	iron	526.000	5584.323851836778	1.0252738517631488e-11	1398697.2656421363	1229213.4965517214	2.888060459655535e-09	0.004543005643447885	0	0	2021-09-30 21:46:24.183423	2021-09-30 21:46:24.183425	1
1099	iron	527.000	5534.609886315746	1.0225286400000252e-11	1396834.9676801562	1225942.3986645762	2.8880367009225484e-09	0.004514575800905995	0	0	2021-09-30 21:46:24.183427	2021-09-30 21:46:24.183428	1
1100	iron	528.000	5485.156315186207	1.0197794278517174e-11	1394964.4193891585	1222661.1964154725	2.888019083905128e-09	0.004486243884460611	0	0	2021-09-30 21:46:24.18343	2021-09-30 21:46:24.183431	1
1101	iron	529.000	5435.963398512364	1.0170262103902556e-11	1393085.7096822858	1219370.103635709	2.8880073976392317e-09	0.004458009411830205	0	0	2021-09-30 21:46:24.183433	2021-09-30 21:46:24.183435	1
1102	iron	530.000	5387.03138780388	1.0142689818920566e-11	1391198.9285915792	1216069.3355259765	2.888001426379472e-09	0.004429871908145658	0	0	2021-09-30 21:46:24.183437	2021-09-30 21:46:24.183438	1
1103	iron	531.000	5338.3605259503265	1.0115077358243116e-11	1389304.1672177613	1212759.1085462978	2.888000949622988e-09	0.004401830906344853	0	0	2021-09-30 21:46:24.18344	2021-09-30 21:46:24.183441	1
1104	iron	532.000	5289.951047155742	1.008742464831405e-11	1387401.5176819563	1209439.6403099946	2.8880057421289692e-09	0.004373885947544982	0	0	2021-09-30 21:46:24.183443	2021-09-30 21:46:24.183445	1
1105	iron	533.000	5241.803176873639	1.0059731607208985e-11	1385491.0730676353	1206111.1494612817	2.8880155739575406e-09	0.004346036581466748	0	0	2021-09-30 21:46:24.183447	2021-09-30 21:46:24.183448	1
1106	iron	534.000	5193.917131740692	1.0031998144498313e-11	1383572.927367866	1202773.8555628732	2.8880302104978274e-09	0.004318282366812876	0	0	2021-09-30 21:46:24.18345	2021-09-30 21:46:24.183452	1
1107	iron	535.000	5146.293119510473	1.000422416110989e-11	1381647.175430119	1199427.9789800858	2.888049412500789e-09	0.004290622871651318	0	0	2021-09-30 21:46:24.183454	2021-09-30 21:46:24.183455	1
1108	iron	536.000	5098.931338987573	9.976409549184895e-12	1379713.9128975272	1196073.740759575	2.888072936118274e-09	0.004263057673809862	0	0	2021-09-30 21:46:24.183457	2021-09-30 21:46:24.183458	1
1109	iron	537.000	5051.831979961195	9.9485541919429e-12	1377773.2361447215	1192711.3624995314	2.88810053295461e-09	0.004235586361292153	0	0	2021-09-30 21:46:24.18346	2021-09-30 21:46:24.183462	1
1110	iron	538.000	5004.995223137973	9.920657963534423e-12	1375825.2422198057	1189341.0662314384	2.888131950103451e-09	0.004208208532643093	0	0	2021-09-30 21:46:24.183464	2021-09-30 21:46:24.183465	1
1111	iron	539.000	4958.421240075335	9.892720728903359e-12	1373870.028779447	1185963.0742908148	2.888166930200391e-09	0.004180923797345364	0	0	2021-09-30 21:46:24.183467	2021-09-30 21:46:24.183468	1
1112	iron	540.000	4912.110193114188	9.864742343642378e-12	1371907.6940229833	1182577.6091872472	2.8882052114766128e-09	0.004153731776208874	0	0	2021-09-30 21:46:24.18347	2021-09-30 21:46:24.183472	1
1113	iron	541.000	4866.062235312159	9.836722653850702e-12	1369938.3366232514	1179184.8934697963	2.888246527819831e-09	0.004126632101767846	0	0	2021-09-30 21:46:24.183474	2021-09-30 21:46:24.183475	1
1114	iron	542.000	4820.277510374834	9.808661495987743e-12	1367962.0556604862	1175785.1495987603	2.888290608828241e-09	0.004099624418644652	0	0	2021-09-30 21:46:24.183477	2021-09-30 21:46:24.183478	1
1115	iron	543.000	4774.756152588984	9.780558696731558e-12	1365978.9505463839	1172378.5998016028	2.8883371798860267e-09	0.004072708383961459	0	0	2021-09-30 21:46:24.183482	2021-09-30 21:46:24.183483	1
1116	iron	544.000	4729.498286753951	9.752414072829533e-12	1363989.120954156	1168965.4659403611	2.8883859622252953e-09	0.004045883667700448	0	0	2021-09-30 21:46:24.183485	2021-09-30 21:46:24.183487	1
1117	iron	545.000	4684.50402811355	9.72422743095643e-12	1361992.6667419672	1165545.969368864	2.8884366730032747e-09	0.004019149953090379	0	0	2021-09-30 21:46:24.183489	2021-09-30 21:46:24.18349	1
1118	iron	546.000	4639.773482287863	9.695998567561195e-12	1359989.687873572	1162120.3307864096	2.8884890253840967e-09	0.0039925069369951705	0	0	2021-09-30 21:46:24.183492	2021-09-30 21:46:24.183494	1
1119	iron	547.000	4595.306745203974	9.667727268726596e-12	1357980.2843441665	1158688.7701016502	2.8885427286117308e-09	0.00396595433025629	0	0	2021-09-30 21:46:24.183495	2021-09-30 21:46:24.183497	1
1120	iron	548.000	4551.103903027603	9.639413310015166e-12	1355964.5560902357	1155251.5062704447	2.8885974881152536e-09	0.003939491858115083	0	0	2021-09-30 21:46:24.183499	2021-09-30 21:46:24.1835	1
1121	iron	549.000	4507.165032093349	9.611056456322064e-12	1353942.602913797	1151808.7571597	2.888653005585011e-09	0.0039131192605339985	0	0	2021-09-30 21:46:24.183502	2021-09-30 21:46:24.183504	1
1122	iron	550.000	4463.490198836125	9.582656461725926e-12	1351914.5243935287	1148360.739390225	2.8887089790768214e-09	0.0038868362925801704	0	0	2021-09-30 21:46:24.183506	2021-09-30 21:46:24.183507	1
1123	iron	551.000	4420.079459720889	9.554213069336765e-12	1349880.4197961688	1144907.6681815432	2.8887651031157435e-09	0.00386064272478959	0	0	2021-09-30 21:46:24.183509	2021-09-30 21:46:24.18351	1
1124	iron	552.000	4376.9328611731025	9.525726011145218e-12	1347840.3879865408	1141449.7571958979	2.8888210688035597e-09	0.0038345383435233627	0	0	2021-09-30 21:46:24.183512	2021-09-30 21:46:24.183514	1
1125	iron	553.000	4334.050439508681	9.497195007871072e-12	1345794.5273376703	1137987.2183839532	2.8888765639265863e-09	0.0038085229513064585	0	0	2021-09-30 21:46:24.183516	2021-09-30 21:46:24.183517	1
1126	iron	554.000	4291.43222086392	9.468619768809454e-12	1343742.9356320202	1134520.2618170574	2.88893127308284e-09	0.003782596367199934	0	0	2021-09-30 21:46:24.183519	2021-09-30 21:46:24.18352	1
1127	iron	555.000	4249.078221124762	9.439999991679205e-12	1341685.7099691927	1131049.0955321165	2.8889848777964193e-09	0.003756758427118258	0	0	2021-09-30 21:46:24.183522	2021-09-30 21:46:24.183524	1
1128	iron	556.000	4206.98844585609	9.411335362466019e-12	1339622.946662873	1127573.925359975	2.8890370566549684e-09	0.0037310089841896795	0	0	2021-09-30 21:46:24.183526	2021-09-30 21:46:24.183527	1
1129	iron	557.000	4165.162890231141	9.38262555526999e-12	1337554.7411435544	1124094.9547653133	2.8890874854362222e-09	0.0037053479090658646	0	0	2021-09-30 21:46:24.183529	2021-09-30 21:46:24.18353	1
1130	iron	558.000	4123.601538960126	9.353870232148287e-12	1335481.187849462	1120612.3846684545	2.889135837260124e-09	0.0036797750902781063	0	0	2021-09-30 21:46:24.183532	2021-09-30 21:46:24.183534	1
1131	iron	559.000	4082.304366218894	9.325069042959908e-12	1333402.3801276684	1117126.4132861672	2.889181782720196e-09	0.0036542904345178667	0	0	2021-09-30 21:46:24.183536	2021-09-30 21:46:24.183537	1
1132	iron	560.000	4041.2713355775677	9.296221625208871e-12	1331318.4101177454	1113637.235945013	2.889224990053387e-09	0.0036288938669945033	0	0	2021-09-30 21:46:24.183539	2021-09-30 21:46:24.18354	1
1133	iron	561.000	4000.502399928181	9.26732760388411e-12	1329229.3686482906	1110145.044918248	2.8892651252825885e-09	0.0036035853317012115	0	0	2021-09-30 21:46:24.183542	2021-09-30 21:46:24.183544	1
1134	iron	562.000	3959.9975014137144	9.238386591305147e-12	1327135.3451164365	1106650.0292362035	2.889301852397992e-09	0.003578364791755219	0	0	2021-09-30 21:46:24.183546	2021-09-30 21:46:24.183547	1
1135	iron	563.000	3919.7565713548406	9.209398186958213e-12	1325036.4273798466	1103152.3745195912	2.889334833510973e-09	0.0035532322296471914	0	0	2021-09-30 21:46:24.183549	2021-09-30 21:46:24.18355	1
1136	iron	564.000	3879.779530177781	9.180361977340269e-12	1322932.701630056	1099652.2627837386	2.8893637290509247e-09	0.0035281876475716325	0	0	2021-09-30 21:46:24.183552	2021-09-30 21:46:24.183554	1
1137	iron	565.000	3840.066287342082	9.151277535795691e-12	1320824.2522801757	1096149.8722689212	2.8893881979308693e-09	0.003503231067658227	0	0	2021-09-30 21:46:24.183556	2021-09-30 21:46:24.183557	1
1138	iron	566.000	3800.6167412671953	9.12214442235621e-12	1318711.1618335843	1092645.3772412154	2.889407897756272e-09	0.0034783625322822014	0	0	2021-09-30 21:46:24.183559	2021-09-30 21:46:24.18356	1
1139	iron	567.000	3761.4307792592904	9.092962183577804e-12	1316593.510764718	1089138.947815713	2.889422485008243e-09	0.003453582104287892	0	0	2021-09-30 21:46:24.183562	2021-09-30 21:46:24.183564	1
1140	iron	568.000	3722.50827743874	9.063730352380841e-12	1314471.3773845434	1085630.7497565907	2.889431615262062e-09	0.0034288898672715047	0	0	2021-09-30 21:46:24.183566	2021-09-30 21:46:24.183567	1
1141	iron	569.000	3683.8491006654617	9.034448447881805e-12	1312344.8377130628	1082120.9442911907	2.889434943390334e-09	0.003404285925801437	0	0	2021-09-30 21:46:24.183569	2021-09-30 21:46:24.183571	1
1142	iron	570.000	3645.453102465682	9.005115975233438e-12	1310213.9653474092	1078609.6879191431	2.8894321237784745e-09	0.0033797704056399685	0	0	2021-09-30 21:46:24.183572	2021-09-30 21:46:24.183574	1
1143	iron	571.000	3607.3201249584577	8.975732425458586e-12	1308078.8313173056	1075097.1322031033	2.889422810568448e-09	0.0033553434540061415	0	0	2021-09-30 21:46:24.183576	2021-09-30 21:46:24.183577	1
1144	iron	572.000	3569.4499987806958	8.946297275281605e-12	1305939.5039547086	1071583.4235853644	2.889406657872296e-09	0.003331005239739365	0	0	2021-09-30 21:46:24.183579	2021-09-30 21:46:24.183581	1
1145	iron	573.000	3531.842543012631	8.916809986966594e-12	1303796.0487452745	1068068.7031770574	2.889383320028297e-09	0.0033067559535326493	0	0	2021-09-30 21:46:24.183583	2021-09-30 21:46:24.183584	1
1146	iron	574.000	3494.4975651038417	8.887270008146897e-12	1301648.5281882882	1064553.1065638736	2.8893524518385228e-09	0.003282595808097593	0	0	2021-09-30 21:46:24.183586	2021-09-30 21:46:24.183587	1
1147	iron	575.000	3457.414860798101	8.857676771660235e-12	1299497.0016422868	1061036.7635909682	2.8893137088404814e-09	0.0032585250383755236	0	0	2021-09-30 21:46:24.183589	2021-09-30 21:46:24.183591	1
1148	iron	576.000	3420.5942140580737	8.828029695376235e-12	1297341.5251843333	1057519.7981729042	2.889266747548769e-09	0.003234543901653563	0	0	2021-09-30 21:46:24.183593	2021-09-30 21:46:24.183594	1
1149	iron	577.000	3384.035396990182	8.79832818203172e-12	1295182.151444614	1054002.328066003	2.8892112257543215e-09	0.003210652677778781	0	0	2021-09-30 21:46:24.183596	2021-09-30 21:46:24.183597	1
1150	iron	578.000	3347.7381697688156	8.76857161905633e-12	1293018.9294607043	1050484.4646756335	2.8891468027799244e-09	0.0031868516692462687	0	0	2021-09-30 21:46:24.183599	2021-09-30 21:46:24.183601	1
1151	iron	579.000	3311.7022805611177	8.73875937840662e-12	1290851.9045114517	1046966.3128331043	2.8890731397840266e-09	0.0031631412013626388	0	0	2021-09-30 21:46:24.183603	2021-09-30 21:46:24.183604	1
1152	iron	580.000	3275.927465450582	8.708890816388782e-12	1288681.1179571748	1043447.9705857919	2.888989900050214e-09	0.0031395216223492925	0	0	2021-09-30 21:46:24.183606	2021-09-30 21:46:24.183607	1
1153	iron	581.000	3240.413448361076	8.678965273494092e-12	1286506.6070721745	1039929.5289777534	2.8888967492975334e-09	0.003115993303456235	0	0	2021-09-30 21:46:24.183609	2021-09-30 21:46:24.183611	1
1154	iron	582.000	3205.1599409798387	8.648982074218274e-12	1284328.4048819542	1036411.0718409866	2.8887933559791586e-09	0.0030925566390240153	0	0	2021-09-30 21:46:24.183613	2021-09-30 21:46:24.183614	1
1155	iron	583.000	3170.16664268187	8.61894052689363e-12	1282146.5399826765	1032892.6755610531	2.8886793916246063e-09	0.003069212046604822	0	0	2021-09-30 21:46:24.183616	2021-09-30 21:46:24.183617	1
1156	iron	584.000	3135.4332404520583	8.588839923511768e-12	1279961.0363734365	1029374.4088665938	2.8885545311532197e-09	0.0030459599669904053	0	0	2021-09-30 21:46:24.183619	2021-09-30 21:46:24.183621	1
1157	iron	585.000	3100.959408808726	8.558679539550256e-12	1277771.9132778049	1025856.3326047045	2.88841845321393e-09	0.0030228008642645145	0	0	2021-09-30 21:46:24.183624	2021-09-30 21:46:24.183626	1
1158	iron	586.000	3066.7448097261704	8.528458633795812e-12	1275579.1849586964	1022338.4995088784	2.8882708405411023e-09	0.002999735225856607	0	0	2021-09-30 21:46:24.183628	2021-09-30 21:46:24.183629	1
1159	iron	587.000	3032.7890925572287	8.498176448169665e-12	1273382.8605382442	1018820.9539783584	2.888111380300992e-09	0.0029767635625421686	0	0	2021-09-30 21:46:24.183631	2021-09-30 21:46:24.183633	1
1160	iron	588.000	2999.0918939549774	8.467832207547642e-12	1271182.943811059	1015303.7318502469	2.8879397644537526e-09	0.0029538864084440604	0	0	2021-09-30 21:46:24.183634	2021-09-30 21:46:24.183636	1
1161	iron	589.000	2965.6528377956956	8.43742511958455e-12	1268979.4330461025	1011786.8601569119	2.887755690143542e-09	0.002931104321058064	0	0	2021-09-30 21:46:24.183638	2021-09-30 21:46:24.183639	1
1162	iron	590.000	2932.471535099857	8.406954374534676e-12	1266772.3208016753	1008270.3569079279	2.8875588600597015e-09	0.002908417881185057	0	0	2021-09-30 21:46:24.183641	2021-09-30 21:46:24.183643	1
1163	iron	591.000	2899.5475839544547	8.37641914507358e-12	1264561.5937227607	1004754.2308474366	2.8873489828396887e-09	0.002885827692916405	0	0	2021-09-30 21:46:24.183644	2021-09-30 21:46:24.183646	1
1164	iron	592.000	2866.8805694332696	8.345818586117e-12	1262347.2323431373	1001238.4812228465	2.8871257734621302e-09	0.002863334383564494	0	0	2021-09-30 21:46:24.183648	2021-09-30 21:46:24.183649	1
1165	iron	593.000	2834.470063519747	8.315151834640828e-12	1260129.2108800411	997723.0975454493	2.886888953658456e-09	0.0028409386035995105	0	0	2021-09-30 21:46:24.183651	2021-09-30 21:46:24.183653	1
1166	iron	594.000	2802.3156250260713	8.284418009498309e-12	1257907.497022152	994208.0593443487	2.886638252340758e-09	0.002818641026581616	0	0	2021-09-30 21:46:24.183655	2021-09-30 21:46:24.183656	1
1167	iron	595.000	2770.416799515461	8.253616211240852e-12	1255682.0517265797	990693.3359385965	2.8863734060110153e-09	0.002796442349024918	0	0	2021-09-30 21:46:24.183658	2021-09-30 21:46:24.183659	1
1168	iron	596.000	2738.7731192209662	8.222745521930985e-12	1253452.828998506	987178.8861858891	2.8860941592100047e-09	0.0027743432903053864	0	0	2021-09-30 21:46:24.183661	2021-09-30 21:46:24.183663	1
1169	iron	597.000	2707.384102967733	8.191805004963731e-12	1251219.7756733298	983664.6582394089	2.885800264963297e-09	0.002752344592529619	0	0	2021-09-30 21:46:24.183665	2021-09-30 21:46:24.183666	1
1170	iron	598.000	2676.2492560913424	8.16079370487812e-12	1248982.8311952949	980150.5893033444	2.885491485234884e-09	0.0027304470203844125	0	0	2021-09-30 21:46:24.183668	2021-09-30 21:46:24.183669	1
1171	iron	599.000	2645.368070358695	8.129710647174326e-12	1246741.9273979068	976636.6053955131	2.8851675913788353e-09	0.0027086513609505636	0	0	2021-09-30 21:46:24.183671	2021-09-30 21:46:24.183673	1
1172	iron	600.000	2614.7400238873333	8.098554838127503e-12	1244496.9882643223	973122.6210829747	2.8848283646378234e-09	0.00268695842357197	0	0	2021-09-30 21:46:24.183675	2021-09-30 21:46:24.183676	1
1173	iron	601.000	2584.3645810643607	8.06732526460115e-12	1242247.9297005534	969608.5392423444	2.8844735966131933e-09	0.0026653690396371637	0	0	2021-09-30 21:46:24.183678	2021-09-30 21:46:24.183679	1
1174	iron	602.000	2554.241192466319	8.036020893860219e-12	1239994.6592998505	966094.2508108949	2.884103089756451e-09	0.002643884062370112	0	0	2021-09-30 21:46:24.183681	2021-09-30 21:46:24.183683	1
1175	iron	603.000	2524.369294777647	8.004640673383452e-12	1237737.076097548	962579.634527557	2.8837166578838843e-09	0.0026225043666300205	0	0	2021-09-30 21:46:24.183685	2021-09-30 21:46:24.183686	1
1176	iron	604.000	2494.74831070996	7.97318353067437e-12	1235475.0703351498	959064.5566932267	2.883314126670524e-09	0.0026012308486423907	0	0	2021-09-30 21:46:24.183688	2021-09-30 21:46:24.183689	1
1177	iron	605.000	2465.377648919729	7.941648373071842e-12	1233208.5232016444	955548.8709006518	2.8828953341980786e-09	0.002580064425795396	0	0	2021-09-30 21:46:24.183691	2021-09-30 21:46:24.183693	1
1178	iron	606.000	2436.256703927402	7.910034087561496e-12	1230937.3065883517	952032.4177905755	2.8824601314725684e-09	0.002559006036350456	0	0	2021-09-30 21:46:24.183695	2021-09-30 21:46:24.183696	1
1179	iron	607.000	2407.384856034799	7.878339540583242e-12	1228661.2828357816	948515.0248007235	2.8820083829608006e-09	0.0025380566391561108	0	0	2021-09-30 21:46:24.183698	2021-09-30 21:46:24.183699	1
1180	iron	608.000	2378.7614712434342	7.84656357783864e-12	1226380.3044645786	944996.5058956572	2.8815399671650862e-09	0.0025172172134000333	0	0	2021-09-30 21:46:24.183701	2021-09-30 21:46:24.183703	1
1181	iron	609.000	2350.3859011723816	7.8147050241037e-12	1224094.2139232755	941476.6613282432	2.8810547771605535e-09	0.002496488758262406	0	0	2021-09-30 21:46:24.183705	2021-09-30 21:46:24.183706	1
1182	iron	610.000	2322.2574829745204	7.782762683032012e-12	1221802.843306899	937955.2773619388	2.88055272120007e-09	0.002475872292659862	0	0	2021-09-30 21:46:24.183708	2021-09-30 21:46:24.18371	1
1183	iron	611.000	2294.3755392545504	7.750735336960983e-12	1219506.0140982866	934432.1260340565	2.8800337232673556e-09	0.0024553688548706095	0	0	2021-09-30 21:46:24.183711	2021-09-30 21:46:24.183713	1
1184	iron	612.000	2266.7393779864924	7.718621746718324e-12	1217203.5368850231	930906.9648876376	2.8794977236884517e-09	0.0024349795022320974	0	0	2021-09-30 21:46:24.183715	2021-09-30 21:46:24.183716	1
1185	iron	613.000	2239.3482924295026	7.686420651429008e-12	1214895.211079061	927379.536713866	2.878944679738061e-09	0.002414705310799231	0	0	2021-09-30 21:46:24.183718	2021-09-30 21:46:24.18372	1
1186	iron	614.000	2212.2015610446624	7.654130768317368e-12	1212580.8246375918	923849.5693029199	2.8783745662430215e-09	0.0023945473749734532	0	0	2021-09-30 21:46:24.183722	2021-09-30 21:46:24.183723	1
1187	iron	615.000	2185.2984474112254	7.621750792510537e-12	1210260.15376693	920316.7751756383	2.8777873762273402e-09	0.0023745068071742703	0	0	2021-09-30 21:46:24.183725	2021-09-30 21:46:24.183726	1
1188	iron	616.000	2158.6382001431925	7.589279396840545e-12	1207932.9626395702	916780.8513422863	2.8771831215268745e-09	0.0023545847374349775	0	0	2021-09-30 21:46:24.183728	2021-09-30 21:46:24.18373	1
1189	iron	617.000	2132.220052804332	7.556715231650969e-12	1205599.0030842423	913241.4790274485	2.87656183347024e-09	0.002334782313080028	0	0	2021-09-30 21:46:24.183732	2021-09-30 21:46:24.183733	1
1190	iron	618.000	2106.043223824695	7.524056924592923e-12	1203258.014296651	909698.3234338809	2.875923563509836e-09	0.0023151006983006353	0	0	2021-09-30 21:46:24.183735	2021-09-30 21:46:24.183736	1
1191	iron	619.000	2080.1069164153273	7.49130308042747e-12	1200909.7225266695	906151.0334783456	2.875268383911514e-09	0.002295541073799411	0	0	2021-09-30 21:46:24.183738	2021-09-30 21:46:24.18374	1
1192	iron	620.000	2054.4103184838373	7.458452280827408e-12	1198553.8407712579	902599.2415441895	2.874596388432071e-09	0.002276104636393335	0	0	2021-09-30 21:46:24.183742	2021-09-30 21:46:24.183743	1
1193	iron	621.000	2028.9526025494742	7.425503084174199e-12	1196190.0684589148	899042.5632294468	2.8739076930176933e-09	0.0022567925986299053	0	0	2021-09-30 21:46:24.183745	2021-09-30 21:46:24.183746	1
1194	iron	622.000	2003.7329256575626	7.392454025357061e-12	1193818.0911266208	895480.5970922961	2.8732024365227164e-09	0.002237606188413081	0	0	2021-09-30 21:46:24.183748	2021-09-30 21:46:24.18375	1
1195	iron	623.000	1978.7504292943968	7.359303615572696e-12	1191437.5801045895	891912.9244172163	2.872480781411765e-09	0.002218546648583806	0	0	2021-09-30 21:46:24.183752	2021-09-30 21:46:24.183753	1
1196	iron	624.000	1954.0042393011543	7.326050342120554e-12	1189048.192179799	888339.1089585613	2.8717429145142875e-09	0.0021996152365642424	0	0	2021-09-30 21:46:24.183755	2021-09-30 21:46:24.183756	1
1197	iron	625.000	1929.4934657878719	7.292692668196561e-12	1186649.5692660809	884758.6967037041	2.870989047765577e-09	0.0021808132239631863	0	0	2021-09-30 21:46:24.183758	2021-09-30 21:46:24.18376	1
1198	iron	626.000	1905.217203048799	7.259229032695732e-12	1184241.3380682468	881171.2156372777	2.870219418966658e-09	0.002162141896193141	0	0	2021-09-30 21:46:24.183762	2021-09-30 21:46:24.183763	1
1199	iron	627.000	1881.1745294735852	7.2256578500005135e-12	1181823.1097400188	877576.175506605	2.869434292559444e-09	0.0021436025520948374	0	0	2021-09-30 21:46:24.183767	2021-09-30 21:46:24.183768	1
1200	iron	628.000	1857.3645074628782	7.191977509777402e-12	1179394.479528308	873973.0675777426	2.868633960440128e-09	0.002125196503606972	0	0	2021-09-30 21:46:24.18377	2021-09-30 21:46:24.183771	1
1201	iron	629.000	1833.7861833405545	7.158186376774285e-12	1176955.0264356136	870361.3644297774	2.867818742732614e-09	0.0021069250753587517	0	0	2021-09-30 21:46:24.183773	2021-09-30 21:46:24.183775	1
1202	iron	630.000	1810.4385872667433	7.124282790604444e-12	1174504.3128515482	866740.519715051	2.8669889886385423e-09	0.0020887896043696465	0	0	2021-09-30 21:46:24.183777	2021-09-30 21:46:24.183778	1
1203	iron	631.000	1787.3207331506694	7.0902650655471e-12	1172041.8841985464	863109.9679527523	2.8661450772609722e-09	0.0020707914396934754	0	0	2021-09-30 21:46:24.18378	2021-09-30 21:46:24.183781	1
1204	iron	632.000	1764.4316185633713	7.0561314903343095e-12	1169567.2685585022	859469.1243071122	2.865287418477152e-09	0.002052931942128605	0	0	2021-09-30 21:46:24.183783	2021-09-30 21:46:24.183785	1
1205	iron	633.000	1741.7702246502372	7.0218803279433455e-12	1167079.976309657	855817.3843940828	2.864416453793282e-09	0.0020352124838915343	0	0	2021-09-30 21:46:24.183787	2021-09-30 21:46:24.183788	1
1206	iron	634.000	1719.335516042223	6.987509815384212e-12	1164579.4997423887	852154.12407087	2.863532657256471e-09	0.002017634448365626	0	0	2021-09-30 21:46:24.18379	2021-09-30 21:46:24.183792	1
1207	iron	635.000	1697.1264407688163	6.953018163494817e-12	1162065.3126813173	848478.6992493318	2.8626365363601376e-09	0.002000199229833704	0	0	2021-09-30 21:46:24.183793	2021-09-30 21:46:24.183795	1
1208	iron	636.000	1675.1419301688866	6.918403556719697e-12	1159536.8701040745	844790.4457195717	2.8617286329622083e-09	0.0019829082332270486	0	0	2021-09-30 21:46:24.183797	2021-09-30 21:46:24.183798	1
1209	iron	637.000	1653.3808988029455	6.8836641529092234e-12	1156993.6077336073	841088.6789507424	2.8608095242816673e-09	0.001965762873976068	0	0	2021-09-30 21:46:24.1838	2021-09-30 21:46:24.183802	1
1210	iron	638.000	1631.8422443633224	6.848798083096366e-12	1154434.9416630268	837372.6939558575	2.8598798238201176e-09	0.001948764577758426	0	0	2021-09-30 21:46:24.183803	2021-09-30 21:46:24.183805	1
1211	iron	639.000	1610.5248475863023	6.813803451289481e-12	1151860.2679337263	833641.7651057674	2.858940182412836e-09	0.0019319147804236615	0	0	2021-09-30 21:46:24.183807	2021-09-30 21:46:24.183808	1
1212	iron	640.000	1589.4275721618415	6.778678334255906e-12	1149268.9621407986	829895.1460009341	2.8579912892225157e-09	0.00191521492783867	0	0	2021-09-30 21:46:24.18381	2021-09-30 21:46:24.183812	1
1213	iron	641.000	1568.549264645461	6.743420781308127e-12	1146660.3790147305	826132.0693275788	2.857033872805401e-09	0.0018986664758362	0	0	2021-09-30 21:46:24.183814	2021-09-30 21:46:24.183815	1
1214	iron	642.000	1547.888754367136	6.708028814083753e-12	1144033.8520053625	822351.7467368416	2.856068702185033e-09	0.001882270890174775	0	0	2021-09-30 21:46:24.183817	2021-09-30 21:46:24.183818	1
1215	iron	643.000	1527.444853342328	6.672500426335308e-12	1141388.6928567886	818553.3687314483	2.855096587966497e-09	0.0018660296465574176	0	0	2021-09-30 21:46:24.18382	2021-09-30 21:46:24.183822	1
1216	iron	644.000	1507.216356181705	6.636833583706788e-12	1138724.1911796331	814736.1045701264	2.8541183834718332e-09	0.0018499442306867536	0	0	2021-09-30 21:46:24.183824	2021-09-30 21:46:24.183825	1
1217	iron	645.000	1487.2020400005797	6.601026223521591e-12	1136039.6140186787	810899.1021878157	2.8531349859085006e-09	0.0018340161383680045	0	0	2021-09-30 21:46:24.183827	2021-09-30 21:46:24.183828	1
1218	iron	646.000	1467.4006643291182	6.565076254559907e-12	1133334.2054060698	807041.4881187662	2.8521473375926088e-09	0.0018182468756961498	0	0	2021-09-30 21:46:24.18383	2021-09-30 21:46:24.183832	1
1219	iron	647.000	1447.8109710204942	6.528981556839818e-12	1130607.1859265566	803162.3674614357	2.851156427165487e-09	0.0018026379592417988	0	0	2021-09-30 21:46:24.183834	2021-09-30 21:46:24.183835	1
1220	iron	648.000	1428.4316841609113	6.492739981396346e-12	1127857.7522556782	799260.8238304903	2.8501632909026323e-09	0.001787190916370821	0	0	2021-09-30 21:46:24.183837	2021-09-30 21:46:24.183838	1
1221	iron	649.000	1409.2615099777895	6.456349350066068e-12	1125085.0767108202	795335.9193540822	2.8491690140186386e-09	0.0017719072855684626	0	0	2021-09-30 21:46:24.18384	2021-09-30 21:46:24.183842	1
1222	iron	650.000	1390.2991367486231	6.419807455258819e-12	1122288.3067836761	791386.694672828	2.848174732045679e-09	0.0017567886168763493	0	0	2021-09-30 21:46:24.183844	2021-09-30 21:46:24.183845	1
1223	iron	651.000	1371.5432347088292	6.383112059738798e-12	1119466.564673543	787412.1689694481	2.847181632244123e-09	0.0017418364723825416	0	0	2021-09-30 21:46:24.183847	2021-09-30 21:46:24.183848	1
1224	iron	652.000	1352.99245596125	6.346260896399159e-12	1116618.9468175173	783411.34002476	2.8461909550544077e-09	0.0017270524267857651	0	0	2021-09-30 21:46:24.18385	2021-09-30 21:46:24.183852	1
1225	iron	653.000	1334.6454343823164	6.309251668043331e-12	1113744.5234014988	779383.1842788664	2.8452039956371638e-09	0.0017124380680822785	0	0	2021-09-30 21:46:24.183854	2021-09-30 21:46:24.183855	1
1226	iron	654.000	1316.50078553109	6.272082047155985e-12	1110842.3378823996	775326.6569418118	2.84422210542376e-09	0.0016979949982938525	0	0	2021-09-30 21:46:24.183857	2021-09-30 21:46:24.183858	1
1227	iron	655.000	1298.5571065559786	6.23474967567939e-12	1107911.4064933062	771240.6921155077	2.843246693756129e-09	0.0016837248343238294	0	0	2021-09-30 21:46:24.18386	2021-09-30 21:46:24.183862	1
1228	iron	656.000	1280.812976102461	6.197252164787075e-12	1104950.7177474499	767124.2029508648	2.842279229577531e-09	0.001669629208902041	0	0	2021-09-30 21:46:24.183864	2021-09-30 21:46:24.183865	1
1229	iron	657.000	1263.2669542197407	6.1595870946575946e-12	1101959.231929183	762976.081825379	2.841321243209203e-09	0.0016557097716581662	0	0	2021-09-30 21:46:24.183867	2021-09-30 21:46:24.183869	1
1230	iron	658.000	1245.9175822681036	6.1217520142496374e-12	1098935.8805878162	758795.2005650379	2.840374328176894e-09	0.0016419681902841892	0	0	2021-09-30 21:46:24.18387	2021-09-30 21:46:24.183872	1
1231	iron	659.000	1228.763382824775	6.0837444410685576e-12	1095879.5660259724	754580.4107006901	2.839440143110954e-09	0.0016284061518159036	0	0	2021-09-30 21:46:24.183874	2021-09-30 21:46:24.183875	1
1232	iron	660.000	1211.802859590971	6.0455618609434474e-12	1092789.1607692242	750330.5437426387	2.838520413763782e-09	0.0016150253640835606	0	0	2021-09-30 21:46:24.183877	2021-09-30 21:46:24.183879	1
1233	iron	661.000	1195.0344972979387	6.007201727795114e-12	1089663.5070403814	746044.4115078244	2.837616935085307e-09	0.0016018275572665494	0	0	2021-09-30 21:46:24.183881	2021-09-30 21:46:24.183882	1
1234	iron	662.000	1178.4567616122627	5.96866146340509e-12	1086501.416228056	741720.806487276	2.8367315733912545e-09	0.0015888144855924016	0	0	2021-09-30 21:46:24.183884	2021-09-30 21:46:24.183885	1
1235	iron	663.000	1162.0680990427315	5.929938457184846e-12	1083301.6683382988	737358.5022407651	2.835866268659646e-09	0.0015759879292248109	0	0	2021-09-30 21:46:24.183887	2021-09-30 21:46:24.183889	1
1236	iron	664.000	1145.8669368445408	5.891030065948634e-12	1080063.0114580393	732956.253860275	2.8350230368882416e-09	0.0015633496962602898	0	0	2021-09-30 21:46:24.183891	2021-09-30 21:46:24.183892	1
1237	iron	665.000	1129.8516829258235	5.851933613673595e-12	1076784.16118896	728512.7984482035	2.8342039726243063e-09	0.0015509016249714586	0	0	2021-09-30 21:46:24.183894	2021-09-30 21:46:24.183895	1
1238	iron	666.000	1114.0207257515774	5.812646391274052e-12	1073463.8000975847	724026.8556752275	2.8334112515613063e-09	0.0015386455861677141	0	0	2021-09-30 21:46:24.183897	2021-09-30 21:46:24.183899	1
1239	iron	667.000	1098.3724342490618	5.77316565636193e-12	1070100.5771348476	719497.1283569557	2.832647133326828e-09	0.0015265834858261438	0	0	2021-09-30 21:46:24.183901	2021-09-30 21:46:24.183902	1
1240	iron	668.000	1082.9051577129499	5.733488633017528e-12	1066693.107076645	714922.3031218366	2.8319139643411943e-09	0.0015147172678544928	0	0	2021-09-30 21:46:24.183904	2021-09-30 21:46:24.183905	1
1241	iron	669.000	1067.6172257087032	5.693612511551496e-12	1063239.9699417353	710301.0511140509	2.8312141808666535e-09	0.0015030489171235636	0	0	2021-09-30 21:46:24.183909	2021-09-30 21:46:24.183911	1
1242	iron	670.000	1052.5069479772355	5.653534448266919e-12	1059739.7103922367	705632.0287418148	2.8305503122467006e-09	0.00149158046277168	0	0	2021-09-30 21:46:24.183913	2021-09-30 21:46:24.183914	1
1243	iron	671.000	1037.5726143388065	5.613251565228529e-12	1056190.8371520042	700913.8785213503	2.829924984254787e-09	0.001480313981694402	0	0	2021-09-30 21:46:24.183916	2021-09-30 21:46:24.183917	1
1244	iron	672.000	1022.8124945967053	5.572760950019729e-12	1052591.8224049807	696145.229968832	2.8293409226603767e-09	0.0014692516023452446	0	0	2021-09-30 21:46:24.183919	2021-09-30 21:46:24.183921	1
1245	iron	673.000	1008.2248384411458	5.532059655507043e-12	1048941.1011795998	691324.7005520754	2.828800957014857e-09	0.0014583955088484492	0	0	2021-09-30 21:46:24.183923	2021-09-30 21:46:24.183924	1
1246	iron	674.000	993.8078753522132	5.4911446996033445e-12	1045237.070749402	686450.8967453019	2.828308024588329e-09	0.0014477479453580667	0	0	2021-09-30 21:46:24.183926	2021-09-30 21:46:24.183927	1
1247	iron	675.000	979.559814502626	5.450013065022903e-12	1041478.0899913311	681522.4151132421	2.827865174628412e-09	0.0014373112208493713	0	0	2021-09-30 21:46:24.183929	2021-09-30 21:46:24.183931	1
1248	iron	676.000	965.4788446612962	5.408661699047085e-12	1037662.4787764549	676537.8435269773	2.8274755727612238e-09	0.0014270877141594773	0	0	2021-09-30 21:46:24.183933	2021-09-30 21:46:24.183934	1
1249	iron	677.000	951.5631340951719	5.367087513281372e-12	1033788.5173267126	671495.7624278684	2.8271425057266506e-09	0.0014170798794838084	0	0	2021-09-30 21:46:24.183936	2021-09-30 21:46:24.183937	1
1250	iron	678.000	937.8108304729807	5.325287383411755e-12	1029854.44556427	666394.7461789511	2.8268693863983594e-09	0.0014072902522871099	0	0	2021-09-30 21:46:24.183939	2021-09-30 21:46:24.183941	1
1251	iron	679.000	924.2200607654797	5.28325814896423e-12	1025858.4624814987	661233.3645441738	2.8266597590336e-09	0.0013977214555750642	0	0	2021-09-30 21:46:24.183943	2021-09-30 21:46:24.183944	1
1252	iron	680.000	910.7889311491989	5.240996613062539e-12	1021798.7254664898	656010.184215328	2.8265173049525365e-09	0.0013883762067484042	0	0	2021-09-30 21:46:24.183946	2021-09-30 21:46:24.183948	1
1253	iron	681.000	897.515526906967	5.198499542183531e-12	1017673.3496524096	650723.770479922	2.8264458484848816e-09	0.0013792573248784675	0	0	2021-09-30 21:46:24.183949	2021-09-30 21:46:24.183951	1
1254	iron	682.000	884.3979123303372	5.155763665911698e-12	1013480.4072253704	645372.688950437	2.8264493633911005e-09	0.001370367738629635	0	0	2021-09-30 21:46:24.183953	2021-09-30 21:46:24.183954	1
1255	iron	683.000	871.4341306203278	5.112785676695877e-12	1009217.926776886	639955.5074703189	2.826531979550062e-09	0.0013617104946326989	0	0	2021-09-30 21:46:24.183956	2021-09-30 21:46:24.183958	1
1256	iron	684.000	858.6222037887139	5.069562229600892e-12	1004883.8925839663	634470.7980522196	2.8266979902677866e-09	0.0013532887666770847	0	0	2021-09-30 21:46:24.183959	2021-09-30 21:46:24.183961	1
1257	iron	685.000	845.9601325586463	5.02608994206529e-12	1000476.2439441681	628917.139016339	2.8269518598908643e-09	0.0013451058654273193	0	0	2021-09-30 21:46:24.183963	2021-09-30 21:46:24.183964	1
1258	iron	686.000	833.4458962660343	4.982365393647609e-12	995992.8744533062	623293.1171914542	2.827298232070888e-09	0.0013371652490268531	0	0	2021-09-30 21:46:24.183966	2021-09-30 21:46:24.183968	1
1259	iron	687.000	821.0774527588785	4.938385125786282e-12	991431.6313101053	617597.3302913209	2.8277419384922433e-09	0.0013294705344201795	0	0	2021-09-30 21:46:24.18397	2021-09-30 21:46:24.183971	1
1260	iron	688.000	808.8527382986227	4.894145641542391e-12	986790.3145900965	611828.3893994922	2.828288008261852e-09	0.001322025509624536	0	0	2021-09-30 21:46:24.183973	2021-09-30 21:46:24.183974	1
1261	iron	689.000	796.7696674588736	4.849643405356158e-12	982066.6765333414	605984.9216246904	2.8289416778925576e-09	0.0013148341469003473	0	0	2021-09-30 21:46:24.183976	2021-09-30 21:46:24.183978	1
1262	iron	690.000	784.8261330265392	4.804874842795903e-12	977258.4207917452	600065.5728656467	2.829708402082862e-09	0.001307900617058496	0	0	2021-09-30 21:46:24.18398	2021-09-30 21:46:24.183981	1
1263	iron	691.000	773.0200059003025	4.759836340303268e-12	972363.2017160654	594069.0107913242	2.8305938651231155e-09	0.0013012293047748918	0	0	2021-09-30 21:46:24.183983	2021-09-30 21:46:24.183984	1
1264	iron	692.000	761.3491349906881	4.714524244949198e-12	967378.623589158	587993.9279277773	2.8316039932654462e-09	0.0012948248252730322	0	0	2021-09-30 21:46:24.183986	2021-09-30 21:46:24.183988	1
1265	iron	693.000	749.8113471184133	4.668934864171005e-12	962302.239870429	581839.0449393467	2.8327449679332354e-09	0.001288692042309702	0	0	2021-09-30 21:46:24.18399	2021-09-30 21:46:24.183991	1
1266	iron	694.000	738.4044469138116	4.623064465530209e-12	957131.5524412394	575603.1140984572	2.8340232398879353e-09	0.0012828360876232286	0	0	2021-09-30 21:46:24.183993	2021-09-30 21:46:24.183994	1
1267	iron	695.000	727.1262167156123	4.576909276450938e-12	951864.0108361244	569284.9229331742	2.8354455444707228e-09	0.0012772623820233623	0	0	2021-09-30 21:46:24.183996	2021-09-30 21:46:24.183998	1
1268	iron	696.000	715.974416468709	4.530465483968681e-12	946497.011441946	562883.2980394908	2.8370189180762665e-09	0.0012719766583276337	0	0	2021-09-30 21:46:24.184	2021-09-30 21:46:24.184001	1
1269	iron	697.000	704.9467836231863	4.483729234476747e-12	941027.8967344761	556397.1091499237	2.8387507157521304e-09	0.0012669849861373656	0	0	2021-09-30 21:46:24.184003	2021-09-30 21:46:24.184004	1
1270	iron	698.000	694.0410330319029	4.436696633462919e-12	935453.9544734955	549825.2733720226	2.840648630269429e-09	0.0012622937988561707	0	0	2021-09-30 21:46:24.184006	2021-09-30 21:46:24.184008	1
1271	iron	699.000	683.2548568481395	4.389363745263777e-12	929772.4168815613	543166.7596366359	2.842720712727458e-09	0.0012579099231057858	0	0	2021-09-30 21:46:24.18401	2021-09-30 21:46:24.184011	1
1272	iron	700.000	672.585924423459	4.341726592800727e-12	923980.4598600864	536420.5934278216	2.844975394657186e-09	0.0012538406106400895	0	0	2021-09-30 21:46:24.184013	2021-09-30 21:46:24.184014	1
1273	iron	701.000	662.0318822045565	4.2937811573193325e-12	918075.2021529675	529585.8616980229	2.847421512056941e-09	0.0012500935732722715	0	0	2021-09-30 21:46:24.184016	2021-09-30 21:46:24.184018	1
1274	iron	702.000	651.5903536319169	4.245523378136924e-12	912053.7045078278	522661.71803796897	2.850068331384451e-09	0.0012466770209954075	0	0	2021-09-30 21:46:24.18402	2021-09-30 21:46:24.184021	1
1275	iron	703.000	641.2589390337847	4.196949152381518e-12	905912.9688565731	515647.38813589624	2.852925577621952e-09	0.0012435997035725975	0	0	2021-09-30 21:46:24.184023	2021-09-30 21:46:24.184024	1
1276	iron	704.000	631.035215526231	4.148054334725363e-12	899649.9374601841	508542.1754728577	2.856003464798286e-09	0.0012408709561590946	0	0	2021-09-30 21:46:24.184026	2021-09-30 21:46:24.184028	1
1277	iron	705.000	620.9167369066639	4.098834737135233e-12	893261.4920444489	501345.4672964583	2.859312729132065e-09	0.0012385007493036734	0	0	2021-09-30 21:46:24.18403	2021-09-30 21:46:24.184031	1
1278	iron	706.000	610.9010335523022	4.049286128598632e-12	886744.4529504776	494056.7409109165	2.8628646649702866e-09	0.0012364997437864208	0	0	2021-09-30 21:46:24.184033	2021-09-30 21:46:24.184034	1
1279	iron	707.000	600.9856123150645	3.999404234870882e-12	880095.5782558918	486675.570244991	2.8666711639732787e-09	0.0012348793509658399	0	0	2021-09-30 21:46:24.184036	2021-09-30 21:46:24.184038	1
1280	iron	708.000	591.1679564171936	3.949184738207945e-12	873311.5628890991	479201.6327356148	2.8707447577961614e-09	0.0012336517992278064	0	0	2021-09-30 21:46:24.18404	2021-09-30 21:46:24.184041	1
1281	iron	709.000	581.445525347586	3.898623277100795e-12	866389.0377440453	471634.71654766164	2.8750986646199273e-09	0.001232830207249655	0	0	2021-09-30 21:46:24.184043	2021-09-30 21:46:24.184044	1
1282	iron	710.000	571.8157547570789	3.847715446018989e-12	859324.5687768459	463974.72812210495	2.879746840014136e-09	0.001232428664965117	0	0	2021-09-30 21:46:24.184046	2021-09-30 21:46:24.184048	1
1283	iron	711.000	562.2760563523287	3.7964567951312916e-12	852114.6561002731	456221.7000835722	2.884704032539014e-09	0.0012324623231409842	0	0	2021-09-30 21:46:24.184051	2021-09-30 21:46:24.184053	1
1284	iron	712.000	552.8238177923853	3.7448428300545175e-12	844755.7330639362	448375.7995077488	2.889985844678031e-09	0.0012329474927043457	0	0	2021-09-30 21:46:24.184055	2021-09-30 21:46:24.184056	1
1285	iron	713.000	543.4564025826924	3.692869011576326e-12	837244.1653308868	440437.3365745053	2.8956087996467522e-09	0.0012339017550360655	0	0	2021-09-30 21:46:24.184058	2021-09-30 21:46:24.18406	1
1286	iron	714.000	534.1711499692725	3.6405307553960005e-12	829576.2499330044	432406.77360271796	2.901590414836446e-09	0.0012353440847345572	0	0	2021-09-30 21:46:24.184062	2021-09-30 21:46:24.184063	1
1287	iron	715.000	524.9653748335243	3.587823431850035e-12	821748.2143378258	424284.73451654427	2.907949282541521e-09	0.0012372949864239203	0	0	2021-09-30 21:46:24.184065	2021-09-30 21:46:24.184066	1
1288	iron	716.000	515.8363675857943	3.534742365642986e-12	813756.2154848576	416072.0147145459	2.9147051590036135e-09	0.0012397766476548383	0	0	2021-09-30 21:46:24.184068	2021-09-30 21:46:24.18407	1
1289	iron	717.000	506.78139405931637	3.4812828355850526e-12	805596.338824749	407769.59139316116	2.9218790626625234e-09	0.001242813110040593	0	0	2021-09-30 21:46:24.184072	2021-09-30 21:46:24.184073	1
1290	iron	718.000	497.7976954040902	3.4274400743147627e-12	797264.5973477364	399378.6343268257	2.9294933827992703e-09	0.0012464304612668006	0	0	2021-09-30 21:46:24.184075	2021-09-30 21:46:24.184076	1
1291	iron	719.000	488.8824879799626	3.3732092680311737e-12	788756.930595398	390900.5171162382	2.937571999918778e-09	0.0012506570510230062	0	0	2021-09-30 21:46:24.184078	2021-09-30 21:46:24.18408	1
1292	iron	720.000	480.03296324964856	3.318585556220179e-12	780069.2036738396	382336.82894095755	2.94614041931062e-09	0.0012555237343451885	0	0	2021-09-30 21:46:24.184082	2021-09-30 21:46:24.184083	1
1293	iron	721.000	471.2462876723025	3.2635640313844338e-12	771197.2062497139	373689.38681594114	2.9552259195987925e-09	0.0012610641465833562	0	0	2021-09-30 21:46:24.184085	2021-09-30 21:46:24.184086	1
1294	iron	722.000	462.5196025954363	3.2081397387687306e-12	762136.6515364647	364960.2483787344	2.9648577182598066e-09	0.0012673150148546056	0	0	2021-09-30 21:46:24.184088	2021-09-30 21:46:24.18409	1
1295	iron	723.000	453.8500241475719	3.152307676088271e-12	752883.1752781868	356151.72523399297	2.9750671564094318e-09	0.001274316511732158	0	0	2021-09-30 21:46:24.184092	2021-09-30 21:46:24.184093	1
1296	iron	724.000	445.23464313107786	3.0960627932496985e-12	743432.3347094059	347266.39685476595	2.985887905638781e-09	0.0012821126580735201	0	0	2021-09-30 21:46:24.184095	2021-09-30 21:46:24.184096	1
1297	iron	725.000	436.67052491378087	3.0393999920820585e-12	733779.6075193882	338307.1250890517	2.997356199944004e-09	0.0012907517830102963	0	0	2021-09-30 21:46:24.184098	2021-09-30 21:46:24.1841	1
1298	iron	726.000	428.15470932076045	2.9823141260532816e-12	723920.3908057213	329277.06927815493	3.0095110964719227e-09	0.0013002870508394837	0	0	2021-09-30 21:46:24.184102	2021-09-30 21:46:24.184103	1
1299	iron	727.000	419.6842105262667	2.924799999999903e-12	713849.9999990463	320179.7019929241	3.0223947694823552e-09	0.001310777066484813	0	0	2021-09-30 21:46:24.184105	2021-09-30 21:46:24.184107	1
1300	iron	728.000	411.25601694428997	2.8668523698485084e-12	703563.6678085327	311018.8254563878	3.0360528423843497e-09	0.0013222865732992672	0	0	2021-09-30 21:46:24.184108	2021-09-30 21:46:24.18411	1
1301	iron	729.000	402.86709112090693	2.80846594233346e-12	693056.5431313515	301798.5886243194	3.0505347640678293e-09	0.0013348872602661445	0	0	2021-09-30 21:46:24.184112	2021-09-30 21:46:24.184113	1
1302	iron	730.000	394.51436962442176	2.7496353747222714e-12	682323.6899557114	292523.5049758789	3.0658942365135407e-09	0.0013486586989204605	0	0	2021-09-30 21:46:24.184115	2021-09-30 21:46:24.184117	1
1303	iron	731.000	386.1947629366707	2.6903552745354007e-12	671360.0862724781	283198.47105191264	3.082189702044598e-09	0.001363689434841186	0	0	2021-09-30 21:46:24.184119	2021-09-30 21:46:24.18412	1
1304	iron	732.000	377.9051553422438	2.6306201992635613e-12	660160.6229412556	273828.7857201838	3.099484900544815e-09	0.001380078264410127	0	0	2021-09-30 21:46:24.184122	2021-09-30 21:46:24.184123	1
1305	iron	733.000	369.64240482070875	2.5704246560906166e-12	648720.1026027203	264420.17027262173	3.1178495083290505e-09	0.0013979357340236226	0	0	2021-09-30 21:46:24.184125	2021-09-30 21:46:24.184127	1
1306	iron	734.000	361.403342934791	2.5097631016082025e-12	637033.2385129929	254978.78927708708	3.1373598738030076e-09	0.001417385908684552	0	0	2021-09-30 21:46:24.184129	2021-09-30 21:46:24.18413	1
1307	iron	735.000	353.18477472204614	2.44862994153552e-12	625094.6534039974	245511.2723006349	3.158099867100124e-09	0.0014385684673963249	0	0	2021-09-30 21:46:24.184132	2021-09-30 21:46:24.184133	1
1308	iron	736.000	344.98347858248866	2.3870195304337513e-12	612898.8783493042	236024.73651411472	3.180161865245683e-09	0.0014616411977727514	0	0	2021-09-30 21:46:24.184135	2021-09-30 21:46:24.184137	1
1309	iron	737.000	336.7962061700803	2.3249261714256452e-12	600440.3515810966	226526.81016552745	3.203647899403162e-09	0.0014867829813344255	0	0	2021-09-30 21:46:24.184139	2021-09-30 21:46:24.18414	1
1310	iron	738.000	328.61968227962376	2.2623441159088995e-12	587713.4173104763	217025.6569959763	3.2286709962680408e-09	0.0015141973849005165	0	0	2021-09-30 21:46:24.184142	2021-09-30 21:46:24.184143	1
1311	iron	739.000	320.4506047379446	2.1992675632697493e-12	574712.324559927	207530.00163517665	3.255356753542659e-09	0.0015441170057969476	0	0	2021-09-30 21:46:24.184145	2021-09-30 21:46:24.184147	1
1312	iron	740.000	312.28564429164277	2.1356906606029664e-12	561431.2259542942	198049.15596906331	3.2838451995739177e-09	0.0015768087612573517	0	0	2021-09-30 21:46:24.184149	2021-09-30 21:46:24.18415	1
1313	iron	741.000	304.1214444948434	2.0716075024120066e-12	547864.1765060425	188593.04654165587	3.314292999355672e-09	0.0016125803685326753	0	0	2021-09-30 21:46:24.184152	2021-09-30 21:46:24.184153	1
1314	iron	742.000	295.95462159866366	2.0070121303383147e-12	534005.1324074268	179172.24303414978	3.346876085599783e-09	0.0016517883383435428	0	0	2021-09-30 21:46:24.184155	2021-09-30 21:46:24.184157	1
1315	iron	743.000	287.78176443933165	1.9418985328602304e-12	519847.9497935772	169797.98783161206	3.3817928151643293e-09	0.0016948479078840652	0	0	2021-09-30 21:46:24.184159	2021-09-30 21:46:24.18416	1
1316	iron	744.000	279.59943432514063	1.8762606450100934e-12	505386.38349819183	160482.2267304043	3.4192677790739506e-09	0.00174224548114504	0	0	2021-09-30 21:46:24.184162	2021-09-30 21:46:24.184163	1
1317	iron	745.000	271.40416492420053	1.8100923480824545e-12	490614.0858106613	151237.64082957237	3.4595564318868482e-09	0.0017945543413365075	0	0	2021-09-30 21:46:24.184165	2021-09-30 21:46:24.184167	1
1318	iron	746.000	263.1924621530465	1.7433874693458038e-12	475524.60519480705	142077.67962011354	3.5029507569798902e-09	0.0018524546773058862	0	0	2021-09-30 21:46:24.184169	2021-09-30 21:46:24.18417	1
1319	iron	747.000	254.96080406236854	1.6761397817507822e-12	460111.3850309849	133016.59535192393	3.549786252182723e-09	0.0019167593591447373	0	0	2021-09-30 21:46:24.184172	2021-09-30 21:46:24.184173	1
1320	iron	748.000	246.70564072476208	1.6083430036346717e-12	444367.76232147217	124069.47868190202	3.6004506152617512e-09	0.0019884474678682515	0	0	2021-09-30 21:46:24.184175	2021-09-30 21:46:24.184177	1
1321	iron	749.000	238.42339412192814	1.5399907984366382e-12	428286.96638321877	115252.29566249091	3.655394639384495e-09	0.0020687084170551884	0	0	2021-09-30 21:46:24.184179	2021-09-30 21:46:24.18418	1
1322	iron	750.000	230.11045802954436	1.471076774396224e-12	411862.1175470352	106581.92612489834	3.7151460136367303e-09	0.0021590007461479797	0	0	2021-09-30 21:46:24.184182	2021-09-30 21:46:24.184183	1
1323	iron	751.000	221.76319790520017	1.401594484265696e-12	395086.225836277	98076.2034864517	3.780326988858735e-09	0.0022611315489575886	0	0	2021-09-30 21:46:24.184185	2021-09-30 21:46:24.184187	1
1324	iron	752.000	213.37795077424838	1.3315374250120538e-12	377952.1896286011	89753.95603174846	3.8516772537652766e-09	0.0023773654132723766	0	0	2021-09-30 21:46:24.184189	2021-09-30 21:46:24.18419	1
1325	iron	753.000	204.95102511486039	1.260899037525035e-12	360452.7943058014	81635.0497187144	3.930083935828248e-09	0.002510576349509792	0	0	2021-09-30 21:46:24.184194	2021-09-30 21:46:24.184195	1
1326	iron	754.000	196.4787007444293	1.1896727063137465e-12	342580.71091127396	73740.4325674697	4.016621499748916e-09	0.002664463631463766	0	0	2021-09-30 21:46:24.184197	2021-09-30 21:46:24.184199	1
1327	iron	755.000	187.9572287045027	1.1178517592204602e-12	324328.4947645664	66092.18065914155	4.112605638920507e-09	0.0028438648389263787	0	0	2021-09-30 21:46:24.184201	2021-09-30 21:46:24.184202	1
1328	iron	756.000	179.3828311471244	1.0454294671147631e-12	305688.58408141136	58713.54582040414	4.219667336649241e-09	0.003055220539666082	0	0	2021-09-30 21:46:24.184204	2021-09-30 21:46:24.184205	1
1329	iron	757.000	170.75170121780644	9.723990435963922e-13	286653.2985973358	51629.00504402726	4.3398566409920545e-09	0.003307282429173211	0	0	2021-09-30 21:46:24.184207	2021-09-30 21:46:24.184209	1
1330	iron	758.000	162.06000294223867	8.987536447013791e-13	267214.8381383419	44864.31167901085	4.475791299826574e-09	0.003612225327376553	0	0	2021-09-30 21:46:24.184211	2021-09-30 21:46:24.184212	1
1331	iron	759.000	153.3038711095057	8.244863686005424e-13	247365.2812063694	38446.54847507666	4.630875030893175e-09	0.003987454718045402	0	0	2021-09-30 21:46:24.184214	2021-09-30 21:46:24.184215	1
1332	iron	760.000	144.47941115763234	7.495902552903289e-13	227096.5835735798	32404.182533629497	4.8096273782359285e-09	0.004458665513554914	0	0	2021-09-30 21:46:24.184217	2021-09-30 21:46:24.184219	1
1333	iron	761.000	135.5826990564942	6.740582863074365e-13	206400.57681250572	26767.122202379436	5.01819906443837e-09	0.005065269924476293	0	0	2021-09-30 21:46:24.184221	2021-09-30 21:46:24.184222	1
1334	iron	762.000	126.6097811923828	5.978833844142785e-13	185268.96684622765	21566.77600421731	5.265209161144576e-09	0.005870593785905908	0	0	2021-09-30 21:46:24.184224	2021-09-30 21:46:24.184225	1
1335	iron	763.000	117.55667425171275	5.210584133018192e-13	163693.332477808	16836.113649463332	5.563169367208456e-09	0.0069824115410066735	0	0	2021-09-30 21:46:24.184227	2021-09-30 21:46:24.184229	1
1336	iron	764.000	108.41936510362613	4.435761772845511e-13	141665.12393140793	12609.729203894984	5.931045105841485e-09	0.008598072436808301	0	0	2021-09-30 21:46:24.184231	2021-09-30 21:46:24.184232	1
1337	iron	765.000	99.19381068529266	3.65429421000228e-13	119175.6613252163	8923.906462711622	6.399178875850485e-09	0.011115514388207917	0	0	2021-09-30 21:46:24.184234	2021-09-30 21:46:24.184235	1
1338	iron	766.000	89.87593788151187	2.866108290996725e-13	96216.13319826126	5816.686624857319	7.019536948480544e-09	0.015451397621702974	0	0	2021-09-30 21:46:24.184237	2021-09-30 21:46:24.184239	1
1339	iron	767.000	80.46164341172889	2.0711302594630274e-13	72777.59496116638	3327.9383130898864	7.888893136458334e-09	0.02417762465585571	0	0	2021-09-30 21:46:24.184241	2021-09-30 21:46:24.184242	1
1340	iron	768.000	70.94679370828855	1.2692857530552583e-13	48850.96738123894	1499.4300319688873	9.200609537502095e-09	0.047315841483532906	0	0	2021-09-30 21:46:24.184244	2021-09-30 21:46:24.184245	1
1341	iron	769.000	61.3272248022871	4.604998004240353e-14	24427.035044193268	374.9051267014218	1.1082915792837563e-08	0.16358065130202584	0	0	2021-09-30 21:46:24.184247	2021-09-30 21:46:24.184249	1
1342	iron	770.000	51.59874220341934	-3.5530318187920205e-14	-503.5552268028259	0.15932138927914827	\N	323.865756110203	0	0	2021-09-30 21:46:24.184251	2021-09-30 21:46:24.184252	1
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.metadata (id, last_modified, created, project_id, db_user_id, software_id) FROM stdin;
1	2021-09-30 21:46:28.070321	2021-09-30 21:46:28.070326	1	1	2
2	2021-09-30 21:46:28.08287	2021-09-30 21:46:28.082874	1	1	2
3	2021-09-30 21:46:28.089109	2021-09-30 21:46:28.089113	1	1	2
4	2021-09-30 21:46:28.09519	2021-09-30 21:46:28.095195	1	1	2
5	2021-09-30 21:46:28.101232	2021-09-30 21:46:28.101236	1	1	2
6	2021-09-30 21:46:28.107445	2021-09-30 21:46:28.107449	1	1	2
7	2021-09-30 21:46:28.113992	2021-09-30 21:46:28.113996	1	1	2
8	2021-09-30 21:46:28.120164	2021-09-30 21:46:28.120168	1	1	2
9	2021-09-30 21:46:28.126104	2021-09-30 21:46:28.126108	1	1	2
10	2021-09-30 21:46:28.132504	2021-09-30 21:46:28.132509	1	1	2
11	2021-09-30 21:46:28.138655	2021-09-30 21:46:28.138659	1	1	2
12	2021-09-30 21:46:28.144889	2021-09-30 21:46:28.144893	1	1	2
13	2021-09-30 21:46:28.151053	2021-09-30 21:46:28.151057	1	1	2
14	2021-09-30 21:46:28.157205	2021-09-30 21:46:28.157209	1	1	2
15	2021-09-30 21:46:28.163451	2021-09-30 21:46:28.163455	1	1	2
16	2021-09-30 21:46:28.169819	2021-09-30 21:46:28.169824	1	1	2
17	2021-09-30 21:46:28.176447	2021-09-30 21:46:28.176452	1	1	2
18	2021-09-30 21:46:28.183109	2021-09-30 21:46:28.183114	1	1	2
19	2021-09-30 21:46:28.189995	2021-09-30 21:46:28.19	1	1	2
20	2021-09-30 21:46:28.196079	2021-09-30 21:46:28.196083	1	1	2
21	2021-09-30 21:46:28.202079	2021-09-30 21:46:28.202083	1	1	2
22	2021-09-30 21:46:28.208273	2021-09-30 21:46:28.208277	1	1	2
23	2021-09-30 21:46:28.214863	2021-09-30 21:46:28.214868	1	1	2
24	2021-09-30 21:46:28.221837	2021-09-30 21:46:28.221841	1	1	2
25	2021-09-30 21:46:28.228191	2021-09-30 21:46:28.228195	1	1	2
26	2021-09-30 21:46:28.234626	2021-09-30 21:46:28.234631	1	1	2
27	2021-09-30 21:46:28.241091	2021-09-30 21:46:28.241095	1	1	2
28	2021-09-30 21:46:28.247949	2021-09-30 21:46:28.247954	1	1	2
29	2021-09-30 21:46:28.254978	2021-09-30 21:46:28.254983	1	1	2
30	2021-09-30 21:46:28.261136	2021-09-30 21:46:28.261141	1	1	2
31	2021-09-30 21:46:28.267602	2021-09-30 21:46:28.267607	1	1	2
32	2021-09-30 21:46:28.273891	2021-09-30 21:46:28.273895	1	1	2
33	2021-09-30 21:46:28.280937	2021-09-30 21:46:28.280942	1	1	2
34	2021-09-30 21:46:28.288391	2021-09-30 21:46:28.288396	1	1	2
35	2021-09-30 21:46:28.295895	2021-09-30 21:46:28.2959	1	1	2
36	2021-09-30 21:46:28.303385	2021-09-30 21:46:28.30339	1	1	2
37	2021-09-30 21:46:28.310562	2021-09-30 21:46:28.310567	1	1	2
38	2021-09-30 21:46:28.317563	2021-09-30 21:46:28.317567	1	1	2
39	2021-09-30 21:46:28.325695	2021-09-30 21:46:28.3257	1	1	2
40	2021-09-30 21:46:28.33292	2021-09-30 21:46:28.332925	1	1	2
41	2021-09-30 21:46:28.339797	2021-09-30 21:46:28.339802	1	1	2
42	2021-09-30 21:46:28.347609	2021-09-30 21:46:28.347614	1	1	2
43	2021-09-30 21:46:28.355025	2021-09-30 21:46:28.355029	1	1	2
44	2021-09-30 21:46:28.36191	2021-09-30 21:46:28.361914	1	1	2
45	2021-09-30 21:46:28.369495	2021-09-30 21:46:28.369501	1	1	2
46	2021-09-30 21:46:28.376613	2021-09-30 21:46:28.376618	1	1	2
47	2021-09-30 21:46:28.38371	2021-09-30 21:46:28.383715	1	1	2
48	2021-09-30 21:46:28.391325	2021-09-30 21:46:28.39133	1	1	2
49	2021-09-30 21:46:28.398811	2021-09-30 21:46:28.398815	1	1	2
50	2021-09-30 21:46:28.405116	2021-09-30 21:46:28.40512	1	1	2
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.model (id, unique_id, mx_tot, my_tot, mz_tot, vx_tot, vy_tot, vz_tot, h_tot, rh_tot, adm_tot, e_typical, e_anis, e_ext, e_demag, e_exch1, e_exch2, e_exch3, e_exch4, e_tot, volume, max_energy_evaluations, last_modified, created, geometry_id, model_materials_text_id, start_magnetization_id, external_field_id, running_status_id, model_run_data_id, model_report_data_id, mdata_id, legacy_model_info_id) FROM stdin;
1	8b0fe9f1-fb74-451b-a420-0d0d3619b3a0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.073224	2021-09-30 21:46:28.073228	1	1	1	\N	1	1	1	1	\N
7	79465af8-ec24-412f-b83a-ac28a18b1ba2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.114739	2021-09-30 21:46:28.114743	1	7	7	\N	1	7	7	7	\N
8	177ab3c7-9742-48d3-a8e0-6f273cf41afc	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.120781	2021-09-30 21:46:28.120785	1	8	8	\N	1	8	8	8	\N
9	52aca378-39b4-4200-95c5-6eb976502819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.126733	2021-09-30 21:46:28.126737	1	9	9	\N	1	9	9	9	\N
10	e92a43eb-4954-4409-a826-c79bd73ee36d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.133087	2021-09-30 21:46:28.13309	1	10	10	\N	1	10	10	10	\N
11	e0671893-3151-4f71-9e14-290046bdf199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.139434	2021-09-30 21:46:28.139438	1	11	11	\N	1	11	11	11	\N
12	6bddb380-ef4b-4673-8422-204e076e92f1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.145545	2021-09-30 21:46:28.145549	1	12	12	\N	1	12	12	12	\N
13	dfe3d2bd-33dd-47b9-9b4e-2fe5e0c68742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.151594	2021-09-30 21:46:28.151598	1	13	13	\N	1	13	13	13	\N
14	9efe84f8-ca7d-412c-a307-5e3bcc73caa4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.157749	2021-09-30 21:46:28.157753	1	14	14	\N	1	14	14	14	\N
15	e0d60aea-5f73-4a21-a715-ae203f6a4ed1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.164125	2021-09-30 21:46:28.164128	1	15	15	\N	1	15	15	15	\N
16	2a490b8d-3510-4dcb-b978-962072893c8b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.170444	2021-09-30 21:46:28.170448	1	16	16	\N	1	16	16	16	\N
17	3faac216-0f9d-479e-aced-07b176d33873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.1771	2021-09-30 21:46:28.177104	1	17	17	\N	1	17	17	17	\N
18	897ddace-0689-42bb-89c6-af1ef9a1f47e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.183802	2021-09-30 21:46:28.183806	1	18	18	\N	1	18	18	18	\N
19	107a3b18-4276-45ee-8d45-a995422df00d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.190566	2021-09-30 21:46:28.19057	1	19	19	\N	1	19	19	19	\N
20	3e4e892d-890b-47fd-ae27-182e6f94ec29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.19663	2021-09-30 21:46:28.196634	1	20	20	\N	1	20	20	20	\N
21	9d145263-9cc7-4d8f-bed0-bff25ce6f970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.202643	2021-09-30 21:46:28.202647	1	21	21	\N	1	21	21	21	\N
22	8f63e204-8ab8-4f14-9f64-9015a47a5605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.208889	2021-09-30 21:46:28.208893	1	22	22	\N	1	22	22	22	\N
23	a32d9690-6448-4340-b35b-6421bb5a1b6a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.215477	2021-09-30 21:46:28.215481	1	23	23	\N	1	23	23	23	\N
24	6615ac38-d85d-4aba-a91e-64fb29a72ae3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.222414	2021-09-30 21:46:28.222418	1	24	24	\N	1	24	24	24	\N
25	cb8a6022-96b3-491b-9206-6ca747cf56a3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.228776	2021-09-30 21:46:28.22878	1	25	25	\N	1	25	25	25	\N
26	7b773558-f95b-47dc-9c26-892408cd0cf8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.235155	2021-09-30 21:46:28.235159	1	26	26	\N	1	26	26	26	\N
27	ece2c306-f1d3-4252-818b-ea7977ffa05c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.241721	2021-09-30 21:46:28.241725	1	27	27	\N	1	27	27	27	\N
28	f7c4cb6f-d338-4233-a564-80f104656f02	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.248631	2021-09-30 21:46:28.248636	1	28	28	\N	1	28	28	28	\N
29	7ad146af-9091-45f0-97fa-0e0afef0634b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.255565	2021-09-30 21:46:28.255569	1	29	29	\N	1	29	29	29	\N
30	5ea66d6a-263c-4046-b811-46735661524b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.261762	2021-09-30 21:46:28.261766	1	30	30	\N	1	30	30	30	\N
31	aa6b26f4-f361-47e4-a0be-86af7ec908c1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.268194	2021-09-30 21:46:28.268198	1	31	31	\N	1	31	31	31	\N
32	f83985bf-c666-4f11-8ac2-7d024676d7ca	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.274478	2021-09-30 21:46:28.274482	1	32	32	\N	1	32	32	32	\N
33	5f1a2a34-bea8-4322-b628-976d4744f962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.281592	2021-09-30 21:46:28.281596	1	33	33	\N	1	33	33	33	\N
34	8d97a133-145b-44f1-a740-c39ca0f6e8a2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.289057	2021-09-30 21:46:28.289062	1	34	34	\N	1	34	34	34	\N
35	12286af8-0815-4bd4-b9de-54adce16801e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.296588	2021-09-30 21:46:28.296592	1	35	35	\N	1	35	35	35	\N
36	f092c2d9-a974-4dfd-888a-23638c4a58e7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.304069	2021-09-30 21:46:28.304073	1	36	36	\N	1	36	36	36	\N
37	d265423b-e85e-4d61-8026-e917fae50369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.31123	2021-09-30 21:46:28.311234	1	37	37	\N	1	37	37	37	\N
38	c5813534-7c43-405e-9fc4-e149934e8680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.318221	2021-09-30 21:46:28.318225	1	38	38	\N	1	38	38	38	\N
39	6e87a2d0-fcb0-4758-a49d-0ab916cf2a36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.326388	2021-09-30 21:46:28.326392	1	39	39	\N	1	39	39	39	\N
40	bd06f5ee-55a0-40f3-b583-f111e51f4737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.333606	2021-09-30 21:46:28.33361	1	40	40	\N	1	40	40	40	\N
41	83a80727-b6cf-4b53-8110-7a458bff5c04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.340496	2021-09-30 21:46:28.340501	1	41	41	\N	1	41	41	41	\N
42	18d9bf27-d42c-43d3-9f6d-561eb27dc24b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.348337	2021-09-30 21:46:28.348341	1	42	42	\N	1	42	42	42	\N
43	f6c346de-d0af-4bcb-a730-8d14a6d14f12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.355662	2021-09-30 21:46:28.355666	1	43	43	\N	1	43	43	43	\N
44	7a3ae1ef-c92c-46de-9e63-79f8e5b11a84	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.362556	2021-09-30 21:46:28.36256	1	44	44	\N	1	44	44	44	\N
45	525e7dfa-571b-4bee-8ae7-9c0a47ed704f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.370191	2021-09-30 21:46:28.370195	1	45	45	\N	1	45	45	45	\N
46	fcd0b54e-951e-4406-bd4b-74ba488c4d98	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.377297	2021-09-30 21:46:28.377302	1	46	46	\N	1	46	46	46	\N
47	86a3f5cd-c938-478c-bba2-1e3db8129bc5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.384408	2021-09-30 21:46:28.384412	1	47	47	\N	1	47	47	47	\N
48	2c982b7d-5863-4aa1-935b-5e3cac7970df	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.392041	2021-09-30 21:46:28.392046	1	48	48	\N	1	48	48	48	\N
49	2c1f51fc-21d8-4790-8910-df294f0d1ed7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.399502	2021-09-30 21:46:28.399506	1	49	49	\N	1	49	49	49	\N
50	aa8a13bf-ab1b-4351-a0ca-4adbb56be2c8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.405802	2021-09-30 21:46:28.405806	1	50	50	\N	1	50	50	50	\N
3	97f58f68-3df5-4b6c-8031-f3440ef1fa6e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.089705	2021-09-30 21:46:28.089708	1	3	3	\N	3	3	3	3	\N
6	0b3f6cfa-88d1-4cf1-b004-f96719ad82a6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.108129	2021-09-30 21:46:28.108133	1	6	6	\N	6	6	6	6	\N
4	f8e344d2-a6b4-4658-8b2b-fb5ce3bdef8c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.095799	2021-09-30 21:46:28.095802	1	4	4	\N	4	4	4	4	\N
2	26e49717-7360-431a-89b3-94a2418c2ca9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.083718	2021-09-30 21:46:28.083722	1	2	2	\N	2	2	2	2	\N
5	265d459d-f4dc-4fc6-bfa4-2d4d383d2a6d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	2021-09-30 21:46:28.101891	2021-09-30 21:46:28.101895	1	5	5	\N	5	5	5	5	\N
\.


--
-- Data for Name: model_field; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.model_field (id, last_modified, created, model_id) FROM stdin;
\.


--
-- Data for Name: model_material_association; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.model_material_association (model_id, material_id, submesh_id) FROM stdin;
1	21	1
2	21	1
3	21	1
4	21	1
5	21	1
6	21	1
7	21	1
8	21	1
9	21	1
10	21	1
11	21	1
12	21	1
13	21	1
14	21	1
15	21	1
16	21	1
17	21	1
18	21	1
19	21	1
20	21	1
21	21	1
22	21	1
23	21	1
24	21	1
25	21	1
26	21	1
27	21	1
28	21	1
29	21	1
30	21	1
31	21	1
32	21	1
33	21	1
34	21	1
35	21	1
36	21	1
37	21	1
38	21	1
39	21	1
40	21	1
41	21	1
42	21	1
43	21	1
44	21	1
45	21	1
46	21	1
47	21	1
48	21	1
49	21	1
50	21	1
\.


--
-- Data for Name: model_materials_text; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.model_materials_text (id, materials, submeshidxs_materials, submeshidxs_materials_temperatures, last_modified, created) FROM stdin;
1	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.065031	2021-09-30 21:46:28.065037
2	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.081728	2021-09-30 21:46:28.081733
3	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.088095	2021-09-30 21:46:28.088099
4	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.094015	2021-09-30 21:46:28.094019
5	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.100026	2021-09-30 21:46:28.10003
6	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.106251	2021-09-30 21:46:28.106255
7	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.112757	2021-09-30 21:46:28.112761
8	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.118948	2021-09-30 21:46:28.118953
9	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.124831	2021-09-30 21:46:28.124836
10	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.131186	2021-09-30 21:46:28.13119
11	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.137396	2021-09-30 21:46:28.1374
12	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.14362	2021-09-30 21:46:28.143624
13	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.149797	2021-09-30 21:46:28.149801
14	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.155949	2021-09-30 21:46:28.155954
15	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.162167	2021-09-30 21:46:28.162172
16	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.168515	2021-09-30 21:46:28.168519
17	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.175104	2021-09-30 21:46:28.175108
18	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.18173	2021-09-30 21:46:28.181734
19	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.188602	2021-09-30 21:46:28.188607
20	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.194775	2021-09-30 21:46:28.19478
21	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.200758	2021-09-30 21:46:28.200763
22	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.206938	2021-09-30 21:46:28.206942
23	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.213464	2021-09-30 21:46:28.213469
24	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.220449	2021-09-30 21:46:28.220454
25	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.226869	2021-09-30 21:46:28.226873
26	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.233262	2021-09-30 21:46:28.233267
27	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.23975	2021-09-30 21:46:28.239755
28	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.246489	2021-09-30 21:46:28.246494
29	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.253622	2021-09-30 21:46:28.253627
30	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.259811	2021-09-30 21:46:28.259815
31	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.266287	2021-09-30 21:46:28.266292
32	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.272528	2021-09-30 21:46:28.272533
33	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.279028	2021-09-30 21:46:28.279032
34	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.286582	2021-09-30 21:46:28.286587
35	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.294046	2021-09-30 21:46:28.294051
36	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.30167	2021-09-30 21:46:28.301675
37	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.308973	2021-09-30 21:46:28.308977
38	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.315959	2021-09-30 21:46:28.315964
39	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.323892	2021-09-30 21:46:28.323897
40	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.331312	2021-09-30 21:46:28.331316
41	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.33819	2021-09-30 21:46:28.338194
42	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.345654	2021-09-30 21:46:28.345659
43	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.35354	2021-09-30 21:46:28.353545
44	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.360146	2021-09-30 21:46:28.360151
45	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.367623	2021-09-30 21:46:28.367628
46	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.375044	2021-09-30 21:46:28.375049
47	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.381945	2021-09-30 21:46:28.38195
48	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.389449	2021-09-30 21:46:28.389455
49	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.397314	2021-09-30 21:46:28.397319
50	magnetite	1:magnetite	1:magnetite:20.000	2021-09-30 21:46:28.403617	2021-09-30 21:46:28.403621
\.


--
-- Data for Name: model_report_data; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.model_report_data (id, has_xy_thumb_png, has_yz_thumb_png, has_xz_thumb_png, has_xy_png, has_yz_png, has_xz_png) FROM stdin;
1	f	f	f	f	f	f
2	f	f	f	f	f	f
3	f	f	f	f	f	f
4	f	f	f	f	f	f
5	f	f	f	f	f	f
6	f	f	f	f	f	f
7	f	f	f	f	f	f
8	f	f	f	f	f	f
9	f	f	f	f	f	f
10	f	f	f	f	f	f
11	f	f	f	f	f	f
12	f	f	f	f	f	f
13	f	f	f	f	f	f
14	f	f	f	f	f	f
15	f	f	f	f	f	f
16	f	f	f	f	f	f
17	f	f	f	f	f	f
18	f	f	f	f	f	f
19	f	f	f	f	f	f
20	f	f	f	f	f	f
21	f	f	f	f	f	f
22	f	f	f	f	f	f
23	f	f	f	f	f	f
24	f	f	f	f	f	f
25	f	f	f	f	f	f
26	f	f	f	f	f	f
27	f	f	f	f	f	f
28	f	f	f	f	f	f
29	f	f	f	f	f	f
30	f	f	f	f	f	f
31	f	f	f	f	f	f
32	f	f	f	f	f	f
33	f	f	f	f	f	f
34	f	f	f	f	f	f
35	f	f	f	f	f	f
36	f	f	f	f	f	f
37	f	f	f	f	f	f
38	f	f	f	f	f	f
39	f	f	f	f	f	f
40	f	f	f	f	f	f
41	f	f	f	f	f	f
42	f	f	f	f	f	f
43	f	f	f	f	f	f
44	f	f	f	f	f	f
45	f	f	f	f	f	f
46	f	f	f	f	f	f
47	f	f	f	f	f	f
48	f	f	f	f	f	f
49	f	f	f	f	f	f
50	f	f	f	f	f	f
\.


--
-- Data for Name: model_run_data; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.model_run_data (id, has_script, has_stdout, has_stderr, has_energy_log, has_tecplot, has_json, has_dat, has_helicity_dat, has_vorticity_dat, has_adm_dat, last_modified, created) FROM stdin;
1	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.068228	2021-09-30 21:46:28.068233
2	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.082315	2021-09-30 21:46:28.082319
3	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.088623	2021-09-30 21:46:28.088627
4	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.094626	2021-09-30 21:46:28.09463
5	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.100665	2021-09-30 21:46:28.100669
6	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.106881	2021-09-30 21:46:28.106885
7	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.113408	2021-09-30 21:46:28.113412
8	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.11959	2021-09-30 21:46:28.119594
9	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.125489	2021-09-30 21:46:28.125494
10	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.131899	2021-09-30 21:46:28.131904
11	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.138085	2021-09-30 21:46:28.138089
12	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.144295	2021-09-30 21:46:28.144299
13	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.150448	2021-09-30 21:46:28.150452
14	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.156611	2021-09-30 21:46:28.156615
15	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.162855	2021-09-30 21:46:28.162859
16	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.169201	2021-09-30 21:46:28.169205
17	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.175826	2021-09-30 21:46:28.17583
18	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.182474	2021-09-30 21:46:28.182478
19	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.189367	2021-09-30 21:46:28.189372
20	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.195468	2021-09-30 21:46:28.195472
21	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.201476	2021-09-30 21:46:28.20148
22	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.207655	2021-09-30 21:46:28.20766
23	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.214219	2021-09-30 21:46:28.214223
24	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.221201	2021-09-30 21:46:28.221205
25	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.227582	2021-09-30 21:46:28.227586
26	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.233997	2021-09-30 21:46:28.234001
27	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.24047	2021-09-30 21:46:28.240474
28	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.247274	2021-09-30 21:46:28.247279
29	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.254361	2021-09-30 21:46:28.254365
30	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.260523	2021-09-30 21:46:28.260527
31	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.266988	2021-09-30 21:46:28.266992
32	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.273255	2021-09-30 21:46:28.273259
33	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.280045	2021-09-30 21:46:28.28005
34	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.287578	2021-09-30 21:46:28.287582
35	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.295058	2021-09-30 21:46:28.295063
36	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.302566	2021-09-30 21:46:28.30257
37	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.309803	2021-09-30 21:46:28.309807
38	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.316733	2021-09-30 21:46:28.316738
39	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.324895	2021-09-30 21:46:28.3249
40	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.332141	2021-09-30 21:46:28.332145
41	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.338982	2021-09-30 21:46:28.338986
42	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.346758	2021-09-30 21:46:28.346762
43	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.35432	2021-09-30 21:46:28.354324
44	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.361147	2021-09-30 21:46:28.361151
45	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.368665	2021-09-30 21:46:28.36867
46	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.375858	2021-09-30 21:46:28.375863
47	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.382923	2021-09-30 21:46:28.382928
48	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.39051	2021-09-30 21:46:28.390514
49	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.398057	2021-09-30 21:46:28.398062
50	f	f	f	f	f	f	f	f	f	f	2021-09-30 21:46:28.40439	2021-09-30 21:46:28.404394
\.


--
-- Data for Name: neb; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.neb (id, unique_id, spring_constant, curvature_weight, no_of_points, max_energy_evaluations, max_path_evaluations, energy_barrier, last_modified, created, external_field_id, start_model_id, end_model_id, parent_neb_id, neb_calculation_type_id, neb_run_data_id, neb_report_data_id, running_status_id, mdata_id) FROM stdin;
\.


--
-- Data for Name: neb_calculation_type; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.neb_calculation_type (id, name, description, last_modified, created) FROM stdin;
\.


--
-- Data for Name: neb_model_split; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.neb_model_split (id, image_number, last_modified, created, neb_id, model_id) FROM stdin;
\.


--
-- Data for Name: neb_report_data; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.neb_report_data (id, has_x_thumb_png, has_y_thumb_png, has_z_thumb_png, has_x_png, has_y_png, has_z_png, last_modified, created) FROM stdin;
\.


--
-- Data for Name: neb_run_data; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.neb_run_data (id, has_script, has_stdout, has_stderr, has_energy_log, has_tecplot, has_neb_energies, last_modified, created) FROM stdin;
\.


--
-- Data for Name: physical_constant; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.physical_constant (id, symbol, name, value, unit, last_modified, created) FROM stdin;
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.project (id, name, description, last_modified, created) FROM stdin;
1	integration_test	A small project to test m4db	2021-09-30 21:46:25.132298	2021-09-30 21:46:25.132305
\.


--
-- Data for Name: random_field; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.random_field (id, seed, last_modified, created) FROM stdin;
1	\N	2021-09-30 21:46:28.061715	2021-09-30 21:46:28.061726
2	\N	2021-09-30 21:46:28.08102	2021-09-30 21:46:28.081026
3	\N	2021-09-30 21:46:28.08735	2021-09-30 21:46:28.087356
4	\N	2021-09-30 21:46:28.093283	2021-09-30 21:46:28.093288
5	\N	2021-09-30 21:46:28.09926	2021-09-30 21:46:28.099264
6	\N	2021-09-30 21:46:28.105504	2021-09-30 21:46:28.105509
7	\N	2021-09-30 21:46:28.112042	2021-09-30 21:46:28.112047
8	\N	2021-09-30 21:46:28.118175	2021-09-30 21:46:28.11818
9	\N	2021-09-30 21:46:28.124125	2021-09-30 21:46:28.12413
10	\N	2021-09-30 21:46:28.130384	2021-09-30 21:46:28.130389
11	\N	2021-09-30 21:46:28.136597	2021-09-30 21:46:28.136601
12	\N	2021-09-30 21:46:28.142855	2021-09-30 21:46:28.14286
13	\N	2021-09-30 21:46:28.149059	2021-09-30 21:46:28.149064
14	\N	2021-09-30 21:46:28.155229	2021-09-30 21:46:28.155234
15	\N	2021-09-30 21:46:28.161342	2021-09-30 21:46:28.161347
16	\N	2021-09-30 21:46:28.167701	2021-09-30 21:46:28.167706
17	\N	2021-09-30 21:46:28.174271	2021-09-30 21:46:28.174276
18	\N	2021-09-30 21:46:28.180859	2021-09-30 21:46:28.180865
19	\N	2021-09-30 21:46:28.187741	2021-09-30 21:46:28.187746
20	\N	2021-09-30 21:46:28.194038	2021-09-30 21:46:28.194044
21	\N	2021-09-30 21:46:28.199995	2021-09-30 21:46:28.2
22	\N	2021-09-30 21:46:28.206141	2021-09-30 21:46:28.206146
23	\N	2021-09-30 21:46:28.212616	2021-09-30 21:46:28.212621
24	\N	2021-09-30 21:46:28.219635	2021-09-30 21:46:28.21964
25	\N	2021-09-30 21:46:28.226083	2021-09-30 21:46:28.226088
26	\N	2021-09-30 21:46:28.232436	2021-09-30 21:46:28.232442
27	\N	2021-09-30 21:46:28.238954	2021-09-30 21:46:28.238959
28	\N	2021-09-30 21:46:28.245609	2021-09-30 21:46:28.245617
29	\N	2021-09-30 21:46:28.25277	2021-09-30 21:46:28.252776
30	\N	2021-09-30 21:46:28.259013	2021-09-30 21:46:28.259019
31	\N	2021-09-30 21:46:28.265513	2021-09-30 21:46:28.265518
32	\N	2021-09-30 21:46:28.271749	2021-09-30 21:46:28.271755
33	\N	2021-09-30 21:46:28.278153	2021-09-30 21:46:28.278158
34	\N	2021-09-30 21:46:28.285591	2021-09-30 21:46:28.285596
35	\N	2021-09-30 21:46:28.293114	2021-09-30 21:46:28.293119
36	\N	2021-09-30 21:46:28.300692	2021-09-30 21:46:28.300697
37	\N	2021-09-30 21:46:28.308008	2021-09-30 21:46:28.308013
38	\N	2021-09-30 21:46:28.315127	2021-09-30 21:46:28.315132
39	\N	2021-09-30 21:46:28.322872	2021-09-30 21:46:28.322878
40	\N	2021-09-30 21:46:28.33049	2021-09-30 21:46:28.330496
41	\N	2021-09-30 21:46:28.337412	2021-09-30 21:46:28.337418
42	\N	2021-09-30 21:46:28.344617	2021-09-30 21:46:28.344623
43	\N	2021-09-30 21:46:28.352596	2021-09-30 21:46:28.352602
44	\N	2021-09-30 21:46:28.35935	2021-09-30 21:46:28.359356
45	\N	2021-09-30 21:46:28.366606	2021-09-30 21:46:28.366612
46	\N	2021-09-30 21:46:28.374069	2021-09-30 21:46:28.374074
47	\N	2021-09-30 21:46:28.381107	2021-09-30 21:46:28.381112
48	\N	2021-09-30 21:46:28.388454	2021-09-30 21:46:28.38846
49	\N	2021-09-30 21:46:28.396224	2021-09-30 21:46:28.396233
50	\N	2021-09-30 21:46:28.402823	2021-09-30 21:46:28.402828
\.


--
-- Data for Name: running_status; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.running_status (id, name, description, last_modified, created) FROM stdin;
1	not-run	a model that has not been run yet	2021-09-30 21:46:23.995399	2021-09-30 21:46:23.995404
2	re-run	a model that is scheduled for a re-run	2021-09-30 21:46:23.995407	2021-09-30 21:46:23.995409
3	running	a model that is currently running scheduled to run	2021-09-30 21:46:23.995411	2021-09-30 21:46:23.995413
4	finished	a model that is finished running	2021-09-30 21:46:23.995415	2021-09-30 21:46:23.995417
5	crashed	a model that has crashed	2021-09-30 21:46:23.995419	2021-09-30 21:46:23.995421
6	scheduled	a job that has been scheduled for running	2021-09-30 21:46:23.995423	2021-09-30 21:46:23.995424
\.


--
-- Data for Name: size_convention; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.size_convention (id, symbol, description, last_modified, created) FROM stdin;
1	ESVD	Equivalent spherical volume diameter	2021-09-30 21:46:24.007334	2021-09-30 21:46:24.007343
2	ECVL	Equivalent cubic volume length	2021-09-30 21:46:24.00735	2021-09-30 21:46:24.007354
\.


--
-- Data for Name: software; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.software (id, name, version, executable, description, url, citation, last_modified, created) FROM stdin;
1	cubit	16.4	\N	\N	\N	\N	2021-09-30 21:46:25.533553	2021-09-30 21:46:25.53356
2	merrill	1.4.0	/home/lnagy2/Install/merrill/1.4.0/bin/merrill	\N	\N	\N	2021-09-30 21:46:25.935835	2021-09-30 21:46:25.935843
\.


--
-- Data for Name: uniform_field; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.uniform_field (id, theta, phi, dir_x, dir_y, dir_z, magnitude, last_modified, created, unit_id) FROM stdin;
\.


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: lnagy2
--

COPY public.unit (id, symbol, name, power, last_modified, created) FROM stdin;
1	1	unitless	1	2021-09-30 21:46:23.981715	2021-09-30 21:46:23.981722
2	m	meter	1	2021-09-30 21:46:23.981724	2021-09-30 21:46:23.981726
3	cm	centimeter	0.01	2021-09-30 21:46:23.981727	2021-09-30 21:46:23.981729
4	mm	millimeter	0.001	2021-09-30 21:46:23.98173	2021-09-30 21:46:23.981732
5	um	micrometer	1e-06	2021-09-30 21:46:23.981734	2021-09-30 21:46:23.981735
6	nm	nanometer	1e-09	2021-09-30 21:46:23.981737	2021-09-30 21:46:23.981738
7	pm	picometer	1e-12	2021-09-30 21:46:23.98174	2021-09-30 21:46:23.981741
8	fm	femtometer	1e-15	2021-09-30 21:46:23.981743	2021-09-30 21:46:23.981744
9	am	attometer	1e-18	2021-09-30 21:46:23.981746	2021-09-30 21:46:23.981747
10	T	tesla	1	2021-09-30 21:46:23.981749	2021-09-30 21:46:23.981751
11	mT	millitesla	0.001	2021-09-30 21:46:23.981752	2021-09-30 21:46:23.981754
12	uT	microtesla	1e-06	2021-09-30 21:46:23.981755	2021-09-30 21:46:23.981757
13	nT	nanotesla	1e-09	2021-09-30 21:46:23.981758	2021-09-30 21:46:23.98176
14	pT	picotesla	1e-12	2021-09-30 21:46:23.981767	2021-09-30 21:46:23.981768
15	fT	femtotesla	1e-15	2021-09-30 21:46:23.98177	2021-09-30 21:46:23.981771
16	aT	attotesla	1e-18	2021-09-30 21:46:23.981773	2021-09-30 21:46:23.981774
\.


--
-- Name: anisotropy_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.anisotropy_form_id_seq', 2, true);


--
-- Name: db_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.db_user_id_seq', 1, true);


--
-- Name: field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.field_id_seq', 50, true);


--
-- Name: geometry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.geometry_id_seq', 1, true);


--
-- Name: legacy_model_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.legacy_model_info_id_seq', 1, false);


--
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.material_id_seq', 1342, true);


--
-- Name: metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.metadata_id_seq', 50, true);


--
-- Name: model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.model_id_seq', 50, true);


--
-- Name: model_materials_text_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.model_materials_text_id_seq', 50, true);


--
-- Name: model_report_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.model_report_data_id_seq', 50, true);


--
-- Name: model_run_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.model_run_data_id_seq', 50, true);


--
-- Name: neb_calculation_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.neb_calculation_type_id_seq', 1, false);


--
-- Name: neb_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.neb_id_seq', 1, false);


--
-- Name: neb_report_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.neb_report_data_id_seq', 1, false);


--
-- Name: neb_run_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.neb_run_data_id_seq', 1, false);


--
-- Name: physical_constant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.physical_constant_id_seq', 1, false);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.project_id_seq', 1, true);


--
-- Name: running_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.running_status_id_seq', 6, true);


--
-- Name: size_convention_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.size_convention_id_seq', 2, true);


--
-- Name: software_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.software_id_seq', 2, true);


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagy2
--

SELECT pg_catalog.setval('public.unit_id_seq', 16, true);


--
-- Name: anisotropy_form anisotropy_form_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.anisotropy_form
    ADD CONSTRAINT anisotropy_form_pkey PRIMARY KEY (id);


--
-- Name: db_user db_user_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.db_user
    ADD CONSTRAINT db_user_pkey PRIMARY KEY (id);


--
-- Name: field field_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.field
    ADD CONSTRAINT field_pkey PRIMARY KEY (id);


--
-- Name: geometry geometry_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT geometry_pkey PRIMARY KEY (id);


--
-- Name: legacy_model_info legacy_model_info_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.legacy_model_info
    ADD CONSTRAINT legacy_model_info_pkey PRIMARY KEY (id);


--
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- Name: metadata metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);


--
-- Name: model_field model_field_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_field
    ADD CONSTRAINT model_field_pkey PRIMARY KEY (id);


--
-- Name: model_material_association model_material_association_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_material_association
    ADD CONSTRAINT model_material_association_pkey PRIMARY KEY (model_id, material_id);


--
-- Name: model_materials_text model_materials_text_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_materials_text
    ADD CONSTRAINT model_materials_text_pkey PRIMARY KEY (id);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);


--
-- Name: model_report_data model_report_data_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_report_data
    ADD CONSTRAINT model_report_data_pkey PRIMARY KEY (id);


--
-- Name: model_run_data model_run_data_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_run_data
    ADD CONSTRAINT model_run_data_pkey PRIMARY KEY (id);


--
-- Name: neb_calculation_type neb_calculation_type_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb_calculation_type
    ADD CONSTRAINT neb_calculation_type_pkey PRIMARY KEY (id);


--
-- Name: neb_model_split neb_model_split_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb_model_split
    ADD CONSTRAINT neb_model_split_pkey PRIMARY KEY (id, neb_id, model_id);


--
-- Name: neb neb_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_pkey PRIMARY KEY (id);


--
-- Name: neb_report_data neb_report_data_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb_report_data
    ADD CONSTRAINT neb_report_data_pkey PRIMARY KEY (id);


--
-- Name: neb_run_data neb_run_data_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb_run_data
    ADD CONSTRAINT neb_run_data_pkey PRIMARY KEY (id);


--
-- Name: physical_constant physical_constant_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.physical_constant
    ADD CONSTRAINT physical_constant_pkey PRIMARY KEY (id);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: random_field random_field_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.random_field
    ADD CONSTRAINT random_field_pkey PRIMARY KEY (id);


--
-- Name: running_status running_status_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.running_status
    ADD CONSTRAINT running_status_pkey PRIMARY KEY (id);


--
-- Name: size_convention size_convention_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.size_convention
    ADD CONSTRAINT size_convention_pkey PRIMARY KEY (id);


--
-- Name: software software_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.software
    ADD CONSTRAINT software_pkey PRIMARY KEY (id);


--
-- Name: uniform_field uniform_field_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.uniform_field
    ADD CONSTRAINT uniform_field_pkey PRIMARY KEY (id);


--
-- Name: anisotropy_form uniq_anisotropy_form_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.anisotropy_form
    ADD CONSTRAINT uniq_anisotropy_form_01 UNIQUE (name);


--
-- Name: db_user uniq_db_user_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.db_user
    ADD CONSTRAINT uniq_db_user_01 UNIQUE (first_name, surname, email, telephone);


--
-- Name: db_user uniq_db_user_02; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.db_user
    ADD CONSTRAINT uniq_db_user_02 UNIQUE (user_name);


--
-- Name: geometry uniq_geometry_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT uniq_geometry_01 UNIQUE (name, size, size_unit_id);


--
-- Name: geometry uniq_geometry_02; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT uniq_geometry_02 UNIQUE (unique_id);


--
-- Name: material uniq_material_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT uniq_material_01 UNIQUE (name, temperature);


--
-- Name: model uniq_model_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT uniq_model_01 UNIQUE (unique_id);


--
-- Name: neb uniq_neb_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT uniq_neb_01 UNIQUE (unique_id);


--
-- Name: physical_constant uniq_physica_constant_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.physical_constant
    ADD CONSTRAINT uniq_physica_constant_01 UNIQUE (symbol);


--
-- Name: running_status uniq_running_status_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.running_status
    ADD CONSTRAINT uniq_running_status_01 UNIQUE (name);


--
-- Name: software uniq_software_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.software
    ADD CONSTRAINT uniq_software_01 UNIQUE (name, version);


--
-- Name: unit uniq_unit_01; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT uniq_unit_01 UNIQUE (symbol);


--
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- Name: geometry geometry_element_size_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT geometry_element_size_unit_id_fkey FOREIGN KEY (element_size_unit_id) REFERENCES public.unit(id);


--
-- Name: geometry geometry_size_convention_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT geometry_size_convention_id_fkey FOREIGN KEY (size_convention_id) REFERENCES public.size_convention(id);


--
-- Name: geometry geometry_size_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT geometry_size_unit_id_fkey FOREIGN KEY (size_unit_id) REFERENCES public.unit(id);


--
-- Name: geometry geometry_software_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT geometry_software_id_fkey FOREIGN KEY (software_id) REFERENCES public.software(id);


--
-- Name: material material_anisotropy_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_anisotropy_form_id_fkey FOREIGN KEY (anisotropy_form_id) REFERENCES public.anisotropy_form(id);


--
-- Name: metadata metadata_db_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_db_user_id_fkey FOREIGN KEY (db_user_id) REFERENCES public.db_user(id);


--
-- Name: metadata metadata_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(id);


--
-- Name: metadata metadata_software_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_software_id_fkey FOREIGN KEY (software_id) REFERENCES public.software(id);


--
-- Name: model model_external_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_external_field_id_fkey FOREIGN KEY (external_field_id) REFERENCES public.field(id);


--
-- Name: model_field model_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_field
    ADD CONSTRAINT model_field_id_fkey FOREIGN KEY (id) REFERENCES public.field(id);


--
-- Name: model_field model_field_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_field
    ADD CONSTRAINT model_field_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(id);


--
-- Name: model model_geometry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_geometry_id_fkey FOREIGN KEY (geometry_id) REFERENCES public.geometry(id);


--
-- Name: model model_legacy_model_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_legacy_model_info_id_fkey FOREIGN KEY (legacy_model_info_id) REFERENCES public.legacy_model_info(id);


--
-- Name: model_material_association model_material_association_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_material_association
    ADD CONSTRAINT model_material_association_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- Name: model_material_association model_material_association_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model_material_association
    ADD CONSTRAINT model_material_association_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(id);


--
-- Name: model model_mdata_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_mdata_id_fkey FOREIGN KEY (mdata_id) REFERENCES public.metadata(id);


--
-- Name: model model_model_materials_text_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_model_materials_text_id_fkey FOREIGN KEY (model_materials_text_id) REFERENCES public.model_materials_text(id);


--
-- Name: model model_model_report_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_model_report_data_id_fkey FOREIGN KEY (model_report_data_id) REFERENCES public.model_report_data(id);


--
-- Name: model model_model_run_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_model_run_data_id_fkey FOREIGN KEY (model_run_data_id) REFERENCES public.model_run_data(id);


--
-- Name: model model_running_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_running_status_id_fkey FOREIGN KEY (running_status_id) REFERENCES public.running_status(id);


--
-- Name: model model_start_magnetization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_start_magnetization_id_fkey FOREIGN KEY (start_magnetization_id) REFERENCES public.field(id);


--
-- Name: neb neb_end_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_end_model_id_fkey FOREIGN KEY (end_model_id) REFERENCES public.model(id);


--
-- Name: neb neb_external_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_external_field_id_fkey FOREIGN KEY (external_field_id) REFERENCES public.field(id);


--
-- Name: neb neb_mdata_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_mdata_id_fkey FOREIGN KEY (mdata_id) REFERENCES public.metadata(id);


--
-- Name: neb_model_split neb_model_split_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb_model_split
    ADD CONSTRAINT neb_model_split_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(id);


--
-- Name: neb_model_split neb_model_split_neb_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb_model_split
    ADD CONSTRAINT neb_model_split_neb_id_fkey FOREIGN KEY (neb_id) REFERENCES public.neb(id);


--
-- Name: neb neb_neb_calculation_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_neb_calculation_type_id_fkey FOREIGN KEY (neb_calculation_type_id) REFERENCES public.neb_calculation_type(id);


--
-- Name: neb neb_neb_report_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_neb_report_data_id_fkey FOREIGN KEY (neb_report_data_id) REFERENCES public.neb_report_data(id);


--
-- Name: neb neb_neb_run_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_neb_run_data_id_fkey FOREIGN KEY (neb_run_data_id) REFERENCES public.neb_run_data(id);


--
-- Name: neb neb_parent_neb_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_parent_neb_id_fkey FOREIGN KEY (parent_neb_id) REFERENCES public.neb(id);


--
-- Name: neb neb_running_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_running_status_id_fkey FOREIGN KEY (running_status_id) REFERENCES public.running_status(id);


--
-- Name: neb neb_start_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.neb
    ADD CONSTRAINT neb_start_model_id_fkey FOREIGN KEY (start_model_id) REFERENCES public.model(id);


--
-- Name: random_field random_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.random_field
    ADD CONSTRAINT random_field_id_fkey FOREIGN KEY (id) REFERENCES public.field(id);


--
-- Name: uniform_field uniform_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.uniform_field
    ADD CONSTRAINT uniform_field_id_fkey FOREIGN KEY (id) REFERENCES public.field(id);


--
-- Name: uniform_field uniform_field_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lnagy2
--

ALTER TABLE ONLY public.uniform_field
    ADD CONSTRAINT uniform_field_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- PostgreSQL database dump complete
--

