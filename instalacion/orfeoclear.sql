--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: concat(text, text); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION concat(text, text) RETURNS text
    LANGUAGE sql
    AS $_$select case when $1 = '' then $2 else ($1 || ', ' || $2) end$_$;


ALTER FUNCTION public.concat(text, text) OWNER TO admin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE usuario (
    usua_codi numeric(10,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_login character varying(50) NOT NULL,
    usua_fech_crea date,
    usua_pasw character varying(35) NOT NULL,
    usua_esta character varying(10) NOT NULL,
    usua_nomb character varying(45),
    perm_radi character(1) DEFAULT 0,
    usua_admin character(1) DEFAULT 0,
    usua_nuevo character(1) DEFAULT 0,
    usua_doc character varying(14) DEFAULT 0,
    codi_nivel numeric(2,0) DEFAULT 1,
    usua_sesion character varying(30),
    usua_fech_sesion date,
    usua_ext numeric(4,0),
    usua_nacim date,
    usua_email character varying(50),
    usua_at character varying(50),
    usua_piso numeric(2,0),
    perm_radi_sal numeric DEFAULT 0,
    usua_admin_archivo numeric(1,0) DEFAULT 0,
    usua_masiva numeric(1,0) DEFAULT 0,
    usua_perm_dev numeric(1,0) DEFAULT 0,
    usua_perm_numera_res character varying(1),
    usua_doc_suip character varying(15),
    usua_perm_numeradoc numeric(1,0),
    sgd_panu_codi numeric(4,0),
    usua_prad_tp1 numeric(1,0) DEFAULT 0,
    usua_prad_tp2 numeric(1,0) DEFAULT 0,
    usua_perm_envios numeric(1,0) DEFAULT 0,
    usua_perm_modifica numeric(1,0) DEFAULT 0,
    usua_perm_impresion numeric(1,0) DEFAULT 0,
    sgd_aper_codigo numeric(2,0),
    usu_telefono1 character varying(14),
    usua_encuesta character varying(1),
    sgd_perm_estadistica numeric(2,0),
    usua_perm_sancionados numeric(1,0),
    usua_admin_sistema numeric(1,0),
    usua_perm_trd numeric(1,0),
    usua_perm_firma numeric(1,0),
    usua_perm_prestamo numeric(1,0),
    usuario_publico numeric(1,0),
    usuario_reasignar numeric(1,0),
    usua_perm_notifica numeric(1,0),
    usua_perm_expediente numeric,
    usua_login_externo character varying(15),
    id_pais numeric(4,0) DEFAULT 170,
    id_cont numeric(2,0) DEFAULT 1,
    usua_auth_ldap numeric(1,0) DEFAULT 0,
    perm_archi character(1) DEFAULT 1,
    perm_vobo character(1) DEFAULT 1,
    perm_borrar_anexo numeric(1,0),
    perm_tipif_anexo numeric(1,0),
    usua_perm_adminflujos numeric(1,0) DEFAULT 0 NOT NULL,
    usua_exp_trd numeric(2,0) DEFAULT 0,
    usua_perm_rademail smallint,
    usua_perm_accesi numeric(1,0) DEFAULT 0,
    usua_perm_agrcontacto numeric(1,0) DEFAULT 0,
    usua_prad_tp4 smallint,
    usua_prad_tp3 smallint,
    usua_prad_tp5 smallint
);


ALTER TABLE public.usuario OWNER TO orfeousr;

--
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE usuario IS 'USUARIO';


--
-- Name: COLUMN usuario.usua_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_codi IS 'CODIGO DE USUARIO';


--
-- Name: COLUMN usuario.depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.depe_codi IS 'DEPE_CODI';


--
-- Name: COLUMN usuario.usua_login; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_login IS 'LOGIN USUARIO';


--
-- Name: COLUMN usuario.usua_fech_crea; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_fech_crea IS 'FECHA DE CREACION DEL USUARIO';


--
-- Name: COLUMN usuario.usua_pasw; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_pasw IS 'USUA_PASW';


--
-- Name: COLUMN usuario.usua_esta; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_esta IS 'ESTADO DEL USUARIO - Activo o No (1/0)';


--
-- Name: COLUMN usuario.usua_nomb; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_nomb IS 'NOMBRE DEL USUARIO';


--
-- Name: COLUMN usuario.perm_radi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.perm_radi IS 'Permiso para digitalizacion de documentos: 1 permiso asignado';


--
-- Name: COLUMN usuario.usua_admin; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_admin IS 'Prestamo de documentos fisicos: 0 sin permiso -  1 permiso asignado ';


--
-- Name: COLUMN usuario.usua_nuevo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_nuevo IS 'Usuario Nuevo ? Si esta en ''0'' resetea la contrase?a';


--
-- Name: COLUMN usuario.usua_doc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_doc IS 'No. de Documento de Identificacion. ';


--
-- Name: COLUMN usuario.codi_nivel; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.codi_nivel IS 'Nivel del Usuario';


--
-- Name: COLUMN usuario.usua_sesion; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_sesion IS 'Sesion Actual del usuario o Ultima fecha que entro.';


--
-- Name: COLUMN usuario.usua_fech_sesion; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_fech_sesion IS 'Fecha de Actual de la session o Ultima Fecha.';


--
-- Name: COLUMN usuario.usua_ext; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_ext IS 'Numero de extension del usuario';


--
-- Name: COLUMN usuario.usua_nacim; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_nacim IS 'Fecha Nacimiento';


--
-- Name: COLUMN usuario.usua_email; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_email IS 'Mail';


--
-- Name: COLUMN usuario.usua_at; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_at IS 'Nombre del Equipo';


--
-- Name: COLUMN usuario.usua_piso; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_piso IS 'Piso en el que se encuentra laborando';


--
-- Name: COLUMN usuario.usua_admin_archivo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_admin_archivo IS 'Administrador de Archivo (Expedientes): 0 sin permiso - 1 permiso asignado ';


--
-- Name: COLUMN usuario.usua_masiva; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_masiva IS 'Permiso de radicacion masiva de documentos';


--
-- Name: COLUMN usuario.usua_perm_dev; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_perm_dev IS 'Devoluciones de correo (Dev_correo): 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.sgd_panu_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.sgd_panu_codi IS 'Permisos de anulacion de radicados: 1 - Permiso de solicitud de anulado 2- Permiso de anulacion y generacion de actas 3- Permiso 1 y 2';


--
-- Name: COLUMN usuario.usua_prad_tp1; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_prad_tp1 IS 'Si esta en ''1'' El usuario Tiene Permisos de radicacicion Tipo 1.  En nuestro caso de salida';


--
-- Name: COLUMN usuario.usua_prad_tp2; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_prad_tp2 IS 'Si esta en ''2'' El usuario Tiene Permisos de radicacicion Tipo 2.  En nuestro caso de Entrada';


--
-- Name: COLUMN usuario.usua_perm_envios; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_perm_envios IS 'Envios de correo (correspondencia): 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.usua_perm_modifica; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_perm_modifica IS 'Permiso de modificar Radicados';


--
-- Name: COLUMN usuario.usua_perm_impresion; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_perm_impresion IS 'Carpeta de impresion: 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.sgd_perm_estadistica; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.sgd_perm_estadistica IS 'Si tiene ''1'' tiene permisos como jefe para ver las estadisticas de la dependencia.';


--
-- Name: COLUMN usuario.usua_admin_sistema; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_admin_sistema IS 'Administrador del sistema : 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.usua_perm_trd; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_perm_trd IS 'Usuario Administracion de tablas de retencion documental : 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.usua_perm_prestamo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_perm_prestamo IS 'Indica si un usuario tiene o no permiso de acceso al modulo de prestamo. Segun su valor:

Tiene permiso

(0) No tiene permiso';


--
-- Name: COLUMN usuario.perm_borrar_anexo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.perm_borrar_anexo IS 'Indica si un usuario tiene (1) o no (0) permiso para tipificar anexos .tif';


--
-- Name: COLUMN usuario.perm_tipif_anexo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.perm_tipif_anexo IS 'Indica si un usuario tiene (1)  o no (0) permiso para tipificar anexos .tif';


--
-- Name: COLUMN usuario.usua_perm_rademail; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_perm_rademail IS 'Permiso de radicacion de email';


--
-- Name: COLUMN usuario.usua_perm_accesi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_perm_accesi IS 'Permiso para  compatbilidad uso de lector de pantalla';


--
-- Name: COLUMN usuario.usua_perm_agrcontacto; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN usuario.usua_perm_agrcontacto IS 'permiso para agregar contactos formualrio rad';


--
-- Name: V_USUARIO; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW "V_USUARIO" AS
    SELECT usuario.usua_codi, usuario.usua_nomb, usuario.usua_login, usuario.depe_codi FROM usuario;


ALTER TABLE public."V_USUARIO" OWNER TO admin;

--
-- Name: anexos; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE anexos (
    anex_radi_nume character varying(15) NOT NULL,
    anex_codigo character varying(20) NOT NULL,
    anex_tipo numeric(4,0) NOT NULL,
    anex_tamano numeric,
    anex_solo_lect character varying(1) NOT NULL,
    anex_creador character varying(50) NOT NULL,
    anex_desc character varying(512),
    anex_numero numeric(5,0) NOT NULL,
    anex_nomb_archivo character varying(50) NOT NULL,
    anex_borrado character varying(1) NOT NULL,
    anex_origen numeric(1,0) DEFAULT 0,
    anex_ubic character varying(15),
    anex_salida numeric(1,0) DEFAULT 0,
    radi_nume_salida character varying(15),
    anex_radi_fech timestamp with time zone,
    anex_estado numeric(1,0) DEFAULT 0,
    usua_doc character varying(14),
    sgd_rem_destino numeric(1,0) DEFAULT 0,
    anex_fech_envio timestamp with time zone,
    sgd_dir_tipo numeric(4,0),
    anex_fech_impres timestamp with time zone,
    anex_depe_creador character varying(5),
    sgd_doc_secuencia numeric(15,0),
    sgd_doc_padre character varying(20),
    sgd_arg_codigo numeric(2,0),
    sgd_tpr_codigo numeric(4,0),
    sgd_deve_codigo numeric(2,0),
    sgd_deve_fech date,
    sgd_fech_impres timestamp without time zone,
    anex_fech_anex timestamp with time zone,
    anex_depe_codi character varying(5),
    sgd_pnufe_codi numeric(4,0),
    sgd_dnufe_codi numeric(4,0),
    anex_usudoc_creador character varying(15),
    sgd_fech_doc date,
    sgd_apli_codi numeric(4,0),
    sgd_trad_codigo numeric(2,0),
    sgd_dir_direccion character varying(150),
    sgd_exp_numero character varying(18),
    numero_doc character varying(15),
    sgd_srd_codigo character varying(3),
    sgd_sbrd_codigo character varying(4),
    anex_num_hoja numeric,
    texto_archivo_anex text,
    anex_idarch_version numeric(3,0),
    anex_num_version numeric(2,0)
);


ALTER TABLE public.anexos OWNER TO orfeousr;

--
-- Name: COLUMN anexos.numero_doc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN anexos.numero_doc IS 'Numero de documento';


--
-- Name: COLUMN anexos.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN anexos.sgd_srd_codigo IS 'Serie';


--
-- Name: COLUMN anexos.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN anexos.sgd_sbrd_codigo IS 'Subserie';


--
-- Name: COLUMN anexos.anex_idarch_version; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN anexos.anex_idarch_version IS 'Id del archivo de versión';


--
-- Name: COLUMN anexos.anex_num_version; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN anexos.anex_num_version IS 'Numero de versión del anexo';


--
-- Name: anexos_historico; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE anexos_historico (
    anex_hist_anex_codi character varying(20) NOT NULL,
    anex_hist_num_ver numeric(4,0) NOT NULL,
    anex_hist_tipo_mod character varying(2) NOT NULL,
    anex_hist_usua character varying(15) NOT NULL,
    anex_hist_fecha date NOT NULL,
    usua_doc character varying(14)
);


ALTER TABLE public.anexos_historico OWNER TO orfeousr;

--
-- Name: anexos_tipo; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE anexos_tipo (
    anex_tipo_codi numeric(4,0) NOT NULL,
    anex_tipo_ext character varying(10) NOT NULL,
    anex_tipo_desc character varying(50)
);


ALTER TABLE public.anexos_tipo OWNER TO orfeousr;

--
-- Name: aux_01; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE aux_01 (
    r numeric
);


ALTER TABLE public.aux_01 OWNER TO orfeousr;

--
-- Name: bodega_empresas; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE bodega_empresas (
    nombre_de_la_empresa character varying(300),
    nuir character varying(13),
    nit_de_la_empresa character varying(80),
    sigla_de_la_empresa character varying(80),
    direccion character varying(4000),
    codigo_del_departamento character varying(4000),
    codigo_del_municipio character varying(4000),
    telefono_1 character varying(4000),
    telefono_2 character varying(4000),
    email character varying(4000),
    nombre_rep_legal character varying(4000),
    cargo_rep_legal character varying(4000),
    identificador_empresa numeric(5,0) NOT NULL,
    are_esp_secue numeric(8,0) NOT NULL,
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    activa numeric(1,0) DEFAULT 1,
    flag_rups character varying(10),
    codigo_suscriptor character varying(50)
);


ALTER TABLE public.bodega_empresas OWNER TO orfeousr;

--
-- Name: COLUMN bodega_empresas.codigo_suscriptor; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN bodega_empresas.codigo_suscriptor IS 'Codigo del suscriptor';


--
-- Name: bodega_empresas_old; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE bodega_empresas_old (
    identificador_de_la_empresa numeric(5,0) NOT NULL,
    nuir character varying(13),
    nombre_de_la_empresa character varying(150),
    nit_de_la_empresa character varying(13),
    sigla_de_la_empresa character varying(30),
    codigo_de_la_nat_juridica numeric(2,0),
    direccion character varying(50),
    codigo_del_departamento numeric(2,0),
    codigo_del_municipio numeric(3,0),
    codigo_de_la_unidad numeric(3,0),
    telefono_1 character varying(15),
    telefono_2 character varying(15),
    telefono_3 character varying(15),
    apartado_aereo numeric(10,0),
    numero_de_fax character varying(15),
    zona_postal numeric(3,0),
    email character varying(50),
    tiene_contab_por_servicio character varying(2),
    fecha_de_actualizacion date,
    codigo_regional numeric(3,0),
    estado_de_la_empresa character varying(50),
    fecha_del_estado date,
    obsv_del_estado character varying(100),
    esp_cias numeric(4,0),
    esp_auxi numeric(8,0),
    esp_etco numeric(2,0),
    esp_ceco character varying(16),
    estado numeric(2,0),
    tipo_identificacion_repl character varying(1),
    numero_identificaci_repl character varying(11),
    nombre_rep_legal character varying(75),
    cargo_rep_legal numeric(2,0),
    numero_camara_ccio character varying(20),
    cod_estado_vigilancia numeric(2,0),
    identificador_empresa numeric(5,0) NOT NULL,
    nombre_de_la_empresa_anterior character varying(150),
    direccion_anterior character varying(50)
);


ALTER TABLE public.bodega_empresas_old OWNER TO orfeousr;

--
-- Name: borrar_carpeta_personalizada; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE borrar_carpeta_personalizada (
    carp_per_codi numeric(2,0) NOT NULL,
    carp_per_usu character varying(15) NOT NULL,
    carp_per_desc character varying(80) NOT NULL
);


ALTER TABLE public.borrar_carpeta_personalizada OWNER TO orfeousr;

--
-- Name: borrar_empresa_esp; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE borrar_empresa_esp (
    eesp_codi numeric(7,0) NOT NULL,
    eesp_nomb character varying(150) NOT NULL,
    essp_nit character varying(13),
    essp_sigla character varying(30),
    depe_codi character varying(5),
    muni_codi numeric(4,0),
    eesp_dire character varying(50),
    eesp_rep_leg character varying(75)
);


ALTER TABLE public.borrar_empresa_esp OWNER TO orfeousr;

--
-- Name: TABLE borrar_empresa_esp; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE borrar_empresa_esp IS 'EMPRESA_ESP';


--
-- Name: COLUMN borrar_empresa_esp.eesp_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN borrar_empresa_esp.eesp_codi IS 'CODGO DE EMPRESA DE SERVICIOS PUBLICOS';


--
-- Name: COLUMN borrar_empresa_esp.eesp_nomb; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN borrar_empresa_esp.eesp_nomb IS 'NOMBRE DE EMPRESA';


--
-- Name: COLUMN borrar_empresa_esp.essp_nit; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN borrar_empresa_esp.essp_nit IS 'ESSP_NIT';


--
-- Name: COLUMN borrar_empresa_esp.essp_sigla; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN borrar_empresa_esp.essp_sigla IS 'ESSP_SIGLA';


--
-- Name: COLUMN borrar_empresa_esp.depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN borrar_empresa_esp.depe_codi IS 'DEPE_CODI';


--
-- Name: COLUMN borrar_empresa_esp.muni_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN borrar_empresa_esp.muni_codi IS 'MUNI_CODI';


--
-- Name: carpeta; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE carpeta (
    carp_codi numeric(2,0) NOT NULL,
    carp_desc character varying(80) NOT NULL
);


ALTER TABLE public.carpeta OWNER TO orfeousr;

--
-- Name: TABLE carpeta; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE carpeta IS 'CARPETA';


--
-- Name: COLUMN carpeta.carp_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN carpeta.carp_codi IS 'CARP_CODI';


--
-- Name: COLUMN carpeta.carp_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN carpeta.carp_desc IS 'CARP_DESC';


--
-- Name: carpeta_per; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE carpeta_per (
    usua_codi numeric(3,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    nomb_carp character varying(15),
    desc_carp character varying(50),
    codi_carp numeric(3,0) DEFAULT 99
);


ALTER TABLE public.carpeta_per OWNER TO orfeousr;

--
-- Name: centro_poblado; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE centro_poblado (
    cpob_codi numeric(4,0) NOT NULL,
    muni_codi numeric(4,0) NOT NULL,
    dpto_codi numeric(2,0) NOT NULL,
    cpob_nomb character varying(100) NOT NULL,
    cpob_nomb_anterior character varying(100)
);


ALTER TABLE public.centro_poblado OWNER TO orfeousr;

--
-- Name: TABLE centro_poblado; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE centro_poblado IS 'CENTRO_POBLADO';


--
-- Name: COLUMN centro_poblado.cpob_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN centro_poblado.cpob_codi IS 'CPOB_CODI';


--
-- Name: COLUMN centro_poblado.muni_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN centro_poblado.muni_codi IS 'MUNI_CODI';


--
-- Name: COLUMN centro_poblado.dpto_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN centro_poblado.dpto_codi IS 'DPTO_CODI';


--
-- Name: COLUMN centro_poblado.cpob_nomb; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN centro_poblado.cpob_nomb IS 'CPOB_NOMB';


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE departamento (
    dpto_codi numeric(3,0) NOT NULL,
    dpto_nomb character varying(70) NOT NULL,
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170
);


ALTER TABLE public.departamento OWNER TO orfeousr;

--
-- Name: TABLE departamento; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE departamento IS 'DEPARTAMENTO';


--
-- Name: COLUMN departamento.dpto_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN departamento.dpto_codi IS 'DPTO_CODI';


--
-- Name: COLUMN departamento.dpto_nomb; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN departamento.dpto_nomb IS 'DPTO_NOMB';


--
-- Name: dependencia; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE dependencia (
    depe_codi character varying(5) NOT NULL,
    depe_nomb character varying(70) NOT NULL,
    dpto_codi numeric(2,0),
    depe_codi_padre character varying(5),
    muni_codi numeric(4,0),
    depe_codi_territorial character varying(5),
    dep_sigla character varying(100),
    dep_central numeric(1,0),
    dep_direccion character varying(100),
    depe_num_interna numeric(4,0),
    depe_num_resolucion numeric(4,0),
    depe_rad_tp1 character varying(5),
    depe_rad_tp2 character varying(5),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    depe_estado numeric(1,0) DEFAULT 0,
    depe_segu numeric(1,0),
    depe_rad_tp4 character varying(5),
    depe_rad_tp3 character varying(5),
    depe_rad_tp5 character varying(5)
);


ALTER TABLE public.dependencia OWNER TO orfeousr;

--
-- Name: TABLE dependencia; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE dependencia IS 'DEPENDENCIA';


--
-- Name: COLUMN dependencia.depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN dependencia.depe_codi IS 'CODIGO DE DEPENDENCIA';


--
-- Name: COLUMN dependencia.depe_nomb; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN dependencia.depe_nomb IS 'NOMBRE DE DEPENDENCIA';


--
-- Name: COLUMN dependencia.dep_sigla; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN dependencia.dep_sigla IS 'SIGLA DE LA DEPENDENCIA';


--
-- Name: COLUMN dependencia.dep_central; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN dependencia.dep_central IS 'INDICA SI SE TRATA DE UNA DEPENDENCIA DEL NIVEL CENTRAL';


--
-- Name: COLUMN dependencia.depe_segu; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN dependencia.depe_segu IS 'Guarda valor que identifica que la dependencia tenga seguridad o no en la consulta de radicados ';


--
-- Name: dependencia_visibilidad; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE dependencia_visibilidad (
    codigo_visibilidad numeric(18,0) NOT NULL,
    dependencia_visible character varying(5) NOT NULL,
    dependencia_observa character varying(5) NOT NULL
);


ALTER TABLE public.dependencia_visibilidad OWNER TO orfeousr;

--
-- Name: dependencias; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE dependencias
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999
    CACHE 1;


ALTER TABLE public.dependencias OWNER TO orfeousr;

--
-- Name: dup_eliminar; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE dup_eliminar (
    sgd_oem_codigo numeric(8,0) NOT NULL,
    tdid_codi numeric(2,0),
    sgd_oem_oempresa character varying(150),
    sgd_oem_rep_legal character varying(150),
    sgd_oem_nit character varying(14),
    sgd_oem_sigla character varying(50),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_oem_direccion character varying(100),
    sgd_oem_telefono character varying(50)
);


ALTER TABLE public.dup_eliminar OWNER TO orfeousr;

--
-- Name: emp_cod_actualizar; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE emp_cod_actualizar (
    emp_cod_ant character varying(10),
    emp_cod_nue character varying(10)
);


ALTER TABLE public.emp_cod_actualizar OWNER TO orfeousr;

--
-- Name: empresas_temporal; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE empresas_temporal (
    nombre_de_la_empresa character varying(160),
    nuir character varying(13),
    nit_de_la_empresa character varying(80),
    sigla_de_la_empresa character varying(80),
    direccion character varying(4000),
    codigo_del_departamento character varying(4000),
    codigo_del_municipio character varying(4000),
    telefono_1 character varying(4000),
    telefono_2 character varying(4000),
    email character varying(4000),
    nombre_rep_legal character varying(4000),
    cargo_rep_legal character varying(4000),
    identificador_empresa numeric(5,0),
    are_esp_secue numeric(8,0) NOT NULL
);


ALTER TABLE public.empresas_temporal OWNER TO orfeousr;

--
-- Name: encuesta; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE encuesta (
    usua_doc character varying(14) NOT NULL,
    fecha date,
    p1 character varying(100),
    p2 character varying(100),
    p3 character varying(100),
    p4 character varying(100),
    p5 character varying(100),
    p6 character varying(100),
    p7 character varying(100),
    p7_cual character varying(150),
    p8 character varying(100),
    p9 character varying(100),
    p10 character varying(100),
    p11 character varying(100),
    p12 character varying(100),
    p13 character varying(100),
    p14 character varying(100),
    p15 character varying(100),
    p16 character varying(100),
    p17 character varying(100),
    p18 character varying(100),
    p19 character varying(100),
    p20 character varying(100),
    p20_cual character varying(150),
    p21 character varying(100),
    p22 character varying(100),
    p23 character varying(100),
    p24 character varying(100),
    p25 character varying(100)
);


ALTER TABLE public.encuesta OWNER TO orfeousr;

--
-- Name: entidades_asociativa; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE entidades_asociativa (
    nit character varying(12),
    codentidad numeric(10,0)
);


ALTER TABLE public.entidades_asociativa OWNER TO orfeousr;

--
-- Name: estado; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE estado (
    esta_codi numeric(2,0) NOT NULL,
    esta_desc character varying(100) NOT NULL
);


ALTER TABLE public.estado OWNER TO orfeousr;

--
-- Name: TABLE estado; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE estado IS 'ESTADO';


--
-- Name: COLUMN estado.esta_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN estado.esta_codi IS 'ESTA_CODI';


--
-- Name: COLUMN estado.esta_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN estado.esta_desc IS 'ESTA_DESC';


--
-- Name: example; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE example (
    campo1 numeric(15,0) NOT NULL,
    campo2 character varying(10)
);


ALTER TABLE public.example OWNER TO orfeousr;

--
-- Name: fun_funcionario; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE fun_funcionario (
    usua_doc character varying(14),
    usua_fech_crea date NOT NULL,
    usua_esta character varying(10) NOT NULL,
    usua_nomb character varying(45),
    usua_ext numeric(4,0),
    usua_nacim date,
    usua_email character varying(50),
    usua_at character varying(15),
    usua_piso numeric(2,0),
    cedula_ok character(1) DEFAULT 'n'::bpchar,
    cedula_suip character varying(15),
    nombre_suip character varying(45),
    observa character(20)
);


ALTER TABLE public.fun_funcionario OWNER TO orfeousr;

--
-- Name: fun_funcionario_2; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE fun_funcionario_2 (
    usua_doc character varying(14),
    usua_fech_crea date NOT NULL,
    usua_esta character varying(10) NOT NULL,
    usua_nomb character varying(45),
    usua_ext numeric(4,0),
    usua_nacim date,
    usua_email character varying(50),
    usua_at character varying(15),
    usua_piso numeric(2,0),
    cedula_ok character(1),
    cedula_suip character varying(15),
    nombre_suip character varying(45),
    observa character(20)
);


ALTER TABLE public.fun_funcionario_2 OWNER TO orfeousr;

--
-- Name: hist_eventos; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE hist_eventos (
    depe_codi character varying(5) NOT NULL,
    hist_fech timestamp with time zone NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    hist_obse character varying(10000) NOT NULL,
    usua_codi_dest numeric(10,0),
    usua_doc character varying(14),
    usua_doc_old character varying(15),
    sgd_ttr_codigo numeric(3,0),
    hist_usua_autor character varying(14),
    hist_doc_dest character varying(14),
    depe_codi_dest character varying(5)
);


ALTER TABLE public.hist_eventos OWNER TO orfeousr;

--
-- Name: TABLE hist_eventos; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE hist_eventos IS 'HIST_EVENTOS';


--
-- Name: COLUMN hist_eventos.depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN hist_eventos.depe_codi IS 'DEPE_CODI';


--
-- Name: COLUMN hist_eventos.hist_fech; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN hist_eventos.hist_fech IS 'HIST_FECH';


--
-- Name: COLUMN hist_eventos.usua_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN hist_eventos.usua_codi IS 'USUA_CODI';


--
-- Name: COLUMN hist_eventos.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN hist_eventos.radi_nume_radi IS 'Numero de Radicado';


--
-- Name: COLUMN hist_eventos.hist_obse; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN hist_eventos.hist_obse IS 'HIST_OBSE';


--
-- Name: COLUMN hist_eventos.usua_codi_dest; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN hist_eventos.usua_codi_dest IS 'Codigo del usuario destino.';


--
-- Name: COLUMN hist_eventos.sgd_ttr_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN hist_eventos.sgd_ttr_codigo IS 'Tipo de Evento';


--
-- Name: COLUMN hist_eventos.hist_doc_dest; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN hist_eventos.hist_doc_dest IS 'Documento del usuario destino No. implentado';


--
-- Name: COLUMN hist_eventos.depe_codi_dest; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN hist_eventos.depe_codi_dest IS 'Codigo de la dependencia del usuario destino';


--
-- Name: informados; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE informados (
    radi_nume_radi character varying(15) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    info_desc character varying(600),
    info_fech date NOT NULL,
    info_leido numeric(1,0) DEFAULT 0,
    usua_codi_info numeric(3,0),
    info_codi numeric(10,0),
    usua_doc character varying(14),
    info_resp character varying(10)
);


ALTER TABLE public.informados OWNER TO orfeousr;

--
-- Name: COLUMN informados.usua_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN informados.usua_codi IS 'Codigo de usuario';


--
-- Name: COLUMN informados.info_resp; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN informados.info_resp IS 'Indica si el informado necesita respuesta.';


--
-- Name: medio_recepcion; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE medio_recepcion (
    mrec_codi numeric(2,0) NOT NULL,
    mrec_desc character varying(100) NOT NULL
);


ALTER TABLE public.medio_recepcion OWNER TO orfeousr;

--
-- Name: TABLE medio_recepcion; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE medio_recepcion IS 'MEDIO_RECEPCION';


--
-- Name: COLUMN medio_recepcion.mrec_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN medio_recepcion.mrec_codi IS 'CODIGO DE MEDIO DE RECEPCION';


--
-- Name: COLUMN medio_recepcion.mrec_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN medio_recepcion.mrec_desc IS 'DESCRIPCION DEL MEDIO';


--
-- Name: municipio; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE municipio (
    muni_codi numeric(4,0) NOT NULL,
    dpto_codi numeric(3,0) NOT NULL,
    muni_nomb character varying(100) NOT NULL,
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    homologa_muni character varying(10),
    homologa_idmuni character varying(15),
    activa numeric(1,0) DEFAULT 1
);


ALTER TABLE public.municipio OWNER TO orfeousr;

--
-- Name: TABLE municipio; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE municipio IS 'MUNICIPIO';


--
-- Name: COLUMN municipio.muni_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN municipio.muni_codi IS 'MUNI_CODI';


--
-- Name: COLUMN municipio.dpto_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN municipio.dpto_codi IS 'DPTO_CODI';


--
-- Name: COLUMN municipio.muni_nomb; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN municipio.muni_nomb IS 'MUNI_NOMB';


--
-- Name: num_resol_dtc; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE num_resol_dtc
    START WITH 24
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.num_resol_dtc OWNER TO orfeousr;

--
-- Name: num_resol_dtn; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE num_resol_dtn
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dtn OWNER TO orfeousr;

--
-- Name: num_resol_dtoc; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE num_resol_dtoc
    START WITH 21
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dtoc OWNER TO orfeousr;

--
-- Name: num_resol_dtor; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE num_resol_dtor
    START WITH 61
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dtor OWNER TO orfeousr;

--
-- Name: num_resol_dts; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE num_resol_dts
    START WITH 61
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dts OWNER TO orfeousr;

--
-- Name: num_resol_gral; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE num_resol_gral
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 20;


ALTER TABLE public.num_resol_gral OWNER TO orfeousr;

--
-- Name: ortega_prueba_orfeo; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE ortega_prueba_orfeo (
    radi_nume_hoja numeric(3,0),
    radi_fech_radi date,
    radi_nume_radi character varying(15),
    ra_asun character varying(350),
    radi_path character varying(100),
    radi_usu_ante character varying(45),
    nombre_de_la_empresa character varying(150),
    fecha character varying(20),
    sgd_tpr_descrip character varying(150),
    sgd_tpr_codigo numeric(4,0),
    sgd_tpr_termino numeric(4,0),
    diasr numeric(4,0),
    radi_leido numeric(1,0),
    radi_tipo_deri numeric(2,0),
    radi_nume_deri character varying(15),
    sgd_ciu_nombre character varying(50),
    sgd_ciu_apell1 character varying(50),
    sgd_ciu_apell2 character varying(50),
    tipo_query character varying(50),
    sgd_dir_tipo numeric(4,0),
    sgd_dir_nombre character varying(60),
    radi_cuentai character varying(20),
    sgd_exp_numero character varying(15)
);


ALTER TABLE public.ortega_prueba_orfeo OWNER TO orfeousr;

--
-- Name: par_serv_servicios; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE par_serv_servicios (
    par_serv_secue numeric(8,0) NOT NULL,
    par_serv_codigo character varying(5),
    par_serv_nombre character varying(100),
    par_serv_estado character varying(1)
);


ALTER TABLE public.par_serv_servicios OWNER TO orfeousr;

--
-- Name: pl_generado_plg; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE pl_generado_plg (
    depe_codi character varying(5),
    radi_nume_radi character varying(15),
    plt_codi numeric(4,0),
    plg_codi numeric(4,0),
    plg_comentarios character varying(150),
    plg_analiza numeric(10,0),
    plg_firma numeric(10,0),
    plg_autoriza numeric(10,0),
    plg_imprime numeric(10,0),
    plg_envia numeric(10,0),
    plg_archivo_tmp character varying(150),
    plg_archivo_final character varying(150),
    plg_nombre character varying(30),
    plg_crea numeric(10,0) DEFAULT 0,
    plg_autoriza_fech date,
    plg_imprime_fech date,
    plg_envia_fech date,
    plg_crea_fech date,
    plg_creador character varying(20),
    pl_codi numeric(4,0),
    usua_doc character varying(14),
    sgd_rem_destino numeric(1,0) DEFAULT 0,
    radi_nume_sal character varying(15) DEFAULT 0
);


ALTER TABLE public.pl_generado_plg OWNER TO orfeousr;

--
-- Name: pl_tipo_plt; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE pl_tipo_plt (
    plt_codi numeric(4,0) NOT NULL,
    plt_desc character varying(35)
);


ALTER TABLE public.pl_tipo_plt OWNER TO orfeousr;

--
-- Name: plan_table; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE plan_table (
    statement_id character varying(30),
    "timestamp" date,
    remarks character varying(80),
    operation character varying(30),
    options character varying(30),
    object_node character varying(128),
    object_owner character varying(30),
    object_name character varying(30),
    object_instance integer,
    object_type character varying(30),
    optimizer character varying(255),
    search_columns numeric,
    id integer,
    parent_id integer,
    "position" integer,
    cost integer,
    cardinality integer,
    s integer,
    other_tag character varying(255),
    partition_start character varying(255),
    partition_stop character varying(255),
    partition_id integer,
    other character varying(255),
    distribution character varying(30)
);


ALTER TABLE public.plan_table OWNER TO orfeousr;

--
-- Name: plantilla_pl; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE plantilla_pl (
    pl_codi numeric(4,0) NOT NULL,
    depe_codi character varying(5),
    pl_nomb character varying(35),
    pl_archivo character varying(35),
    pl_desc character varying(150),
    pl_fech date,
    usua_codi numeric(10,0),
    pl_uso numeric(1,0) DEFAULT 0
);


ALTER TABLE public.plantilla_pl OWNER TO orfeousr;

--
-- Name: plsql_profiler_data; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE plsql_profiler_data (
    runid numeric,
    unit_numeric numeric,
    line numeric NOT NULL,
    total_occur numeric,
    total_time numeric,
    min_time numeric,
    max_time numeric,
    spare1 numeric,
    spare2 numeric,
    spare3 numeric,
    spare4 numeric
);


ALTER TABLE public.plsql_profiler_data OWNER TO orfeousr;

--
-- Name: plsql_profiler_runnumeric; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE plsql_profiler_runnumeric
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.plsql_profiler_runnumeric OWNER TO orfeousr;

--
-- Name: plsql_profiler_runs; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE plsql_profiler_runs (
    runid numeric,
    related_run numeric,
    run_owner character varying(32),
    run_date date,
    run_comment character varying(2047),
    run_total_time numeric,
    run_system_info character varying(2047),
    run_comment1 character varying(2047),
    spare1 character varying(256)
);


ALTER TABLE public.plsql_profiler_runs OWNER TO orfeousr;

--
-- Name: plsql_profiler_units; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE plsql_profiler_units (
    runid numeric,
    unit_numeric numeric,
    unit_type character varying(32),
    unit_owner character varying(32),
    unit_name character varying(32),
    unit_timestamp date,
    total_time numeric DEFAULT 0 NOT NULL,
    spare1 numeric,
    spare2 numeric
);


ALTER TABLE public.plsql_profiler_units OWNER TO orfeousr;

--
-- Name: pres_seq; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE pres_seq
    START WITH 30392
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.pres_seq OWNER TO orfeousr;

--
-- Name: prestamo; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE prestamo (
    pres_id numeric(10,0) NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    usua_login_actu character varying(50) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_login_pres character varying(50),
    pres_desc character varying(200),
    pres_fech_pres timestamp without time zone,
    pres_fech_devo timestamp without time zone,
    pres_fech_pedi timestamp without time zone NOT NULL,
    pres_estado numeric(2,0),
    pres_requerimiento numeric(2,0),
    pres_depe_arch character varying(5),
    pres_fech_venc timestamp without time zone,
    dev_desc character varying(500),
    pres_fech_canc timestamp without time zone,
    usua_login_canc character varying(50),
    usua_login_rx character varying(50)
);


ALTER TABLE public.prestamo OWNER TO orfeousr;

--
-- Name: COLUMN prestamo.dev_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN prestamo.dev_desc IS 'Observaciones realizadas por el usuario que recibe la devolucion acerca de la cantidad, el estado, tipo o sucesos acontecidos con los documentos y anexos fisicos';


--
-- Name: COLUMN prestamo.pres_fech_canc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN prestamo.pres_fech_canc IS 'Fecha de cancelacion de la solicitud';


--
-- Name: COLUMN prestamo.usua_login_canc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN prestamo.usua_login_canc IS 'Login del usuario que cancela la solicitud';


--
-- Name: COLUMN prestamo.usua_login_rx; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN prestamo.usua_login_rx IS 'Login del usuario que recibe el documento al momento de entregar.';


--
-- Name: pruba; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE pruba (
    nombre character varying(20),
    tel character varying(20)
);


ALTER TABLE public.pruba OWNER TO orfeousr;

--
-- Name: TABLE pruba; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE pruba IS 'Almacena parametros compuestos por dos valores: identificador y valor';


--
-- Name: radicado; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE radicado (
    radi_nume_radi character varying(15) NOT NULL,
    radi_fech_radi timestamp with time zone NOT NULL,
    tdoc_codi numeric(4,0) NOT NULL,
    trte_codi numeric(2,0),
    mrec_codi numeric(2,0),
    eesp_codi numeric(10,0),
    eotra_codi numeric(10,0),
    radi_tipo_empr character varying(2),
    radi_fech_ofic date,
    tdid_codi numeric(2,0),
    radi_nume_iden character varying(15),
    radi_nomb character varying(90),
    radi_prim_apel character varying(50),
    radi_segu_apel character varying(50),
    radi_pais character varying(70),
    muni_codi numeric(5,0),
    cpob_codi numeric(4,0),
    carp_codi numeric(3,0),
    esta_codi numeric(2,0),
    dpto_codi numeric(2,0),
    cen_muni_codi numeric(4,0),
    cen_dpto_codi numeric(2,0),
    radi_dire_corr character varying(100),
    radi_tele_cont character varying(15),
    radi_nume_hoja numeric(4,0),
    radi_desc_anex character varying(500),
    radi_nume_deri character varying(15),
    radi_path character varying(100),
    radi_usua_actu numeric(10,0),
    radi_depe_actu character varying(5),
    radi_fech_asig timestamp with time zone,
    radi_arch1 character varying(10),
    radi_arch2 character varying(10),
    radi_arch3 character varying(10),
    radi_arch4 character varying(10),
    ra_asun character varying(350),
    radi_usu_ante character varying(45),
    radi_depe_radi character varying(5),
    radi_rem character varying(60),
    radi_usua_radi numeric(10,0),
    codi_nivel numeric(2,0) DEFAULT 1,
    flag_nivel integer DEFAULT 1,
    carp_per numeric(1,0) DEFAULT 0,
    radi_leido numeric(1,0) DEFAULT 0,
    radi_cuentai character varying(20),
    radi_tipo_deri numeric(2,0) DEFAULT 0,
    listo character varying(2),
    sgd_tma_codigo numeric(4,0),
    sgd_mtd_codigo numeric(4,0),
    par_serv_secue numeric(8,0),
    sgd_fld_codigo numeric(3,0) DEFAULT 0,
    radi_agend numeric(1,0),
    radi_fech_agend timestamp with time zone,
    radi_fech_doc date,
    sgd_doc_secuencia numeric(15,0),
    sgd_pnufe_codi numeric(4,0),
    sgd_eanu_codigo numeric(1,0),
    sgd_not_codi numeric(3,0),
    radi_fech_notif timestamp with time zone,
    sgd_tdec_codigo numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_ttr_codigo integer DEFAULT 0,
    usua_doc_ante character varying(14),
    radi_fech_antetx timestamp with time zone,
    sgd_trad_codigo numeric(2,0),
    fech_vcmto timestamp with time zone,
    tdoc_vcmto numeric(4,0),
    sgd_termino_real numeric(4,0),
    id_cont numeric(2,0) DEFAULT 1,
    sgd_spub_codigo numeric(2,0) DEFAULT 0,
    id_pais numeric(4,0),
    medio_m character varying(5),
    radi_nrr numeric(2,0),
    numero_rm character varying(15),
    numero_tran character varying(15),
    texto_archivo text
);


ALTER TABLE public.radicado OWNER TO orfeousr;

--
-- Name: COLUMN radicado.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_nume_radi IS 'Numero de Radicado';


--
-- Name: COLUMN radicado.radi_fech_radi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_fech_radi IS 'FECHA DE RADICACION';


--
-- Name: COLUMN radicado.tdoc_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.tdoc_codi IS 'Tipo de Documento, (ej. Res, derecho pet, tutela, etc .. . . . .)';


--
-- Name: COLUMN radicado.trte_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.trte_codi IS 'TRTE_CODI';


--
-- Name: COLUMN radicado.mrec_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.mrec_codi IS 'MREC_CODI';


--
-- Name: COLUMN radicado.eesp_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.eesp_codi IS 'EESP_CODI';


--
-- Name: COLUMN radicado.eotra_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.eotra_codi IS 'EOTRA_CODI';


--
-- Name: COLUMN radicado.radi_tipo_empr; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_tipo_empr IS 'TIPO DE EMPRESA (OTRA O ESP)';


--
-- Name: COLUMN radicado.radi_fech_ofic; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_fech_ofic IS 'FECHA DE OFICIO';


--
-- Name: COLUMN radicado.tdid_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.tdid_codi IS 'TDID_CODI';


--
-- Name: COLUMN radicado.radi_nume_iden; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_nume_iden IS 'NUMERO DE IDENTIFICACION';


--
-- Name: COLUMN radicado.radi_nomb; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_nomb IS 'NOMBRE';


--
-- Name: COLUMN radicado.radi_prim_apel; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_prim_apel IS '1 APELLIDO';


--
-- Name: COLUMN radicado.radi_segu_apel; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_segu_apel IS '2 APELLIDO';


--
-- Name: COLUMN radicado.radi_pais; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_pais IS 'PAIS (DEFAULT COLOMBIA)';


--
-- Name: COLUMN radicado.muni_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.muni_codi IS 'MUNI_CODI';


--
-- Name: COLUMN radicado.cpob_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.cpob_codi IS 'CPOB_CODI';


--
-- Name: COLUMN radicado.carp_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.carp_codi IS 'CARP_CODI';


--
-- Name: COLUMN radicado.esta_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.esta_codi IS 'ESTA_CODI';


--
-- Name: COLUMN radicado.dpto_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.dpto_codi IS 'DPTO_CODI';


--
-- Name: COLUMN radicado.cen_muni_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.cen_muni_codi IS 'CEN_MUNI_CODI';


--
-- Name: COLUMN radicado.cen_dpto_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.cen_dpto_codi IS 'CEN_DPTO_CODI';


--
-- Name: COLUMN radicado.radi_dire_corr; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_dire_corr IS 'DIRECCION CORRESPONDENCIA';


--
-- Name: COLUMN radicado.radi_tele_cont; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_tele_cont IS 'TELEFONO CONTACTO';


--
-- Name: COLUMN radicado.radi_nume_hoja; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_nume_hoja IS 'NUMERO DE HOJAS';


--
-- Name: COLUMN radicado.radi_desc_anex; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_desc_anex IS 'DESCRIPCION DE ANEXOS';


--
-- Name: COLUMN radicado.radi_nume_deri; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_nume_deri IS 'NUMERO DERIVADO';


--
-- Name: COLUMN radicado.radi_path; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_path IS 'RADI_PATH';


--
-- Name: COLUMN radicado.radi_usua_actu; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_usua_actu IS 'USUARIO ACTUAL';


--
-- Name: COLUMN radicado.radi_depe_actu; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_depe_actu IS 'DEPENDENCIA ACTUAL (USUARIO)';


--
-- Name: COLUMN radicado.radi_fech_asig; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_fech_asig IS 'FECHA DE ASIGNACION DEL USUARIO';


--
-- Name: COLUMN radicado.radi_arch1; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_arch1 IS 'CAMPO PARA ARCHIVO FISICO';


--
-- Name: COLUMN radicado.radi_arch2; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_arch2 IS 'CAMPO PARA ARCHIVO FISICO';


--
-- Name: COLUMN radicado.radi_arch3; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_arch3 IS 'CAMPO PARA ARCHIVO FISICO';


--
-- Name: COLUMN radicado.radi_arch4; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_arch4 IS 'CAMPO PARA ARCHIVO FISICO';


--
-- Name: COLUMN radicado.usua_doc_ante; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.usua_doc_ante IS 'Codigo TTR. transaccion.';


--
-- Name: COLUMN radicado.radi_fech_antetx; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.radi_fech_antetx IS 'Documento del usuario que realizo la anterior tx';


--
-- Name: COLUMN radicado.sgd_trad_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.sgd_trad_codigo IS 'Fecha de la Ultima transaccion.';


--
-- Name: COLUMN radicado.numero_rm; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.numero_rm IS 'numero de registro';


--
-- Name: COLUMN radicado.numero_tran; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN radicado.numero_tran IS 'Numero de transaccion';


--
-- Name: retencion_doc_tmp; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE retencion_doc_tmp (
    cod_serie numeric(4,0),
    serie character varying(100),
    tipologia_doc character varying(200),
    cod_subserie character varying(10),
    subserie character varying(100),
    tipologia_sub character varying(200),
    dependencia character varying(5),
    nom_depe character varying(200),
    archivo_gestion numeric(3,0),
    archivo_central numeric(3,0),
    disposicion character varying(100),
    soporte character varying(20),
    procedimiento character varying(500),
    tipo_doc numeric(4,0),
    error character varying(200)
);


ALTER TABLE public.retencion_doc_tmp OWNER TO orfeousr;

--
-- Name: sec_bodega_empresas; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_bodega_empresas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_bodega_empresas OWNER TO orfeousr;

--
-- Name: sec_central; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_central
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_central OWNER TO orfeousr;

--
-- Name: sec_ciu_ciudadano; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_ciu_ciudadano
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_ciu_ciudadano OWNER TO orfeousr;

--
-- Name: sec_def_contactos; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_def_contactos
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_def_contactos OWNER TO orfeousr;

--
-- Name: sec_dir_direcciones; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_dir_direcciones
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_dir_direcciones OWNER TO orfeousr;

--
-- Name: sec_edificio; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_edificio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_edificio OWNER TO orfeousr;

--
-- Name: sec_fondo; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_fondo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sec_fondo OWNER TO orfeousr;

--
-- Name: sec_inv; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_inv
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_inv OWNER TO orfeousr;

--
-- Name: sec_oem_empresas; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_oem_empresas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_oem_empresas OWNER TO orfeousr;

--
-- Name: sec_oem_oempresas; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_oem_oempresas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_oem_oempresas OWNER TO orfeousr;

--
-- Name: sec_planilla; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_planilla
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_planilla OWNER TO orfeousr;

--
-- Name: sec_planilla_envio; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_planilla_envio
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_planilla_envio OWNER TO orfeousr;

--
-- Name: sec_planilla_tx; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_planilla_tx
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_planilla_tx OWNER TO orfeousr;

--
-- Name: sec_prestamo; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_prestamo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_prestamo OWNER TO orfeousr;

--
-- Name: sec_sgd_hfld_histflujodoc; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sec_sgd_hfld_histflujodoc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_sgd_hfld_histflujodoc OWNER TO orfeousr;

--
-- Name: secr_tp1_; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp1_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp1_ OWNER TO orfeousr;

--
-- Name: secr_tp1_0998; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp1_0998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp1_0998 OWNER TO orfeousr;

--
-- Name: secr_tp1_998; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp1_998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secr_tp1_998 OWNER TO orfeousr;

--
-- Name: secr_tp1_gr10; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp1_gr10
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp1_gr10 OWNER TO orfeousr;

--
-- Name: secr_tp2_; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp2_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp2_ OWNER TO orfeousr;

--
-- Name: secr_tp2_0998; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp2_0998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp2_0998 OWNER TO orfeousr;

--
-- Name: secr_tp2_998; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp2_998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secr_tp2_998 OWNER TO orfeousr;

--
-- Name: secr_tp2_gr10; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp2_gr10
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp2_gr10 OWNER TO orfeousr;

--
-- Name: secr_tp3_; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp3_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secr_tp3_ OWNER TO orfeousr;

--
-- Name: secr_tp4_; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp4_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp4_ OWNER TO orfeousr;

--
-- Name: secr_tp4_0998; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp4_0998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp4_0998 OWNER TO orfeousr;

--
-- Name: secr_tp4_ca98; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp4_ca98
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secr_tp4_ca98 OWNER TO orfeousr;

--
-- Name: secr_tp4_ch51; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE secr_tp4_ch51
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secr_tp4_ch51 OWNER TO orfeousr;

--
-- Name: series; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE series (
    depe_codi character varying(5) NOT NULL,
    seri_nume numeric(7,0) NOT NULL,
    seri_tipo numeric(2,0),
    seri_ano numeric(4,0),
    dpto_codi numeric(2,0) NOT NULL,
    bloq character varying(20)
);


ALTER TABLE public.series OWNER TO orfeousr;

--
-- Name: TABLE series; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE series IS 'SERIES';


--
-- Name: COLUMN series.depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN series.depe_codi IS 'CODIGO SERIE DEPENDENCIA';


--
-- Name: COLUMN series.seri_nume; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN series.seri_nume IS 'NUMERO DE SERIE PARA DEPENDENCIA';


--
-- Name: sgd_acm_acusemsg; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_acm_acusemsg (
    sgd_msg_codi numeric(15,0) NOT NULL,
    usua_doc character varying(14),
    sgd_msg_leido numeric(3,0)
);


ALTER TABLE public.sgd_acm_acusemsg OWNER TO orfeousr;

--
-- Name: sgd_actadd_actualiadicional; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_actadd_actualiadicional (
    sgd_actadd_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_instorf_codi numeric(4,0),
    sgd_actadd_query character varying(500),
    sgd_actadd_desc character varying(150)
);


ALTER TABLE public.sgd_actadd_actualiadicional OWNER TO orfeousr;

--
-- Name: sgd_agen_agendados; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_agen_agendados (
    sgd_agen_fech date,
    sgd_agen_observacion character varying(4000),
    radi_nume_radi character varying(15) NOT NULL,
    usua_doc character varying(18) NOT NULL,
    depe_codi character varying(5),
    sgd_agen_codigo numeric,
    sgd_agen_fechplazo date,
    sgd_agen_activo numeric
);


ALTER TABLE public.sgd_agen_agendados OWNER TO orfeousr;

--
-- Name: sgd_anar_anexarg; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_anar_anexarg (
    sgd_anar_codi numeric(4,0) NOT NULL,
    anex_codigo character varying(20),
    sgd_argd_codi numeric(4,0),
    sgd_anar_argcod numeric(4,0)
);


ALTER TABLE public.sgd_anar_anexarg OWNER TO orfeousr;

--
-- Name: TABLE sgd_anar_anexarg; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_anar_anexarg IS 'Indica los argumentos o criterios a incluir dentro de un tipo de documento generado';


--
-- Name: COLUMN sgd_anar_anexarg.sgd_anar_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_anar_anexarg.sgd_anar_codi IS 'id del registro';


--
-- Name: COLUMN sgd_anar_anexarg.anex_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_anar_anexarg.anex_codigo IS 'codigo del anexo';


--
-- Name: COLUMN sgd_anar_anexarg.sgd_argd_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_anar_anexarg.sgd_argd_codi IS 'codigo del argumento empleado';


--
-- Name: COLUMN sgd_anar_anexarg.sgd_anar_argcod; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_anar_anexarg.sgd_anar_argcod IS 'valor del campo llave, de tabla que contiene el argumento referenciado';


--
-- Name: sgd_anar_secue; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sgd_anar_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.sgd_anar_secue OWNER TO orfeousr;

--
-- Name: sgd_anu_anulados; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_anu_anulados (
    sgd_anu_id numeric(4,0),
    sgd_anu_desc character varying(250),
    radi_nume_radi character varying(15),
    sgd_eanu_codi numeric(4,0),
    sgd_anu_sol_fech date,
    sgd_anu_fech date,
    depe_codi character varying(5),
    usua_doc character varying(14),
    usua_codi numeric(4,0),
    depe_codi_anu character varying(5),
    usua_doc_anu character varying(14),
    usua_codi_anu numeric(4,0),
    usua_anu_acta numeric(8,0),
    sgd_anu_path_acta character varying(200),
    sgd_trad_codigo numeric(2,0)
);


ALTER TABLE public.sgd_anu_anulados OWNER TO orfeousr;

--
-- Name: sgd_aper_adminperfiles; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_aper_adminperfiles (
    sgd_aper_codigo numeric(2,0),
    sgd_aper_descripcion character varying(20)
);


ALTER TABLE public.sgd_aper_adminperfiles OWNER TO orfeousr;

--
-- Name: sgd_aplfad_plicfunadi; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_aplfad_plicfunadi (
    sgd_aplfad_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_aplfad_menu character varying(150) NOT NULL,
    sgd_aplfad_lk1 character varying(150) NOT NULL,
    sgd_aplfad_desc character varying(150) NOT NULL
);


ALTER TABLE public.sgd_aplfad_plicfunadi OWNER TO orfeousr;

--
-- Name: sgd_apli_aplintegra; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_apli_aplintegra (
    sgd_apli_codi numeric(4,0),
    sgd_apli_descrip character varying(150),
    sgd_apli_lk1desc character varying(150),
    sgd_apli_lk1 character varying(150),
    sgd_apli_lk2desc character varying(150),
    sgd_apli_lk2 character varying(150),
    sgd_apli_lk3desc character varying(150),
    sgd_apli_lk3 character varying(150),
    sgd_apli_lk4desc character varying(150),
    sgd_apli_lk4 character varying(150)
);


ALTER TABLE public.sgd_apli_aplintegra OWNER TO orfeousr;

--
-- Name: sgd_aplmen_aplimens; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_aplmen_aplimens (
    sgd_aplmen_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_aplmen_ref character varying(20),
    sgd_aplmen_haciaorfeo numeric(4,0),
    sgd_aplmen_desdeorfeo numeric(4,0)
);


ALTER TABLE public.sgd_aplmen_aplimens OWNER TO orfeousr;

--
-- Name: sgd_aplus_plicusua; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_aplus_plicusua (
    sgd_aplus_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    usua_doc character varying(14),
    sgd_trad_codigo numeric(2,0),
    sgd_aplus_prioridad numeric(1,0)
);


ALTER TABLE public.sgd_aplus_plicusua OWNER TO orfeousr;

--
-- Name: sgd_arch_depe; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_arch_depe (
    sgd_arch_depe character varying(5),
    sgd_arch_edificio numeric(6,0),
    sgd_arch_item numeric(6,0),
    sgd_arch_id numeric NOT NULL
);


ALTER TABLE public.sgd_arch_depe OWNER TO orfeousr;

--
-- Name: sgd_archivo_central; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_archivo_central (
    sgd_archivo_id numeric NOT NULL,
    sgd_archivo_tipo numeric,
    sgd_archivo_orden character varying(15),
    sgd_archivo_fechai timestamp with time zone,
    sgd_archivo_demandado character varying(1500),
    sgd_archivo_demandante character varying(200),
    sgd_archivo_cc_demandante numeric,
    sgd_archivo_depe character varying(5),
    sgd_archivo_zona character varying(4),
    sgd_archivo_carro numeric,
    sgd_archivo_cara character varying(4),
    sgd_archivo_estante numeric,
    sgd_archivo_entrepano numeric,
    sgd_archivo_caja numeric,
    sgd_archivo_unidocu character varying(40),
    sgd_archivo_anexo character varying(4000),
    sgd_archivo_inder numeric DEFAULT 0,
    sgd_archivo_path character varying(4000),
    sgd_archivo_year numeric(4,0),
    sgd_archivo_rad character varying(15) NOT NULL,
    sgd_archivo_srd numeric,
    sgd_archivo_sbrd numeric,
    sgd_archivo_folios numeric,
    sgd_archivo_mata numeric DEFAULT 0,
    sgd_archivo_fechaf timestamp with time zone,
    sgd_archivo_prestamo numeric(1,0),
    sgd_archivo_funprest character(100),
    sgd_archivo_fechprest timestamp with time zone,
    sgd_archivo_fechprestf timestamp with time zone,
    depe_codi character varying(5),
    sgd_archivo_usua character varying(15),
    sgd_archivo_fech timestamp with time zone
);


ALTER TABLE public.sgd_archivo_central OWNER TO orfeousr;

--
-- Name: sgd_archivo_fondo; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_archivo_fondo (
    sgd_archivo_id numeric NOT NULL,
    sgd_archivo_tipo numeric,
    sgd_archivo_orden character varying(15),
    sgd_archivo_fechai timestamp with time zone,
    sgd_archivo_demandado character varying(1500),
    sgd_archivo_demandante character varying(200),
    sgd_archivo_cc_demandante numeric,
    sgd_archivo_depe character varying(5),
    sgd_archivo_zona character varying(4),
    sgd_archivo_carro numeric,
    sgd_archivo_cara character varying(4),
    sgd_archivo_estante numeric,
    sgd_archivo_entrepano numeric,
    sgd_archivo_caja numeric,
    sgd_archivo_unidocu character varying(40),
    sgd_archivo_anexo character varying(4000),
    sgd_archivo_inder numeric DEFAULT 0,
    sgd_archivo_path character varying(4000),
    sgd_archivo_year numeric(4,0),
    sgd_archivo_rad character varying(15) NOT NULL,
    sgd_archivo_srd numeric,
    sgd_archivo_folios numeric,
    sgd_archivo_mata numeric DEFAULT 0,
    sgd_archivo_fechaf timestamp with time zone,
    sgd_archivo_prestamo numeric(1,0),
    sgd_archivo_funprest character(100),
    sgd_archivo_fechprest timestamp with time zone,
    sgd_archivo_fechprestf timestamp with time zone,
    depe_codi character varying(5),
    sgd_archivo_usua character varying(15),
    sgd_archivo_fech timestamp with time zone
);


ALTER TABLE public.sgd_archivo_fondo OWNER TO orfeousr;

--
-- Name: sgd_archivo_hist; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_archivo_hist (
    depe_codi character varying(5) NOT NULL,
    hist_fech timestamp with time zone NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    sgd_archivo_rad character varying(14),
    hist_obse character varying(600) NOT NULL,
    usua_doc character varying(14),
    sgd_ttr_codigo numeric(3,0),
    hist_id numeric
);


ALTER TABLE public.sgd_archivo_hist OWNER TO orfeousr;

--
-- Name: sgd_arg_pliego; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_arg_pliego (
    sgd_arg_codigo numeric(2,0) NOT NULL,
    sgd_arg_desc character varying(150) NOT NULL
);


ALTER TABLE public.sgd_arg_pliego OWNER TO orfeousr;

--
-- Name: sgd_argd_argdoc; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_argd_argdoc (
    sgd_argd_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    sgd_argd_tabla character varying(100),
    sgd_argd_tcodi character varying(100),
    sgd_argd_tdes character varying(100),
    sgd_argd_llist character varying(150),
    sgd_argd_campo character varying(100)
);


ALTER TABLE public.sgd_argd_argdoc OWNER TO orfeousr;

--
-- Name: TABLE sgd_argd_argdoc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_argd_argdoc IS 'Define los argumentos que ha de incluir un tipo de documento';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_pnufe_codi IS 'Codigo del proceso';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_tabla; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_tabla IS 'Nombre de la tabla tabla a la que hace refencia el argumento';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_tcodi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_tcodi IS 'Nombre del campo llave de la tabla referenciada';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_tdes; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_tdes IS 'Nombre del campo descripcion de la tabla referenciada';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_llist; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_llist IS 'Texto del label descriptor  que ha  de aparecen de forma dinamica en la pagina web';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_campo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_campo IS 'Etiqueta que ha de incluirse en el documento para referenciar este campo';


--
-- Name: sgd_argup_argudoctop; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_argup_argudoctop (
    sgd_argup_codi numeric(4,0) NOT NULL,
    sgd_argup_desc character varying(50),
    sgd_tpr_codigo numeric(4,0)
);


ALTER TABLE public.sgd_argup_argudoctop OWNER TO orfeousr;

--
-- Name: TABLE sgd_argup_argudoctop; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_argup_argudoctop IS 'Almacena los argumentos para contestar pliegos de cargos';


--
-- Name: COLUMN sgd_argup_argudoctop.sgd_argup_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_argup_argudoctop.sgd_argup_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_argup_argudoctop.sgd_argup_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_argup_argudoctop.sgd_argup_desc IS 'Descripcion';


--
-- Name: sgd_auditoria; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_auditoria (
    fecha character varying(10),
    usua_doc character varying(12),
    ip character varying(15),
    tipo character varying(5),
    tabla character varying(50),
    isql character(5000)
);


ALTER TABLE public.sgd_auditoria OWNER TO orfeousr;

--
-- Name: TABLE sgd_auditoria; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_auditoria IS 'Tabla para radicacion via web';


--
-- Name: sgd_camexp_campoexpediente; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_camexp_campoexpediente (
    sgd_camexp_codigo numeric(4,0) NOT NULL,
    sgd_camexp_campo character varying(30) NOT NULL,
    sgd_parexp_codigo numeric(4,0) NOT NULL,
    sgd_camexp_fk numeric DEFAULT 0,
    sgd_camexp_tablafk character varying(30),
    sgd_camexp_campofk character varying(30),
    sgd_camexp_campovalor character varying(30),
    sgd_camexp_orden numeric(1,0)
);


ALTER TABLE public.sgd_camexp_campoexpediente OWNER TO orfeousr;

--
-- Name: sgd_carp_descripcion; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_carp_descripcion (
    sgd_carp_depecodi character varying(5) NOT NULL,
    sgd_carp_tiporad numeric(2,0) NOT NULL,
    sgd_carp_descr character varying(40)
);


ALTER TABLE public.sgd_carp_descripcion OWNER TO orfeousr;

--
-- Name: sgd_cau_causal; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_cau_causal (
    sgd_cau_codigo numeric(4,0) NOT NULL,
    sgd_cau_descrip character varying(150)
);


ALTER TABLE public.sgd_cau_causal OWNER TO orfeousr;

--
-- Name: sgd_caux_causales; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_caux_causales (
    sgd_caux_codigo numeric(10,0) NOT NULL,
    radi_nume_radi character varying(15),
    sgd_dcau_codigo numeric(4,0),
    sgd_ddca_codigo numeric(4,0),
    sgd_caux_fecha date,
    usua_doc character varying(14)
);


ALTER TABLE public.sgd_caux_causales OWNER TO orfeousr;

--
-- Name: sgd_ciu_ciudadano; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_ciu_ciudadano (
    tdid_codi numeric(2,0),
    sgd_ciu_codigo numeric(8,0),
    sgd_ciu_nombre character varying(150),
    sgd_ciu_direccion character varying(150),
    sgd_ciu_apell1 character varying(50),
    sgd_ciu_apell2 character varying(50),
    sgd_ciu_telefono character varying(50),
    sgd_ciu_email character varying(50),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_ciu_cedula character varying(13),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170
);


ALTER TABLE public.sgd_ciu_ciudadano OWNER TO orfeousr;

--
-- Name: sgd_ciu_secue; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sgd_ciu_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_ciu_secue OWNER TO orfeousr;

--
-- Name: sgd_clta_clstarif; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_clta_clstarif (
    sgd_fenv_codigo numeric(5,0),
    sgd_clta_codser numeric(5,0),
    sgd_tar_codigo numeric(5,0),
    sgd_clta_descrip character varying(100),
    sgd_clta_pesdes numeric(15,0),
    sgd_clta_peshast numeric(15,0)
);


ALTER TABLE public.sgd_clta_clstarif OWNER TO orfeousr;

--
-- Name: sgd_cob_campobliga; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_cob_campobliga (
    sgd_cob_codi numeric(4,0) NOT NULL,
    sgd_cob_desc character varying(150),
    sgd_cob_label character varying(50),
    sgd_tidm_codi numeric(4,0)
);


ALTER TABLE public.sgd_cob_campobliga OWNER TO orfeousr;

--
-- Name: TABLE sgd_cob_campobliga; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_cob_campobliga IS 'Indica los campos obligatorios que hacen parte de un tipo de documento de correspondencia masiva';


--
-- Name: COLUMN sgd_cob_campobliga.sgd_cob_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_cob_campobliga.sgd_cob_codi IS 'ID del registro';


--
-- Name: COLUMN sgd_cob_campobliga.sgd_cob_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_cob_campobliga.sgd_cob_desc IS 'Descripcion';


--
-- Name: COLUMN sgd_cob_campobliga.sgd_cob_label; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_cob_campobliga.sgd_cob_label IS 'Rotulo del campo a incluir dentro del documento';


--
-- Name: COLUMN sgd_cob_campobliga.sgd_tidm_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_cob_campobliga.sgd_tidm_codi IS 'Codigo del documento';


--
-- Name: sgd_dcau_causal; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_dcau_causal (
    sgd_dcau_codigo numeric(4,0) NOT NULL,
    sgd_cau_codigo numeric(4,0),
    sgd_dcau_descrip character varying(150)
);


ALTER TABLE public.sgd_dcau_causal OWNER TO orfeousr;

--
-- Name: sgd_ddca_ddsgrgdo; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_ddca_ddsgrgdo (
    sgd_ddca_codigo numeric(4,0) NOT NULL,
    sgd_dcau_codigo numeric(4,0),
    par_serv_secue numeric(8,0),
    sgd_ddca_descrip character varying(150)
);


ALTER TABLE public.sgd_ddca_ddsgrgdo OWNER TO orfeousr;

--
-- Name: sgd_def_contactos; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_def_contactos (
    ctt_id numeric(15,0) NOT NULL,
    ctt_nombre character varying(60) NOT NULL,
    ctt_cargo character varying(60) NOT NULL,
    ctt_telefono character varying(25),
    ctt_id_tipo numeric(4,0) NOT NULL,
    ctt_id_empresa numeric(15,0) NOT NULL
);


ALTER TABLE public.sgd_def_contactos OWNER TO orfeousr;

--
-- Name: sgd_def_continentes; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_def_continentes (
    id_cont numeric(2,0),
    nombre_cont character varying(20) NOT NULL
);


ALTER TABLE public.sgd_def_continentes OWNER TO orfeousr;

--
-- Name: sgd_def_paises; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_def_paises (
    id_pais numeric(4,0),
    id_cont numeric(2,0) DEFAULT 1 NOT NULL,
    nombre_pais character varying(30) NOT NULL
);


ALTER TABLE public.sgd_def_paises OWNER TO orfeousr;

--
-- Name: sgd_deve_dev_envio; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_deve_dev_envio (
    sgd_deve_codigo numeric(2,0) NOT NULL,
    sgd_deve_desc character varying(150) NOT NULL
);


ALTER TABLE public.sgd_deve_dev_envio OWNER TO orfeousr;

--
-- Name: sgd_dir_drecciones; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_dir_drecciones (
    sgd_dir_codigo numeric(10,0) NOT NULL,
    sgd_dir_tipo numeric(4,0) NOT NULL,
    sgd_oem_codigo numeric(8,0),
    sgd_ciu_codigo numeric(8,0),
    radi_nume_radi character varying(15),
    sgd_esp_codi numeric(5,0),
    muni_codi numeric(4,0),
    dpto_codi numeric(3,0),
    sgd_dir_direccion character varying(150),
    sgd_dir_telefono character varying(50),
    sgd_dir_mail character varying(50),
    sgd_sec_codigo numeric(13,0),
    sgd_temporal_nombre character varying(150),
    anex_codigo numeric(20,0),
    sgd_anex_codigo character varying(20),
    sgd_dir_nombre character varying(150),
    sgd_doc_fun character varying(14),
    sgd_dir_nomremdes character varying(1000),
    sgd_trd_codigo numeric(1,0),
    sgd_dir_tdoc numeric(1,0),
    sgd_dir_doc character varying(14),
    id_pais numeric(4,0) DEFAULT 170,
    id_cont numeric(2,0) DEFAULT 1
);


ALTER TABLE public.sgd_dir_drecciones OWNER TO orfeousr;

--
-- Name: COLUMN sgd_dir_drecciones.sgd_dir_nomremdes; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dir_drecciones.sgd_dir_nomremdes IS 'NOMBRE DE REMITENTE O DESTINATARIO';


--
-- Name: COLUMN sgd_dir_drecciones.sgd_trd_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dir_drecciones.sgd_trd_codigo IS 'TIPO DE REMITENTE/DESTINATARIO (1 Ciudadanao, 2 OtrasEmpresas, 3 Esp, 4 Funcionario)';


--
-- Name: COLUMN sgd_dir_drecciones.sgd_dir_tdoc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dir_drecciones.sgd_dir_tdoc IS 'NUMERO DE DOCUMENTO';


--
-- Name: sgd_dir_secue; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sgd_dir_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_dir_secue OWNER TO orfeousr;

--
-- Name: sgd_dnufe_docnufe; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_dnufe_docnufe (
    sgd_dnufe_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    sgd_tpr_codigo numeric(4,0),
    sgd_dnufe_label character varying(150),
    trte_codi numeric(2,0),
    sgd_dnufe_main character varying(1),
    sgd_dnufe_path character varying(150),
    sgd_dnufe_gerarq character varying(10),
    anex_tipo_codi numeric(4,0)
);


ALTER TABLE public.sgd_dnufe_docnufe OWNER TO orfeousr;

--
-- Name: TABLE sgd_dnufe_docnufe; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_dnufe_docnufe IS 'Indica los documentos que componen un proceso de numeracion y fechado';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_dnufe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_dnufe_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_pnufe_codi IS 'codigo del proceso';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_tpr_codigo IS 'codigo del documento que hace parte de un proceso de numeracion y fechado';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_dnufe_label; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_dnufe_label IS 'label del documento que ha de usarse en la interfaz de gestion de procesos de numeracion y fechado';


--
-- Name: COLUMN sgd_dnufe_docnufe.trte_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dnufe_docnufe.trte_codi IS 'indica el tipo de remitente para quien va dirigida la comunicacion';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_dnufe_main; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_dnufe_main IS 'Indica si el registro es el documento principal del paquete';


--
-- Name: sgd_dt_radicado; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_dt_radicado (
    radi_nume_radi character varying(15) NOT NULL,
    dias_termino numeric(2,0) NOT NULL
);


ALTER TABLE public.sgd_dt_radicado OWNER TO orfeousr;

--
-- Name: TABLE sgd_dt_radicado; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_dt_radicado IS 'Dias de termino por radicado';


--
-- Name: COLUMN sgd_dt_radicado.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dt_radicado.radi_nume_radi IS 'Numero de radicado';


--
-- Name: COLUMN sgd_dt_radicado.dias_termino; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_dt_radicado.dias_termino IS 'dias de termino';


--
-- Name: sgd_eanu_estanulacion; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_eanu_estanulacion (
    sgd_eanu_desc character varying(150),
    sgd_eanu_codi numeric
);


ALTER TABLE public.sgd_eanu_estanulacion OWNER TO orfeousr;

--
-- Name: sgd_einv_inventario; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_einv_inventario (
    sgd_einv_codigo numeric NOT NULL,
    sgd_depe_nomb character varying(400),
    sgd_depe_codi character varying(5),
    sgd_einv_expnum character varying(18),
    sgd_einv_titulo character varying(400),
    sgd_einv_unidad numeric,
    sgd_einv_fech date,
    sgd_einv_fechfin date,
    sgd_einv_radicados character varying(40),
    sgd_einv_folios numeric,
    sgd_einv_nundocu numeric,
    sgd_einv_nundocubodega numeric,
    sgd_einv_caja numeric,
    sgd_einv_cajabodega numeric,
    sgd_einv_srd numeric,
    sgd_einv_nomsrd character varying(400),
    sgd_einv_sbrd numeric,
    sgd_einv_nomsbrd character varying(400),
    sgd_einv_retencion character varying(400),
    sgd_einv_disfinal character varying(400),
    sgd_einv_ubicacion character varying(400),
    sgd_einv_observacion character varying(400)
);


ALTER TABLE public.sgd_einv_inventario OWNER TO orfeousr;

--
-- Name: sgd_eit_items; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_eit_items (
    sgd_eit_codigo numeric NOT NULL,
    sgd_eit_cod_padre numeric DEFAULT 0,
    sgd_eit_nombre character varying(40),
    sgd_eit_sigla character varying(6),
    codi_dpto numeric(4,0),
    codi_muni numeric(5,0)
);


ALTER TABLE public.sgd_eit_items OWNER TO orfeousr;

--
-- Name: sgd_eje_tema; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_eje_tema (
    sgd_tema_codigo character varying(10) NOT NULL,
    sgd_tema_nomb character varying(150) NOT NULL,
    sgd_tema_desc character varying(350) NOT NULL,
    sgd_tema_plazo numeric(2,0),
    sgd_tema_tpplazo character varying(50),
    sgd_tema_estado numeric(2,0) NOT NULL,
    sgd_tema_depe character varying(5) NOT NULL
);


ALTER TABLE public.sgd_eje_tema OWNER TO orfeousr;

--
-- Name: TABLE sgd_eje_tema; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_eje_tema IS 'Tabla de ejes tematicos';


--
-- Name: COLUMN sgd_eje_tema.sgd_tema_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_codigo IS 'Codigo del eje tematico';


--
-- Name: COLUMN sgd_eje_tema.sgd_tema_nomb; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_nomb IS 'Nombre del eje tematico';


--
-- Name: COLUMN sgd_eje_tema.sgd_tema_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_desc IS 'Descripcion del eje tematico';


--
-- Name: COLUMN sgd_eje_tema.sgd_tema_plazo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_plazo IS 'Dias de plazo';


--
-- Name: COLUMN sgd_eje_tema.sgd_tema_tpplazo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_tpplazo IS 'Tipo de plazo';


--
-- Name: COLUMN sgd_eje_tema.sgd_tema_estado; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_estado IS 'Estado de eje tematico';


--
-- Name: COLUMN sgd_eje_tema.sgd_tema_depe; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_depe IS 'Dependencia asignada al eje tematico';


--
-- Name: sgd_empus_empusuario; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_empus_empusuario (
    usua_login character varying(10),
    identificador_empresa numeric(10,0)
);


ALTER TABLE public.sgd_empus_empusuario OWNER TO orfeousr;

--
-- Name: COLUMN sgd_empus_empusuario.identificador_empresa; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_empus_empusuario.identificador_empresa IS 'Corresponde al identificador de la tabla bodega_empresas';


--
-- Name: sgd_ent_entidades; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_ent_entidades (
    sgd_ent_nit character varying(13) NOT NULL,
    sgd_ent_codsuc character varying(4) NOT NULL,
    sgd_ent_pias numeric(5,0),
    dpto_codi numeric(2,0),
    muni_codi numeric(4,0),
    sgd_ent_descrip character varying(80),
    sgd_ent_direccion character varying(50),
    sgd_ent_telefono character varying(50)
);


ALTER TABLE public.sgd_ent_entidades OWNER TO orfeousr;

--
-- Name: sgd_enve_envioespecial; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_enve_envioespecial (
    sgd_fenv_codigo numeric(4,0),
    sgd_enve_valorl character varying(30),
    sgd_enve_valorn character varying(30),
    sgd_enve_desc character varying(30)
);


ALTER TABLE public.sgd_enve_envioespecial OWNER TO orfeousr;

--
-- Name: COLUMN sgd_enve_envioespecial.sgd_fenv_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_enve_envioespecial.sgd_fenv_codigo IS 'Codigo Empresa de envio';


--
-- Name: COLUMN sgd_enve_envioespecial.sgd_enve_valorl; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_enve_envioespecial.sgd_enve_valorl IS 'Valor Campo Local';


--
-- Name: COLUMN sgd_enve_envioespecial.sgd_enve_valorn; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_enve_envioespecial.sgd_enve_valorn IS 'Valor Campo Nacional';


--
-- Name: COLUMN sgd_enve_envioespecial.sgd_enve_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_enve_envioespecial.sgd_enve_desc IS 'Descripcion Valor';


--
-- Name: tipo_doc_identificacion; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE tipo_doc_identificacion (
    tdid_codi numeric(2,0) NOT NULL,
    tdid_desc character varying(100) NOT NULL
);


ALTER TABLE public.tipo_doc_identificacion OWNER TO orfeousr;

--
-- Name: TABLE tipo_doc_identificacion; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE tipo_doc_identificacion IS 'TIPO_DOC_IDENTIFICACION';


--
-- Name: COLUMN tipo_doc_identificacion.tdid_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN tipo_doc_identificacion.tdid_codi IS 'CODIGO DEL TIPO DE DOCUMENTO DE IDENTIFICACION';


--
-- Name: COLUMN tipo_doc_identificacion.tdid_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN tipo_doc_identificacion.tdid_desc IS 'DESCIPCION DEL TIPO DE DOCUMENTO DE IDENTIFICACION';


--
-- Name: tipo_remitente; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE tipo_remitente (
    trte_codi numeric(2,0) NOT NULL,
    trte_desc character varying(100) NOT NULL
);


ALTER TABLE public.tipo_remitente OWNER TO orfeousr;

--
-- Name: TABLE tipo_remitente; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE tipo_remitente IS 'TIPO_REMITENTE';


--
-- Name: COLUMN tipo_remitente.trte_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN tipo_remitente.trte_codi IS 'CODIGO TIPO DE REMITENTE';


--
-- Name: COLUMN tipo_remitente.trte_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN tipo_remitente.trte_desc IS 'DESC DEL TIPO DE REMITENTE';


--
-- Name: sgd_est_estadi; Type: VIEW; Schema: public; Owner: orfeousr
--

CREATE VIEW sgd_est_estadi AS
    SELECT a.radi_nume_radi, a.radi_fech_radi, a.radi_depe_radi, a.radi_usua_radi, a.radi_depe_actu, a.radi_usua_actu, a.trte_codi, a.tdid_codi, a.radi_nomb, a.eesp_codi, b.usua_nomb, c.depe_nomb, d.tdid_desc FROM radicado a, usuario b, dependencia c, tipo_doc_identificacion d, tipo_remitente e WHERE (((((a.radi_usua_actu = b.usua_codi) AND ((a.radi_depe_actu)::text = (b.depe_codi)::text)) AND ((a.radi_depe_actu)::text = (c.depe_codi)::text)) AND (d.tdid_codi = a.tdoc_codi)) AND (a.trte_codi = e.trte_codi));


ALTER TABLE public.sgd_est_estadi OWNER TO orfeousr;

--
-- Name: sgd_estc_estconsolid; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_estc_estconsolid (
    sgd_estc_codigo numeric,
    sgd_tpr_codigo numeric,
    dep_nombre character varying(30),
    depe_codi character varying(5),
    sgd_estc_ctotal numeric,
    sgd_estc_centramite numeric,
    sgd_estc_csinriesgo numeric,
    sgd_estc_criesgomedio numeric,
    sgd_estc_criesgoalto numeric,
    sgd_estc_ctramitados numeric,
    sgd_estc_centermino numeric,
    sgd_estc_cfueratermino numeric,
    sgd_estc_fechgen date,
    sgd_estc_fechini date,
    sgd_estc_fechfin date,
    sgd_estc_fechiniresp date,
    sgd_estc_fechfinresp date,
    sgd_estc_dsinriesgo numeric,
    sgd_estc_driesgomegio numeric,
    sgd_estc_driesgoalto numeric,
    sgd_estc_dtermino numeric,
    sgd_estc_grupgenerado numeric
);


ALTER TABLE public.sgd_estc_estconsolid OWNER TO orfeousr;

--
-- Name: TABLE sgd_estc_estconsolid; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_estc_estconsolid IS 'Tabla en la cual se almacenan consolidados de las territoriales.';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_codigo IS 'Codigo Registro Unico';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_tpr_codigo IS 'Tipo de Documento';


--
-- Name: COLUMN sgd_estc_estconsolid.dep_nombre; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.dep_nombre IS 'Nombre Grupo Dependenciad de cada Territorial';


--
-- Name: COLUMN sgd_estc_estconsolid.depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.depe_codi IS 'Codigo dependencia';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_ctotal; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_ctotal IS 'Cantidad Documentos';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_centramite; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_centramite IS 'Cantidad Documentos En tramite';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_csinriesgo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_csinriesgo IS 'Cantidad Documentos Sin riesgo';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_criesgomedio; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_criesgomedio IS 'Cantidad de Documentos en Riesgo Medio';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_criesgoalto; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_criesgoalto IS 'Cantidad de Documentos en Riesgo Alto';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_ctramitados; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_ctramitados IS 'Cantidad de Documentos Tramitados';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_centermino; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_centermino IS 'Cantidad Documentos Tramitados en Termino';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_cfueratermino; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_cfueratermino IS 'Cantidad Documentos Tramitados Fuera de Termino';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechgen; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechgen IS 'Fecha Generados';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechini; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechini IS 'Fecha Inicio de Reporde de Radicados';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechfin; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechfin IS 'Fecha Fin de Reporte de Radicados';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechiniresp; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechiniresp IS 'Fecha inicio de Documentos respuesta';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechfinresp; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechfinresp IS 'Fecha Fin de Documentos Respuesta';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_dsinriesgo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_dsinriesgo IS 'Dias definidos para Riesgo Bajo';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_driesgomegio; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_driesgomegio IS 'Dias Para Riesgo Medio';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_driesgoalto; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_driesgoalto IS 'Dias Para Riesgo Alto';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_dtermino; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_dtermino IS 'Dias Reales de Termino de los Documentos.';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_grupgenerado; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_grupgenerado IS 'Numero Historico de la Generacion.';


--
-- Name: sgd_estinst_estadoinstancia; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_estinst_estadoinstancia (
    sgd_estinst_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_instorf_codi numeric(4,0),
    sgd_estinst_valor numeric(4,0),
    sgd_estinst_habilita numeric(1,0),
    sgd_estinst_mensaje character varying(100)
);


ALTER TABLE public.sgd_estinst_estadoinstancia OWNER TO orfeousr;

--
-- Name: sgd_exp_expediente; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_exp_expediente (
    sgd_exp_numero character varying(18),
    radi_nume_radi character varying(18),
    sgd_exp_fech date,
    sgd_exp_fech_mod date,
    depe_codi character varying(5),
    usua_codi numeric(3,0),
    usua_doc character varying(15),
    sgd_exp_estado numeric(1,0) DEFAULT 0,
    sgd_exp_titulo character varying(50),
    sgd_exp_asunto character varying(150),
    sgd_exp_carpeta character varying(30),
    sgd_exp_ufisica character varying(20),
    sgd_exp_isla character varying(10),
    sgd_exp_estante character varying(10),
    sgd_exp_caja character varying(10),
    sgd_exp_fech_arch date,
    sgd_srd_codigo numeric(3,0),
    sgd_sbrd_codigo numeric(3,0),
    sgd_fexp_codigo numeric(3,0),
    sgd_exp_subexpediente character varying(20),
    sgd_exp_archivo numeric(1,0),
    sgd_exp_unicon numeric(1,0),
    sgd_exp_fechfin date,
    sgd_exp_folios character varying(6),
    sgd_exp_rete numeric(2,0),
    sgd_exp_entrepa numeric(6,0),
    radi_usua_arch character varying(40),
    sgd_exp_edificio character varying(400),
    sgd_exp_caja_bodega character varying(40),
    sgd_exp_carro character varying(40),
    sgd_exp_carpeta_bodega character varying(40),
    sgd_exp_privado numeric(1,0),
    sgd_exp_cd character varying(10),
    sgd_exp_nref character varying(7),
    sgd_sexp_paraexp1 character varying(50)
);


ALTER TABLE public.sgd_exp_expediente OWNER TO orfeousr;

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_numero; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_numero IS 'Numero de Expediente';


--
-- Name: COLUMN sgd_exp_expediente.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.radi_nume_radi IS 'Radicado Asociado por cada radicado puede existir un registro de ubicacion en el expediente.';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_fech; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_fech IS 'Fecha de Creacion del Expediente';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_fech_mod; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_fech_mod IS 'Fecha de Ultima modificacion';


--
-- Name: COLUMN sgd_exp_expediente.depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.depe_codi IS 'Dependencia que crea el expediente';


--
-- Name: COLUMN sgd_exp_expediente.usua_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.usua_codi IS 'Codigo del Usuario que crea el expediente ';


--
-- Name: COLUMN sgd_exp_expediente.usua_doc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.usua_doc IS 'Documento del usuario que crea el documento';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_estado; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_estado IS 'Indica si el radicado esta archivado (1) o no (0)';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_titulo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_titulo IS 'Titulo de expediente se coloca en archivo';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_asunto; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_asunto IS 'Asunto del expediente';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_carpeta; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_carpeta IS 'Ubicacion en carpeta';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_ufisica; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_ufisica IS 'Ubicacion fisica';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_isla; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_isla IS 'Isla';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_estante; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_estante IS 'Estante';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_caja; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_caja IS 'Caja';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_fech_arch; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_fech_arch IS 'Fecha de archivado';


--
-- Name: COLUMN sgd_exp_expediente.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_srd_codigo IS 'Serie';


--
-- Name: COLUMN sgd_exp_expediente.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_sbrd_codigo IS 'Subserie';


--
-- Name: COLUMN sgd_exp_expediente.sgd_fexp_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_fexp_codigo IS 'Fecha del expediente';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_subexpediente; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_subexpediente IS 'Nombre de subexpediente';


--
-- Name: sgd_fars_faristas; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_fars_faristas (
    sgd_fars_codigo numeric(5,0) NOT NULL,
    sgd_pexp_codigo numeric(4,0),
    sgd_fexp_codigoini numeric(6,0),
    sgd_fexp_codigofin numeric(6,0),
    sgd_fars_diasminimo numeric(3,0),
    sgd_fars_diasmaximo numeric(3,0),
    sgd_fars_desc character varying(100),
    sgd_trad_codigo numeric(2,0),
    sgd_srd_codigo numeric(3,0),
    sgd_sbrd_codigo numeric(3,0),
    sgd_fars_tipificacion numeric(1,0),
    sgd_tpr_codigo numeric,
    sgd_fars_automatico numeric,
    sgd_fars_rolgeneral numeric
);


ALTER TABLE public.sgd_fars_faristas OWNER TO orfeousr;

--
-- Name: sgd_fenv_frmenvio; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_fenv_frmenvio (
    sgd_fenv_codigo numeric(5,0) NOT NULL,
    sgd_fenv_descrip character varying(40),
    sgd_fenv_planilla numeric(1,0) DEFAULT 0 NOT NULL,
    sgd_fenv_estado numeric(1,0) DEFAULT 1 NOT NULL
);


ALTER TABLE public.sgd_fenv_frmenvio OWNER TO orfeousr;

--
-- Name: sgd_fexp_flujoexpedientes; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_fexp_flujoexpedientes (
    sgd_fexp_codigo numeric(6,0),
    sgd_pexp_codigo numeric(6,0),
    sgd_fexp_orden numeric(4,0),
    sgd_fexp_terminos numeric(4,0),
    sgd_fexp_imagen character varying(50),
    sgd_fexp_descrip character varying(150)
);


ALTER TABLE public.sgd_fexp_flujoexpedientes OWNER TO orfeousr;

--
-- Name: TABLE sgd_fexp_flujoexpedientes; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_fexp_flujoexpedientes IS 'Descripcion de la etapa en el Tipo de Proceso incicado en el campo SGD_PEXP_CODIGO';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_codigo IS 'Codigo etapa del Flujo. Codigo debe ser Unico.';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_pexp_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_pexp_codigo IS 'Codigo de proceso al cual se le incluira el flujo';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_orden; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_orden IS 'Orden de la Etapa en el Flujo Documental';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_terminos; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_terminos IS 'Numero de dias de plazo para cumplimiento de esta etapa.';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_imagen; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_imagen IS 'Icono para distinguir la etapa.';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_descrip; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_descrip IS 'Descripcion de la etapa en el Tipo de Proceso incicado en el campo SGD_PEXP_CODIGO';


--
-- Name: sgd_firrad_firmarads; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_firrad_firmarads (
    sgd_firrad_id numeric(15,0) NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    sgd_firrad_firma character varying(255),
    sgd_firrad_fecha date,
    sgd_firrad_docsolic character varying(14) NOT NULL,
    sgd_firrad_fechsolic date NOT NULL,
    sgd_firrad_pk character varying(255)
);


ALTER TABLE public.sgd_firrad_firmarads OWNER TO orfeousr;

--
-- Name: sgd_fld_flujodoc; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_fld_flujodoc (
    sgd_fld_codigo numeric(3,0),
    sgd_fld_desc character varying(100),
    sgd_tpr_codigo numeric(3,0),
    sgd_fld_imagen character varying(50),
    sgd_fld_grupoweb integer DEFAULT 0
);


ALTER TABLE public.sgd_fld_flujodoc OWNER TO orfeousr;

--
-- Name: sgd_fun_funciones; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_fun_funciones (
    sgd_fun_codigo numeric(4,0) NOT NULL,
    sgd_fun_descrip character varying(530),
    sgd_fun_fech_ini date,
    sgd_fun_fech_fin date
);


ALTER TABLE public.sgd_fun_funciones OWNER TO orfeousr;

--
-- Name: sgd_hfld_histflujodoc; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_hfld_histflujodoc (
    sgd_hfld_codigo numeric(6,0),
    sgd_fexp_codigo numeric(3,0) NOT NULL,
    sgd_exp_fechflujoant date,
    sgd_hfld_fech timestamp without time zone,
    sgd_exp_numero character varying(18),
    radi_nume_radi character varying(15),
    usua_doc character varying(10),
    usua_codi numeric(10,0),
    depe_codi character varying(5),
    sgd_ttr_codigo numeric(2,0),
    sgd_fexp_observa character varying(500),
    sgd_hfld_observa character varying(500),
    sgd_fars_codigo numeric,
    sgd_hfld_automatico numeric
);


ALTER TABLE public.sgd_hfld_histflujodoc OWNER TO orfeousr;

--
-- Name: COLUMN sgd_hfld_histflujodoc.sgd_hfld_fech; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_hfld_histflujodoc.sgd_hfld_fech IS 'Fecha Historico de expediente';


--
-- Name: sgd_hmtd_hismatdoc; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_hmtd_hismatdoc (
    sgd_hmtd_codigo numeric(6,0) NOT NULL,
    sgd_hmtd_fecha date NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    sgd_hmtd_obse character varying(600) NOT NULL,
    usua_doc numeric(13,0),
    depe_codi character varying(5),
    sgd_mtd_codigo numeric(4,0)
);


ALTER TABLE public.sgd_hmtd_hismatdoc OWNER TO orfeousr;

--
-- Name: sgd_hmtd_secue; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sgd_hmtd_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.sgd_hmtd_secue OWNER TO orfeousr;

--
-- Name: sgd_info_secue; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sgd_info_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.sgd_info_secue OWNER TO orfeousr;

--
-- Name: sgd_instorf_instanciasorfeo; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_instorf_instanciasorfeo (
    sgd_instorf_codi numeric(4,0),
    sgd_instorf_desc character varying(100)
);


ALTER TABLE public.sgd_instorf_instanciasorfeo OWNER TO orfeousr;

--
-- Name: sgd_lip_linkip; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_lip_linkip (
    sgd_lip_id numeric(4,0) NOT NULL,
    sgd_lip_ipini character varying(20) NOT NULL,
    sgd_lip_ipfin character varying(20),
    sgd_lip_dirintranet character varying(150) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_lip_arch character varying(70),
    sgd_lip_diascache numeric(5,0),
    sgd_lip_rutaftp character varying(150),
    sgd_lip_servftp character varying(50),
    sgd_lip_usbd character varying(20),
    sgd_lip_nombd character varying(20),
    sgd_lip_pwdbd character varying(20),
    sgd_lip_usftp character varying(20),
    sgd_lip_pwdftp character varying(30)
);


ALTER TABLE public.sgd_lip_linkip OWNER TO orfeousr;

--
-- Name: sgd_mat_matriz; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_mat_matriz (
    sgd_mat_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5),
    sgd_fun_codigo numeric(4,0),
    sgd_prc_codigo numeric(4,0),
    sgd_prd_codigo numeric(4,0),
    sgd_mat_fech_ini date,
    sgd_mat_fech_fin date,
    sgd_mat_peso_prd numeric(5,2)
);


ALTER TABLE public.sgd_mat_matriz OWNER TO orfeousr;

--
-- Name: sgd_mat_secue; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sgd_mat_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_mat_secue OWNER TO orfeousr;

--
-- Name: sgd_mpes_mddpeso; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_mpes_mddpeso (
    sgd_mpes_codigo numeric(5,0) NOT NULL,
    sgd_mpes_descrip character varying(10)
);


ALTER TABLE public.sgd_mpes_mddpeso OWNER TO orfeousr;

--
-- Name: sgd_mrd_matrird; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_mrd_matrird (
    sgd_mrd_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_srd_codigo numeric(4,0) NOT NULL,
    sgd_sbrd_codigo numeric(4,0) NOT NULL,
    sgd_tpr_codigo numeric(4,0) NOT NULL,
    soporte character varying(12),
    sgd_mrd_fechini date,
    sgd_mrd_fechfin date,
    sgd_mrd_esta character varying(10)
);


ALTER TABLE public.sgd_mrd_matrird OWNER TO orfeousr;

--
-- Name: sgd_msdep_msgdep; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_msdep_msgdep (
    sgd_msdep_codi numeric(15,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_msg_codi numeric(15,0) NOT NULL
);


ALTER TABLE public.sgd_msdep_msgdep OWNER TO orfeousr;

--
-- Name: sgd_msg_mensaje; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_msg_mensaje (
    sgd_msg_codi numeric(15,0) NOT NULL,
    sgd_tme_codi numeric(3,0) NOT NULL,
    sgd_msg_desc character varying(150),
    sgd_msg_fechdesp date NOT NULL,
    sgd_msg_url character varying(150) NOT NULL,
    sgd_msg_veces numeric(3,0) NOT NULL,
    sgd_msg_ancho numeric(6,0) NOT NULL,
    sgd_msg_largo numeric(6,0) NOT NULL
);


ALTER TABLE public.sgd_msg_mensaje OWNER TO orfeousr;

--
-- Name: sgd_mtd_matriz_doc; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_mtd_matriz_doc (
    sgd_mtd_codigo numeric(4,0) NOT NULL,
    sgd_mat_codigo numeric(4,0),
    sgd_tpr_codigo numeric(4,0)
);


ALTER TABLE public.sgd_mtd_matriz_doc OWNER TO orfeousr;

--
-- Name: sgd_noh_nohabiles; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_noh_nohabiles (
    noh_fecha date NOT NULL
);


ALTER TABLE public.sgd_noh_nohabiles OWNER TO orfeousr;

--
-- Name: sgd_not_notificacion; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_not_notificacion (
    sgd_not_codi numeric(3,0) NOT NULL,
    sgd_not_descrip character varying(100) NOT NULL
);


ALTER TABLE public.sgd_not_notificacion OWNER TO orfeousr;

--
-- Name: sgd_ntrd_notifrad; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_ntrd_notifrad (
    radi_nume_radi character varying(15) NOT NULL,
    sgd_not_codi numeric(3,0) NOT NULL,
    sgd_ntrd_notificador character varying(150),
    sgd_ntrd_notificado character varying(150),
    sgd_ntrd_fecha_not date,
    sgd_ntrd_num_edicto numeric(6,0),
    sgd_ntrd_fecha_fija date,
    sgd_ntrd_fecha_desfija date,
    sgd_ntrd_observaciones character varying(150)
);


ALTER TABLE public.sgd_ntrd_notifrad OWNER TO orfeousr;

--
-- Name: sgd_oem_oempresas; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_oem_oempresas (
    sgd_oem_codigo numeric(8,0) NOT NULL,
    tdid_codi numeric(2,0),
    sgd_oem_oempresa character varying(300),
    sgd_oem_rep_legal character varying(300),
    sgd_oem_nit character varying(14),
    sgd_oem_sigla character varying(1000),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_oem_direccion character varying(1000),
    sgd_oem_telefono character varying(1000),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    email character varying(1000)
);


ALTER TABLE public.sgd_oem_oempresas OWNER TO orfeousr;

--
-- Name: sgd_oem_secue; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sgd_oem_secue
    START WITH 18398
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_oem_secue OWNER TO orfeousr;

--
-- Name: sgd_panu_peranulados; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_panu_peranulados (
    sgd_panu_codi numeric(4,0),
    sgd_panu_desc character varying(200)
);


ALTER TABLE public.sgd_panu_peranulados OWNER TO orfeousr;

--
-- Name: TABLE sgd_panu_peranulados; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_panu_peranulados IS 'Define los permisos de anulacion de documentos';


--
-- Name: COLUMN sgd_panu_peranulados.sgd_panu_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_panu_peranulados.sgd_panu_codi IS 'Descripcion';


--
-- Name: sgd_parametro; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_parametro (
    param_nomb character varying(25) NOT NULL,
    param_codi numeric(5,0) NOT NULL,
    param_valor character varying(25) NOT NULL
);


ALTER TABLE public.sgd_parametro OWNER TO orfeousr;

--
-- Name: TABLE sgd_parametro; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_parametro IS 'Almacena parametros compuestos por dos valores: identificador y valor';


--
-- Name: COLUMN sgd_parametro.param_nomb; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_parametro.param_nomb IS 'Nombre del tipo de parametro';


--
-- Name: COLUMN sgd_parametro.param_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_parametro.param_codi IS 'Codigo identificador del parametro';


--
-- Name: COLUMN sgd_parametro.param_valor; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_parametro.param_valor IS 'Valor del parametro';


--
-- Name: sgd_parexp_paramexpediente; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_parexp_paramexpediente (
    sgd_parexp_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_parexp_tabla character varying(30) NOT NULL,
    sgd_parexp_etiqueta character varying(20) NOT NULL,
    sgd_parexp_orden numeric(1,0),
    sgd_parexp_editable numeric(1,0)
);


ALTER TABLE public.sgd_parexp_paramexpediente OWNER TO orfeousr;

--
-- Name: COLUMN sgd_parexp_paramexpediente.sgd_parexp_editable; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_parexp_paramexpediente.sgd_parexp_editable IS '1 o 0';


--
-- Name: sgd_pen_pensionados; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_pen_pensionados (
    tdid_codi numeric(2,0),
    sgd_ciu_codigo numeric(8,0) NOT NULL,
    sgd_ciu_nombre character varying(150),
    sgd_ciu_direccion character varying(150),
    sgd_ciu_apell1 character varying(50),
    sgd_ciu_apell2 character varying(50),
    sgd_ciu_telefono character varying(50),
    sgd_ciu_email character varying(50),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_ciu_cedula character varying(20),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170
);


ALTER TABLE public.sgd_pen_pensionados OWNER TO orfeousr;

--
-- Name: sgd_pexp_procexpedientes; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_pexp_procexpedientes (
    sgd_pexp_codigo numeric NOT NULL,
    sgd_pexp_descrip character varying(100),
    sgd_pexp_terminos numeric DEFAULT 0,
    sgd_srd_codigo numeric(3,0),
    sgd_sbrd_codigo numeric(3,0),
    sgd_pexp_automatico numeric(1,0) DEFAULT 1,
    sgd_pexp_tieneflujo numeric(1,0) DEFAULT 0
);


ALTER TABLE public.sgd_pexp_procexpedientes OWNER TO orfeousr;

--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_pexp_codigo IS 'Codigo que identifica el proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_descrip; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_pexp_descrip IS 'Nombre del proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_terminos; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_pexp_terminos IS 'termino del proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_srd_codigo IS 'Serie (trd) que identifica el proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_sbrd_codigo IS 'Subserie (trd) que identifica el proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_tieneflujo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_pexp_tieneflujo IS 'Si el expediente tiene flujo';


--
-- Name: sgd_plg_secue; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sgd_plg_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.sgd_plg_secue OWNER TO orfeousr;

--
-- Name: sgd_pnufe_procnumfe; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_pnufe_procnumfe (
    sgd_pnufe_codi numeric(4,0) NOT NULL,
    sgd_tpr_codigo numeric(4,0),
    sgd_pnufe_descrip character varying(150),
    sgd_pnufe_serie character varying(50)
);


ALTER TABLE public.sgd_pnufe_procnumfe OWNER TO orfeousr;

--
-- Name: TABLE sgd_pnufe_procnumfe; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_pnufe_procnumfe IS 'Cataloga los procesos de numeracion y fechado';


--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pnufe_procnumfe.sgd_pnufe_codi IS 'Codigo del proceso';


--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pnufe_procnumfe.sgd_tpr_codigo IS 'Codigo del documento que genera el procedimiento';


--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_pnufe_descrip; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pnufe_procnumfe.sgd_pnufe_descrip IS 'Descripcion del procedimiento generado';


--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_pnufe_serie; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pnufe_procnumfe.sgd_pnufe_serie IS 'Serie que maneja la numeracion de los documentos';


--
-- Name: sgd_pnun_procenum; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_pnun_procenum (
    sgd_pnun_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    depe_codi character varying(5),
    sgd_pnun_prepone character varying(50)
);


ALTER TABLE public.sgd_pnun_procenum OWNER TO orfeousr;

--
-- Name: COLUMN sgd_pnun_procenum.sgd_pnun_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pnun_procenum.sgd_pnun_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_pnun_procenum.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pnun_procenum.sgd_pnufe_codi IS 'Codigo del proceso';


--
-- Name: COLUMN sgd_pnun_procenum.depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pnun_procenum.depe_codi IS 'Codigo de la dependencia';


--
-- Name: COLUMN sgd_pnun_procenum.sgd_pnun_prepone; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_pnun_procenum.sgd_pnun_prepone IS 'Preposicion empleada para generar el numero completo del documento';


--
-- Name: sgd_prc_proceso; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_prc_proceso (
    sgd_prc_codigo numeric(4,0) NOT NULL,
    sgd_prc_descrip character varying(150),
    sgd_prc_fech_ini date,
    sgd_prc_fech_fin date
);


ALTER TABLE public.sgd_prc_proceso OWNER TO orfeousr;

--
-- Name: sgd_prd_prcdmentos; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_prd_prcdmentos (
    sgd_prd_codigo numeric(4,0) NOT NULL,
    sgd_prd_descrip character varying(200),
    sgd_prd_fech_ini date,
    sgd_prd_fech_fin date
);


ALTER TABLE public.sgd_prd_prcdmentos OWNER TO orfeousr;

--
-- Name: sgd_rda_retdoca; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_rda_retdoca (
    anex_radi_nume numeric(15,0) NOT NULL,
    anex_codigo character varying(20) NOT NULL,
    radi_nume_salida character varying(15),
    anex_borrado character varying(1),
    sgd_mrd_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    sgd_rda_fech date,
    sgd_deve_codigo numeric(2,0),
    anex_solo_lect character varying(1),
    anex_radi_fech date,
    anex_estado numeric(1,0),
    anex_nomb_archivo character varying(50),
    anex_tipo numeric(4,0),
    sgd_dir_tipo numeric(4,0)
);


ALTER TABLE public.sgd_rda_retdoca OWNER TO orfeousr;

--
-- Name: sgd_rdf_retdocf; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_rdf_retdocf (
    sgd_mrd_codigo numeric(4,0) NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    sgd_rdf_fech date NOT NULL
);


ALTER TABLE public.sgd_rdf_retdocf OWNER TO orfeousr;

--
-- Name: sgd_renv_regenvio; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_renv_regenvio (
    sgd_renv_codigo numeric NOT NULL,
    sgd_fenv_codigo numeric,
    sgd_renv_fech timestamp without time zone,
    radi_nume_sal character varying(15),
    sgd_renv_destino character varying,
    sgd_renv_telefono character varying,
    sgd_renv_mail character varying,
    sgd_renv_peso character varying,
    sgd_renv_valor numeric,
    sgd_renv_certificado numeric,
    sgd_renv_estado numeric,
    usua_doc numeric,
    sgd_renv_nombre character varying,
    sgd_rem_destino numeric DEFAULT 0,
    sgd_dir_codigo numeric,
    sgd_renv_planilla character varying(8),
    sgd_renv_fech_sal timestamp without time zone,
    depe_codi character varying(5),
    sgd_dir_tipo numeric(4,0) DEFAULT 0,
    radi_nume_grupo character varying(15),
    sgd_renv_dir character varying(100),
    sgd_renv_depto character varying(30),
    sgd_renv_mpio character varying(30),
    sgd_renv_tel character varying(20),
    sgd_renv_cantidad numeric(4,0) DEFAULT 0,
    sgd_renv_tipo numeric(1,0) DEFAULT 0,
    sgd_renv_observa character varying(200),
    sgd_renv_grupo numeric(14,0),
    sgd_deve_codigo numeric(2,0),
    sgd_deve_fech timestamp without time zone,
    sgd_renv_valortotal character varying(14) DEFAULT 0,
    sgd_renv_valistamiento character varying(10) DEFAULT 0,
    sgd_renv_vdescuento character varying(10) DEFAULT 0,
    sgd_renv_vadicional character varying(14) DEFAULT 0,
    sgd_depe_genera character varying(5),
    sgd_renv_pais character varying(30) DEFAULT 'colombia'::character varying,
    sgd_renv_guia character varying(100)
);


ALTER TABLE public.sgd_renv_regenvio OWNER TO orfeousr;

--
-- Name: sgd_renv_regenvio1; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_renv_regenvio1 (
    sgd_renv_codigo numeric(6,0) NOT NULL,
    sgd_fenv_codigo numeric(5,0),
    sgd_renv_fech date,
    radi_nume_sal character varying(15),
    sgd_renv_destino character varying(150),
    sgd_renv_telefono character varying(50),
    sgd_renv_mail character varying(150),
    sgd_renv_peso character varying(10),
    sgd_renv_valor character varying(10),
    sgd_renv_certificado numeric(1,0),
    sgd_renv_estado numeric(1,0),
    usua_doc numeric(15,0),
    sgd_renv_nombre character varying(100),
    sgd_rem_destino numeric(1,0) DEFAULT 0,
    sgd_dir_codigo numeric(10,0),
    sgd_renv_planilla character varying(8),
    sgd_renv_fech_sal date,
    depe_codi character varying(5),
    sgd_dir_tipo numeric(4,0) DEFAULT 0,
    radi_nume_grupo numeric(14,0),
    sgd_renv_dir character varying(100),
    sgd_renv_depto character varying(30),
    sgd_renv_mpio character varying(30),
    sgd_renv_tel character varying(20),
    sgd_renv_cantidad numeric(4,0) DEFAULT 0,
    sgd_renv_tipo numeric(1,0) DEFAULT 0,
    sgd_renv_observa character varying(200),
    sgd_renv_grupo numeric(14,0),
    sgd_deve_codigo numeric(2,0),
    sgd_deve_fech date,
    sgd_renv_valortotal character varying(14) DEFAULT 0,
    sgd_renv_valistamiento character varying(10) DEFAULT 0,
    sgd_renv_vdescuento character varying(10) DEFAULT 0,
    sgd_renv_vadicional character varying(14) DEFAULT 0,
    sgd_depe_genera character varying(5),
    sgd_renv_pais character varying(30) DEFAULT 'colombia'::character varying
);


ALTER TABLE public.sgd_renv_regenvio1 OWNER TO orfeousr;

--
-- Name: COLUMN sgd_renv_regenvio1.sgd_renv_valistamiento; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_renv_regenvio1.sgd_renv_valistamiento IS 'Valor Alistamiento';


--
-- Name: COLUMN sgd_renv_regenvio1.sgd_renv_vdescuento; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_renv_regenvio1.sgd_renv_vdescuento IS 'Descuento Autorizado para el envio';


--
-- Name: COLUMN sgd_renv_regenvio1.sgd_renv_vadicional; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_renv_regenvio1.sgd_renv_vadicional IS 'Valores Adicionales cobrados dependiendo del envio';


--
-- Name: sgd_rfax_reservafax; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_rfax_reservafax (
    sgd_rfax_codigo numeric(10,0),
    sgd_rfax_fax character varying(30),
    usua_login character varying(30),
    sgd_rfax_fech date,
    sgd_rfax_fechradi date,
    radi_nume_radi character varying(15),
    sgd_rfax_observa character varying(500)
);


ALTER TABLE public.sgd_rfax_reservafax OWNER TO orfeousr;

--
-- Name: sgd_rmr_radmasivre; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_rmr_radmasivre (
    sgd_rmr_grupo character varying(15) NOT NULL,
    sgd_rmr_radi character varying(15) NOT NULL
);


ALTER TABLE public.sgd_rmr_radmasivre OWNER TO orfeousr;

--
-- Name: sgd_san_sancionados; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_san_sancionados (
    sgd_san_ref character varying(20) NOT NULL,
    sgd_san_decision character varying(60),
    sgd_san_cargo character varying(50),
    sgd_san_expediente character varying(20),
    sgd_san_tipo_sancion character varying(50),
    sgd_san_plazo character varying(100),
    sgd_san_valor numeric(14,2),
    sgd_san_radicacion character varying(15),
    sgd_san_fecha_radicado date,
    sgd_san_valorletras character varying(1000),
    sgd_san_nombreempresa character varying(160),
    sgd_san_motivos character varying(160),
    sgd_san_sectores character varying(160),
    sgd_san_padre character varying(15),
    sgd_san_fecha_padre date,
    sgd_san_notificado character varying(100)
);


ALTER TABLE public.sgd_san_sancionados OWNER TO orfeousr;

--
-- Name: sgd_san_sancionados_x; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_san_sancionados_x (
    radi_nume_radi character varying(15) NOT NULL,
    sgd_san_decision character varying(60),
    sgd_san_cargo character varying(50),
    sgd_san_expediente character varying(15),
    sgd_san_tipo_sancion character varying(50),
    sgd_san_plazo character varying(100),
    sgd_san_valor numeric(14,2),
    sgd_san_radicacion character varying(15),
    sgd_san_fecha_radicado date,
    sgd_san_valorletras character varying(1000),
    sgd_san_nombreempresa character varying(160),
    sgd_san_motivos character varying(160),
    sgd_san_sectores character varying(160),
    sgd_san_padre character varying(15)
);


ALTER TABLE public.sgd_san_sancionados_x OWNER TO orfeousr;

--
-- Name: sgd_sbrd_subserierd; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_sbrd_subserierd (
    sgd_srd_codigo numeric(4,0) NOT NULL,
    sgd_sbrd_codigo numeric(4,0) NOT NULL,
    sgd_sbrd_descrip character varying(500) NOT NULL,
    sgd_sbrd_fechini date NOT NULL,
    sgd_sbrd_fechfin date NOT NULL,
    sgd_sbrd_tiemag numeric(4,0),
    sgd_sbrd_tiemac numeric(4,0),
    sgd_sbrd_dispfin character varying(50),
    sgd_sbrd_soporte character varying(50),
    sgd_sbrd_procedi character varying(1500)
);


ALTER TABLE public.sgd_sbrd_subserierd OWNER TO orfeousr;

--
-- Name: sgd_sed_sede; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_sed_sede (
    sgd_sed_codi numeric(4,0) NOT NULL,
    sgd_sed_desc character varying(50)
);


ALTER TABLE public.sgd_sed_sede OWNER TO orfeousr;

--
-- Name: sgd_senuf_secnumfe; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_senuf_secnumfe (
    sgd_senuf_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    depe_codi character varying(5),
    sgd_senuf_sec character varying(50)
);


ALTER TABLE public.sgd_senuf_secnumfe OWNER TO orfeousr;

--
-- Name: sgd_sexp_secexpedientes; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_sexp_secexpedientes (
    sgd_exp_numero character varying(18) NOT NULL,
    sgd_srd_codigo numeric,
    sgd_sbrd_codigo numeric,
    sgd_sexp_secuencia numeric,
    depe_codi character varying(5),
    usua_doc character varying(15),
    sgd_sexp_fech date,
    sgd_fexp_codigo numeric,
    sgd_sexp_ano numeric,
    usua_doc_responsable character varying(18),
    sgd_sexp_parexp1 character varying(250),
    sgd_sexp_parexp2 character varying(160),
    sgd_sexp_parexp3 character varying(160),
    sgd_sexp_parexp4 character varying(160),
    sgd_sexp_parexp5 character varying(160),
    sgd_pexp_codigo numeric(3,0),
    sgd_exp_fech_arch date,
    sgd_fld_codigo numeric(3,0),
    sgd_exp_fechflujoant date,
    sgd_mrd_codigo numeric(4,0),
    sgd_exp_subexpediente numeric(18,0),
    sgd_exp_privado numeric(1,0),
    sgd_sexp_estado numeric(1,0) DEFAULT 0 NOT NULL
);


ALTER TABLE public.sgd_sexp_secexpedientes OWNER TO orfeousr;

--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_exp_numero; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_exp_numero IS 'Numero del expediente';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_srd_codigo IS 'codigo serie';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sbrd_codigo IS 'codigo subserie';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_secuencia; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sexp_secuencia IS 'numero del expediente';


--
-- Name: COLUMN sgd_sexp_secexpedientes.depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.depe_codi IS 'Dependencia creadora';


--
-- Name: COLUMN sgd_sexp_secexpedientes.usua_doc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.usua_doc IS 'Documento del usuario creador';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_fech; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sexp_fech IS 'Fecha de inicio del proceso';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_fexp_codigo; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_fexp_codigo IS 'Codigo de proceso';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_ano; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sexp_ano IS 'A?o del expediente';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_estado; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sexp_estado IS 'Estado de transferencia, 0 ninguna, 1 primaria, 2, secundaria, 3 eliminado';


--
-- Name: sgd_srd_seriesrd; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_srd_seriesrd (
    sgd_srd_codigo numeric(4,0) NOT NULL,
    sgd_srd_descrip character varying(60) NOT NULL,
    sgd_srd_fechini date NOT NULL,
    sgd_srd_fechfin date NOT NULL
);


ALTER TABLE public.sgd_srd_seriesrd OWNER TO orfeousr;

--
-- Name: sgd_tar_tarifas; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tar_tarifas (
    sgd_fenv_codigo numeric(5,0),
    sgd_tar_codser numeric(5,0),
    sgd_tar_codigo numeric(5,0),
    sgd_tar_valenv1 numeric(15,0),
    sgd_tar_valenv2 numeric(15,0),
    sgd_tar_valenv1g1 numeric(15,0),
    sgd_clta_codser numeric(5,0),
    sgd_tar_valenv2g2 numeric(15,0),
    sgd_clta_descrip character varying(100)
);


ALTER TABLE public.sgd_tar_tarifas OWNER TO orfeousr;

--
-- Name: sgd_tdec_tipodecision; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tdec_tipodecision (
    sgd_apli_codi numeric(4,0) NOT NULL,
    sgd_tdec_codigo numeric(4,0) NOT NULL,
    sgd_tdec_descrip character varying(150),
    sgd_tdec_sancionar numeric(1,0),
    sgd_tdec_firmeza numeric(1,0),
    sgd_tdec_versancion numeric(1,0),
    sgd_tdec_showmenu numeric(1,0),
    sgd_tdec_updnotif numeric(1,0),
    sgd_tdec_veragota numeric(1,0)
);


ALTER TABLE public.sgd_tdec_tipodecision OWNER TO orfeousr;

--
-- Name: sgd_tid_tipdecision; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tid_tipdecision (
    sgd_tid_codi numeric(4,0) NOT NULL,
    sgd_tid_desc character varying(150),
    sgd_tpr_codigo numeric(4,0),
    sgd_pexp_codigo numeric(2,0),
    sgd_tpr_codigop numeric(2,0)
);


ALTER TABLE public.sgd_tid_tipdecision OWNER TO orfeousr;

--
-- Name: TABLE sgd_tid_tipdecision; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_tid_tipdecision IS 'Tipos de decision';


--
-- Name: COLUMN sgd_tid_tipdecision.sgd_tid_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tid_tipdecision.sgd_tid_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_tid_tipdecision.sgd_tid_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tid_tipdecision.sgd_tid_desc IS 'Descripcion';


--
-- Name: sgd_tidm_tidocmasiva; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tidm_tidocmasiva (
    sgd_tidm_codi numeric(4,0) NOT NULL,
    sgd_tidm_desc character varying(150)
);


ALTER TABLE public.sgd_tidm_tidocmasiva OWNER TO orfeousr;

--
-- Name: TABLE sgd_tidm_tidocmasiva; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_tidm_tidocmasiva IS 'Cataloga los documentos que hacen parte del procedimiento de correspondencia masiva';


--
-- Name: COLUMN sgd_tidm_tidocmasiva.sgd_tidm_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tidm_tidocmasiva.sgd_tidm_codi IS 'Codigo del documento';


--
-- Name: COLUMN sgd_tidm_tidocmasiva.sgd_tidm_desc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tidm_tidocmasiva.sgd_tidm_desc IS 'Descripcion';


--
-- Name: sgd_tip3_tipotercero; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tip3_tipotercero (
    sgd_tip3_codigo numeric(2,0) NOT NULL,
    sgd_dir_tipo numeric(4,0),
    sgd_tip3_nombre character varying(15),
    sgd_tip3_desc character varying(30),
    sgd_tip3_imgpestana character varying(20),
    sgd_tpr_tp1 numeric(1,0) DEFAULT 0,
    sgd_tpr_tp2 numeric(1,0) DEFAULT 0,
    sgd_tpr_tp4 smallint DEFAULT 1,
    sgd_tpr_tp3 smallint DEFAULT 1,
    sgd_tpr_tp5 smallint DEFAULT 1
);


ALTER TABLE public.sgd_tip3_tipotercero OWNER TO orfeousr;

--
-- Name: sgd_tma_temas; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tma_temas (
    sgd_tma_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5),
    sgd_prc_codigo numeric(4,0),
    sgd_tma_descrip character varying(150)
);


ALTER TABLE public.sgd_tma_temas OWNER TO orfeousr;

--
-- Name: sgd_tme_tipmen; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tme_tipmen (
    sgd_tme_codi numeric(3,0) NOT NULL,
    sgd_tme_desc character varying(150)
);


ALTER TABLE public.sgd_tme_tipmen OWNER TO orfeousr;

--
-- Name: sgd_tpr_tpdcumento; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tpr_tpdcumento (
    sgd_tpr_codigo numeric(4,0) NOT NULL,
    sgd_tpr_descrip character varying(500),
    sgd_tpr_termino numeric(4,0),
    sgd_tpr_tpuso numeric(1,0),
    sgd_tpr_numera character(1),
    sgd_tpr_radica character(1),
    sgd_tpr_tp1 numeric(1,0) DEFAULT 0,
    sgd_tpr_tp2 numeric(1,0) DEFAULT 0,
    sgd_tpr_estado numeric(1,0),
    sgd_termino_real numeric(4,0),
    sgd_tpr_web smallint DEFAULT 1,
    sgd_tpr_tiptermino character varying(5),
    sgd_tpr_tp4 smallint,
    sgd_tpr_tp3 smallint,
    sgd_tpr_tp5 smallint
);


ALTER TABLE public.sgd_tpr_tpdcumento OWNER TO orfeousr;

--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_numera; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_numera IS 'INDICA SI UN DOCUMNTO PUEDE NUMERARSE';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_radica; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_radica IS 'INDICA SI UN DOCUMNTO PUEDE RADICARSE';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp1; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp1 IS 'Radicados de salida';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp2; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp2 IS 'Radicados de entrada';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_estado; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_estado IS 'Estado del documento 1- habilitado 2- deshabilitado';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_web; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_web IS 'Prueba';


--
-- Name: sgd_trad_tiporad; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_trad_tiporad (
    sgd_trad_codigo numeric(2,0) NOT NULL,
    sgd_trad_descr character varying(30),
    sgd_trad_icono character varying(30),
    sgd_trad_diasbloqueo numeric(2,0),
    sgd_trad_genradsal smallint
);


ALTER TABLE public.sgd_trad_tiporad OWNER TO orfeousr;

--
-- Name: sgd_ttr_transaccion; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_ttr_transaccion (
    sgd_ttr_codigo numeric(3,0) NOT NULL,
    sgd_ttr_descrip character varying(100) NOT NULL
);


ALTER TABLE public.sgd_ttr_transaccion OWNER TO orfeousr;

--
-- Name: sgd_tvd_depe_id; Type: SEQUENCE; Schema: public; Owner: orfeousr
--

CREATE SEQUENCE sgd_tvd_depe_id
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE public.sgd_tvd_depe_id OWNER TO orfeousr;

--
-- Name: sgd_tvd_dependencia; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tvd_dependencia (
    sgd_depe_codi character varying(5) NOT NULL,
    sgd_depe_nombre character varying(200) NOT NULL,
    sgd_depe_fechini date NOT NULL,
    sgd_depe_fechfin date NOT NULL
);


ALTER TABLE public.sgd_tvd_dependencia OWNER TO orfeousr;

--
-- Name: sgd_tvd_series; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_tvd_series (
    sgd_depe_codi character varying(5) NOT NULL,
    sgd_stvd_codi numeric(4,0) NOT NULL,
    sgd_stvd_nombre character varying(200) NOT NULL,
    sgd_stvd_ac numeric(4,0),
    sgd_stvd_dispfin numeric(2,0),
    sgd_stvd_proc character varying(500)
);


ALTER TABLE public.sgd_tvd_series OWNER TO orfeousr;

--
-- Name: TABLE sgd_tvd_series; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_tvd_series IS 'Series de TVD';


--
-- Name: COLUMN sgd_tvd_series.sgd_depe_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tvd_series.sgd_depe_codi IS 'Codigo de dependencia TVD';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_codi; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_codi IS 'Codigo de serieTVD';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_nombre; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_nombre IS 'Nombre de serie TVD';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_ac; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_ac IS 'Retencion en AC';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_dispfin; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_dispfin IS 'Disposicion final';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_proc; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_proc IS 'procedimiento';


--
-- Name: sgd_ush_usuhistorico; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_ush_usuhistorico (
    sgd_ush_admcod numeric(10,0) NOT NULL,
    sgd_ush_admdep character varying(5) NOT NULL,
    sgd_ush_admdoc character varying(14) NOT NULL,
    sgd_ush_usucod numeric(10,0) NOT NULL,
    sgd_ush_usudep character varying(5) NOT NULL,
    sgd_ush_usudoc character varying(14) NOT NULL,
    sgd_ush_modcod numeric(5,0) NOT NULL,
    sgd_ush_fechevento date NOT NULL,
    sgd_ush_usulogin character varying(20) NOT NULL
);


ALTER TABLE public.sgd_ush_usuhistorico OWNER TO orfeousr;

--
-- Name: TABLE sgd_ush_usuhistorico; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_ush_usuhistorico IS 'Representa las modificaciones hechas a los usuarios. Registro historico por usuario sobre el tipo de transaccion realizada y los cambios con fecha y hora de realizacion.';


--
-- Name: sgd_usm_usumodifica; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE sgd_usm_usumodifica (
    sgd_usm_modcod numeric(5,0) NOT NULL,
    sgd_usm_moddescr character varying(60) NOT NULL
);


ALTER TABLE public.sgd_usm_usumodifica OWNER TO orfeousr;

--
-- Name: TABLE sgd_usm_usumodifica; Type: COMMENT; Schema: public; Owner: orfeousr
--

COMMENT ON TABLE sgd_usm_usumodifica IS 'Contiene los tipos de modificaciones que se pueden hacer a los usuarios del sistema.';


--
-- Name: ubicacion_fisica; Type: TABLE; Schema: public; Owner: orfeousr; Tablespace: 
--

CREATE TABLE ubicacion_fisica (
    ubic_depe_radi character varying(5),
    ubic_depe_arch character varying(5)
);


ALTER TABLE public.ubicacion_fisica OWNER TO orfeousr;

--
-- Data for Name: anexos; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY anexos (anex_radi_nume, anex_codigo, anex_tipo, anex_tamano, anex_solo_lect, anex_creador, anex_desc, anex_numero, anex_nomb_archivo, anex_borrado, anex_origen, anex_ubic, anex_salida, radi_nume_salida, anex_radi_fech, anex_estado, usua_doc, sgd_rem_destino, anex_fech_envio, sgd_dir_tipo, anex_fech_impres, anex_depe_creador, sgd_doc_secuencia, sgd_doc_padre, sgd_arg_codigo, sgd_tpr_codigo, sgd_deve_codigo, sgd_deve_fech, sgd_fech_impres, anex_fech_anex, anex_depe_codi, sgd_pnufe_codi, sgd_dnufe_codi, anex_usudoc_creador, sgd_fech_doc, sgd_apli_codi, sgd_trad_codigo, sgd_dir_direccion, sgd_exp_numero, numero_doc, sgd_srd_codigo, sgd_sbrd_codigo, anex_num_hoja, texto_archivo_anex, anex_idarch_version, anex_num_version) FROM stdin;

\.


--
-- Data for Name: anexos_historico; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY anexos_historico (anex_hist_anex_codi, anex_hist_num_ver, anex_hist_tipo_mod, anex_hist_usua, anex_hist_fecha, usua_doc) FROM stdin;
\.


--
-- Data for Name: anexos_tipo; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY anexos_tipo (anex_tipo_codi, anex_tipo_ext, anex_tipo_desc) FROM stdin;
1	doc	Word
2	xls	Excel
3	ppt	PowerPoint
4	tif	Imagen Tif
5	jpg	Imagen jpg
6	gif	Imagen gif
7	pdf	Acrobat Reader
8	txt	Documento txt
9	zip	Comprimido
10	rtf	Rich Text Format (rtf)
11	dia	Dia(Diagrama)
12	zargo	Argo(Diagrama)
13	csv	csv (separado por comas)
14	odt	OpenDocument Text
20	avi	.avi (Video)
21	mpg	.mpg (video)
23	tar	.tar (Comprimido)
24	docx	Microsoft Word 2010+
25	xlsx	Microsoft Excel 2010+
26	pptx	Microsoft Power Point 2010+
\.


--
-- Data for Name: aux_01; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY aux_01 (r) FROM stdin;
\.


--
-- Data for Name: bodega_empresas; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY bodega_empresas (nombre_de_la_empresa, nuir, nit_de_la_empresa, sigla_de_la_empresa, direccion, codigo_del_departamento, codigo_del_municipio, telefono_1, telefono_2, email, nombre_rep_legal, cargo_rep_legal, identificador_empresa, are_esp_secue, id_cont, id_pais, activa, flag_rups, codigo_suscriptor) FROM stdin;
\.


--
-- Data for Name: bodega_empresas_old; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY bodega_empresas_old (identificador_de_la_empresa, nuir, nombre_de_la_empresa, nit_de_la_empresa, sigla_de_la_empresa, codigo_de_la_nat_juridica, direccion, codigo_del_departamento, codigo_del_municipio, codigo_de_la_unidad, telefono_1, telefono_2, telefono_3, apartado_aereo, numero_de_fax, zona_postal, email, tiene_contab_por_servicio, fecha_de_actualizacion, codigo_regional, estado_de_la_empresa, fecha_del_estado, obsv_del_estado, esp_cias, esp_auxi, esp_etco, esp_ceco, estado, tipo_identificacion_repl, numero_identificaci_repl, nombre_rep_legal, cargo_rep_legal, numero_camara_ccio, cod_estado_vigilancia, identificador_empresa, nombre_de_la_empresa_anterior, direccion_anterior) FROM stdin;
\.


--
-- Data for Name: borrar_carpeta_personalizada; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY borrar_carpeta_personalizada (carp_per_codi, carp_per_usu, carp_per_desc) FROM stdin;
\.


--
-- Data for Name: borrar_empresa_esp; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY borrar_empresa_esp (eesp_codi, eesp_nomb, essp_nit, essp_sigla, depe_codi, muni_codi, eesp_dire, eesp_rep_leg) FROM stdin;
\.


--
-- Data for Name: carpeta; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY carpeta (carp_codi, carp_desc) FROM stdin;
1	Salida
12	Devueltos
11	Vo.Bo.
0	Entrada
4	Pqrs
3	Solicitudes internas
5	NUEVA RADICACION
\.


--
-- Data for Name: carpeta_per; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY carpeta_per (usua_codi, depe_codi, nomb_carp, desc_carp, codi_carp) FROM stdin;
\.


--
-- Data for Name: centro_poblado; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY centro_poblado (cpob_codi, muni_codi, dpto_codi, cpob_nomb, cpob_nomb_anterior) FROM stdin;
\.


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY departamento (dpto_codi, dpto_nomb, id_cont, id_pais) FROM stdin;
1	TODOS	1	170
5	ANTIOQUÍA	1	170
8	ATLÁNTICO	1	170
13	BOLÍVAR	1	170
15	BOYACÁ	1	170
17	CALDAS	1	170
18	CAQUETÁ	1	170
19	CAUCA	1	170
20	CESAR	1	170
23	CÓRDOBA	1	170
25	CUNDINAMARCA	1	170
27	CHOCO	1	170
41	HUILA	1	170
44	LA GUAJIRA	1	170
47	MAGDALENA	1	170
50	META	1	170
52	NARIÑO	1	170
54	NORTE DE SANTANDER	1	170
63	QUINDÍO	1	170
66	RISARALDA	1	170
68	SANTANDER	1	170
70	SUCRE	1	170
73	TOLIMA	1	170
76	VALLE DEL CAUCA	1	170
81	ARAUCA	1	170
85	CASANARE	1	170
86	PUTUMAYO	1	170
88	SAN ANDRÉS	1	170
91	AMAZONAS	1	170
94	GUAINÍA	1	170
95	GUAVIARE	1	170
97	VAUPÉS	1	170
99	VICHADA	1	170
99	CICLO PRUEBA	1	170
11	D.C.	1	170
\.


--
-- Data for Name: dependencia; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY dependencia (depe_codi, depe_nomb, dpto_codi, depe_codi_padre, muni_codi, depe_codi_territorial, dep_sigla, dep_central, dep_direccion, depe_num_interna, depe_num_resolucion, depe_rad_tp1, depe_rad_tp2, id_cont, id_pais, depe_estado, depe_segu, depe_rad_tp4, depe_rad_tp3, depe_rad_tp5) FROM stdin;
0999	Dependencia de Salida	11	0999	1	0999	\N	1	\N	\N	\N	\N	\N	1	170	1	\N	\N	\N	\N
0998	Dependencia de Prueba	11	0998	1	0998		1	Bogota DC	\N	\N	0998	0998	1	170	1	\N	0998	\N	\N
0997	SKINA TECHNOLOGIES	11		1	998	SKINA	\N	CR 64 96 17	\N	\N	997	997	1	170	1	\N	997	997	\N
\.


--
-- Data for Name: dependencia_visibilidad; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY dependencia_visibilidad (codigo_visibilidad, dependencia_visible, dependencia_observa) FROM stdin;
1	0998	997
\.


--
-- Name: dependencias; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('dependencias', 0, false);


--
-- Data for Name: dup_eliminar; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY dup_eliminar (sgd_oem_codigo, tdid_codi, sgd_oem_oempresa, sgd_oem_rep_legal, sgd_oem_nit, sgd_oem_sigla, muni_codi, dpto_codi, sgd_oem_direccion, sgd_oem_telefono) FROM stdin;
\.


--
-- Data for Name: emp_cod_actualizar; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY emp_cod_actualizar (emp_cod_ant, emp_cod_nue) FROM stdin;
\.


--
-- Data for Name: empresas_temporal; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY empresas_temporal (nombre_de_la_empresa, nuir, nit_de_la_empresa, sigla_de_la_empresa, direccion, codigo_del_departamento, codigo_del_municipio, telefono_1, telefono_2, email, nombre_rep_legal, cargo_rep_legal, identificador_empresa, are_esp_secue) FROM stdin;
\.


--
-- Data for Name: encuesta; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY encuesta (usua_doc, fecha, p1, p2, p3, p4, p5, p6, p7, p7_cual, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p20_cual, p21, p22, p23, p24, p25) FROM stdin;
\.


--
-- Data for Name: entidades_asociativa; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY entidades_asociativa (nit, codentidad) FROM stdin;
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY estado (esta_codi, esta_desc) FROM stdin;
9	Documento Orfeo
\.


--
-- Data for Name: example; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY example (campo1, campo2) FROM stdin;
\.


--
-- Data for Name: fun_funcionario; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY fun_funcionario (usua_doc, usua_fech_crea, usua_esta, usua_nomb, usua_ext, usua_nacim, usua_email, usua_at, usua_piso, cedula_ok, cedula_suip, nombre_suip, observa) FROM stdin;
\.


--
-- Data for Name: fun_funcionario_2; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY fun_funcionario_2 (usua_doc, usua_fech_crea, usua_esta, usua_nomb, usua_ext, usua_nacim, usua_email, usua_at, usua_piso, cedula_ok, cedula_suip, nombre_suip, observa) FROM stdin;
\.


--
-- Data for Name: hist_eventos; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY hist_eventos (depe_codi, hist_fech, usua_codi, radi_nume_radi, hist_obse, usua_codi_dest, usua_doc, usua_doc_old, sgd_ttr_codigo, hist_usua_autor, hist_doc_dest, depe_codi_dest) FROM stdin;
\.


--
-- Data for Name: informados; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY informados (radi_nume_radi, usua_codi, depe_codi, info_desc, info_fech, info_leido, usua_codi_info, info_codi, usua_doc, info_resp) FROM stdin;
\.


--
-- Data for Name: medio_recepcion; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY medio_recepcion (mrec_codi, mrec_desc) FROM stdin;
1	Correo
2	Fax
3	Internet
4	Mail
5	Personal
6	Telefonico
\.


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY municipio (muni_codi, dpto_codi, muni_nomb, id_cont, id_pais, homologa_muni, homologa_idmuni, activa) FROM stdin;
1	10	NEW YORK	1	249	0	\N	1
8	9	BARCELONA	2	724	0	\N	1
1	16	GINEBRA	2	767	0	\N	1
16	9	CUENCA	2	724	0	\N	1
999	1	TODOS	1	170	\N	\N	1
1	5	MEDELLIN	1	170	\N	\N	1
2	5	ABEJORRAL	1	170	\N	\N	1
4	5	ABRIAQUI	1	170	\N	\N	1
21	5	ALEJANDRIA	1	170	\N	\N	1
30	5	AMAGA	1	170	\N	\N	1
31	5	AMALFI	1	170	\N	\N	1
34	5	ANDES	1	170	\N	\N	1
36	5	ANGELOPOLIS	1	170	\N	\N	1
38	5	ANGOSTURA	1	170	\N	\N	1
40	5	ANORI	1	170	\N	\N	1
42	5	SANTA FE DE ANTIOQUIA	1	170	\N	\N	1
44	5	ANZA	1	170	\N	\N	1
45	5	APARTADO	1	170	\N	\N	1
51	5	ARBOLETES	1	170	\N	\N	1
55	5	ARGELIA	1	170	\N	\N	1
59	5	ARMENIA	1	170	\N	\N	1
79	5	BARBOSA	1	170	\N	\N	1
86	5	BELMIRA	1	170	\N	\N	1
88	5	BELLO	1	170	\N	\N	1
91	5	BETANIA	1	170	\N	\N	1
93	5	BETULIA	1	170	\N	\N	1
101	5	CIUDAD BOLIVAR	1	170	\N	\N	1
107	5	BRICEÑO	1	170	\N	\N	1
113	5	BURITICA	1	170	\N	\N	1
120	5	CACERES	1	170	\N	\N	1
125	5	CAICEDO	1	170	\N	\N	1
129	5	CALDAS	1	170	\N	\N	1
134	5	CAMPAMENTO	1	170	\N	\N	1
138	5	CAÑASGORDAS	1	170	\N	\N	1
142	5	CARACOLI	1	170	\N	\N	1
145	5	CARAMANTA	1	170	\N	\N	1
147	5	CAREPA	1	170	\N	\N	1
148	5	EL CARMEN DE VIBORAL	1	170	\N	\N	1
150	5	CAROLINA	1	170	\N	\N	1
154	5	CAUCASIA	1	170	\N	\N	1
172	5	CHIGORODO	1	170	\N	\N	1
190	5	CISNEROS	1	170	\N	\N	1
197	5	COCORNA	1	170	\N	\N	1
206	5	CONCEPCION	1	170	\N	\N	1
209	5	CONCORDIA	1	170	\N	\N	1
212	5	COPACABANA	1	170	\N	\N	1
234	5	DABEIBA	1	170	\N	\N	1
237	5	DON MATIAS	1	170	\N	\N	1
240	5	EBEJICO	1	170	\N	\N	1
250	5	EL BAGRE	1	170	\N	\N	1
264	5	ENTRERRIOS	1	170	\N	\N	1
266	5	ENVIGADO	1	170	\N	\N	1
282	5	FREDONIA	1	170	\N	\N	1
284	5	FRONTINO	1	170	\N	\N	1
306	5	GIRALDO	1	170	\N	\N	1
308	5	GIRARDOTA	1	170	\N	\N	1
310	5	GOMEZ PLATA	1	170	\N	\N	1
313	5	GRANADA	1	170	\N	\N	1
315	5	GUADALUPE	1	170	\N	\N	1
318	5	GUARNE	1	170	\N	\N	1
321	5	GUATAPE	1	170	\N	\N	1
347	5	HELICONIA	1	170	\N	\N	1
353	5	HISPANIA	1	170	\N	\N	1
360	5	ITAGUI	1	170	\N	\N	1
361	5	ITUANGO	1	170	\N	\N	1
364	5	JARDIN	1	170	\N	\N	1
368	5	JERICO	1	170	\N	\N	1
376	5	LA CEJA	1	170	\N	\N	1
380	5	LA ESTRELLA	1	170	\N	\N	1
390	5	LA PINTADA	1	170	\N	\N	1
400	5	LA UNION	1	170	\N	\N	1
411	5	LIBORINA	1	170	\N	\N	1
425	5	MACEO	1	170	\N	\N	1
440	5	MARINILLA	1	170	\N	\N	1
467	5	MONTEBELLO	1	170	\N	\N	1
475	5	MURINDO	1	170	\N	\N	1
480	5	MUTATA	1	170	\N	\N	1
483	5	NARIÑO	1	170	\N	\N	1
490	5	NECOCLI	1	170	\N	\N	1
495	5	NECHI	1	170	\N	\N	1
501	5	OLAYA	1	170	\N	\N	1
541	5	PEÑOL	1	170	\N	\N	1
543	5	PEQUE	1	170	\N	\N	1
576	5	PUEBLORRICO	1	170	\N	\N	1
585	5	PUERTO NARE	1	170	\N	\N	1
591	5	PUERTO TRIUNFO	1	170	\N	\N	1
604	5	REMEDIOS	1	170	\N	\N	1
607	5	RETIRO	1	170	\N	\N	1
615	5	RIONEGRO	1	170	\N	\N	1
628	5	SABANALARGA	1	170	\N	\N	1
631	5	SABANETA	1	170	\N	\N	1
642	5	SALGAR	1	170	\N	\N	1
647	5	SAN ANDRES DE CUERQUIA	1	170	\N	\N	1
649	5	SAN CARLOS	1	170	\N	\N	1
652	5	SAN FRANCISCO	1	170	\N	\N	1
656	5	SAN JERONIMO	1	170	\N	\N	1
658	5	SAN JOSE DE LA MONTAÑA	1	170	\N	\N	1
659	5	SAN JUAN DE URABA	1	170	\N	\N	1
660	5	SAN LUIS	1	170	\N	\N	1
664	5	SAN PEDRO DE LOS MILAGROS	1	170	\N	\N	1
665	5	SAN PEDRO DE URABA	1	170	\N	\N	1
667	5	SAN RAFAEL	1	170	\N	\N	1
670	5	SAN ROQUE	1	170	\N	\N	1
674	5	SAN VICENTE FERRER	1	170	\N	\N	1
679	5	SANTA BARBARA	1	170	\N	\N	1
686	5	SANTA ROSA DE OSOS	1	170	\N	\N	1
690	5	SANTO DOMINGO	1	170	\N	\N	1
697	5	EL SANTUARIO	1	170	\N	\N	1
736	5	SEGOVIA	1	170	\N	\N	1
756	5	SONSON	1	170	\N	\N	1
761	5	SOPETRAN	1	170	\N	\N	1
789	5	TAMESIS	1	170	\N	\N	1
790	5	TARAZA	1	170	\N	\N	1
792	5	TARSO	1	170	\N	\N	1
809	5	TITIRIBI	1	170	\N	\N	1
819	5	TOLEDO	1	170	\N	\N	1
837	5	TURBO	1	170	\N	\N	1
842	5	URAMITA	1	170	\N	\N	1
847	5	URRAO	1	170	\N	\N	1
854	5	VALDIVIA	1	170	\N	\N	1
856	5	VALPARAISO	1	170	\N	\N	1
858	5	VEGACHI	1	170	\N	\N	1
861	5	VENECIA	1	170	\N	\N	1
873	5	VIGIA DEL FUERTE	1	170	\N	\N	1
885	5	YALI	1	170	\N	\N	1
887	5	YARUMAL	1	170	\N	\N	1
890	5	YOLOMBO	1	170	\N	\N	1
893	5	YONDO	1	170	\N	\N	1
895	5	ZARAGOZA	1	170	\N	\N	1
1	8	BARRANQUILLA	1	170	\N	\N	1
78	8	BARANOA	1	170	\N	\N	1
137	8	CAMPO DE LA CRUZ	1	170	\N	\N	1
141	8	CANDELARIA	1	170	\N	\N	1
296	8	GALAPA	1	170	\N	\N	1
372	8	JUAN DE ACOSTA	1	170	\N	\N	1
421	8	LURUACO	1	170	\N	\N	1
433	8	MALAMBO	1	170	\N	\N	1
436	8	MANATI	1	170	\N	\N	1
520	8	PALMAR DE VARELA	1	170	\N	\N	1
549	8	PIOJO	1	170	\N	\N	1
558	8	POLONUEVO	1	170	\N	\N	1
560	8	PONEDERA	1	170	\N	\N	1
573	8	PUERTO COLOMBIA	1	170	\N	\N	1
606	8	REPELON	1	170	\N	\N	1
634	8	SABANAGRANDE	1	170	\N	\N	1
638	8	SABANALARGA	1	170	\N	\N	1
675	8	SANTA LUCIA	1	170	\N	\N	1
685	8	SANTO TOMAS	1	170	\N	\N	1
758	8	SOLEDAD	1	170	\N	\N	1
770	8	SUAN	1	170	\N	\N	1
832	8	TUBARA	1	170	\N	\N	1
849	8	USIACURI	1	170	\N	\N	1
1	11	BOGOTA	1	170	\N	\N	1
1	13	CARTAGENA	1	170	\N	\N	1
6	13	ACHI	1	170	\N	\N	1
30	13	ALTOS DEL ROSARIO	1	170	\N	\N	1
42	13	ARENAL	1	170	\N	\N	1
52	13	ARJONA	1	170	\N	\N	1
62	13	ARROYOHONDO	1	170	\N	\N	1
74	13	BARRANCO DE LOBA	1	170	\N	\N	1
140	13	CALAMAR	1	170	\N	\N	1
160	13	CANTAGALLO	1	170	\N	\N	1
188	13	CICUCO	1	170	\N	\N	1
212	13	CORDOBA	1	170	\N	\N	1
222	13	CLEMENCIA	1	170	\N	\N	1
244	13	EL CARMEN DE BOLIVAR	1	170	\N	\N	1
248	13	EL GUAMO	1	170	\N	\N	1
268	13	EL PEÑON	1	170	\N	\N	1
300	13	HATILLO DE LOBA	1	170	\N	\N	1
430	13	MAGANGUE	1	170	\N	\N	1
433	13	MAHATES	1	170	\N	\N	1
440	13	MARGARITA	1	170	\N	\N	1
442	13	MARIA LA BAJA	1	170	\N	\N	1
458	13	MONTECRISTO	1	170	\N	\N	1
468	13	MOMPOS	1	170	\N	\N	1
473	13	MORALES	1	170	\N	\N	1
490	13	NOROSI	1	170	\N	\N	1
549	13	PINILLOS	1	170	\N	\N	1
580	13	REGIDOR	1	170	\N	\N	1
600	13	RIO VIEJO	1	170	\N	\N	1
620	13	SAN CRISTOBAL	1	170	\N	\N	1
647	13	SAN ESTANISLAO	1	170	\N	\N	1
650	13	SAN FERNANDO	1	170	\N	\N	1
654	13	SAN JACINTO	1	170	\N	\N	1
655	13	SAN JACINTO DEL CAUCA	1	170	\N	\N	1
657	13	SAN JUAN NEPOMUCENO	1	170	\N	\N	1
667	13	SAN MARTIN DE LOBA	1	170	\N	\N	1
670	13	SAN PABLO	1	170	\N	\N	1
673	13	SANTA CATALINA	1	170	\N	\N	1
683	13	SANTA ROSA	1	170	\N	\N	1
688	13	SANTA ROSA DEL SUR	1	170	\N	\N	1
744	13	SIMITI	1	170	\N	\N	1
760	13	SOPLAVIENTO	1	170	\N	\N	1
780	13	TALAIGUA NUEVO	1	170	\N	\N	1
810	13	TIQUISIO	1	170	\N	\N	1
836	13	TURBACO	1	170	\N	\N	1
838	13	TURBANA	1	170	\N	\N	1
873	13	VILLANUEVA	1	170	\N	\N	1
894	13	ZAMBRANO	1	170	\N	\N	1
1	15	TUNJA	1	170	\N	\N	1
22	15	ALMEIDA	1	170	\N	\N	1
47	15	AQUITANIA	1	170	\N	\N	1
51	15	ARCABUCO	1	170	\N	\N	1
87	15	BELEN	1	170	\N	\N	1
90	15	BERBEO	1	170	\N	\N	1
92	15	BETEITIVA	1	170	\N	\N	1
97	15	BOAVITA	1	170	\N	\N	1
104	15	BOYACA	1	170	\N	\N	1
106	15	BRICEÑO	1	170	\N	\N	1
109	15	BUENAVISTA	1	170	\N	\N	1
114	15	BUSBANZA	1	170	\N	\N	1
131	15	CALDAS	1	170	\N	\N	1
135	15	CAMPOHERMOSO	1	170	\N	\N	1
162	15	CERINZA	1	170	\N	\N	1
172	15	CHINAVITA	1	170	\N	\N	1
176	15	CHIQUINQUIRA	1	170	\N	\N	1
180	15	CHISCAS	1	170	\N	\N	1
183	15	CHITA	1	170	\N	\N	1
185	15	CHITARAQUE	1	170	\N	\N	1
187	15	CHIVATA	1	170	\N	\N	1
189	15	CIENEGA	1	170	\N	\N	1
204	15	COMBITA	1	170	\N	\N	1
212	15	COPER	1	170	\N	\N	1
215	15	CORRALES	1	170	\N	\N	1
218	15	COVARACHIA	1	170	\N	\N	1
223	15	CUBARA	1	170	\N	\N	1
224	15	CUCAITA	1	170	\N	\N	1
226	15	CUITIVA	1	170	\N	\N	1
232	15	CHIQUIZA	1	170	\N	\N	1
236	15	CHIVOR	1	170	\N	\N	1
238	15	DUITAMA	1	170	\N	\N	1
244	15	EL COCUY	1	170	\N	\N	1
248	15	EL ESPINO	1	170	\N	\N	1
272	15	FIRAVITOBA	1	170	\N	\N	1
276	15	FLORESTA	1	170	\N	\N	1
293	15	GACHANTIVA	1	170	\N	\N	1
296	15	GAMEZA	1	170	\N	\N	1
299	15	GARAGOA	1	170	\N	\N	1
317	15	GUACAMAYAS	1	170	\N	\N	1
322	15	GUATEQUE	1	170	\N	\N	1
325	15	GUAYATA	1	170	\N	\N	1
332	15	GUICAN DE LA SIERRA	1	170	\N	\N	1
362	15	IZA	1	170	\N	\N	1
367	15	JENESANO	1	170	\N	\N	1
368	15	JERICO	1	170	\N	\N	1
377	15	LABRANZAGRANDE	1	170	\N	\N	1
380	15	LA CAPILLA	1	170	\N	\N	1
401	15	LA VICTORIA	1	170	\N	\N	1
403	15	LA UVITA	1	170	\N	\N	1
407	15	VILLA DE LEYVA	1	170	\N	\N	1
425	15	MACANAL	1	170	\N	\N	1
442	15	MARIPI	1	170	\N	\N	1
455	15	MIRAFLORES	1	170	\N	\N	1
464	15	MONGUA	1	170	\N	\N	1
466	15	MONGUI	1	170	\N	\N	1
469	15	MONIQUIRA	1	170	\N	\N	1
476	15	MOTAVITA	1	170	\N	\N	1
480	15	MUZO	1	170	\N	\N	1
491	15	NOBSA	1	170	\N	\N	1
494	15	NUEVO COLON	1	170	\N	\N	1
500	15	OICATA	1	170	\N	\N	1
507	15	OTANCHE	1	170	\N	\N	1
511	15	PACHAVITA	1	170	\N	\N	1
514	15	PAEZ	1	170	\N	\N	1
516	15	PAIPA	1	170	\N	\N	1
518	15	PAJARITO	1	170	\N	\N	1
522	15	PANQUEBA	1	170	\N	\N	1
531	15	PAUNA	1	170	\N	\N	1
533	15	PAYA	1	170	\N	\N	1
537	15	PAZ DE RIO	1	170	\N	\N	1
542	15	PESCA	1	170	\N	\N	1
550	15	PISBA	1	170	\N	\N	1
572	15	PUERTO BOYACA	1	170	\N	\N	1
580	15	QUIPAMA	1	170	\N	\N	1
599	15	RAMIRIQUI	1	170	\N	\N	1
600	15	RAQUIRA	1	170	\N	\N	1
621	15	RONDON	1	170	\N	\N	1
632	15	SABOYA	1	170	\N	\N	1
638	15	SACHICA	1	170	\N	\N	1
646	15	SAMACA	1	170	\N	\N	1
660	15	SAN EDUARDO	1	170	\N	\N	1
664	15	SAN JOSE DE PARE	1	170	\N	\N	1
667	15	SAN LUIS DE GACENO	1	170	\N	\N	1
673	15	SAN MATEO	1	170	\N	\N	1
676	15	SAN MIGUEL DE SEMA	1	170	\N	\N	1
681	15	SAN PABLO DE BORBUR	1	170	\N	\N	1
686	15	SANTANA	1	170	\N	\N	1
690	15	SANTA MARIA	1	170	\N	\N	1
693	15	SANTA ROSA DE VITERBO	1	170	\N	\N	1
696	15	SANTA SOFIA	1	170	\N	\N	1
720	15	SATIVANORTE	1	170	\N	\N	1
723	15	SATIVASUR	1	170	\N	\N	1
740	15	SIACHOQUE	1	170	\N	\N	1
753	15	SOATA	1	170	\N	\N	1
755	15	SOCOTA	1	170	\N	\N	1
757	15	SOCHA	1	170	\N	\N	1
759	15	SOGAMOSO	1	170	\N	\N	1
761	15	SOMONDOCO	1	170	\N	\N	1
762	15	SORA	1	170	\N	\N	1
763	15	SOTAQUIRA	1	170	\N	\N	1
764	15	SORACA	1	170	\N	\N	1
774	15	SUSACON	1	170	\N	\N	1
776	15	SUTAMARCHAN	1	170	\N	\N	1
778	15	SUTATENZA	1	170	\N	\N	1
790	15	TASCO	1	170	\N	\N	1
798	15	TENZA	1	170	\N	\N	1
804	15	TIBANA	1	170	\N	\N	1
806	15	TIBASOSA	1	170	\N	\N	1
808	15	TINJACA	1	170	\N	\N	1
810	15	TIPACOQUE	1	170	\N	\N	1
814	15	TOCA	1	170	\N	\N	1
816	15	TOGUI	1	170	\N	\N	1
820	15	TOPAGA	1	170	\N	\N	1
822	15	TOTA	1	170	\N	\N	1
832	15	TUNUNGUA	1	170	\N	\N	1
835	15	TURMEQUE	1	170	\N	\N	1
837	15	TUTA	1	170	\N	\N	1
839	15	TUTAZA	1	170	\N	\N	1
842	15	UMBITA	1	170	\N	\N	1
861	15	VENTAQUEMADA	1	170	\N	\N	1
879	15	VIRACACHA	1	170	\N	\N	1
897	15	ZETAQUIRA	1	170	\N	\N	1
1	17	MANIZALES	1	170	\N	\N	1
13	17	AGUADAS	1	170	\N	\N	1
42	17	ANSERMA	1	170	\N	\N	1
50	17	ARANZAZU	1	170	\N	\N	1
88	17	BELALCAZAR	1	170	\N	\N	1
174	17	CHINCHINA	1	170	\N	\N	1
272	17	FILADELFIA	1	170	\N	\N	1
380	17	LA DORADA	1	170	\N	\N	1
388	17	LA MERCED	1	170	\N	\N	1
433	17	MANZANARES	1	170	\N	\N	1
442	17	MARMATO	1	170	\N	\N	1
444	17	MARQUETALIA	1	170	\N	\N	1
446	17	MARULANDA	1	170	\N	\N	1
486	17	NEIRA	1	170	\N	\N	1
495	17	NORCASIA	1	170	\N	\N	1
513	17	PACORA	1	170	\N	\N	1
524	17	PALESTINA	1	170	\N	\N	1
541	17	PENSILVANIA	1	170	\N	\N	1
614	17	RIOSUCIO	1	170	\N	\N	1
616	17	RISARALDA	1	170	\N	\N	1
653	17	SALAMINA	1	170	\N	\N	1
662	17	SAMANA	1	170	\N	\N	1
665	17	SAN JOSE	1	170	\N	\N	1
777	17	SUPIA	1	170	\N	\N	1
867	17	VICTORIA	1	170	\N	\N	1
873	17	VILLAMARIA	1	170	\N	\N	1
877	17	VITERBO	1	170	\N	\N	1
1	18	FLORENCIA	1	170	\N	\N	1
29	18	ALBANIA	1	170	\N	\N	1
94	18	BELEN DE LOS ANDAQUIES	1	170	\N	\N	1
150	18	CARTAGENA DEL CHAIRA	1	170	\N	\N	1
205	18	CURILLO	1	170	\N	\N	1
247	18	EL DONCELLO	1	170	\N	\N	1
256	18	EL PAUJIL	1	170	\N	\N	1
410	18	LA MONTAÑITA	1	170	\N	\N	1
460	18	MILAN	1	170	\N	\N	1
479	18	MORELIA	1	170	\N	\N	1
592	18	PUERTO RICO	1	170	\N	\N	1
610	18	SAN JOSE DEL FRAGUA	1	170	\N	\N	1
753	18	SAN VICENTE DEL CAGUAN	1	170	\N	\N	1
756	18	SOLANO	1	170	\N	\N	1
785	18	SOLITA	1	170	\N	\N	1
860	18	VALPARAISO	1	170	\N	\N	1
1	19	POPAYAN	1	170	\N	\N	1
22	19	ALMAGUER	1	170	\N	\N	1
50	19	ARGELIA	1	170	\N	\N	1
75	19	BALBOA	1	170	\N	\N	1
100	19	BOLIVAR	1	170	\N	\N	1
110	19	BUENOS AIRES	1	170	\N	\N	1
130	19	CAJIBIO	1	170	\N	\N	1
137	19	CALDONO	1	170	\N	\N	1
142	19	CALOTO	1	170	\N	\N	1
212	19	CORINTO	1	170	\N	\N	1
256	19	EL TAMBO	1	170	\N	\N	1
290	19	FLORENCIA	1	170	\N	\N	1
300	19	GUACHENE	1	170	\N	\N	1
318	19	GUAPI	1	170	\N	\N	1
355	19	INZA	1	170	\N	\N	1
364	19	JAMBALO	1	170	\N	\N	1
392	19	LA SIERRA	1	170	\N	\N	1
397	19	LA VEGA	1	170	\N	\N	1
418	19	LOPEZ DE MICAY	1	170	\N	\N	1
450	19	MERCADERES	1	170	\N	\N	1
455	19	MIRANDA	1	170	\N	\N	1
473	19	MORALES	1	170	\N	\N	1
513	19	PADILLA	1	170	\N	\N	1
517	19	PAEZ	1	170	\N	\N	1
532	19	PATIA	1	170	\N	\N	1
533	19	PIAMONTE	1	170	\N	\N	1
548	19	PIENDAMO	1	170	\N	\N	1
573	19	PUERTO TEJADA	1	170	\N	\N	1
585	19	PURACE	1	170	\N	\N	1
622	19	ROSAS	1	170	\N	\N	1
693	19	SAN SEBASTIAN	1	170	\N	\N	1
698	19	SANTANDER DE QUILICHAO	1	170	\N	\N	1
701	19	SANTA ROSA	1	170	\N	\N	1
743	19	SILVIA	1	170	\N	\N	1
760	19	SOTARA	1	170	\N	\N	1
780	19	SUAREZ	1	170	\N	\N	1
785	19	SUCRE	1	170	\N	\N	1
807	19	TIMBIO	1	170	\N	\N	1
809	19	TIMBIQUI	1	170	\N	\N	1
821	19	TORIBIO	1	170	\N	\N	1
824	19	TOTORO	1	170	\N	\N	1
845	19	VILLA RICA	1	170	\N	\N	1
1	20	VALLEDUPAR	1	170	\N	\N	1
11	20	AGUACHICA	1	170	\N	\N	1
13	20	AGUSTIN CODAZZI	1	170	\N	\N	1
32	20	ASTREA	1	170	\N	\N	1
45	20	BECERRIL	1	170	\N	\N	1
60	20	BOSCONIA	1	170	\N	\N	1
175	20	CHIMICHAGUA	1	170	\N	\N	1
178	20	CHIRIGUANA	1	170	\N	\N	1
228	20	CURUMANI	1	170	\N	\N	1
238	20	EL COPEY	1	170	\N	\N	1
250	20	EL PASO	1	170	\N	\N	1
295	20	GAMARRA	1	170	\N	\N	1
310	20	GONZALEZ	1	170	\N	\N	1
383	20	LA GLORIA	1	170	\N	\N	1
400	20	LA JAGUA DE IBIRICO	1	170	\N	\N	1
443	20	MANAURE BALCON DEL CESAR	1	170	\N	\N	1
517	20	PAILITAS	1	170	\N	\N	1
550	20	PELAYA	1	170	\N	\N	1
570	20	PUEBLO BELLO	1	170	\N	\N	1
614	20	RIO DE ORO	1	170	\N	\N	1
621	20	LA PAZ	1	170	\N	\N	1
710	20	SAN ALBERTO	1	170	\N	\N	1
750	20	SAN DIEGO	1	170	\N	\N	1
770	20	SAN MARTIN	1	170	\N	\N	1
787	20	TAMALAMEQUE	1	170	\N	\N	1
1	23	MONTERIA	1	170	\N	\N	1
68	23	AYAPEL	1	170	\N	\N	1
79	23	BUENAVISTA	1	170	\N	\N	1
90	23	CANALETE	1	170	\N	\N	1
162	23	CERETE	1	170	\N	\N	1
168	23	CHIMA	1	170	\N	\N	1
182	23	CHINU	1	170	\N	\N	1
189	23	CIENAGA DE ORO	1	170	\N	\N	1
300	23	COTORRA	1	170	\N	\N	1
350	23	LA APARTADA	1	170	\N	\N	1
417	23	LORICA	1	170	\N	\N	1
419	23	LOS CORDOBAS	1	170	\N	\N	1
464	23	MOMIL	1	170	\N	\N	1
466	23	MONTELIBANO	1	170	\N	\N	1
500	23	MOÑITOS	1	170	\N	\N	1
555	23	PLANETA RICA	1	170	\N	\N	1
570	23	PUEBLO NUEVO	1	170	\N	\N	1
574	23	PUERTO ESCONDIDO	1	170	\N	\N	1
580	23	PUERTO LIBERTADOR	1	170	\N	\N	1
586	23	PURISIMA DE LA CONCEPCION	1	170	\N	\N	1
660	23	SAHAGUN	1	170	\N	\N	1
670	23	SAN ANDRES DE SOTAVENTO	1	170	\N	\N	1
672	23	SAN ANTERO	1	170	\N	\N	1
675	23	SAN BERNARDO DEL VIENTO	1	170	\N	\N	1
678	23	SAN CARLOS	1	170	\N	\N	1
682	23	SAN JOSE DE URE	1	170	\N	\N	1
686	23	SAN PELAYO	1	170	\N	\N	1
807	23	TIERRALTA	1	170	\N	\N	1
815	23	TUCHIN	1	170	\N	\N	1
855	23	VALENCIA	1	170	\N	\N	1
1	25	AGUA DE DIOS	1	170	\N	\N	1
19	25	ALBAN	1	170	\N	\N	1
35	25	ANAPOIMA	1	170	\N	\N	1
40	25	ANOLAIMA	1	170	\N	\N	1
53	25	ARBELAEZ	1	170	\N	\N	1
86	25	BELTRAN	1	170	\N	\N	1
95	25	BITUIMA	1	170	\N	\N	1
99	25	BOJACA	1	170	\N	\N	1
120	25	CABRERA	1	170	\N	\N	1
123	25	CACHIPAY	1	170	\N	\N	1
126	25	CAJICA	1	170	\N	\N	1
148	25	CAPARRAPI	1	170	\N	\N	1
151	25	CAQUEZA	1	170	\N	\N	1
154	25	CARMEN DE CARUPA	1	170	\N	\N	1
168	25	CHAGUANI	1	170	\N	\N	1
175	25	CHIA	1	170	\N	\N	1
178	25	CHIPAQUE	1	170	\N	\N	1
181	25	CHOACHI	1	170	\N	\N	1
183	25	CHOCONTA	1	170	\N	\N	1
200	25	COGUA	1	170	\N	\N	1
214	25	COTA	1	170	\N	\N	1
224	25	CUCUNUBA	1	170	\N	\N	1
245	25	EL COLEGIO	1	170	\N	\N	1
258	25	EL PEÑON	1	170	\N	\N	1
260	25	EL ROSAL	1	170	\N	\N	1
269	25	FACATATIVA	1	170	\N	\N	1
279	25	FOMEQUE	1	170	\N	\N	1
281	25	FOSCA	1	170	\N	\N	1
286	25	FUNZA	1	170	\N	\N	1
288	25	FUQUENE	1	170	\N	\N	1
290	25	FUSAGASUGA	1	170	\N	\N	1
293	25	GACHALA	1	170	\N	\N	1
295	25	GACHANCIPA	1	170	\N	\N	1
297	25	GACHETA	1	170	\N	\N	1
299	25	GAMA	1	170	\N	\N	1
307	25	GIRARDOT	1	170	\N	\N	1
312	25	GRANADA	1	170	\N	\N	1
317	25	GUACHETA	1	170	\N	\N	1
320	25	GUADUAS	1	170	\N	\N	1
322	25	GUASCA	1	170	\N	\N	1
324	25	GUATAQUI	1	170	\N	\N	1
326	25	GUATAVITA	1	170	\N	\N	1
328	25	GUAYABAL DE SIQUIMA	1	170	\N	\N	1
335	25	GUAYABETAL	1	170	\N	\N	1
339	25	GUTIERREZ	1	170	\N	\N	1
368	25	JERUSALEN	1	170	\N	\N	1
372	25	JUNIN	1	170	\N	\N	1
377	25	LA CALERA	1	170	\N	\N	1
386	25	LA MESA	1	170	\N	\N	1
394	25	LA PALMA	1	170	\N	\N	1
398	25	LA PEÑA	1	170	\N	\N	1
402	25	LA VEGA	1	170	\N	\N	1
407	25	LENGUAZAQUE	1	170	\N	\N	1
426	25	MACHETA	1	170	\N	\N	1
430	25	MADRID	1	170	\N	\N	1
436	25	MANTA	1	170	\N	\N	1
438	25	MEDINA	1	170	\N	\N	1
473	25	MOSQUERA	1	170	\N	\N	1
483	25	NARIÑO	1	170	\N	\N	1
486	25	NEMOCON	1	170	\N	\N	1
488	25	NILO	1	170	\N	\N	1
489	25	NIMAIMA	1	170	\N	\N	1
491	25	NOCAIMA	1	170	\N	\N	1
506	25	VENECIA	1	170	\N	\N	1
513	25	PACHO	1	170	\N	\N	1
518	25	PAIME	1	170	\N	\N	1
524	25	PANDI	1	170	\N	\N	1
530	25	PARATEBUENO	1	170	\N	\N	1
535	25	PASCA	1	170	\N	\N	1
572	25	PUERTO SALGAR	1	170	\N	\N	1
580	25	PULI	1	170	\N	\N	1
592	25	QUEBRADANEGRA	1	170	\N	\N	1
594	25	QUETAME	1	170	\N	\N	1
596	25	QUIPILE	1	170	\N	\N	1
599	25	APULO	1	170	\N	\N	1
612	25	RICAURTE	1	170	\N	\N	1
645	25	SAN ANTONIO DEL TEQUENDAMA	1	170	\N	\N	1
649	25	SAN BERNARDO	1	170	\N	\N	1
653	25	SAN CAYETANO	1	170	\N	\N	1
658	25	SAN FRANCISCO	1	170	\N	\N	1
662	25	SAN JUAN DE RIOSECO	1	170	\N	\N	1
718	25	SASAIMA	1	170	\N	\N	1
736	25	SESQUILE	1	170	\N	\N	1
740	25	SIBATE	1	170	\N	\N	1
743	25	SILVANIA	1	170	\N	\N	1
745	25	SIMIJACA	1	170	\N	\N	1
754	25	SOACHA	1	170	\N	\N	1
758	25	SOPO	1	170	\N	\N	1
769	25	SUBACHOQUE	1	170	\N	\N	1
772	25	SUESCA	1	170	\N	\N	1
777	25	SUPATA	1	170	\N	\N	1
779	25	SUSA	1	170	\N	\N	1
781	25	SUTATAUSA	1	170	\N	\N	1
785	25	TABIO	1	170	\N	\N	1
793	25	TAUSA	1	170	\N	\N	1
797	25	TENA	1	170	\N	\N	1
799	25	TENJO	1	170	\N	\N	1
805	25	TIBACUY	1	170	\N	\N	1
807	25	TIBIRITA	1	170	\N	\N	1
815	25	TOCAIMA	1	170	\N	\N	1
817	25	TOCANCIPA	1	170	\N	\N	1
823	25	TOPAIPI	1	170	\N	\N	1
839	25	UBALA	1	170	\N	\N	1
841	25	UBAQUE	1	170	\N	\N	1
843	25	VILLA DE SAN DIEGO DE UBATE	1	170	\N	\N	1
845	25	UNE	1	170	\N	\N	1
851	25	UTICA	1	170	\N	\N	1
862	25	VERGARA	1	170	\N	\N	1
867	25	VIANI	1	170	\N	\N	1
871	25	VILLAGOMEZ	1	170	\N	\N	1
873	25	VILLAPINZON	1	170	\N	\N	1
875	25	VILLETA	1	170	\N	\N	1
878	25	VIOTA	1	170	\N	\N	1
885	25	YACOPI	1	170	\N	\N	1
898	25	ZIPACON	1	170	\N	\N	1
899	25	ZIPAQUIRA	1	170	\N	\N	1
1	27	QUIBDO	1	170	\N	\N	1
6	27	ACANDI	1	170	\N	\N	1
25	27	ALTO BAUDO	1	170	\N	\N	1
50	27	ATRATO	1	170	\N	\N	1
73	27	BAGADO	1	170	\N	\N	1
75	27	BAHIA SOLANO	1	170	\N	\N	1
77	27	BAJO BAUDO	1	170	\N	\N	1
99	27	BOJAYA	1	170	\N	\N	1
135	27	EL CANTON DEL SAN PABLO	1	170	\N	\N	1
150	27	CARMEN DEL DARIEN	1	170	\N	\N	1
160	27	CERTEGUI	1	170	\N	\N	1
205	27	CONDOTO	1	170	\N	\N	1
245	27	EL CARMEN DE ATRATO	1	170	\N	\N	1
250	27	EL LITORAL DEL SAN JUAN	1	170	\N	\N	1
361	27	ISTMINA	1	170	\N	\N	1
372	27	JURADO	1	170	\N	\N	1
413	27	LLORO	1	170	\N	\N	1
425	27	MEDIO ATRATO	1	170	\N	\N	1
430	27	MEDIO BAUDO	1	170	\N	\N	1
450	27	MEDIO SAN JUAN	1	170	\N	\N	1
491	27	NOVITA	1	170	\N	\N	1
495	27	NUQUI	1	170	\N	\N	1
580	27	RIO IRO	1	170	\N	\N	1
600	27	RIO QUITO	1	170	\N	\N	1
615	27	RIOSUCIO	1	170	\N	\N	1
660	27	SAN JOSE DEL PALMAR	1	170	\N	\N	1
745	27	SIPI	1	170	\N	\N	1
787	27	TADO	1	170	\N	\N	1
800	27	UNGUIA	1	170	\N	\N	1
810	27	UNION PANAMERICANA	1	170	\N	\N	1
1	41	NEIVA	1	170	\N	\N	1
6	41	ACEVEDO	1	170	\N	\N	1
13	41	AGRADO	1	170	\N	\N	1
16	41	AIPE	1	170	\N	\N	1
20	41	ALGECIRAS	1	170	\N	\N	1
26	41	ALTAMIRA	1	170	\N	\N	1
78	41	BARAYA	1	170	\N	\N	1
132	41	CAMPOALEGRE	1	170	\N	\N	1
206	41	COLOMBIA	1	170	\N	\N	1
244	41	ELIAS	1	170	\N	\N	1
298	41	GARZON	1	170	\N	\N	1
306	41	GIGANTE	1	170	\N	\N	1
319	41	GUADALUPE	1	170	\N	\N	1
349	41	HOBO	1	170	\N	\N	1
357	41	IQUIRA	1	170	\N	\N	1
359	41	ISNOS	1	170	\N	\N	1
378	41	LA ARGENTINA	1	170	\N	\N	1
396	41	LA PLATA	1	170	\N	\N	1
483	41	NATAGA	1	170	\N	\N	1
503	41	OPORAPA	1	170	\N	\N	1
518	41	PAICOL	1	170	\N	\N	1
524	41	PALERMO	1	170	\N	\N	1
530	41	PALESTINA	1	170	\N	\N	1
548	41	PITAL	1	170	\N	\N	1
551	41	PITALITO	1	170	\N	\N	1
615	41	RIVERA	1	170	\N	\N	1
660	41	SALADOBLANCO	1	170	\N	\N	1
668	41	SAN AGUSTIN	1	170	\N	\N	1
676	41	SANTA MARIA	1	170	\N	\N	1
770	41	SUAZA	1	170	\N	\N	1
791	41	TARQUI	1	170	\N	\N	1
797	41	TESALIA	1	170	\N	\N	1
799	41	TELLO	1	170	\N	\N	1
801	41	TERUEL	1	170	\N	\N	1
807	41	TIMANA	1	170	\N	\N	1
872	41	VILLAVIEJA	1	170	\N	\N	1
885	41	YAGUARA	1	170	\N	\N	1
1	44	RIOHACHA	1	170	\N	\N	1
35	44	ALBANIA	1	170	\N	\N	1
78	44	BARRANCAS	1	170	\N	\N	1
90	44	DIBULLA	1	170	\N	\N	1
98	44	DISTRACCION	1	170	\N	\N	1
110	44	EL MOLINO	1	170	\N	\N	1
279	44	FONSECA	1	170	\N	\N	1
378	44	HATONUEVO	1	170	\N	\N	1
420	44	LA JAGUA DEL PILAR	1	170	\N	\N	1
430	44	MAICAO	1	170	\N	\N	1
560	44	MANAURE	1	170	\N	\N	1
650	44	SAN JUAN DEL CESAR	1	170	\N	\N	1
847	44	URIBIA	1	170	\N	\N	1
855	44	URUMITA	1	170	\N	\N	1
874	44	VILLANUEVA	1	170	\N	\N	1
1	47	SANTA MARTA	1	170	\N	\N	1
30	47	ALGARROBO	1	170	\N	\N	1
53	47	ARACATACA	1	170	\N	\N	1
58	47	ARIGUANI	1	170	\N	\N	1
161	47	CERRO DE SAN ANTONIO	1	170	\N	\N	1
170	47	CHIVOLO	1	170	\N	\N	1
189	47	CIENAGA	1	170	\N	\N	1
205	47	CONCORDIA	1	170	\N	\N	1
245	47	EL BANCO	1	170	\N	\N	1
258	47	EL PIÑON	1	170	\N	\N	1
268	47	EL RETEN	1	170	\N	\N	1
288	47	FUNDACION	1	170	\N	\N	1
318	47	GUAMAL	1	170	\N	\N	1
460	47	NUEVA GRANADA	1	170	\N	\N	1
541	47	PEDRAZA	1	170	\N	\N	1
545	47	PIJIÑO DEL CARMEN	1	170	\N	\N	1
551	47	PIVIJAY	1	170	\N	\N	1
555	47	PLATO	1	170	\N	\N	1
570	47	PUEBLOVIEJO	1	170	\N	\N	1
605	47	REMOLINO	1	170	\N	\N	1
660	47	SABANAS DE SAN ANGEL	1	170	\N	\N	1
675	47	SALAMINA	1	170	\N	\N	1
692	47	SAN SEBASTIAN DE BUENAVISTA	1	170	\N	\N	1
703	47	SAN ZENON	1	170	\N	\N	1
707	47	SANTA ANA	1	170	\N	\N	1
720	47	SANTA BARBARA DE PINTO	1	170	\N	\N	1
745	47	SITIONUEVO	1	170	\N	\N	1
798	47	TENERIFE	1	170	\N	\N	1
960	47	ZAPAYAN	1	170	\N	\N	1
980	47	ZONA BANANERA	1	170	\N	\N	1
1	50	VILLAVICENCIO	1	170	\N	\N	1
6	50	ACACIAS	1	170	\N	\N	1
110	50	BARRANCA DE UPIA	1	170	\N	\N	1
124	50	CABUYARO	1	170	\N	\N	1
150	50	CASTILLA LA NUEVA	1	170	\N	\N	1
223	50	CUBARRAL	1	170	\N	\N	1
226	50	CUMARAL	1	170	\N	\N	1
245	50	EL CALVARIO	1	170	\N	\N	1
251	50	EL CASTILLO	1	170	\N	\N	1
270	50	EL DORADO	1	170	\N	\N	1
287	50	FUENTE DE ORO	1	170	\N	\N	1
313	50	GRANADA	1	170	\N	\N	1
318	50	GUAMAL	1	170	\N	\N	1
325	50	MAPIRIPAN	1	170	\N	\N	1
330	50	MESETAS	1	170	\N	\N	1
350	50	LA MACARENA	1	170	\N	\N	1
370	50	URIBE	1	170	\N	\N	1
400	50	LEJANIAS	1	170	\N	\N	1
450	50	PUERTO CONCORDIA	1	170	\N	\N	1
568	50	PUERTO GAITAN	1	170	\N	\N	1
573	50	PUERTO LOPEZ	1	170	\N	\N	1
577	50	PUERTO LLERAS	1	170	\N	\N	1
590	50	PUERTO RICO	1	170	\N	\N	1
606	50	RESTREPO	1	170	\N	\N	1
680	50	SAN CARLOS DE GUAROA	1	170	\N	\N	1
683	50	SAN JUAN DE ARAMA	1	170	\N	\N	1
686	50	SAN JUANITO	1	170	\N	\N	1
689	50	SAN MARTIN	1	170	\N	\N	1
711	50	VISTAHERMOSA	1	170	\N	\N	1
1	52	PASTO	1	170	\N	\N	1
19	52	ALBAN	1	170	\N	\N	1
22	52	ALDANA	1	170	\N	\N	1
36	52	ANCUYA	1	170	\N	\N	1
51	52	ARBOLEDA	1	170	\N	\N	1
79	52	BARBACOAS	1	170	\N	\N	1
83	52	BELEN	1	170	\N	\N	1
110	52	BUESACO	1	170	\N	\N	1
203	52	COLON	1	170	\N	\N	1
207	52	CONSACA	1	170	\N	\N	1
210	52	CONTADERO	1	170	\N	\N	1
215	52	CORDOBA	1	170	\N	\N	1
224	52	CUASPUD	1	170	\N	\N	1
227	52	CUMBAL	1	170	\N	\N	1
233	52	CUMBITARA	1	170	\N	\N	1
240	52	CHACHAGUI	1	170	\N	\N	1
250	52	EL CHARCO	1	170	\N	\N	1
254	52	EL PEÑOL	1	170	\N	\N	1
256	52	EL ROSARIO	1	170	\N	\N	1
258	52	EL TABLON DE GOMEZ	1	170	\N	\N	1
260	52	EL TAMBO	1	170	\N	\N	1
287	52	FUNES	1	170	\N	\N	1
317	52	GUACHUCAL	1	170	\N	\N	1
320	52	GUAITARILLA	1	170	\N	\N	1
323	52	GUALMATAN	1	170	\N	\N	1
352	52	ILES	1	170	\N	\N	1
354	52	IMUES	1	170	\N	\N	1
356	52	IPIALES	1	170	\N	\N	1
378	52	LA CRUZ	1	170	\N	\N	1
381	52	LA FLORIDA	1	170	\N	\N	1
385	52	LA LLANADA	1	170	\N	\N	1
390	52	LA TOLA	1	170	\N	\N	1
399	52	LA UNION	1	170	\N	\N	1
405	52	LEIVA	1	170	\N	\N	1
411	52	LINARES	1	170	\N	\N	1
418	52	LOS ANDES	1	170	\N	\N	1
427	52	MAGUI	1	170	\N	\N	1
435	52	MALLAMA	1	170	\N	\N	1
473	52	MOSQUERA	1	170	\N	\N	1
480	52	NARIÑO	1	170	\N	\N	1
490	52	OLAYA HERRERA	1	170	\N	\N	1
506	52	OSPINA	1	170	\N	\N	1
520	52	FRANCISCO PIZARRO	1	170	\N	\N	1
540	52	POLICARPA	1	170	\N	\N	1
560	52	POTOSI	1	170	\N	\N	1
565	52	PROVIDENCIA	1	170	\N	\N	1
573	52	PUERRES	1	170	\N	\N	1
585	52	PUPIALES	1	170	\N	\N	1
612	52	RICAURTE	1	170	\N	\N	1
621	52	ROBERTO PAYAN	1	170	\N	\N	1
678	52	SAMANIEGO	1	170	\N	\N	1
683	52	SANDONA	1	170	\N	\N	1
685	52	SAN BERNARDO	1	170	\N	\N	1
687	52	SAN LORENZO	1	170	\N	\N	1
693	52	SAN PABLO	1	170	\N	\N	1
694	52	SAN PEDRO DE CARTAGO	1	170	\N	\N	1
696	52	SANTA BARBARA	1	170	\N	\N	1
699	52	SANTACRUZ	1	170	\N	\N	1
720	52	SAPUYES	1	170	\N	\N	1
786	52	TAMINANGO	1	170	\N	\N	1
788	52	TANGUA	1	170	\N	\N	1
835	52	SAN ANDRES DE TUMACO	1	170	\N	\N	1
838	52	TUQUERRES	1	170	\N	\N	1
885	52	YACUANQUER	1	170	\N	\N	1
1	54	CUCUTA	1	170	\N	\N	1
3	54	ABREGO	1	170	\N	\N	1
51	54	ARBOLEDAS	1	170	\N	\N	1
99	54	BOCHALEMA	1	170	\N	\N	1
109	54	BUCARASICA	1	170	\N	\N	1
125	54	CACOTA	1	170	\N	\N	1
128	54	CACHIRA	1	170	\N	\N	1
172	54	CHINACOTA	1	170	\N	\N	1
174	54	CHITAGA	1	170	\N	\N	1
206	54	CONVENCION	1	170	\N	\N	1
223	54	CUCUTILLA	1	170	\N	\N	1
239	54	DURANIA	1	170	\N	\N	1
245	54	EL CARMEN	1	170	\N	\N	1
250	54	EL TARRA	1	170	\N	\N	1
261	54	EL ZULIA	1	170	\N	\N	1
313	54	GRAMALOTE	1	170	\N	\N	1
344	54	HACARI	1	170	\N	\N	1
347	54	HERRAN	1	170	\N	\N	1
377	54	LABATECA	1	170	\N	\N	1
385	54	LA ESPERANZA	1	170	\N	\N	1
398	54	LA PLAYA	1	170	\N	\N	1
405	54	LOS PATIOS	1	170	\N	\N	1
418	54	LOURDES	1	170	\N	\N	1
480	54	MUTISCUA	1	170	\N	\N	1
498	54	OCAÑA	1	170	\N	\N	1
518	54	PAMPLONA	1	170	\N	\N	1
520	54	PAMPLONITA	1	170	\N	\N	1
553	54	PUERTO SANTANDER	1	170	\N	\N	1
599	54	RAGONVALIA	1	170	\N	\N	1
660	54	SALAZAR	1	170	\N	\N	1
670	54	SAN CALIXTO	1	170	\N	\N	1
673	54	SAN CAYETANO	1	170	\N	\N	1
680	54	SANTIAGO	1	170	\N	\N	1
720	54	SARDINATA	1	170	\N	\N	1
743	54	SILOS	1	170	\N	\N	1
800	54	TEORAMA	1	170	\N	\N	1
810	54	TIBU	1	170	\N	\N	1
820	54	TOLEDO	1	170	\N	\N	1
871	54	VILLA CARO	1	170	\N	\N	1
874	54	VILLA DEL ROSARIO	1	170	\N	\N	1
1	63	ARMENIA	1	170	\N	\N	1
111	63	BUENAVISTA	1	170	\N	\N	1
130	63	CALARCA	1	170	\N	\N	1
190	63	CIRCASIA	1	170	\N	\N	1
212	63	CORDOBA	1	170	\N	\N	1
272	63	FILANDIA	1	170	\N	\N	1
302	63	GENOVA	1	170	\N	\N	1
401	63	LA TEBAIDA	1	170	\N	\N	1
470	63	MONTENEGRO	1	170	\N	\N	1
548	63	PIJAO	1	170	\N	\N	1
594	63	QUIMBAYA	1	170	\N	\N	1
690	63	SALENTO	1	170	\N	\N	1
1	66	PEREIRA	1	170	\N	\N	1
45	66	APIA	1	170	\N	\N	1
75	66	BALBOA	1	170	\N	\N	1
88	66	BELEN DE UMBRIA	1	170	\N	\N	1
170	66	DOSQUEBRADAS	1	170	\N	\N	1
318	66	GUATICA	1	170	\N	\N	1
383	66	LA CELIA	1	170	\N	\N	1
400	66	LA VIRGINIA	1	170	\N	\N	1
440	66	MARSELLA	1	170	\N	\N	1
456	66	MISTRATO	1	170	\N	\N	1
572	66	PUEBLO RICO	1	170	\N	\N	1
594	66	QUINCHIA	1	170	\N	\N	1
682	66	SANTA ROSA DE CABAL	1	170	\N	\N	1
687	66	SANTUARIO	1	170	\N	\N	1
1	68	BUCARAMANGA	1	170	\N	\N	1
13	68	AGUADA	1	170	\N	\N	1
20	68	ALBANIA	1	170	\N	\N	1
51	68	ARATOCA	1	170	\N	\N	1
77	68	BARBOSA	1	170	\N	\N	1
79	68	BARICHARA	1	170	\N	\N	1
81	68	BARRANCABERMEJA	1	170	\N	\N	1
92	68	BETULIA	1	170	\N	\N	1
101	68	BOLIVAR	1	170	\N	\N	1
121	68	CABRERA	1	170	\N	\N	1
132	68	CALIFORNIA	1	170	\N	\N	1
147	68	CAPITANEJO	1	170	\N	\N	1
152	68	CARCASI	1	170	\N	\N	1
160	68	CEPITA	1	170	\N	\N	1
162	68	CERRITO	1	170	\N	\N	1
167	68	CHARALA	1	170	\N	\N	1
169	68	CHARTA	1	170	\N	\N	1
176	68	CHIMA	1	170	\N	\N	1
179	68	CHIPATA	1	170	\N	\N	1
190	68	CIMITARRA	1	170	\N	\N	1
207	68	CONCEPCION	1	170	\N	\N	1
209	68	CONFINES	1	170	\N	\N	1
211	68	CONTRATACION	1	170	\N	\N	1
217	68	COROMORO	1	170	\N	\N	1
229	68	CURITI	1	170	\N	\N	1
235	68	EL CARMEN DE CHUCURI	1	170	\N	\N	1
245	68	EL GUACAMAYO	1	170	\N	\N	1
250	68	EL PEÑON	1	170	\N	\N	1
255	68	EL PLAYON	1	170	\N	\N	1
264	68	ENCINO	1	170	\N	\N	1
266	68	ENCISO	1	170	\N	\N	1
271	68	FLORIAN	1	170	\N	\N	1
276	68	FLORIDABLANCA	1	170	\N	\N	1
296	68	GALAN	1	170	\N	\N	1
298	68	GAMBITA	1	170	\N	\N	1
307	68	GIRON	1	170	\N	\N	1
318	68	GUACA	1	170	\N	\N	1
320	68	GUADALUPE	1	170	\N	\N	1
322	68	GUAPOTA	1	170	\N	\N	1
324	68	GUAVATA	1	170	\N	\N	1
327	68	GUEPSA	1	170	\N	\N	1
344	68	HATO	1	170	\N	\N	1
368	68	JESUS MARIA	1	170	\N	\N	1
370	68	JORDAN	1	170	\N	\N	1
377	68	LA BELLEZA	1	170	\N	\N	1
385	68	LANDAZURI	1	170	\N	\N	1
397	68	LA PAZ	1	170	\N	\N	1
406	68	LEBRIJA	1	170	\N	\N	1
418	68	LOS SANTOS	1	170	\N	\N	1
425	68	MACARAVITA	1	170	\N	\N	1
432	68	MALAGA	1	170	\N	\N	1
444	68	MATANZA	1	170	\N	\N	1
464	68	MOGOTES	1	170	\N	\N	1
468	68	MOLAGAVITA	1	170	\N	\N	1
498	68	OCAMONTE	1	170	\N	\N	1
500	68	OIBA	1	170	\N	\N	1
502	68	ONZAGA	1	170	\N	\N	1
522	68	PALMAR	1	170	\N	\N	1
524	68	PALMAS DEL SOCORRO	1	170	\N	\N	1
533	68	PARAMO	1	170	\N	\N	1
547	68	PIEDECUESTA	1	170	\N	\N	1
549	68	PINCHOTE	1	170	\N	\N	1
572	68	PUENTE NACIONAL	1	170	\N	\N	1
573	68	PUERTO PARRA	1	170	\N	\N	1
575	68	PUERTO WILCHES	1	170	\N	\N	1
615	68	RIONEGRO	1	170	\N	\N	1
655	68	SABANA DE TORRES	1	170	\N	\N	1
669	68	SAN ANDRES	1	170	\N	\N	1
673	68	SAN BENITO	1	170	\N	\N	1
679	68	SAN GIL	1	170	\N	\N	1
682	68	SAN JOAQUIN	1	170	\N	\N	1
684	68	SAN JOSE DE MIRANDA	1	170	\N	\N	1
686	68	SAN MIGUEL	1	170	\N	\N	1
689	68	SAN VICENTE DE CHUCURI	1	170	\N	\N	1
705	68	SANTA BARBARA	1	170	\N	\N	1
720	68	SANTA HELENA DEL OPON	1	170	\N	\N	1
745	68	SIMACOTA	1	170	\N	\N	1
755	68	SOCORRO	1	170	\N	\N	1
770	68	SUAITA	1	170	\N	\N	1
773	68	SUCRE	1	170	\N	\N	1
780	68	SURATA	1	170	\N	\N	1
820	68	TONA	1	170	\N	\N	1
855	68	VALLE DE SAN JOSE	1	170	\N	\N	1
861	68	VELEZ	1	170	\N	\N	1
867	68	VETAS	1	170	\N	\N	1
872	68	VILLANUEVA	1	170	\N	\N	1
895	68	ZAPATOCA	1	170	\N	\N	1
1	70	SINCELEJO	1	170	\N	\N	1
110	70	BUENAVISTA	1	170	\N	\N	1
124	70	CAIMITO	1	170	\N	\N	1
204	70	COLOSO	1	170	\N	\N	1
215	70	COROZAL	1	170	\N	\N	1
221	70	COVEÑAS	1	170	\N	\N	1
230	70	CHALAN	1	170	\N	\N	1
233	70	EL ROBLE	1	170	\N	\N	1
235	70	GALERAS	1	170	\N	\N	1
265	70	GUARANDA	1	170	\N	\N	1
400	70	LA UNION	1	170	\N	\N	1
418	70	LOS PALMITOS	1	170	\N	\N	1
429	70	MAJAGUAL	1	170	\N	\N	1
473	70	MORROA	1	170	\N	\N	1
508	70	OVEJAS	1	170	\N	\N	1
523	70	PALMITO	1	170	\N	\N	1
670	70	SAMPUES	1	170	\N	\N	1
678	70	SAN BENITO ABAD	1	170	\N	\N	1
702	70	SAN JUAN DE BETULIA	1	170	\N	\N	1
708	70	SAN MARCOS	1	170	\N	\N	1
713	70	SAN ONOFRE	1	170	\N	\N	1
717	70	SAN PEDRO	1	170	\N	\N	1
742	70	SAN LUIS DE SINCE	1	170	\N	\N	1
771	70	SUCRE	1	170	\N	\N	1
820	70	SANTIAGO DE TOLU	1	170	\N	\N	1
823	70	TOLU VIEJO	1	170	\N	\N	1
1	73	IBAGUE	1	170	\N	\N	1
24	73	ALPUJARRA	1	170	\N	\N	1
26	73	ALVARADO	1	170	\N	\N	1
30	73	AMBALEMA	1	170	\N	\N	1
43	73	ANZOATEGUI	1	170	\N	\N	1
55	73	ARMERO GUAYABAL	1	170	\N	\N	1
67	73	ATACO	1	170	\N	\N	1
124	73	CAJAMARCA	1	170	\N	\N	1
148	73	CARMEN DE APICALA	1	170	\N	\N	1
152	73	CASABIANCA	1	170	\N	\N	1
168	73	CHAPARRAL	1	170	\N	\N	1
200	73	COELLO	1	170	\N	\N	1
217	73	COYAIMA	1	170	\N	\N	1
226	73	CUNDAY	1	170	\N	\N	1
236	73	DOLORES	1	170	\N	\N	1
268	73	ESPINAL	1	170	\N	\N	1
270	73	FALAN	1	170	\N	\N	1
275	73	FLANDES	1	170	\N	\N	1
283	73	FRESNO	1	170	\N	\N	1
319	73	GUAMO	1	170	\N	\N	1
347	73	HERVEO	1	170	\N	\N	1
349	73	HONDA	1	170	\N	\N	1
352	73	ICONONZO	1	170	\N	\N	1
408	73	LERIDA	1	170	\N	\N	1
411	73	LIBANO	1	170	\N	\N	1
443	73	SAN SEBASTIAN DE MARIQUITA	1	170	\N	\N	1
449	73	MELGAR	1	170	\N	\N	1
461	73	MURILLO	1	170	\N	\N	1
483	73	NATAGAIMA	1	170	\N	\N	1
504	73	ORTEGA	1	170	\N	\N	1
520	73	PALOCABILDO	1	170	\N	\N	1
547	73	PIEDRAS	1	170	\N	\N	1
555	73	PLANADAS	1	170	\N	\N	1
563	73	PRADO	1	170	\N	\N	1
585	73	PURIFICACION	1	170	\N	\N	1
616	73	RIOBLANCO	1	170	\N	\N	1
622	73	RONCESVALLES	1	170	\N	\N	1
624	73	ROVIRA	1	170	\N	\N	1
671	73	SALDAÑA	1	170	\N	\N	1
675	73	SAN ANTONIO	1	170	\N	\N	1
678	73	SAN LUIS	1	170	\N	\N	1
686	73	SANTA ISABEL	1	170	\N	\N	1
770	73	SUAREZ	1	170	\N	\N	1
854	73	VALLE DE SAN JUAN	1	170	\N	\N	1
861	73	VENADILLO	1	170	\N	\N	1
870	73	VILLAHERMOSA	1	170	\N	\N	1
873	73	VILLARRICA	1	170	\N	\N	1
1	76	CALI	1	170	\N	\N	1
20	76	ALCALA	1	170	\N	\N	1
36	76	ANDALUCIA	1	170	\N	\N	1
41	76	ANSERMANUEVO	1	170	\N	\N	1
54	76	ARGELIA	1	170	\N	\N	1
100	76	BOLIVAR	1	170	\N	\N	1
109	76	BUENAVENTURA	1	170	\N	\N	1
111	76	GUADALAJARA DE BUGA	1	170	\N	\N	1
113	76	BUGALAGRANDE	1	170	\N	\N	1
122	76	CAICEDONIA	1	170	\N	\N	1
126	76	CALIMA	1	170	\N	\N	1
130	76	CANDELARIA	1	170	\N	\N	1
147	76	CARTAGO	1	170	\N	\N	1
233	76	DAGUA	1	170	\N	\N	1
243	76	EL AGUILA	1	170	\N	\N	1
246	76	EL CAIRO	1	170	\N	\N	1
248	76	EL CERRITO	1	170	\N	\N	1
250	76	EL DOVIO	1	170	\N	\N	1
275	76	FLORIDA	1	170	\N	\N	1
306	76	GINEBRA	1	170	\N	\N	1
318	76	GUACARI	1	170	\N	\N	1
364	76	JAMUNDI	1	170	\N	\N	1
377	76	LA CUMBRE	1	170	\N	\N	1
400	76	LA UNION	1	170	\N	\N	1
403	76	LA VICTORIA	1	170	\N	\N	1
497	76	OBANDO	1	170	\N	\N	1
520	76	PALMIRA	1	170	\N	\N	1
563	76	PRADERA	1	170	\N	\N	1
606	76	RESTREPO	1	170	\N	\N	1
616	76	RIOFRIO	1	170	\N	\N	1
622	76	ROLDANILLO	1	170	\N	\N	1
670	76	SAN PEDRO	1	170	\N	\N	1
736	76	SEVILLA	1	170	\N	\N	1
823	76	TORO	1	170	\N	\N	1
828	76	TRUJILLO	1	170	\N	\N	1
834	76	TULUA	1	170	\N	\N	1
845	76	ULLOA	1	170	\N	\N	1
863	76	VERSALLES	1	170	\N	\N	1
869	76	VIJES	1	170	\N	\N	1
890	76	YOTOCO	1	170	\N	\N	1
892	76	YUMBO	1	170	\N	\N	1
895	76	ZARZAL	1	170	\N	\N	1
1	81	ARAUCA	1	170	\N	\N	1
65	81	ARAUQUITA	1	170	\N	\N	1
220	81	CRAVO NORTE	1	170	\N	\N	1
300	81	FORTUL	1	170	\N	\N	1
591	81	PUERTO RONDON	1	170	\N	\N	1
736	81	SARAVENA	1	170	\N	\N	1
794	81	TAME	1	170	\N	\N	1
1	85	YOPAL	1	170	\N	\N	1
10	85	AGUAZUL	1	170	\N	\N	1
15	85	CHAMEZA	1	170	\N	\N	1
125	85	HATO COROZAL	1	170	\N	\N	1
136	85	LA SALINA	1	170	\N	\N	1
139	85	MANI	1	170	\N	\N	1
162	85	MONTERREY	1	170	\N	\N	1
225	85	NUNCHIA	1	170	\N	\N	1
230	85	OROCUE	1	170	\N	\N	1
250	85	PAZ DE ARIPORO	1	170	\N	\N	1
263	85	PORE	1	170	\N	\N	1
279	85	RECETOR	1	170	\N	\N	1
300	85	SABANALARGA	1	170	\N	\N	1
315	85	SACAMA	1	170	\N	\N	1
325	85	SAN LUIS DE PALENQUE	1	170	\N	\N	1
400	85	TAMARA	1	170	\N	\N	1
410	85	TAURAMENA	1	170	\N	\N	1
430	85	TRINIDAD	1	170	\N	\N	1
440	85	VILLANUEVA	1	170	\N	\N	1
1	86	MOCOA	1	170	\N	\N	1
219	86	COLON	1	170	\N	\N	1
320	86	ORITO	1	170	\N	\N	1
568	86	PUERTO ASIS	1	170	\N	\N	1
569	86	PUERTO CAICEDO	1	170	\N	\N	1
571	86	PUERTO GUZMAN	1	170	\N	\N	1
573	86	PUERTO LEGUIZAMO	1	170	\N	\N	1
749	86	SIBUNDOY	1	170	\N	\N	1
755	86	SAN FRANCISCO	1	170	\N	\N	1
757	86	SAN MIGUEL	1	170	\N	\N	1
760	86	SANTIAGO	1	170	\N	\N	1
865	86	VALLE DEL GUAMUEZ	1	170	\N	\N	1
885	86	VILLAGARZON	1	170	\N	\N	1
1	88	SAN ANDRES	1	170	\N	\N	1
564	88	PROVIDENCIA	1	170	\N	\N	1
1	91	LETICIA	1	170	\N	\N	1
263	91	EL ENCANTO	1	170	\N	\N	1
405	91	LA CHORRERA	1	170	\N	\N	1
407	91	LA PEDRERA	1	170	\N	\N	1
430	91	LA VICTORIA	1	170	\N	\N	1
460	91	MIRITI - PARANA	1	170	\N	\N	1
530	91	PUERTO ALEGRIA	1	170	\N	\N	1
536	91	PUERTO ARICA	1	170	\N	\N	1
540	91	PUERTO NARIÑO	1	170	\N	\N	1
669	91	PUERTO SANTANDER	1	170	\N	\N	1
798	91	TARAPACA	1	170	\N	\N	1
1	94	INIRIDA	1	170	\N	\N	1
343	94	BARRANCO MINAS	1	170	\N	\N	1
663	94	MAPIRIPANA	1	170	\N	\N	1
883	94	SAN FELIPE	1	170	\N	\N	1
884	94	PUERTO COLOMBIA	1	170	\N	\N	1
885	94	LA GUADALUPE	1	170	\N	\N	1
886	94	CACAHUAL	1	170	\N	\N	1
887	94	PANA PANA	1	170	\N	\N	1
888	94	MORICHAL	1	170	\N	\N	1
1	95	SAN JOSE DEL GUAVIARE	1	170	\N	\N	1
15	95	CALAMAR	1	170	\N	\N	1
25	95	EL RETORNO	1	170	\N	\N	1
200	95	MIRAFLORES	1	170	\N	\N	1
1	97	MITU	1	170	\N	\N	1
161	97	CARURU	1	170	\N	\N	1
511	97	PACOA	1	170	\N	\N	1
666	97	TARAIRA	1	170	\N	\N	1
777	97	PAPUNAUA	1	170	\N	\N	1
889	97	YAVARATE	1	170	\N	\N	1
524	99	LA PRIMAVERA	1	170	\N	\N	1
624	99	SANTA ROSALIA	1	170	\N	\N	1
773	99	CUMARIBO	1	170	\N	\N	1
579	5	Puerto Berrio	1	170	0	\N	1
\.


--
-- Name: num_resol_dtc; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('num_resol_dtc', 24, false);


--
-- Name: num_resol_dtn; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('num_resol_dtn', 101, false);


--
-- Name: num_resol_dtoc; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('num_resol_dtoc', 21, false);


--
-- Name: num_resol_dtor; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('num_resol_dtor', 61, false);


--
-- Name: num_resol_dts; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('num_resol_dts', 61, false);


--
-- Name: num_resol_gral; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('num_resol_gral', 1, false);


--
-- Data for Name: ortega_prueba_orfeo; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY ortega_prueba_orfeo (radi_nume_hoja, radi_fech_radi, radi_nume_radi, ra_asun, radi_path, radi_usu_ante, nombre_de_la_empresa, fecha, sgd_tpr_descrip, sgd_tpr_codigo, sgd_tpr_termino, diasr, radi_leido, radi_tipo_deri, radi_nume_deri, sgd_ciu_nombre, sgd_ciu_apell1, sgd_ciu_apell2, tipo_query, sgd_dir_tipo, sgd_dir_nombre, radi_cuentai, sgd_exp_numero) FROM stdin;
\.


--
-- Data for Name: par_serv_servicios; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY par_serv_servicios (par_serv_secue, par_serv_codigo, par_serv_nombre, par_serv_estado) FROM stdin;
\.


--
-- Data for Name: pl_generado_plg; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY pl_generado_plg (depe_codi, radi_nume_radi, plt_codi, plg_codi, plg_comentarios, plg_analiza, plg_firma, plg_autoriza, plg_imprime, plg_envia, plg_archivo_tmp, plg_archivo_final, plg_nombre, plg_crea, plg_autoriza_fech, plg_imprime_fech, plg_envia_fech, plg_crea_fech, plg_creador, pl_codi, usua_doc, sgd_rem_destino, radi_nume_sal) FROM stdin;
\.


--
-- Data for Name: pl_tipo_plt; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY pl_tipo_plt (plt_codi, plt_desc) FROM stdin;
\.


--
-- Data for Name: plan_table; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY plan_table (statement_id, "timestamp", remarks, operation, options, object_node, object_owner, object_name, object_instance, object_type, optimizer, search_columns, id, parent_id, "position", cost, cardinality, s, other_tag, partition_start, partition_stop, partition_id, other, distribution) FROM stdin;
\.


--
-- Data for Name: plantilla_pl; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY plantilla_pl (pl_codi, depe_codi, pl_nomb, pl_archivo, pl_desc, pl_fech, usua_codi, pl_uso) FROM stdin;
\.


--
-- Data for Name: plsql_profiler_data; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY plsql_profiler_data (runid, unit_numeric, line, total_occur, total_time, min_time, max_time, spare1, spare2, spare3, spare4) FROM stdin;
\.


--
-- Name: plsql_profiler_runnumeric; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('plsql_profiler_runnumeric', 1, false);


--
-- Data for Name: plsql_profiler_runs; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY plsql_profiler_runs (runid, related_run, run_owner, run_date, run_comment, run_total_time, run_system_info, run_comment1, spare1) FROM stdin;
\.


--
-- Data for Name: plsql_profiler_units; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY plsql_profiler_units (runid, unit_numeric, unit_type, unit_owner, unit_name, unit_timestamp, total_time, spare1, spare2) FROM stdin;
\.


--
-- Name: pres_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('pres_seq', 30392, false);


--
-- Data for Name: prestamo; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY prestamo (pres_id, radi_nume_radi, usua_login_actu, depe_codi, usua_login_pres, pres_desc, pres_fech_pres, pres_fech_devo, pres_fech_pedi, pres_estado, pres_requerimiento, pres_depe_arch, pres_fech_venc, dev_desc, pres_fech_canc, usua_login_canc, usua_login_rx) FROM stdin;
\.


--
-- Data for Name: pruba; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY pruba (nombre, tel) FROM stdin;
\.


--
-- Data for Name: radicado; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY radicado (radi_nume_radi, radi_fech_radi, tdoc_codi, trte_codi, mrec_codi, eesp_codi, eotra_codi, radi_tipo_empr, radi_fech_ofic, tdid_codi, radi_nume_iden, radi_nomb, radi_prim_apel, radi_segu_apel, radi_pais, muni_codi, cpob_codi, carp_codi, esta_codi, dpto_codi, cen_muni_codi, cen_dpto_codi, radi_dire_corr, radi_tele_cont, radi_nume_hoja, radi_desc_anex, radi_nume_deri, radi_path, radi_usua_actu, radi_depe_actu, radi_fech_asig, radi_arch1, radi_arch2, radi_arch3, radi_arch4, ra_asun, radi_usu_ante, radi_depe_radi, radi_rem, radi_usua_radi, codi_nivel, flag_nivel, carp_per, radi_leido, radi_cuentai, radi_tipo_deri, listo, sgd_tma_codigo, sgd_mtd_codigo, par_serv_secue, sgd_fld_codigo, radi_agend, radi_fech_agend, radi_fech_doc, sgd_doc_secuencia, sgd_pnufe_codi, sgd_eanu_codigo, sgd_not_codi, radi_fech_notif, sgd_tdec_codigo, sgd_apli_codi, sgd_ttr_codigo, usua_doc_ante, radi_fech_antetx, sgd_trad_codigo, fech_vcmto, tdoc_vcmto, sgd_termino_real, id_cont, sgd_spub_codigo, id_pais, medio_m, radi_nrr, numero_rm, numero_tran, texto_archivo) FROM stdin;
\.


--
-- Data for Name: retencion_doc_tmp; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY retencion_doc_tmp (cod_serie, serie, tipologia_doc, cod_subserie, subserie, tipologia_sub, dependencia, nom_depe, archivo_gestion, archivo_central, disposicion, soporte, procedimiento, tipo_doc, error) FROM stdin;
\.


--
-- Name: sec_bodega_empresas; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_bodega_empresas', 1, false);


--
-- Name: sec_central; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_central', 1, false);


--
-- Name: sec_ciu_ciudadano; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_ciu_ciudadano', 35, true);


--
-- Name: sec_def_contactos; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_def_contactos', 1, true);


--
-- Name: sec_dir_direcciones; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_dir_direcciones', 373, true);


--
-- Name: sec_edificio; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_edificio', 14, true);


--
-- Name: sec_fondo; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_fondo', 1, false);


--
-- Name: sec_inv; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_inv', 1, false);


--
-- Name: sec_oem_empresas; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_oem_empresas', 395, true);


--
-- Name: sec_oem_oempresas; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_oem_oempresas', 37, true);


--
-- Name: sec_planilla; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_planilla', 89, true);


--
-- Name: sec_planilla_envio; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_planilla_envio', 1, true);


--
-- Name: sec_planilla_tx; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_planilla_tx', 9, true);


--
-- Name: sec_prestamo; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_prestamo', 7, true);


--
-- Name: sec_sgd_hfld_histflujodoc; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sec_sgd_hfld_histflujodoc', 1, false);


--
-- Name: secr_tp1_; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp1_', 500, true);


--
-- Name: secr_tp1_0998; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp1_0998', 191, true);


--
-- Name: secr_tp1_998; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp1_998', 1, true);


--
-- Name: secr_tp1_gr10; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp1_gr10', 1, true);


--
-- Name: secr_tp2_; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp2_', 301, true);


--
-- Name: secr_tp2_0998; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp2_0998', 85, true);


--
-- Name: secr_tp2_998; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp2_998', 6, true);


--
-- Name: secr_tp2_gr10; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp2_gr10', 1, true);


--
-- Name: secr_tp3_; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp3_', 5, true);


--
-- Name: secr_tp4_; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp4_', 600, false);


--
-- Name: secr_tp4_0998; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp4_0998', 51, true);


--
-- Name: secr_tp4_ca98; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp4_ca98', 10, false);


--
-- Name: secr_tp4_ch51; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('secr_tp4_ch51', 4, true);


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY series (depe_codi, seri_nume, seri_tipo, seri_ano, dpto_codi, bloq) FROM stdin;
\.


--
-- Data for Name: sgd_acm_acusemsg; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_acm_acusemsg (sgd_msg_codi, usua_doc, sgd_msg_leido) FROM stdin;
\.


--
-- Data for Name: sgd_actadd_actualiadicional; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_actadd_actualiadicional (sgd_actadd_codi, sgd_apli_codi, sgd_instorf_codi, sgd_actadd_query, sgd_actadd_desc) FROM stdin;
\.


--
-- Data for Name: sgd_agen_agendados; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_agen_agendados (sgd_agen_fech, sgd_agen_observacion, radi_nume_radi, usua_doc, depe_codi, sgd_agen_codigo, sgd_agen_fechplazo, sgd_agen_activo) FROM stdin;
\.


--
-- Data for Name: sgd_anar_anexarg; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_anar_anexarg (sgd_anar_codi, anex_codigo, sgd_argd_codi, sgd_anar_argcod) FROM stdin;
\.


--
-- Name: sgd_anar_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sgd_anar_secue', 1, false);


--
-- Data for Name: sgd_anu_anulados; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_anu_anulados (sgd_anu_id, sgd_anu_desc, radi_nume_radi, sgd_eanu_codi, sgd_anu_sol_fech, sgd_anu_fech, depe_codi, usua_doc, usua_codi, depe_codi_anu, usua_doc_anu, usua_codi_anu, usua_anu_acta, sgd_anu_path_acta, sgd_trad_codigo) FROM stdin;
\.


--
-- Data for Name: sgd_aper_adminperfiles; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_aper_adminperfiles (sgd_aper_codigo, sgd_aper_descripcion) FROM stdin;
\.


--
-- Data for Name: sgd_aplfad_plicfunadi; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_aplfad_plicfunadi (sgd_aplfad_codi, sgd_apli_codi, sgd_aplfad_menu, sgd_aplfad_lk1, sgd_aplfad_desc) FROM stdin;
\.


--
-- Data for Name: sgd_apli_aplintegra; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_apli_aplintegra (sgd_apli_codi, sgd_apli_descrip, sgd_apli_lk1desc, sgd_apli_lk1, sgd_apli_lk2desc, sgd_apli_lk2, sgd_apli_lk3desc, sgd_apli_lk3, sgd_apli_lk4desc, sgd_apli_lk4) FROM stdin;
\.


--
-- Data for Name: sgd_aplmen_aplimens; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_aplmen_aplimens (sgd_aplmen_codi, sgd_apli_codi, sgd_aplmen_ref, sgd_aplmen_haciaorfeo, sgd_aplmen_desdeorfeo) FROM stdin;
\.


--
-- Data for Name: sgd_aplus_plicusua; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_aplus_plicusua (sgd_aplus_codi, sgd_apli_codi, usua_doc, sgd_trad_codigo, sgd_aplus_prioridad) FROM stdin;
\.


--
-- Data for Name: sgd_arch_depe; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_arch_depe (sgd_arch_depe, sgd_arch_edificio, sgd_arch_item, sgd_arch_id) FROM stdin;
\.


--
-- Data for Name: sgd_archivo_central; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_archivo_central (sgd_archivo_id, sgd_archivo_tipo, sgd_archivo_orden, sgd_archivo_fechai, sgd_archivo_demandado, sgd_archivo_demandante, sgd_archivo_cc_demandante, sgd_archivo_depe, sgd_archivo_zona, sgd_archivo_carro, sgd_archivo_cara, sgd_archivo_estante, sgd_archivo_entrepano, sgd_archivo_caja, sgd_archivo_unidocu, sgd_archivo_anexo, sgd_archivo_inder, sgd_archivo_path, sgd_archivo_year, sgd_archivo_rad, sgd_archivo_srd, sgd_archivo_sbrd, sgd_archivo_folios, sgd_archivo_mata, sgd_archivo_fechaf, sgd_archivo_prestamo, sgd_archivo_funprest, sgd_archivo_fechprest, sgd_archivo_fechprestf, depe_codi, sgd_archivo_usua, sgd_archivo_fech) FROM stdin;
\.


--
-- Data for Name: sgd_archivo_fondo; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_archivo_fondo (sgd_archivo_id, sgd_archivo_tipo, sgd_archivo_orden, sgd_archivo_fechai, sgd_archivo_demandado, sgd_archivo_demandante, sgd_archivo_cc_demandante, sgd_archivo_depe, sgd_archivo_zona, sgd_archivo_carro, sgd_archivo_cara, sgd_archivo_estante, sgd_archivo_entrepano, sgd_archivo_caja, sgd_archivo_unidocu, sgd_archivo_anexo, sgd_archivo_inder, sgd_archivo_path, sgd_archivo_year, sgd_archivo_rad, sgd_archivo_srd, sgd_archivo_folios, sgd_archivo_mata, sgd_archivo_fechaf, sgd_archivo_prestamo, sgd_archivo_funprest, sgd_archivo_fechprest, sgd_archivo_fechprestf, depe_codi, sgd_archivo_usua, sgd_archivo_fech) FROM stdin;
\.


--
-- Data for Name: sgd_archivo_hist; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_archivo_hist (depe_codi, hist_fech, usua_codi, sgd_archivo_rad, hist_obse, usua_doc, sgd_ttr_codigo, hist_id) FROM stdin;
\.


--
-- Data for Name: sgd_arg_pliego; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_arg_pliego (sgd_arg_codigo, sgd_arg_desc) FROM stdin;
\.


--
-- Data for Name: sgd_argd_argdoc; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_argd_argdoc (sgd_argd_codi, sgd_pnufe_codi, sgd_argd_tabla, sgd_argd_tcodi, sgd_argd_tdes, sgd_argd_llist, sgd_argd_campo) FROM stdin;
\.


--
-- Data for Name: sgd_argup_argudoctop; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_argup_argudoctop (sgd_argup_codi, sgd_argup_desc, sgd_tpr_codigo) FROM stdin;
\.


--
-- Data for Name: sgd_auditoria; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_auditoria (fecha, usua_doc, ip, tipo, tabla, isql) FROM stdin;
\.


--
-- Data for Name: sgd_camexp_campoexpediente; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_camexp_campoexpediente (sgd_camexp_codigo, sgd_camexp_campo, sgd_parexp_codigo, sgd_camexp_fk, sgd_camexp_tablafk, sgd_camexp_campofk, sgd_camexp_campovalor, sgd_camexp_orden) FROM stdin;
\.


--
-- Data for Name: sgd_carp_descripcion; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_carp_descripcion (sgd_carp_depecodi, sgd_carp_tiporad, sgd_carp_descr) FROM stdin;
0900	1	Oficio
\.


--
-- Data for Name: sgd_cau_causal; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_cau_causal (sgd_cau_codigo, sgd_cau_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_caux_causales; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_caux_causales (sgd_caux_codigo, radi_nume_radi, sgd_dcau_codigo, sgd_ddca_codigo, sgd_caux_fecha, usua_doc) FROM stdin;
\.


--
-- Data for Name: sgd_ciu_ciudadano; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_ciu_ciudadano (tdid_codi, sgd_ciu_codigo, sgd_ciu_nombre, sgd_ciu_direccion, sgd_ciu_apell1, sgd_ciu_apell2, sgd_ciu_telefono, sgd_ciu_email, muni_codi, dpto_codi, sgd_ciu_cedula, id_cont, id_pais) FROM stdin;
\.


--
-- Name: sgd_ciu_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sgd_ciu_secue', 1, false);


--
-- Data for Name: sgd_clta_clstarif; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_clta_clstarif (sgd_fenv_codigo, sgd_clta_codser, sgd_tar_codigo, sgd_clta_descrip, sgd_clta_pesdes, sgd_clta_peshast) FROM stdin;
1	1	2	CORREO CERTIFICADO REGIONAL	1	500
1	1	1	CORREO CERTIFICADO URBANO	1	500
1	1	4	CORREO CERTIFICADO ESPECIAL	1	500
1	1	3	CORREO CERTIFICADO NACIONAL	1	500
\.


--
-- Data for Name: sgd_cob_campobliga; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_cob_campobliga (sgd_cob_codi, sgd_cob_desc, sgd_cob_label, sgd_tidm_codi) FROM stdin;
1	PAIS_NOMBRE	PAIS_NOMBRE	2
2	NOMBRE	NOMBRE	1
3	MUNI_NOMBRE	MUNI_NOMBRE	1
4	DEPTO_NOMBRE	DEPTO_NOMBRE	1
5	F_RAD_S	F_RAD_S	1
6	TIPO	TIPO	2
7	NOMBRE	NOMBRE	2
8	MUNI_NOMBRE	MUNI_NOMBRE	2
9	DEPTO_NOMBRE	DEPTO_NOMBRE	2
10	DIR	DIR	2
\.


--
-- Data for Name: sgd_dcau_causal; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_dcau_causal (sgd_dcau_codigo, sgd_cau_codigo, sgd_dcau_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_ddca_ddsgrgdo; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_ddca_ddsgrgdo (sgd_ddca_codigo, sgd_dcau_codigo, par_serv_secue, sgd_ddca_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_def_contactos; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_def_contactos (ctt_id, ctt_nombre, ctt_cargo, ctt_telefono, ctt_id_tipo, ctt_id_empresa) FROM stdin;
1	ADRIANA	GERENTE	6262080	0	12
\.


--
-- Data for Name: sgd_def_continentes; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_def_continentes (id_cont, nombre_cont) FROM stdin;
1	AMERICA
2	EUROPA
3	ASIA
4	AFRICA
5	OCEANIA
6	ANTARTIDA
\.


--
-- Data for Name: sgd_def_paises; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_def_paises (id_pais, id_cont, nombre_pais) FROM stdin;
170	1	COLOMBIA
862	1	VENEZUELA
1	1	MEXICO
214	1	REPUBLICA DOMINICANA
32	1	ARGENTINA
591	1	PANAMA
249	1	ESTADOS UNIDOS
276	2	ALEMANIA
55	1	BRASIL
244	4	ANGOLA
724	2	ESPAÑA
767	2	SUIZA
604	1	PERU
\.


--
-- Data for Name: sgd_deve_dev_envio; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_deve_dev_envio (sgd_deve_codigo, sgd_deve_desc) FROM stdin;
1	CASA DESOCUPADA
5	DEVUELTO DE PORTERIA
6	DIRECCION DEFICIENTE
7	FALLECIDO
8	NO EXISTE NUMERO
9	NO RESIDE
10	NO RECLAMADO
13	NO EXISTE EMPRESA
14	ZONA DE ALTO RIESGO
15	SOBRE DESOCUPADO
16	FUERA PERIMETRO URBANO
17	ENVIADO A ADPOSTAL, CONTROL DE CALIDAD
18	SIN SELLO
90	DOCUMENTO MAL RADICADO
99	SOBREPASO TIEMPO DE ESPERA
12	SE TRASLADO
3	CERRADO
2	CAMBIO DE DOMICILIO USUARIO
\.


--
-- Data for Name: sgd_dir_drecciones; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_dir_drecciones (sgd_dir_codigo, sgd_dir_tipo, sgd_oem_codigo, sgd_ciu_codigo, radi_nume_radi, sgd_esp_codi, muni_codi, dpto_codi, sgd_dir_direccion, sgd_dir_telefono, sgd_dir_mail, sgd_sec_codigo, sgd_temporal_nombre, anex_codigo, sgd_anex_codigo, sgd_dir_nombre, sgd_doc_fun, sgd_dir_nomremdes, sgd_trd_codigo, sgd_dir_tdoc, sgd_dir_doc, id_pais, id_cont) FROM stdin;
\.


--
-- Name: sgd_dir_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sgd_dir_secue', 1, false);


--
-- Data for Name: sgd_dnufe_docnufe; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_dnufe_docnufe (sgd_dnufe_codi, sgd_pnufe_codi, sgd_tpr_codigo, sgd_dnufe_label, trte_codi, sgd_dnufe_main, sgd_dnufe_path, sgd_dnufe_gerarq, anex_tipo_codi) FROM stdin;
\.


--
-- Data for Name: sgd_dt_radicado; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_dt_radicado (radi_nume_radi, dias_termino) FROM stdin;
\.


--
-- Data for Name: sgd_eanu_estanulacion; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_eanu_estanulacion (sgd_eanu_desc, sgd_eanu_codi) FROM stdin;
RADICADO EN SOLICITUD DE ANULACION	1
RADICADO ANULADO	2
RADICADO EN SOLICITUD DE REVIVIR	3
RADICADO IMPOSIBLE DE ANULAR	9
\.


--
-- Data for Name: sgd_einv_inventario; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_einv_inventario (sgd_einv_codigo, sgd_depe_nomb, sgd_depe_codi, sgd_einv_expnum, sgd_einv_titulo, sgd_einv_unidad, sgd_einv_fech, sgd_einv_fechfin, sgd_einv_radicados, sgd_einv_folios, sgd_einv_nundocu, sgd_einv_nundocubodega, sgd_einv_caja, sgd_einv_cajabodega, sgd_einv_srd, sgd_einv_nomsrd, sgd_einv_sbrd, sgd_einv_nomsbrd, sgd_einv_retencion, sgd_einv_disfinal, sgd_einv_ubicacion, sgd_einv_observacion) FROM stdin;
\.


--
-- Data for Name: sgd_eit_items; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_eit_items (sgd_eit_codigo, sgd_eit_cod_padre, sgd_eit_nombre, sgd_eit_sigla, codi_dpto, codi_muni) FROM stdin;
1	0	TEST	TS	11	1
2	1	AA	AA	\N	\N
3	1	BB	BB	\N	\N
4	2	STANTE 1	ST1	\N	\N
5	4	ENTREPAñO 1	ENT1	\N	\N
6	5	CAJA 1	BOX1	\N	\N
7	0	EDIFICIO	ED	25	1
8	7	ALM1	A1	\N	\N
9	7	ALM2	A2	\N	\N
10	8	SUB 1	S1	\N	\N
11	8	SUB 2	S2	\N	\N
12	11	SUB-SUB 1	SS1	\N	\N
13	11	SUB-SUB 2	SS2	\N	\N
14	0	BODEGA CENTRAL	BCM	5	1
\.


--
-- Data for Name: sgd_eje_tema; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_eje_tema (sgd_tema_codigo, sgd_tema_nomb, sgd_tema_desc, sgd_tema_plazo, sgd_tema_tpplazo, sgd_tema_estado, sgd_tema_depe) FROM stdin;
\.


--
-- Data for Name: sgd_empus_empusuario; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_empus_empusuario (usua_login, identificador_empresa) FROM stdin;
\.


--
-- Data for Name: sgd_ent_entidades; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_ent_entidades (sgd_ent_nit, sgd_ent_codsuc, sgd_ent_pias, dpto_codi, muni_codi, sgd_ent_descrip, sgd_ent_direccion, sgd_ent_telefono) FROM stdin;
\.


--
-- Data for Name: sgd_enve_envioespecial; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_enve_envioespecial (sgd_fenv_codigo, sgd_enve_valorl, sgd_enve_valorn, sgd_enve_desc) FROM stdin;
109	1200	1200	Valor descuento automático
109	160	160	Valor alistamiento
109	1300	3300	Valor cert. acuse de recibido
\.


--
-- Data for Name: sgd_estc_estconsolid; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_estc_estconsolid (sgd_estc_codigo, sgd_tpr_codigo, dep_nombre, depe_codi, sgd_estc_ctotal, sgd_estc_centramite, sgd_estc_csinriesgo, sgd_estc_criesgomedio, sgd_estc_criesgoalto, sgd_estc_ctramitados, sgd_estc_centermino, sgd_estc_cfueratermino, sgd_estc_fechgen, sgd_estc_fechini, sgd_estc_fechfin, sgd_estc_fechiniresp, sgd_estc_fechfinresp, sgd_estc_dsinriesgo, sgd_estc_driesgomegio, sgd_estc_driesgoalto, sgd_estc_dtermino, sgd_estc_grupgenerado) FROM stdin;
\.


--
-- Data for Name: sgd_estinst_estadoinstancia; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_estinst_estadoinstancia (sgd_estinst_codi, sgd_apli_codi, sgd_instorf_codi, sgd_estinst_valor, sgd_estinst_habilita, sgd_estinst_mensaje) FROM stdin;
\.


--
-- Data for Name: sgd_exp_expediente; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_exp_expediente (sgd_exp_numero, radi_nume_radi, sgd_exp_fech, sgd_exp_fech_mod, depe_codi, usua_codi, usua_doc, sgd_exp_estado, sgd_exp_titulo, sgd_exp_asunto, sgd_exp_carpeta, sgd_exp_ufisica, sgd_exp_isla, sgd_exp_estante, sgd_exp_caja, sgd_exp_fech_arch, sgd_srd_codigo, sgd_sbrd_codigo, sgd_fexp_codigo, sgd_exp_subexpediente, sgd_exp_archivo, sgd_exp_unicon, sgd_exp_fechfin, sgd_exp_folios, sgd_exp_rete, sgd_exp_entrepa, radi_usua_arch, sgd_exp_edificio, sgd_exp_caja_bodega, sgd_exp_carro, sgd_exp_carpeta_bodega, sgd_exp_privado, sgd_exp_cd, sgd_exp_nref, sgd_sexp_paraexp1) FROM stdin;
\.


--
-- Data for Name: sgd_fars_faristas; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_fars_faristas (sgd_fars_codigo, sgd_pexp_codigo, sgd_fexp_codigoini, sgd_fexp_codigofin, sgd_fars_diasminimo, sgd_fars_diasmaximo, sgd_fars_desc, sgd_trad_codigo, sgd_srd_codigo, sgd_sbrd_codigo, sgd_fars_tipificacion, sgd_tpr_codigo, sgd_fars_automatico, sgd_fars_rolgeneral) FROM stdin;
1	1	1	2	1	2	Algo	2	10	1	1	118	1	0
2	1	2	1	2	10	Algo2	4	11	1	1	169	1	0
3	3	3	5	1	1	EL AREA DE COMPRAS VALIDA LA EXISTENCIA DE REQUERIMIENTO O SOLICITUD DE COMPRA	1	11	1	1	169	1	0
4	5	6	7	1	1	Asignacion de trd	4	46	1	1	201	1	0
5	5	7	8	1	1	Creacion de Expediente	4	46	1	1	201	1	0
6	5	8	9	1	1	Rerasignacion de Usuario	4	46	1	1	201	1	0
7	5	9	10	1	1	Cargar Respuesta	4	46	1	1	201	1	0
\.


--
-- Data for Name: sgd_fenv_frmenvio; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_fenv_frmenvio (sgd_fenv_codigo, sgd_fenv_descrip, sgd_fenv_planilla, sgd_fenv_estado) FROM stdin;
1	SERVIENTREGA	1	1
3	TRANSPORTADORA COMERCIAL COLOMBIA T.C.C.	1	1
2	COLVANES ENVIA MENSAJERIA C	1	0
\.


--
-- Data for Name: sgd_fexp_flujoexpedientes; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_fexp_flujoexpedientes (sgd_fexp_codigo, sgd_pexp_codigo, sgd_fexp_orden, sgd_fexp_terminos, sgd_fexp_imagen, sgd_fexp_descrip) FROM stdin;
1	1	1	2	\N	Inicio
2	1	2	10	\N	Ejecución
3	3	1	1	\N	RADICACION
5	3	3	1	\N	PAGO
6	5	1	1	\N	Radicado de PQR
7	5	2	1	\N	Asignar TRD a radicado
8	5	3	1	\N	Crear Expediente
9	5	4	1	\N	Reasignar Usuario
10	5	5	1	\N	Cargar Respuesta
11	5	6	1	\N	Enviar Vo.Bo
12	5	7	1	\N	Devolver Aprobado
13	5	8	1	\N	Radicar Respuesta
14	5	9	1	\N	Cargar Soportes
0	0	0	0		
\.


--
-- Data for Name: sgd_firrad_firmarads; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_firrad_firmarads (sgd_firrad_id, radi_nume_radi, usua_doc, sgd_firrad_firma, sgd_firrad_fecha, sgd_firrad_docsolic, sgd_firrad_fechsolic, sgd_firrad_pk) FROM stdin;
\.


--
-- Data for Name: sgd_fld_flujodoc; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_fld_flujodoc (sgd_fld_codigo, sgd_fld_desc, sgd_tpr_codigo, sgd_fld_imagen, sgd_fld_grupoweb) FROM stdin;
\.


--
-- Data for Name: sgd_fun_funciones; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_fun_funciones (sgd_fun_codigo, sgd_fun_descrip, sgd_fun_fech_ini, sgd_fun_fech_fin) FROM stdin;
\.


--
-- Data for Name: sgd_hfld_histflujodoc; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_hfld_histflujodoc (sgd_hfld_codigo, sgd_fexp_codigo, sgd_exp_fechflujoant, sgd_hfld_fech, sgd_exp_numero, radi_nume_radi, usua_doc, usua_codi, depe_codi, sgd_ttr_codigo, sgd_fexp_observa, sgd_hfld_observa, sgd_fars_codigo, sgd_hfld_automatico) FROM stdin;
\.


--
-- Data for Name: sgd_hmtd_hismatdoc; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_hmtd_hismatdoc (sgd_hmtd_codigo, sgd_hmtd_fecha, radi_nume_radi, usua_codi, sgd_hmtd_obse, usua_doc, depe_codi, sgd_mtd_codigo) FROM stdin;
\.


--
-- Name: sgd_hmtd_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sgd_hmtd_secue', 1, false);


--
-- Name: sgd_info_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sgd_info_secue', 1, false);


--
-- Data for Name: sgd_instorf_instanciasorfeo; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_instorf_instanciasorfeo (sgd_instorf_codi, sgd_instorf_desc) FROM stdin;
\.


--
-- Data for Name: sgd_lip_linkip; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_lip_linkip (sgd_lip_id, sgd_lip_ipini, sgd_lip_ipfin, sgd_lip_dirintranet, depe_codi, sgd_lip_arch, sgd_lip_diascache, sgd_lip_rutaftp, sgd_lip_servftp, sgd_lip_usbd, sgd_lip_nombd, sgd_lip_pwdbd, sgd_lip_usftp, sgd_lip_pwdftp) FROM stdin;
\.


--
-- Data for Name: sgd_mat_matriz; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_mat_matriz (sgd_mat_codigo, depe_codi, sgd_fun_codigo, sgd_prc_codigo, sgd_prd_codigo, sgd_mat_fech_ini, sgd_mat_fech_fin, sgd_mat_peso_prd) FROM stdin;
\.


--
-- Name: sgd_mat_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sgd_mat_secue', 1, false);


--
-- Data for Name: sgd_mpes_mddpeso; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_mpes_mddpeso (sgd_mpes_codigo, sgd_mpes_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_mrd_matrird; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_mrd_matrird (sgd_mrd_codigo, depe_codi, sgd_srd_codigo, sgd_sbrd_codigo, sgd_tpr_codigo, soporte, sgd_mrd_fechini, sgd_mrd_fechfin, sgd_mrd_esta) FROM stdin;
\.


--
-- Data for Name: sgd_msdep_msgdep; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_msdep_msgdep (sgd_msdep_codi, depe_codi, sgd_msg_codi) FROM stdin;
\.


--
-- Data for Name: sgd_msg_mensaje; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_msg_mensaje (sgd_msg_codi, sgd_tme_codi, sgd_msg_desc, sgd_msg_fechdesp, sgd_msg_url, sgd_msg_veces, sgd_msg_ancho, sgd_msg_largo) FROM stdin;
\.


--
-- Data for Name: sgd_mtd_matriz_doc; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_mtd_matriz_doc (sgd_mtd_codigo, sgd_mat_codigo, sgd_tpr_codigo) FROM stdin;
\.


--
-- Data for Name: sgd_noh_nohabiles; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_noh_nohabiles (noh_fecha) FROM stdin;
2015-01-01
2015-01-12
2015-03-23
2015-04-02
2015-04-03
2015-05-01
2015-05-18
2015-06-08
2015-06-15
2015-06-29
2015-07-20
2015-08-07
2015-08-17
2015-10-12
2015-11-02
2015-11-16
2015-12-08
2015-12-25
2016-01-01
2016-01-11
2016-03-21
2016-03-24
2016-03-25
2016-05-09
2016-05-30
2016-06-06
2016-07-04
2016-07-20
2016-08-15
2016-10-17
2016-11-07
2016-11-14
2016-12-08
2017-01-09
2017-03-20
2017-04-13
2017-04-14
2017-05-01
2017-05-29
2017-06-19
2017-05-29
2017-06-19
2017-06-26
2017-07-03
2017-07-20
2017-08-07
2017-08-21
2017-10-16
2017-11-06
2017-11-13
2017-12-08
2017-12-25
2018-01-01
2018-01-08
2018-03-19
2018-03-29
2018-03-30
2018-05-01
2018-05-14
2018-06-04
2018-06-11
2018-07-02
2018-07-20
2018-08-07
2018-08-20
2018-10-15
2018-11-05
2018-11-12
2018-12-08
2018-12-25
2019-01-01
2019-01-07
2019-03-25
2019-04-18
2019-04-19
2019-05-01
2019-06-03
2019-06-24
2019-07-01
2019-07-20
2019-08-07
2019-08-19
2019-10-14
2019-11-04
2019-11-11
2019-12-25
2020-01-01
2020-01-06
2020-03-23
2020-04-09
2020-04-10
2020-05-01
2020-05-25
2020-06-15
2020-06-22
2020-06-29
2020-07-20
2020-08-07
2020-08-17
2020-10-12
2020-11-02
2020-11-16
2015-07-02
2015-07-02
2015-01-01
2015-01-12
2015-03-23
2015-04-02
2015-04-03
2015-05-01
2015-05-18
2015-06-08
2015-06-15
2015-06-29
2015-07-20
2015-08-07
2015-08-17
2015-10-12
2015-11-02
2015-11-16
2015-12-08
2015-12-25
2016-01-01
2016-01-11
2016-03-21
2016-03-24
2016-03-25
2016-05-09
2016-05-30
2016-06-06
2016-07-04
2016-07-20
2016-08-15
2016-10-17
2016-11-07
2016-11-14
2016-12-08
2017-01-09
2017-03-20
2017-04-13
2017-04-14
2017-05-01
2017-05-29
2017-06-19
2017-05-29
2017-06-19
2017-06-26
2017-07-03
2017-07-20
2017-08-07
2017-08-21
2017-10-16
2017-11-06
2017-11-13
2017-12-08
2017-12-25
2018-01-01
2018-01-08
2018-03-19
2018-03-29
2018-03-30
2018-05-01
2018-05-14
2018-06-04
2018-06-11
2018-07-02
2018-07-20
2018-08-07
2018-08-20
2018-10-15
2018-11-05
2018-11-12
2018-12-08
2018-12-25
2019-01-01
2019-01-07
2019-03-25
2019-04-18
2019-04-19
2019-05-01
2019-06-03
2019-06-24
2019-07-01
2019-07-20
2019-08-07
2019-08-19
2019-10-14
2019-11-04
2019-11-11
2019-12-25
2020-01-01
2020-01-06
2020-03-23
2020-04-09
2020-04-10
2020-05-01
2020-05-25
2020-06-15
2020-06-22
2020-06-29
2020-07-20
2020-08-07
2020-08-17
2020-10-12
2020-11-02
2020-11-16
2015-09-01
2016-01-01
2016-01-11
2016-03-21
2016-03-24
2016-03-25
2016-05-09
2016-05-30
2016-06-06
2016-07-04
2016-07-20
2016-08-15
2016-10-17
2016-11-07
2016-11-14
2016-12-08
2017-01-09
2017-03-20
2017-04-13
2017-04-14
2017-05-01
2017-05-29
2017-06-19
2017-05-29
2017-06-19
2017-06-26
2017-07-03
2017-07-20
2017-08-07
2017-08-21
2017-10-16
2017-11-06
2017-11-13
2017-12-08
2017-12-25
2018-01-01
2018-01-08
2018-03-19
2018-03-29
2018-03-30
2018-05-01
2018-05-14
2018-06-04
2018-06-11
2018-07-02
2018-07-20
2018-08-07
2018-08-20
2018-10-15
2018-11-05
2018-11-12
2018-12-08
2018-12-25
2019-01-01
2019-01-07
2019-03-25
2019-04-18
2019-04-19
2019-05-01
2019-06-03
2019-06-24
2019-07-01
2019-07-20
2019-08-07
2019-08-19
2019-10-14
2019-11-04
2019-11-11
2019-12-25
2020-01-01
2020-01-06
2020-03-23
2020-04-09
2020-04-10
2020-05-01
2020-05-25
2020-06-15
2020-06-22
2020-06-29
2020-07-20
2020-08-07
2020-08-17
2020-10-12
2020-11-02
2020-11-16
2019-01-01
2017-06-06
2017-06-06
\.


--
-- Data for Name: sgd_not_notificacion; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_not_notificacion (sgd_not_codi, sgd_not_descrip) FROM stdin;
1	PERSONAL
2	TELEFONICA
\.


--
-- Data for Name: sgd_ntrd_notifrad; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_ntrd_notifrad (radi_nume_radi, sgd_not_codi, sgd_ntrd_notificador, sgd_ntrd_notificado, sgd_ntrd_fecha_not, sgd_ntrd_num_edicto, sgd_ntrd_fecha_fija, sgd_ntrd_fecha_desfija, sgd_ntrd_observaciones) FROM stdin;
\.


--
-- Data for Name: sgd_oem_oempresas; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_oem_oempresas (sgd_oem_codigo, tdid_codi, sgd_oem_oempresa, sgd_oem_rep_legal, sgd_oem_nit, sgd_oem_sigla, muni_codi, dpto_codi, sgd_oem_direccion, sgd_oem_telefono, id_cont, id_pais, email) FROM stdin;
\.


--
-- Name: sgd_oem_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sgd_oem_secue', 18398, false);


--
-- Data for Name: sgd_panu_peranulados; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_panu_peranulados (sgd_panu_codi, sgd_panu_desc) FROM stdin;
\.


--
-- Data for Name: sgd_parametro; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_parametro (param_nomb, param_codi, param_valor) FROM stdin;
PRESTAMO_ESTADO	5	Prestamo indefinido
PRESTAMO_REQUERIMIENTO	1	Documento
PRESTAMO_REQUERIMIENTO	2	Anexo
PRESTAMO_REQUERIMIENTO	3	Anexo y Documento
PRESTAMO_DIAS_PREST	1	8
PRESTAMO_DIAS_CANC	1	2
PRESTAMO_PASW	1	1
PRESTAMO_ESTADO	4	Cancelado
PRESTAMO_ESTADO	3	Devuelto
PRESTAMO_ESTADO	2	Prestado
PRESTAMO_ESTADO	1	Solicitado
\.


--
-- Data for Name: sgd_parexp_paramexpediente; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_parexp_paramexpediente (sgd_parexp_codigo, depe_codi, sgd_parexp_tabla, sgd_parexp_etiqueta, sgd_parexp_orden, sgd_parexp_editable) FROM stdin;
\.


--
-- Data for Name: sgd_pen_pensionados; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_pen_pensionados (tdid_codi, sgd_ciu_codigo, sgd_ciu_nombre, sgd_ciu_direccion, sgd_ciu_apell1, sgd_ciu_apell2, sgd_ciu_telefono, sgd_ciu_email, muni_codi, dpto_codi, sgd_ciu_cedula, id_cont, id_pais) FROM stdin;
\.


--
-- Data for Name: sgd_pexp_procexpedientes; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_pexp_procexpedientes (sgd_pexp_codigo, sgd_pexp_descrip, sgd_pexp_terminos, sgd_srd_codigo, sgd_sbrd_codigo, sgd_pexp_automatico, sgd_pexp_tieneflujo) FROM stdin;
0	\N	0	\N	\N	1	0
1	coso	0	10	1	1	1
2	coso	0	10	1	1	1
3	CONTROL DE FACTURAS IN	0	11	2	1	1
4	fgh	0	14	1	1	1
5	Derecho de Peticion	0	46	1	1	1
6	DEMO	0	11	1	1	1
\.


--
-- Name: sgd_plg_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sgd_plg_secue', 1, false);


--
-- Data for Name: sgd_pnufe_procnumfe; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_pnufe_procnumfe (sgd_pnufe_codi, sgd_tpr_codigo, sgd_pnufe_descrip, sgd_pnufe_serie) FROM stdin;
\.


--
-- Data for Name: sgd_pnun_procenum; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_pnun_procenum (sgd_pnun_codi, sgd_pnufe_codi, depe_codi, sgd_pnun_prepone) FROM stdin;
\.


--
-- Data for Name: sgd_prc_proceso; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_prc_proceso (sgd_prc_codigo, sgd_prc_descrip, sgd_prc_fech_ini, sgd_prc_fech_fin) FROM stdin;
\.


--
-- Data for Name: sgd_prd_prcdmentos; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_prd_prcdmentos (sgd_prd_codigo, sgd_prd_descrip, sgd_prd_fech_ini, sgd_prd_fech_fin) FROM stdin;
\.


--
-- Data for Name: sgd_rda_retdoca; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_rda_retdoca (anex_radi_nume, anex_codigo, radi_nume_salida, anex_borrado, sgd_mrd_codigo, depe_codi, usua_codi, usua_doc, sgd_rda_fech, sgd_deve_codigo, anex_solo_lect, anex_radi_fech, anex_estado, anex_nomb_archivo, anex_tipo, sgd_dir_tipo) FROM stdin;
\.


--
-- Data for Name: sgd_rdf_retdocf; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_rdf_retdocf (sgd_mrd_codigo, radi_nume_radi, depe_codi, usua_codi, usua_doc, sgd_rdf_fech) FROM stdin;
\.


--
-- Data for Name: sgd_renv_regenvio; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_renv_regenvio (sgd_renv_codigo, sgd_fenv_codigo, sgd_renv_fech, radi_nume_sal, sgd_renv_destino, sgd_renv_telefono, sgd_renv_mail, sgd_renv_peso, sgd_renv_valor, sgd_renv_certificado, sgd_renv_estado, usua_doc, sgd_renv_nombre, sgd_rem_destino, sgd_dir_codigo, sgd_renv_planilla, sgd_renv_fech_sal, depe_codi, sgd_dir_tipo, radi_nume_grupo, sgd_renv_dir, sgd_renv_depto, sgd_renv_mpio, sgd_renv_tel, sgd_renv_cantidad, sgd_renv_tipo, sgd_renv_observa, sgd_renv_grupo, sgd_deve_codigo, sgd_deve_fech, sgd_renv_valortotal, sgd_renv_valistamiento, sgd_renv_vdescuento, sgd_renv_vadicional, sgd_depe_genera, sgd_renv_pais, sgd_renv_guia) FROM stdin;
\.


--
-- Data for Name: sgd_renv_regenvio1; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_renv_regenvio1 (sgd_renv_codigo, sgd_fenv_codigo, sgd_renv_fech, radi_nume_sal, sgd_renv_destino, sgd_renv_telefono, sgd_renv_mail, sgd_renv_peso, sgd_renv_valor, sgd_renv_certificado, sgd_renv_estado, usua_doc, sgd_renv_nombre, sgd_rem_destino, sgd_dir_codigo, sgd_renv_planilla, sgd_renv_fech_sal, depe_codi, sgd_dir_tipo, radi_nume_grupo, sgd_renv_dir, sgd_renv_depto, sgd_renv_mpio, sgd_renv_tel, sgd_renv_cantidad, sgd_renv_tipo, sgd_renv_observa, sgd_renv_grupo, sgd_deve_codigo, sgd_deve_fech, sgd_renv_valortotal, sgd_renv_valistamiento, sgd_renv_vdescuento, sgd_renv_vadicional, sgd_depe_genera, sgd_renv_pais) FROM stdin;
\.


--
-- Data for Name: sgd_rfax_reservafax; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_rfax_reservafax (sgd_rfax_codigo, sgd_rfax_fax, usua_login, sgd_rfax_fech, sgd_rfax_fechradi, radi_nume_radi, sgd_rfax_observa) FROM stdin;
\.


--
-- Data for Name: sgd_rmr_radmasivre; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_rmr_radmasivre (sgd_rmr_grupo, sgd_rmr_radi) FROM stdin;
\.


--
-- Data for Name: sgd_san_sancionados; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_san_sancionados (sgd_san_ref, sgd_san_decision, sgd_san_cargo, sgd_san_expediente, sgd_san_tipo_sancion, sgd_san_plazo, sgd_san_valor, sgd_san_radicacion, sgd_san_fecha_radicado, sgd_san_valorletras, sgd_san_nombreempresa, sgd_san_motivos, sgd_san_sectores, sgd_san_padre, sgd_san_fecha_padre, sgd_san_notificado) FROM stdin;
\.


--
-- Data for Name: sgd_san_sancionados_x; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_san_sancionados_x (radi_nume_radi, sgd_san_decision, sgd_san_cargo, sgd_san_expediente, sgd_san_tipo_sancion, sgd_san_plazo, sgd_san_valor, sgd_san_radicacion, sgd_san_fecha_radicado, sgd_san_valorletras, sgd_san_nombreempresa, sgd_san_motivos, sgd_san_sectores, sgd_san_padre) FROM stdin;
\.


--
-- Data for Name: sgd_sbrd_subserierd; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_sbrd_subserierd (sgd_srd_codigo, sgd_sbrd_codigo, sgd_sbrd_descrip, sgd_sbrd_fechini, sgd_sbrd_fechfin, sgd_sbrd_tiemag, sgd_sbrd_tiemac, sgd_sbrd_dispfin, sgd_sbrd_soporte, sgd_sbrd_procedi) FROM stdin;
\.


--
-- Data for Name: sgd_sed_sede; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_sed_sede (sgd_sed_codi, sgd_sed_desc) FROM stdin;
\.


--
-- Data for Name: sgd_senuf_secnumfe; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_senuf_secnumfe (sgd_senuf_codi, sgd_pnufe_codi, depe_codi, sgd_senuf_sec) FROM stdin;
\.


--
-- Data for Name: sgd_sexp_secexpedientes; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_sexp_secexpedientes (sgd_exp_numero, sgd_srd_codigo, sgd_sbrd_codigo, sgd_sexp_secuencia, depe_codi, usua_doc, sgd_sexp_fech, sgd_fexp_codigo, sgd_sexp_ano, usua_doc_responsable, sgd_sexp_parexp1, sgd_sexp_parexp2, sgd_sexp_parexp3, sgd_sexp_parexp4, sgd_sexp_parexp5, sgd_pexp_codigo, sgd_exp_fech_arch, sgd_fld_codigo, sgd_exp_fechflujoant, sgd_mrd_codigo, sgd_exp_subexpediente, sgd_exp_privado, sgd_sexp_estado) FROM stdin;
\.


--
-- Data for Name: sgd_srd_seriesrd; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_srd_seriesrd (sgd_srd_codigo, sgd_srd_descrip, sgd_srd_fechini, sgd_srd_fechfin) FROM stdin;
\.


--
-- Data for Name: sgd_tar_tarifas; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tar_tarifas (sgd_fenv_codigo, sgd_tar_codser, sgd_tar_codigo, sgd_tar_valenv1, sgd_tar_valenv2, sgd_tar_valenv1g1, sgd_clta_codser, sgd_tar_valenv2g2, sgd_clta_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_tdec_tipodecision; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tdec_tipodecision (sgd_apli_codi, sgd_tdec_codigo, sgd_tdec_descrip, sgd_tdec_sancionar, sgd_tdec_firmeza, sgd_tdec_versancion, sgd_tdec_showmenu, sgd_tdec_updnotif, sgd_tdec_veragota) FROM stdin;
\.


--
-- Data for Name: sgd_tid_tipdecision; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tid_tipdecision (sgd_tid_codi, sgd_tid_desc, sgd_tpr_codigo, sgd_pexp_codigo, sgd_tpr_codigop) FROM stdin;
\.


--
-- Data for Name: sgd_tidm_tidocmasiva; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tidm_tidocmasiva (sgd_tidm_codi, sgd_tidm_desc) FROM stdin;
1	PLANTILLA
2	CSV
\.


--
-- Data for Name: sgd_tip3_tipotercero; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tip3_tipotercero (sgd_tip3_codigo, sgd_dir_tipo, sgd_tip3_nombre, sgd_tip3_desc, sgd_tip3_imgpestana, sgd_tpr_tp1, sgd_tpr_tp2, sgd_tpr_tp4, sgd_tpr_tp3, sgd_tpr_tp5) FROM stdin;
2	1	DESTINATARIO	DESTINATARIO	tip3destina.jpg	1	0	1	1	1
3	2	EMPRESAS	EMPRESAS	tip3predio.jpg	1	1	1	1	1
4	3	ENTIDADES	ENTIDADES ESTATALES	tip3ent.jpg	1	1	1	1	1
1	1	REMITENTE	REMITENTE	tip3remitente.jpg	0	1	0	0	0
\.


--
-- Data for Name: sgd_tma_temas; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tma_temas (sgd_tma_codigo, depe_codi, sgd_prc_codigo, sgd_tma_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_tme_tipmen; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tme_tipmen (sgd_tme_codi, sgd_tme_desc) FROM stdin;
\.


--
-- Data for Name: sgd_tpr_tpdcumento; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tpr_tpdcumento (sgd_tpr_codigo, sgd_tpr_descrip, sgd_tpr_termino, sgd_tpr_tpuso, sgd_tpr_numera, sgd_tpr_radica, sgd_tpr_tp1, sgd_tpr_tp2, sgd_tpr_estado, sgd_termino_real, sgd_tpr_web, sgd_tpr_tiptermino, sgd_tpr_tp4, sgd_tpr_tp3, sgd_tpr_tp5) FROM stdin;
\.


--
-- Data for Name: sgd_trad_tiporad; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_trad_tiporad (sgd_trad_codigo, sgd_trad_descr, sgd_trad_icono, sgd_trad_diasbloqueo, sgd_trad_genradsal) FROM stdin;
1	Salida	\N	1	\N
2	Entrada	\N	1	\N
4	Pqrs	\N	\N	1
3	Solicitudes internas	\N	\N	1
5	NUEVA RADICACION	\N	\N	1
\.


--
-- Data for Name: sgd_ttr_transaccion; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_ttr_transaccion (sgd_ttr_codigo, sgd_ttr_descrip) FROM stdin;
40	Firma Digital de Documento
41	Eliminacion solicitud de Firma Digital
50	Cambio de Estado Expediente
51	Creacion Expediente
1	Recuperacion Radicado
9	Reasignacion
8	Informar
19	Cambiar Tipo de Documento
20	Crear Registro
21	Editar Registro
10	Movimiento entre Carpetas
11	Modificacion Radicado
7	Borrar Informado
12	Devuelto-Reasignar
13	Archivar
14	Agendar
15	Sacar de la agenda
0	--
16	Reasignar para Vo.Bo.
2	Radicacion
22	Digitalizacion de Radicado
23	Digitalizacion - Modificacion
24	Asociacion Imagen fax
30	Radicacion Masiva
17	Modificacion de Causal
18	Modificacion del Sector
25	Solicitud de Anulacion
26	Anulacion Rad
27	Rechazo de Anulacion
37	Cambio de Estado del Documento
28	Devolucion de correo
29	Digitalizacion de Anexo
31	Borrado de Anexo a radicado
32	Asignacion TRD
33	Eliminar TRD
35	Tipificacion de la decision
36	Cambio en la Notificacion
38	Cambio Vinculacion Documento
39	Solicitud de Firma
42	Digitalizacion Radicado(Asoc. Imagen Web)
52	Excluir radicado de expediente
53	Incluir radicado en expediente
54	Cambio Seguridad del Documento
57	Ingreso al Archivo Fisico
55	Creación Subexpediente
56	Cambio de Responsable
58	Expediente Cerrado
59	Expediente Reabierto
61	Asignar TRD Multiple
62	Insercion Expediente Multiple
65	Archivado NRR
\.


--
-- Name: sgd_tvd_depe_id; Type: SEQUENCE SET; Schema: public; Owner: orfeousr
--

SELECT pg_catalog.setval('sgd_tvd_depe_id', 0, false);


--
-- Data for Name: sgd_tvd_dependencia; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tvd_dependencia (sgd_depe_codi, sgd_depe_nombre, sgd_depe_fechini, sgd_depe_fechfin) FROM stdin;
\.


--
-- Data for Name: sgd_tvd_series; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_tvd_series (sgd_depe_codi, sgd_stvd_codi, sgd_stvd_nombre, sgd_stvd_ac, sgd_stvd_dispfin, sgd_stvd_proc) FROM stdin;
\.


--
-- Data for Name: sgd_ush_usuhistorico; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_ush_usuhistorico (sgd_ush_admcod, sgd_ush_admdep, sgd_ush_admdoc, sgd_ush_usucod, sgd_ush_usudep, sgd_ush_usudoc, sgd_ush_modcod, sgd_ush_fechevento, sgd_ush_usulogin) FROM stdin;
\.


--
-- Data for Name: sgd_usm_usumodifica; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY sgd_usm_usumodifica (sgd_usm_modcod, sgd_usm_moddescr) FROM stdin;
47	Quito permiso impresion
43	Otorgo permiso prestamo de documentos
44	Quito permiso prestamo de documentos
45	Otorgo permiso digitalizacion de documentos
46	Quito permiso digitalizacion de documentos
48	Otorgo permiso modificaciones
49	Quito permiso modificaciones
50	Cambio de perfil
1	Creacion de usuario
51	Otorgo permiso tablas retencion documental
52	Quito permiso tablas retencion documental
3	Cambio dependencia
4	Cambio cedula
5	Cambio nombre
7	Cambio ubicacion
8	Cambio piso
9	Cambio estado
10	Otorgo permiso radicacion entrada
11	Otorgo permisos radicacion de entrada
12	Quito permiso administracion sistema
13	Otorgo permiso administracion sistema
14	Quito permiso administracion archivo
15	Otorgo permiso administracion archivo
16	Habilitado como usuario nuevo
17	Habilitado como usuario antiguo con clave
18	Cambio nivel
19	Otorgo permiso radicacion salida
20	Otorgo permiso impresion
21	Otorgo permiso radicacion masiva
22	Quito permiso radicacion masiva
23	Quito permiso devoluciones de correo
24	Otorgo permiso devoluciones de correo
25	Otorgo permiso de solicitud de anulacion
26	Otorgo permiso de anulacion
27	Otorgo permiso de solicitud de anulacion y anulacion
28	Quito permiso radicacion memorandos
29	Otorgo permiso radicacion memorandos
30	Quito permiso radicacion resoluciones
31	Otorgo permiso radicacion resoluciones
33	Quito permiso envio de correo
34	Otorgo permiso envio de correo
35	Otorgo permiso radicacion de salida 
39	Cambio extension
40	Cambio email
41	Quito permisos radicacion entrada
42	Quito permisos de solicitud de anulacion y anulaciones
\.


--
-- Data for Name: tipo_doc_identificacion; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY tipo_doc_identificacion (tdid_codi, tdid_desc) FROM stdin;
0	Cedula de Ciudadania
1	Tarjeta de Identidad
2	Cedula de Extranjería
3	Pasaporte
4	Nit
5	NUIR
\.


--
-- Data for Name: tipo_remitente; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY tipo_remitente (trte_codi, trte_desc) FROM stdin;
0	Entidades
1	Otras empresas
2	Persona natural
3	Predio
5	Otros
6	Funcionario
\.


--
-- Data for Name: ubicacion_fisica; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY ubicacion_fisica (ubic_depe_radi, ubic_depe_arch) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: orfeousr
--

COPY usuario (usua_codi, depe_codi, usua_login, usua_fech_crea, usua_pasw, usua_esta, usua_nomb, perm_radi, usua_admin, usua_nuevo, usua_doc, codi_nivel, usua_sesion, usua_fech_sesion, usua_ext, usua_nacim, usua_email, usua_at, usua_piso, perm_radi_sal, usua_admin_archivo, usua_masiva, usua_perm_dev, usua_perm_numera_res, usua_doc_suip, usua_perm_numeradoc, sgd_panu_codi, usua_prad_tp1, usua_prad_tp2, usua_perm_envios, usua_perm_modifica, usua_perm_impresion, sgd_aper_codigo, usu_telefono1, usua_encuesta, sgd_perm_estadistica, usua_perm_sancionados, usua_admin_sistema, usua_perm_trd, usua_perm_firma, usua_perm_prestamo, usuario_publico, usuario_reasignar, usua_perm_notifica, usua_perm_expediente, usua_login_externo, id_pais, id_cont, usua_auth_ldap, perm_archi, perm_vobo, perm_borrar_anexo, perm_tipif_anexo, usua_perm_adminflujos, usua_exp_trd, usua_perm_rademail, usua_perm_accesi, usua_perm_agrcontacto, usua_prad_tp4, usua_prad_tp3, usua_prad_tp5) FROM stdin;
1	0998	ADMON	2016-08-23	1232f297a57a5a743894a0e4a8	1	Usuario Administrador	1	1	1	123456789	5	5ltd2on3vrpvbj4peu2j7gph61	2018-02-16	\N	\N	pruebas@skinatech.com	\N	\N	3	2	1	1	\N		\N	3	3	3	1	1	2	\N	eeeeeeeee	\N	2	1	1	2	1	1	1	1	0	2	\N	170	1	0	1	1	1	1	0	0	1	0	1	3	3	\N
\.


--
-- Name: ID; Type: CONSTRAINT; Schema: public; Owner: orfeousr; Tablespace: 
--

ALTER TABLE ONLY sgd_arch_depe
    ADD CONSTRAINT "ID" PRIMARY KEY (sgd_arch_id);


--
-- Name: PK_SGD_TTR_TRANSACCION; Type: CONSTRAINT; Schema: public; Owner: orfeousr; Tablespace: 
--

ALTER TABLE ONLY sgd_ttr_transaccion
    ADD CONSTRAINT "PK_SGD_TTR_TRANSACCION" PRIMARY KEY (sgd_ttr_codigo);


--
-- Name: SGD_TRAD_TIPORAD_CODIGO_INX; Type: CONSTRAINT; Schema: public; Owner: orfeousr; Tablespace: 
--

ALTER TABLE ONLY sgd_trad_tiporad
    ADD CONSTRAINT "SGD_TRAD_TIPORAD_CODIGO_INX" PRIMARY KEY (sgd_trad_codigo);


--
-- Name: bodega_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeousr; Tablespace: 
--

ALTER TABLE ONLY bodega_empresas
    ADD CONSTRAINT bodega_empresas_pkey PRIMARY KEY (identificador_empresa);


--
-- Name: pk_radicados; Type: CONSTRAINT; Schema: public; Owner: orfeousr; Tablespace: 
--

ALTER TABLE ONLY radicado
    ADD CONSTRAINT pk_radicados PRIMARY KEY (radi_nume_radi);


--
-- Name: sede_codi; Type: CONSTRAINT; Schema: public; Owner: orfeousr; Tablespace: 
--

ALTER TABLE ONLY sgd_sed_sede
    ADD CONSTRAINT sede_codi UNIQUE (sgd_sed_codi);


--
-- Name: sgd_archivo_central2_pk; Type: CONSTRAINT; Schema: public; Owner: orfeousr; Tablespace: 
--

ALTER TABLE ONLY sgd_archivo_central
    ADD CONSTRAINT sgd_archivo_central2_pk PRIMARY KEY (sgd_archivo_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: concat(text, text); Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON FUNCTION concat(text, text) FROM PUBLIC;
REVOKE ALL ON FUNCTION concat(text, text) FROM admin;
GRANT ALL ON FUNCTION concat(text, text) TO admin;
GRANT ALL ON FUNCTION concat(text, text) TO postgres;
GRANT ALL ON FUNCTION concat(text, text) TO PUBLIC;


--
-- Name: usuario; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE usuario FROM PUBLIC;
REVOKE ALL ON TABLE usuario FROM orfeousr;
GRANT ALL ON TABLE usuario TO orfeousr;
GRANT ALL ON TABLE usuario TO postgres;
GRANT ALL ON TABLE usuario TO PUBLIC;


--
-- Name: anexos; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE anexos FROM PUBLIC;
REVOKE ALL ON TABLE anexos FROM orfeousr;
GRANT ALL ON TABLE anexos TO orfeousr;
GRANT ALL ON TABLE anexos TO postgres;
GRANT ALL ON TABLE anexos TO PUBLIC;


--
-- Name: anexos_historico; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE anexos_historico FROM PUBLIC;
REVOKE ALL ON TABLE anexos_historico FROM orfeousr;
GRANT ALL ON TABLE anexos_historico TO orfeousr;
GRANT ALL ON TABLE anexos_historico TO postgres;
GRANT ALL ON TABLE anexos_historico TO PUBLIC;


--
-- Name: anexos_tipo; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE anexos_tipo FROM PUBLIC;
REVOKE ALL ON TABLE anexos_tipo FROM orfeousr;
GRANT ALL ON TABLE anexos_tipo TO orfeousr;
GRANT ALL ON TABLE anexos_tipo TO postgres;
GRANT ALL ON TABLE anexos_tipo TO PUBLIC;


--
-- Name: aux_01; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE aux_01 FROM PUBLIC;
REVOKE ALL ON TABLE aux_01 FROM orfeousr;
GRANT ALL ON TABLE aux_01 TO orfeousr;
GRANT ALL ON TABLE aux_01 TO postgres;
GRANT ALL ON TABLE aux_01 TO PUBLIC;


--
-- Name: bodega_empresas; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE bodega_empresas FROM PUBLIC;
REVOKE ALL ON TABLE bodega_empresas FROM orfeousr;
GRANT ALL ON TABLE bodega_empresas TO orfeousr;
GRANT ALL ON TABLE bodega_empresas TO postgres;
GRANT ALL ON TABLE bodega_empresas TO PUBLIC;


--
-- Name: bodega_empresas_old; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE bodega_empresas_old FROM PUBLIC;
REVOKE ALL ON TABLE bodega_empresas_old FROM orfeousr;
GRANT ALL ON TABLE bodega_empresas_old TO orfeousr;
GRANT ALL ON TABLE bodega_empresas_old TO postgres;
GRANT ALL ON TABLE bodega_empresas_old TO PUBLIC;


--
-- Name: borrar_carpeta_personalizada; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE borrar_carpeta_personalizada FROM PUBLIC;
REVOKE ALL ON TABLE borrar_carpeta_personalizada FROM orfeousr;
GRANT ALL ON TABLE borrar_carpeta_personalizada TO orfeousr;
GRANT ALL ON TABLE borrar_carpeta_personalizada TO postgres;
GRANT ALL ON TABLE borrar_carpeta_personalizada TO PUBLIC;


--
-- Name: borrar_empresa_esp; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE borrar_empresa_esp FROM PUBLIC;
REVOKE ALL ON TABLE borrar_empresa_esp FROM orfeousr;
GRANT ALL ON TABLE borrar_empresa_esp TO orfeousr;
GRANT ALL ON TABLE borrar_empresa_esp TO postgres;
GRANT ALL ON TABLE borrar_empresa_esp TO PUBLIC;


--
-- Name: carpeta; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE carpeta FROM PUBLIC;
REVOKE ALL ON TABLE carpeta FROM orfeousr;
GRANT ALL ON TABLE carpeta TO orfeousr;
GRANT ALL ON TABLE carpeta TO postgres;
GRANT ALL ON TABLE carpeta TO PUBLIC;


--
-- Name: carpeta_per; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE carpeta_per FROM PUBLIC;
REVOKE ALL ON TABLE carpeta_per FROM orfeousr;
GRANT ALL ON TABLE carpeta_per TO orfeousr;
GRANT ALL ON TABLE carpeta_per TO postgres;
GRANT ALL ON TABLE carpeta_per TO PUBLIC;


--
-- Name: centro_poblado; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE centro_poblado FROM PUBLIC;
REVOKE ALL ON TABLE centro_poblado FROM orfeousr;
GRANT ALL ON TABLE centro_poblado TO orfeousr;
GRANT ALL ON TABLE centro_poblado TO postgres;
GRANT ALL ON TABLE centro_poblado TO PUBLIC;


--
-- Name: departamento; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE departamento FROM PUBLIC;
REVOKE ALL ON TABLE departamento FROM orfeousr;
GRANT ALL ON TABLE departamento TO orfeousr;
GRANT ALL ON TABLE departamento TO postgres;
GRANT ALL ON TABLE departamento TO PUBLIC;


--
-- Name: dependencia; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE dependencia FROM PUBLIC;
REVOKE ALL ON TABLE dependencia FROM orfeousr;
GRANT ALL ON TABLE dependencia TO orfeousr;
GRANT ALL ON TABLE dependencia TO postgres;
GRANT ALL ON TABLE dependencia TO PUBLIC;


--
-- Name: dependencia_visibilidad; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE dependencia_visibilidad FROM PUBLIC;
REVOKE ALL ON TABLE dependencia_visibilidad FROM orfeousr;
GRANT ALL ON TABLE dependencia_visibilidad TO orfeousr;
GRANT ALL ON TABLE dependencia_visibilidad TO postgres;
GRANT ALL ON TABLE dependencia_visibilidad TO PUBLIC;


--
-- Name: dup_eliminar; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE dup_eliminar FROM PUBLIC;
REVOKE ALL ON TABLE dup_eliminar FROM orfeousr;
GRANT ALL ON TABLE dup_eliminar TO orfeousr;
GRANT ALL ON TABLE dup_eliminar TO postgres;
GRANT ALL ON TABLE dup_eliminar TO PUBLIC;


--
-- Name: emp_cod_actualizar; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE emp_cod_actualizar FROM PUBLIC;
REVOKE ALL ON TABLE emp_cod_actualizar FROM orfeousr;
GRANT ALL ON TABLE emp_cod_actualizar TO orfeousr;
GRANT ALL ON TABLE emp_cod_actualizar TO postgres;
GRANT ALL ON TABLE emp_cod_actualizar TO PUBLIC;


--
-- Name: empresas_temporal; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE empresas_temporal FROM PUBLIC;
REVOKE ALL ON TABLE empresas_temporal FROM orfeousr;
GRANT ALL ON TABLE empresas_temporal TO orfeousr;
GRANT ALL ON TABLE empresas_temporal TO postgres;
GRANT ALL ON TABLE empresas_temporal TO PUBLIC;


--
-- Name: encuesta; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE encuesta FROM PUBLIC;
REVOKE ALL ON TABLE encuesta FROM orfeousr;
GRANT ALL ON TABLE encuesta TO orfeousr;
GRANT ALL ON TABLE encuesta TO postgres;
GRANT ALL ON TABLE encuesta TO PUBLIC;


--
-- Name: estado; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE estado FROM PUBLIC;
REVOKE ALL ON TABLE estado FROM orfeousr;
GRANT ALL ON TABLE estado TO orfeousr;
GRANT ALL ON TABLE estado TO postgres;
GRANT ALL ON TABLE estado TO PUBLIC;


--
-- Name: example; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE example FROM PUBLIC;
REVOKE ALL ON TABLE example FROM orfeousr;
GRANT ALL ON TABLE example TO orfeousr;
GRANT ALL ON TABLE example TO postgres;
GRANT ALL ON TABLE example TO PUBLIC;


--
-- Name: fun_funcionario; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE fun_funcionario FROM PUBLIC;
REVOKE ALL ON TABLE fun_funcionario FROM orfeousr;
GRANT ALL ON TABLE fun_funcionario TO orfeousr;
GRANT ALL ON TABLE fun_funcionario TO postgres;
GRANT ALL ON TABLE fun_funcionario TO PUBLIC;


--
-- Name: fun_funcionario_2; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE fun_funcionario_2 FROM PUBLIC;
REVOKE ALL ON TABLE fun_funcionario_2 FROM orfeousr;
GRANT ALL ON TABLE fun_funcionario_2 TO orfeousr;
GRANT ALL ON TABLE fun_funcionario_2 TO postgres;
GRANT ALL ON TABLE fun_funcionario_2 TO PUBLIC;


--
-- Name: hist_eventos; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE hist_eventos FROM PUBLIC;
REVOKE ALL ON TABLE hist_eventos FROM orfeousr;
GRANT ALL ON TABLE hist_eventos TO orfeousr;
GRANT ALL ON TABLE hist_eventos TO postgres;
GRANT ALL ON TABLE hist_eventos TO PUBLIC;


--
-- Name: informados; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE informados FROM PUBLIC;
REVOKE ALL ON TABLE informados FROM orfeousr;
GRANT ALL ON TABLE informados TO orfeousr;
GRANT ALL ON TABLE informados TO postgres;
GRANT ALL ON TABLE informados TO PUBLIC;


--
-- Name: medio_recepcion; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE medio_recepcion FROM PUBLIC;
REVOKE ALL ON TABLE medio_recepcion FROM orfeousr;
GRANT ALL ON TABLE medio_recepcion TO orfeousr;
GRANT ALL ON TABLE medio_recepcion TO postgres;
GRANT ALL ON TABLE medio_recepcion TO PUBLIC;


--
-- Name: municipio; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE municipio FROM PUBLIC;
REVOKE ALL ON TABLE municipio FROM orfeousr;
GRANT ALL ON TABLE municipio TO orfeousr;
GRANT ALL ON TABLE municipio TO postgres;
GRANT ALL ON TABLE municipio TO PUBLIC;


--
-- Name: ortega_prueba_orfeo; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE ortega_prueba_orfeo FROM PUBLIC;
REVOKE ALL ON TABLE ortega_prueba_orfeo FROM orfeousr;
GRANT ALL ON TABLE ortega_prueba_orfeo TO orfeousr;
GRANT ALL ON TABLE ortega_prueba_orfeo TO postgres;
GRANT ALL ON TABLE ortega_prueba_orfeo TO PUBLIC;


--
-- Name: par_serv_servicios; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE par_serv_servicios FROM PUBLIC;
REVOKE ALL ON TABLE par_serv_servicios FROM orfeousr;
GRANT ALL ON TABLE par_serv_servicios TO orfeousr;
GRANT ALL ON TABLE par_serv_servicios TO postgres;
GRANT ALL ON TABLE par_serv_servicios TO PUBLIC;


--
-- Name: pl_generado_plg; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE pl_generado_plg FROM PUBLIC;
REVOKE ALL ON TABLE pl_generado_plg FROM orfeousr;
GRANT ALL ON TABLE pl_generado_plg TO orfeousr;
GRANT ALL ON TABLE pl_generado_plg TO postgres;
GRANT ALL ON TABLE pl_generado_plg TO PUBLIC;


--
-- Name: pl_tipo_plt; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE pl_tipo_plt FROM PUBLIC;
REVOKE ALL ON TABLE pl_tipo_plt FROM orfeousr;
GRANT ALL ON TABLE pl_tipo_plt TO orfeousr;
GRANT ALL ON TABLE pl_tipo_plt TO postgres;
GRANT ALL ON TABLE pl_tipo_plt TO PUBLIC;


--
-- Name: plan_table; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE plan_table FROM PUBLIC;
REVOKE ALL ON TABLE plan_table FROM orfeousr;
GRANT ALL ON TABLE plan_table TO orfeousr;
GRANT ALL ON TABLE plan_table TO postgres;
GRANT ALL ON TABLE plan_table TO PUBLIC;


--
-- Name: plantilla_pl; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE plantilla_pl FROM PUBLIC;
REVOKE ALL ON TABLE plantilla_pl FROM orfeousr;
GRANT ALL ON TABLE plantilla_pl TO orfeousr;
GRANT ALL ON TABLE plantilla_pl TO postgres;
GRANT ALL ON TABLE plantilla_pl TO PUBLIC;


--
-- Name: plsql_profiler_data; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE plsql_profiler_data FROM PUBLIC;
REVOKE ALL ON TABLE plsql_profiler_data FROM orfeousr;
GRANT ALL ON TABLE plsql_profiler_data TO orfeousr;
GRANT ALL ON TABLE plsql_profiler_data TO postgres;
GRANT ALL ON TABLE plsql_profiler_data TO PUBLIC;


--
-- Name: plsql_profiler_runs; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE plsql_profiler_runs FROM PUBLIC;
REVOKE ALL ON TABLE plsql_profiler_runs FROM orfeousr;
GRANT ALL ON TABLE plsql_profiler_runs TO orfeousr;
GRANT ALL ON TABLE plsql_profiler_runs TO postgres;
GRANT ALL ON TABLE plsql_profiler_runs TO PUBLIC;


--
-- Name: plsql_profiler_units; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE plsql_profiler_units FROM PUBLIC;
REVOKE ALL ON TABLE plsql_profiler_units FROM orfeousr;
GRANT ALL ON TABLE plsql_profiler_units TO orfeousr;
GRANT ALL ON TABLE plsql_profiler_units TO postgres;
GRANT ALL ON TABLE plsql_profiler_units TO PUBLIC;


--
-- Name: prestamo; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE prestamo FROM PUBLIC;
REVOKE ALL ON TABLE prestamo FROM orfeousr;
GRANT ALL ON TABLE prestamo TO orfeousr;
GRANT ALL ON TABLE prestamo TO postgres;
GRANT ALL ON TABLE prestamo TO PUBLIC;


--
-- Name: pruba; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE pruba FROM PUBLIC;
REVOKE ALL ON TABLE pruba FROM orfeousr;
GRANT ALL ON TABLE pruba TO orfeousr;
GRANT ALL ON TABLE pruba TO postgres;
GRANT ALL ON TABLE pruba TO PUBLIC;


--
-- Name: radicado; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE radicado FROM PUBLIC;
REVOKE ALL ON TABLE radicado FROM orfeousr;
GRANT ALL ON TABLE radicado TO orfeousr;
GRANT ALL ON TABLE radicado TO postgres;
GRANT ALL ON TABLE radicado TO PUBLIC;


--
-- Name: retencion_doc_tmp; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE retencion_doc_tmp FROM PUBLIC;
REVOKE ALL ON TABLE retencion_doc_tmp FROM orfeousr;
GRANT ALL ON TABLE retencion_doc_tmp TO orfeousr;
GRANT ALL ON TABLE retencion_doc_tmp TO postgres;
GRANT ALL ON TABLE retencion_doc_tmp TO PUBLIC;


--
-- Name: series; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE series FROM PUBLIC;
REVOKE ALL ON TABLE series FROM orfeousr;
GRANT ALL ON TABLE series TO orfeousr;
GRANT ALL ON TABLE series TO postgres;
GRANT ALL ON TABLE series TO PUBLIC;


--
-- Name: sgd_acm_acusemsg; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_acm_acusemsg FROM PUBLIC;
REVOKE ALL ON TABLE sgd_acm_acusemsg FROM orfeousr;
GRANT ALL ON TABLE sgd_acm_acusemsg TO orfeousr;
GRANT ALL ON TABLE sgd_acm_acusemsg TO postgres;
GRANT ALL ON TABLE sgd_acm_acusemsg TO PUBLIC;


--
-- Name: sgd_actadd_actualiadicional; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_actadd_actualiadicional FROM PUBLIC;
REVOKE ALL ON TABLE sgd_actadd_actualiadicional FROM orfeousr;
GRANT ALL ON TABLE sgd_actadd_actualiadicional TO orfeousr;
GRANT ALL ON TABLE sgd_actadd_actualiadicional TO postgres;
GRANT ALL ON TABLE sgd_actadd_actualiadicional TO PUBLIC;


--
-- Name: sgd_agen_agendados; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_agen_agendados FROM PUBLIC;
REVOKE ALL ON TABLE sgd_agen_agendados FROM orfeousr;
GRANT ALL ON TABLE sgd_agen_agendados TO orfeousr;
GRANT ALL ON TABLE sgd_agen_agendados TO postgres;
GRANT ALL ON TABLE sgd_agen_agendados TO PUBLIC;


--
-- Name: sgd_anar_anexarg; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_anar_anexarg FROM PUBLIC;
REVOKE ALL ON TABLE sgd_anar_anexarg FROM orfeousr;
GRANT ALL ON TABLE sgd_anar_anexarg TO orfeousr;
GRANT ALL ON TABLE sgd_anar_anexarg TO postgres;
GRANT ALL ON TABLE sgd_anar_anexarg TO PUBLIC;


--
-- Name: sgd_anu_anulados; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_anu_anulados FROM PUBLIC;
REVOKE ALL ON TABLE sgd_anu_anulados FROM orfeousr;
GRANT ALL ON TABLE sgd_anu_anulados TO orfeousr;
GRANT ALL ON TABLE sgd_anu_anulados TO postgres;
GRANT ALL ON TABLE sgd_anu_anulados TO PUBLIC;


--
-- Name: sgd_aper_adminperfiles; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_aper_adminperfiles FROM PUBLIC;
REVOKE ALL ON TABLE sgd_aper_adminperfiles FROM orfeousr;
GRANT ALL ON TABLE sgd_aper_adminperfiles TO orfeousr;
GRANT ALL ON TABLE sgd_aper_adminperfiles TO postgres;
GRANT ALL ON TABLE sgd_aper_adminperfiles TO PUBLIC;


--
-- Name: sgd_aplfad_plicfunadi; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_aplfad_plicfunadi FROM PUBLIC;
REVOKE ALL ON TABLE sgd_aplfad_plicfunadi FROM orfeousr;
GRANT ALL ON TABLE sgd_aplfad_plicfunadi TO orfeousr;
GRANT ALL ON TABLE sgd_aplfad_plicfunadi TO postgres;
GRANT ALL ON TABLE sgd_aplfad_plicfunadi TO PUBLIC;


--
-- Name: sgd_apli_aplintegra; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_apli_aplintegra FROM PUBLIC;
REVOKE ALL ON TABLE sgd_apli_aplintegra FROM orfeousr;
GRANT ALL ON TABLE sgd_apli_aplintegra TO orfeousr;
GRANT ALL ON TABLE sgd_apli_aplintegra TO postgres;
GRANT ALL ON TABLE sgd_apli_aplintegra TO PUBLIC;


--
-- Name: sgd_aplmen_aplimens; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_aplmen_aplimens FROM PUBLIC;
REVOKE ALL ON TABLE sgd_aplmen_aplimens FROM orfeousr;
GRANT ALL ON TABLE sgd_aplmen_aplimens TO orfeousr;
GRANT ALL ON TABLE sgd_aplmen_aplimens TO postgres;
GRANT ALL ON TABLE sgd_aplmen_aplimens TO PUBLIC;


--
-- Name: sgd_aplus_plicusua; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_aplus_plicusua FROM PUBLIC;
REVOKE ALL ON TABLE sgd_aplus_plicusua FROM orfeousr;
GRANT ALL ON TABLE sgd_aplus_plicusua TO orfeousr;
GRANT ALL ON TABLE sgd_aplus_plicusua TO postgres;
GRANT ALL ON TABLE sgd_aplus_plicusua TO PUBLIC;


--
-- Name: sgd_archivo_central; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_archivo_central FROM PUBLIC;
REVOKE ALL ON TABLE sgd_archivo_central FROM orfeousr;
GRANT ALL ON TABLE sgd_archivo_central TO orfeousr;
GRANT ALL ON TABLE sgd_archivo_central TO postgres;
GRANT ALL ON TABLE sgd_archivo_central TO PUBLIC;


--
-- Name: sgd_archivo_hist; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_archivo_hist FROM PUBLIC;
REVOKE ALL ON TABLE sgd_archivo_hist FROM orfeousr;
GRANT ALL ON TABLE sgd_archivo_hist TO orfeousr;
GRANT ALL ON TABLE sgd_archivo_hist TO postgres;
GRANT ALL ON TABLE sgd_archivo_hist TO PUBLIC;


--
-- Name: sgd_arg_pliego; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_arg_pliego FROM PUBLIC;
REVOKE ALL ON TABLE sgd_arg_pliego FROM orfeousr;
GRANT ALL ON TABLE sgd_arg_pliego TO orfeousr;
GRANT ALL ON TABLE sgd_arg_pliego TO postgres;
GRANT ALL ON TABLE sgd_arg_pliego TO PUBLIC;


--
-- Name: sgd_argd_argdoc; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_argd_argdoc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_argd_argdoc FROM orfeousr;
GRANT ALL ON TABLE sgd_argd_argdoc TO orfeousr;
GRANT ALL ON TABLE sgd_argd_argdoc TO postgres;
GRANT ALL ON TABLE sgd_argd_argdoc TO PUBLIC;


--
-- Name: sgd_argup_argudoctop; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_argup_argudoctop FROM PUBLIC;
REVOKE ALL ON TABLE sgd_argup_argudoctop FROM orfeousr;
GRANT ALL ON TABLE sgd_argup_argudoctop TO orfeousr;
GRANT ALL ON TABLE sgd_argup_argudoctop TO postgres;
GRANT ALL ON TABLE sgd_argup_argudoctop TO PUBLIC;


--
-- Name: sgd_camexp_campoexpediente; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_camexp_campoexpediente FROM PUBLIC;
REVOKE ALL ON TABLE sgd_camexp_campoexpediente FROM orfeousr;
GRANT ALL ON TABLE sgd_camexp_campoexpediente TO orfeousr;
GRANT ALL ON TABLE sgd_camexp_campoexpediente TO postgres;
GRANT ALL ON TABLE sgd_camexp_campoexpediente TO PUBLIC;


--
-- Name: sgd_carp_descripcion; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_carp_descripcion FROM PUBLIC;
REVOKE ALL ON TABLE sgd_carp_descripcion FROM orfeousr;
GRANT ALL ON TABLE sgd_carp_descripcion TO orfeousr;
GRANT ALL ON TABLE sgd_carp_descripcion TO postgres;
GRANT ALL ON TABLE sgd_carp_descripcion TO PUBLIC;


--
-- Name: sgd_cau_causal; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_cau_causal FROM PUBLIC;
REVOKE ALL ON TABLE sgd_cau_causal FROM orfeousr;
GRANT ALL ON TABLE sgd_cau_causal TO orfeousr;
GRANT ALL ON TABLE sgd_cau_causal TO postgres;
GRANT ALL ON TABLE sgd_cau_causal TO PUBLIC;


--
-- Name: sgd_caux_causales; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_caux_causales FROM PUBLIC;
REVOKE ALL ON TABLE sgd_caux_causales FROM orfeousr;
GRANT ALL ON TABLE sgd_caux_causales TO orfeousr;
GRANT ALL ON TABLE sgd_caux_causales TO postgres;
GRANT ALL ON TABLE sgd_caux_causales TO PUBLIC;


--
-- Name: sgd_clta_clstarif; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_clta_clstarif FROM PUBLIC;
REVOKE ALL ON TABLE sgd_clta_clstarif FROM orfeousr;
GRANT ALL ON TABLE sgd_clta_clstarif TO orfeousr;
GRANT ALL ON TABLE sgd_clta_clstarif TO postgres;
GRANT ALL ON TABLE sgd_clta_clstarif TO PUBLIC;


--
-- Name: sgd_cob_campobliga; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_cob_campobliga FROM PUBLIC;
REVOKE ALL ON TABLE sgd_cob_campobliga FROM orfeousr;
GRANT ALL ON TABLE sgd_cob_campobliga TO orfeousr;
GRANT ALL ON TABLE sgd_cob_campobliga TO postgres;
GRANT ALL ON TABLE sgd_cob_campobliga TO PUBLIC;


--
-- Name: sgd_dcau_causal; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_dcau_causal FROM PUBLIC;
REVOKE ALL ON TABLE sgd_dcau_causal FROM orfeousr;
GRANT ALL ON TABLE sgd_dcau_causal TO orfeousr;
GRANT ALL ON TABLE sgd_dcau_causal TO postgres;
GRANT ALL ON TABLE sgd_dcau_causal TO PUBLIC;


--
-- Name: sgd_ddca_ddsgrgdo; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_ddca_ddsgrgdo FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ddca_ddsgrgdo FROM orfeousr;
GRANT ALL ON TABLE sgd_ddca_ddsgrgdo TO orfeousr;
GRANT ALL ON TABLE sgd_ddca_ddsgrgdo TO postgres;
GRANT ALL ON TABLE sgd_ddca_ddsgrgdo TO PUBLIC;


--
-- Name: sgd_def_contactos; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_def_contactos FROM PUBLIC;
REVOKE ALL ON TABLE sgd_def_contactos FROM orfeousr;
GRANT ALL ON TABLE sgd_def_contactos TO orfeousr;
GRANT ALL ON TABLE sgd_def_contactos TO postgres;
GRANT ALL ON TABLE sgd_def_contactos TO PUBLIC;


--
-- Name: sgd_def_continentes; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_def_continentes FROM PUBLIC;
REVOKE ALL ON TABLE sgd_def_continentes FROM orfeousr;
GRANT ALL ON TABLE sgd_def_continentes TO orfeousr;
GRANT ALL ON TABLE sgd_def_continentes TO postgres;
GRANT ALL ON TABLE sgd_def_continentes TO PUBLIC;


--
-- Name: sgd_def_paises; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_def_paises FROM PUBLIC;
REVOKE ALL ON TABLE sgd_def_paises FROM orfeousr;
GRANT ALL ON TABLE sgd_def_paises TO orfeousr;
GRANT ALL ON TABLE sgd_def_paises TO postgres;
GRANT ALL ON TABLE sgd_def_paises TO PUBLIC;


--
-- Name: sgd_deve_dev_envio; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_deve_dev_envio FROM PUBLIC;
REVOKE ALL ON TABLE sgd_deve_dev_envio FROM orfeousr;
GRANT ALL ON TABLE sgd_deve_dev_envio TO orfeousr;
GRANT ALL ON TABLE sgd_deve_dev_envio TO postgres;
GRANT ALL ON TABLE sgd_deve_dev_envio TO PUBLIC;


--
-- Name: sgd_dir_drecciones; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_dir_drecciones FROM PUBLIC;
REVOKE ALL ON TABLE sgd_dir_drecciones FROM orfeousr;
GRANT ALL ON TABLE sgd_dir_drecciones TO orfeousr;
GRANT ALL ON TABLE sgd_dir_drecciones TO postgres;
GRANT ALL ON TABLE sgd_dir_drecciones TO PUBLIC;


--
-- Name: sgd_dnufe_docnufe; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_dnufe_docnufe FROM PUBLIC;
REVOKE ALL ON TABLE sgd_dnufe_docnufe FROM orfeousr;
GRANT ALL ON TABLE sgd_dnufe_docnufe TO orfeousr;
GRANT ALL ON TABLE sgd_dnufe_docnufe TO postgres;
GRANT ALL ON TABLE sgd_dnufe_docnufe TO PUBLIC;


--
-- Name: sgd_eanu_estanulacion; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_eanu_estanulacion FROM PUBLIC;
REVOKE ALL ON TABLE sgd_eanu_estanulacion FROM orfeousr;
GRANT ALL ON TABLE sgd_eanu_estanulacion TO orfeousr;
GRANT ALL ON TABLE sgd_eanu_estanulacion TO postgres;
GRANT ALL ON TABLE sgd_eanu_estanulacion TO PUBLIC;


--
-- Name: sgd_einv_inventario; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_einv_inventario FROM PUBLIC;
REVOKE ALL ON TABLE sgd_einv_inventario FROM orfeousr;
GRANT ALL ON TABLE sgd_einv_inventario TO orfeousr;
GRANT ALL ON TABLE sgd_einv_inventario TO postgres;
GRANT ALL ON TABLE sgd_einv_inventario TO PUBLIC;


--
-- Name: sgd_eit_items; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_eit_items FROM PUBLIC;
REVOKE ALL ON TABLE sgd_eit_items FROM orfeousr;
GRANT ALL ON TABLE sgd_eit_items TO orfeousr;
GRANT ALL ON TABLE sgd_eit_items TO postgres;
GRANT ALL ON TABLE sgd_eit_items TO PUBLIC;


--
-- Name: sgd_ent_entidades; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_ent_entidades FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ent_entidades FROM orfeousr;
GRANT ALL ON TABLE sgd_ent_entidades TO orfeousr;
GRANT ALL ON TABLE sgd_ent_entidades TO postgres;
GRANT ALL ON TABLE sgd_ent_entidades TO PUBLIC;


--
-- Name: sgd_enve_envioespecial; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_enve_envioespecial FROM PUBLIC;
REVOKE ALL ON TABLE sgd_enve_envioespecial FROM orfeousr;
GRANT ALL ON TABLE sgd_enve_envioespecial TO orfeousr;
GRANT ALL ON TABLE sgd_enve_envioespecial TO postgres;
GRANT ALL ON TABLE sgd_enve_envioespecial TO PUBLIC;


--
-- Name: tipo_doc_identificacion; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE tipo_doc_identificacion FROM PUBLIC;
REVOKE ALL ON TABLE tipo_doc_identificacion FROM orfeousr;
GRANT ALL ON TABLE tipo_doc_identificacion TO orfeousr;
GRANT ALL ON TABLE tipo_doc_identificacion TO postgres;
GRANT ALL ON TABLE tipo_doc_identificacion TO PUBLIC;


--
-- Name: tipo_remitente; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE tipo_remitente FROM PUBLIC;
REVOKE ALL ON TABLE tipo_remitente FROM orfeousr;
GRANT ALL ON TABLE tipo_remitente TO orfeousr;
GRANT ALL ON TABLE tipo_remitente TO postgres;
GRANT ALL ON TABLE tipo_remitente TO PUBLIC;


--
-- Name: sgd_est_estadi; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_est_estadi FROM PUBLIC;
REVOKE ALL ON TABLE sgd_est_estadi FROM orfeousr;
GRANT ALL ON TABLE sgd_est_estadi TO orfeousr;
GRANT ALL ON TABLE sgd_est_estadi TO postgres;
GRANT ALL ON TABLE sgd_est_estadi TO PUBLIC;


--
-- Name: sgd_estc_estconsolid; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_estc_estconsolid FROM PUBLIC;
REVOKE ALL ON TABLE sgd_estc_estconsolid FROM orfeousr;
GRANT ALL ON TABLE sgd_estc_estconsolid TO orfeousr;
GRANT ALL ON TABLE sgd_estc_estconsolid TO postgres;
GRANT ALL ON TABLE sgd_estc_estconsolid TO PUBLIC;


--
-- Name: sgd_estinst_estadoinstancia; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_estinst_estadoinstancia FROM PUBLIC;
REVOKE ALL ON TABLE sgd_estinst_estadoinstancia FROM orfeousr;
GRANT ALL ON TABLE sgd_estinst_estadoinstancia TO orfeousr;
GRANT ALL ON TABLE sgd_estinst_estadoinstancia TO postgres;
GRANT ALL ON TABLE sgd_estinst_estadoinstancia TO PUBLIC;


--
-- Name: sgd_exp_expediente; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_exp_expediente FROM PUBLIC;
REVOKE ALL ON TABLE sgd_exp_expediente FROM orfeousr;
GRANT ALL ON TABLE sgd_exp_expediente TO orfeousr;
GRANT ALL ON TABLE sgd_exp_expediente TO postgres;
GRANT ALL ON TABLE sgd_exp_expediente TO PUBLIC;


--
-- Name: sgd_fars_faristas; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_fars_faristas FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fars_faristas FROM orfeousr;
GRANT ALL ON TABLE sgd_fars_faristas TO orfeousr;
GRANT ALL ON TABLE sgd_fars_faristas TO postgres;
GRANT ALL ON TABLE sgd_fars_faristas TO PUBLIC;


--
-- Name: sgd_fenv_frmenvio; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_fenv_frmenvio FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fenv_frmenvio FROM orfeousr;
GRANT ALL ON TABLE sgd_fenv_frmenvio TO orfeousr;
GRANT ALL ON TABLE sgd_fenv_frmenvio TO postgres;
GRANT ALL ON TABLE sgd_fenv_frmenvio TO PUBLIC;


--
-- Name: sgd_fexp_flujoexpedientes; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_fexp_flujoexpedientes FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fexp_flujoexpedientes FROM orfeousr;
GRANT ALL ON TABLE sgd_fexp_flujoexpedientes TO orfeousr;
GRANT ALL ON TABLE sgd_fexp_flujoexpedientes TO postgres;
GRANT ALL ON TABLE sgd_fexp_flujoexpedientes TO PUBLIC;


--
-- Name: sgd_firrad_firmarads; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_firrad_firmarads FROM PUBLIC;
REVOKE ALL ON TABLE sgd_firrad_firmarads FROM orfeousr;
GRANT ALL ON TABLE sgd_firrad_firmarads TO orfeousr;
GRANT ALL ON TABLE sgd_firrad_firmarads TO postgres;
GRANT ALL ON TABLE sgd_firrad_firmarads TO PUBLIC;


--
-- Name: sgd_fld_flujodoc; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_fld_flujodoc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fld_flujodoc FROM orfeousr;
GRANT ALL ON TABLE sgd_fld_flujodoc TO orfeousr;
GRANT ALL ON TABLE sgd_fld_flujodoc TO postgres;
GRANT ALL ON TABLE sgd_fld_flujodoc TO PUBLIC;


--
-- Name: sgd_fun_funciones; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_fun_funciones FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fun_funciones FROM orfeousr;
GRANT ALL ON TABLE sgd_fun_funciones TO orfeousr;
GRANT ALL ON TABLE sgd_fun_funciones TO postgres;
GRANT ALL ON TABLE sgd_fun_funciones TO PUBLIC;


--
-- Name: sgd_hfld_histflujodoc; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_hfld_histflujodoc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_hfld_histflujodoc FROM orfeousr;
GRANT ALL ON TABLE sgd_hfld_histflujodoc TO orfeousr;
GRANT ALL ON TABLE sgd_hfld_histflujodoc TO postgres;
GRANT ALL ON TABLE sgd_hfld_histflujodoc TO PUBLIC;


--
-- Name: sgd_hmtd_hismatdoc; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_hmtd_hismatdoc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_hmtd_hismatdoc FROM orfeousr;
GRANT ALL ON TABLE sgd_hmtd_hismatdoc TO orfeousr;
GRANT ALL ON TABLE sgd_hmtd_hismatdoc TO postgres;
GRANT ALL ON TABLE sgd_hmtd_hismatdoc TO PUBLIC;


--
-- Name: sgd_instorf_instanciasorfeo; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_instorf_instanciasorfeo FROM PUBLIC;
REVOKE ALL ON TABLE sgd_instorf_instanciasorfeo FROM orfeousr;
GRANT ALL ON TABLE sgd_instorf_instanciasorfeo TO orfeousr;
GRANT ALL ON TABLE sgd_instorf_instanciasorfeo TO postgres;
GRANT ALL ON TABLE sgd_instorf_instanciasorfeo TO PUBLIC;


--
-- Name: sgd_lip_linkip; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_lip_linkip FROM PUBLIC;
REVOKE ALL ON TABLE sgd_lip_linkip FROM orfeousr;
GRANT ALL ON TABLE sgd_lip_linkip TO orfeousr;
GRANT ALL ON TABLE sgd_lip_linkip TO postgres;
GRANT ALL ON TABLE sgd_lip_linkip TO PUBLIC;


--
-- Name: sgd_mat_matriz; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_mat_matriz FROM PUBLIC;
REVOKE ALL ON TABLE sgd_mat_matriz FROM orfeousr;
GRANT ALL ON TABLE sgd_mat_matriz TO orfeousr;
GRANT ALL ON TABLE sgd_mat_matriz TO postgres;
GRANT ALL ON TABLE sgd_mat_matriz TO PUBLIC;


--
-- Name: sgd_mpes_mddpeso; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_mpes_mddpeso FROM PUBLIC;
REVOKE ALL ON TABLE sgd_mpes_mddpeso FROM orfeousr;
GRANT ALL ON TABLE sgd_mpes_mddpeso TO orfeousr;
GRANT ALL ON TABLE sgd_mpes_mddpeso TO postgres;
GRANT ALL ON TABLE sgd_mpes_mddpeso TO PUBLIC;


--
-- Name: sgd_mrd_matrird; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_mrd_matrird FROM PUBLIC;
REVOKE ALL ON TABLE sgd_mrd_matrird FROM orfeousr;
GRANT ALL ON TABLE sgd_mrd_matrird TO orfeousr;
GRANT ALL ON TABLE sgd_mrd_matrird TO postgres;
GRANT ALL ON TABLE sgd_mrd_matrird TO PUBLIC;


--
-- Name: sgd_msdep_msgdep; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_msdep_msgdep FROM PUBLIC;
REVOKE ALL ON TABLE sgd_msdep_msgdep FROM orfeousr;
GRANT ALL ON TABLE sgd_msdep_msgdep TO orfeousr;
GRANT ALL ON TABLE sgd_msdep_msgdep TO postgres;
GRANT ALL ON TABLE sgd_msdep_msgdep TO PUBLIC;


--
-- Name: sgd_msg_mensaje; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_msg_mensaje FROM PUBLIC;
REVOKE ALL ON TABLE sgd_msg_mensaje FROM orfeousr;
GRANT ALL ON TABLE sgd_msg_mensaje TO orfeousr;
GRANT ALL ON TABLE sgd_msg_mensaje TO postgres;
GRANT ALL ON TABLE sgd_msg_mensaje TO PUBLIC;


--
-- Name: sgd_mtd_matriz_doc; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_mtd_matriz_doc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_mtd_matriz_doc FROM orfeousr;
GRANT ALL ON TABLE sgd_mtd_matriz_doc TO orfeousr;
GRANT ALL ON TABLE sgd_mtd_matriz_doc TO postgres;
GRANT ALL ON TABLE sgd_mtd_matriz_doc TO PUBLIC;


--
-- Name: sgd_noh_nohabiles; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_noh_nohabiles FROM PUBLIC;
REVOKE ALL ON TABLE sgd_noh_nohabiles FROM orfeousr;
GRANT ALL ON TABLE sgd_noh_nohabiles TO orfeousr;
GRANT ALL ON TABLE sgd_noh_nohabiles TO postgres;
GRANT ALL ON TABLE sgd_noh_nohabiles TO PUBLIC;


--
-- Name: sgd_not_notificacion; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_not_notificacion FROM PUBLIC;
REVOKE ALL ON TABLE sgd_not_notificacion FROM orfeousr;
GRANT ALL ON TABLE sgd_not_notificacion TO orfeousr;
GRANT ALL ON TABLE sgd_not_notificacion TO postgres;
GRANT ALL ON TABLE sgd_not_notificacion TO PUBLIC;


--
-- Name: sgd_ntrd_notifrad; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_ntrd_notifrad FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ntrd_notifrad FROM orfeousr;
GRANT ALL ON TABLE sgd_ntrd_notifrad TO orfeousr;
GRANT ALL ON TABLE sgd_ntrd_notifrad TO postgres;
GRANT ALL ON TABLE sgd_ntrd_notifrad TO PUBLIC;


--
-- Name: sgd_oem_oempresas; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_oem_oempresas FROM PUBLIC;
REVOKE ALL ON TABLE sgd_oem_oempresas FROM orfeousr;
GRANT ALL ON TABLE sgd_oem_oempresas TO orfeousr;
GRANT ALL ON TABLE sgd_oem_oempresas TO postgres;
GRANT ALL ON TABLE sgd_oem_oempresas TO PUBLIC;


--
-- Name: sgd_panu_peranulados; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_panu_peranulados FROM PUBLIC;
REVOKE ALL ON TABLE sgd_panu_peranulados FROM orfeousr;
GRANT ALL ON TABLE sgd_panu_peranulados TO orfeousr;
GRANT ALL ON TABLE sgd_panu_peranulados TO postgres;
GRANT ALL ON TABLE sgd_panu_peranulados TO PUBLIC;


--
-- Name: sgd_parametro; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_parametro FROM PUBLIC;
REVOKE ALL ON TABLE sgd_parametro FROM orfeousr;
GRANT ALL ON TABLE sgd_parametro TO orfeousr;
GRANT ALL ON TABLE sgd_parametro TO postgres;
GRANT ALL ON TABLE sgd_parametro TO PUBLIC;


--
-- Name: sgd_parexp_paramexpediente; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_parexp_paramexpediente FROM PUBLIC;
REVOKE ALL ON TABLE sgd_parexp_paramexpediente FROM orfeousr;
GRANT ALL ON TABLE sgd_parexp_paramexpediente TO orfeousr;
GRANT ALL ON TABLE sgd_parexp_paramexpediente TO postgres;
GRANT ALL ON TABLE sgd_parexp_paramexpediente TO PUBLIC;


--
-- Name: sgd_pexp_procexpedientes; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_pexp_procexpedientes FROM PUBLIC;
REVOKE ALL ON TABLE sgd_pexp_procexpedientes FROM orfeousr;
GRANT ALL ON TABLE sgd_pexp_procexpedientes TO orfeousr;
GRANT ALL ON TABLE sgd_pexp_procexpedientes TO postgres;
GRANT ALL ON TABLE sgd_pexp_procexpedientes TO PUBLIC;


--
-- Name: sgd_pnufe_procnumfe; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_pnufe_procnumfe FROM PUBLIC;
REVOKE ALL ON TABLE sgd_pnufe_procnumfe FROM orfeousr;
GRANT ALL ON TABLE sgd_pnufe_procnumfe TO orfeousr;
GRANT ALL ON TABLE sgd_pnufe_procnumfe TO postgres;
GRANT ALL ON TABLE sgd_pnufe_procnumfe TO PUBLIC;


--
-- Name: sgd_pnun_procenum; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_pnun_procenum FROM PUBLIC;
REVOKE ALL ON TABLE sgd_pnun_procenum FROM orfeousr;
GRANT ALL ON TABLE sgd_pnun_procenum TO orfeousr;
GRANT ALL ON TABLE sgd_pnun_procenum TO postgres;
GRANT ALL ON TABLE sgd_pnun_procenum TO PUBLIC;


--
-- Name: sgd_prc_proceso; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_prc_proceso FROM PUBLIC;
REVOKE ALL ON TABLE sgd_prc_proceso FROM orfeousr;
GRANT ALL ON TABLE sgd_prc_proceso TO orfeousr;
GRANT ALL ON TABLE sgd_prc_proceso TO postgres;
GRANT ALL ON TABLE sgd_prc_proceso TO PUBLIC;


--
-- Name: sgd_prd_prcdmentos; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_prd_prcdmentos FROM PUBLIC;
REVOKE ALL ON TABLE sgd_prd_prcdmentos FROM orfeousr;
GRANT ALL ON TABLE sgd_prd_prcdmentos TO orfeousr;
GRANT ALL ON TABLE sgd_prd_prcdmentos TO postgres;
GRANT ALL ON TABLE sgd_prd_prcdmentos TO PUBLIC;


--
-- Name: sgd_rda_retdoca; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_rda_retdoca FROM PUBLIC;
REVOKE ALL ON TABLE sgd_rda_retdoca FROM orfeousr;
GRANT ALL ON TABLE sgd_rda_retdoca TO orfeousr;
GRANT ALL ON TABLE sgd_rda_retdoca TO postgres;
GRANT ALL ON TABLE sgd_rda_retdoca TO PUBLIC;


--
-- Name: sgd_rdf_retdocf; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_rdf_retdocf FROM PUBLIC;
REVOKE ALL ON TABLE sgd_rdf_retdocf FROM orfeousr;
GRANT ALL ON TABLE sgd_rdf_retdocf TO orfeousr;
GRANT ALL ON TABLE sgd_rdf_retdocf TO postgres;
GRANT ALL ON TABLE sgd_rdf_retdocf TO PUBLIC;


--
-- Name: sgd_renv_regenvio; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_renv_regenvio FROM PUBLIC;
REVOKE ALL ON TABLE sgd_renv_regenvio FROM orfeousr;
GRANT ALL ON TABLE sgd_renv_regenvio TO orfeousr;
GRANT ALL ON TABLE sgd_renv_regenvio TO postgres;
GRANT ALL ON TABLE sgd_renv_regenvio TO PUBLIC;


--
-- Name: sgd_renv_regenvio1; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_renv_regenvio1 FROM PUBLIC;
REVOKE ALL ON TABLE sgd_renv_regenvio1 FROM orfeousr;
GRANT ALL ON TABLE sgd_renv_regenvio1 TO orfeousr;
GRANT ALL ON TABLE sgd_renv_regenvio1 TO postgres;
GRANT ALL ON TABLE sgd_renv_regenvio1 TO PUBLIC;


--
-- Name: sgd_rfax_reservafax; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_rfax_reservafax FROM PUBLIC;
REVOKE ALL ON TABLE sgd_rfax_reservafax FROM orfeousr;
GRANT ALL ON TABLE sgd_rfax_reservafax TO orfeousr;
GRANT ALL ON TABLE sgd_rfax_reservafax TO postgres;
GRANT ALL ON TABLE sgd_rfax_reservafax TO PUBLIC;


--
-- Name: sgd_rmr_radmasivre; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_rmr_radmasivre FROM PUBLIC;
REVOKE ALL ON TABLE sgd_rmr_radmasivre FROM orfeousr;
GRANT ALL ON TABLE sgd_rmr_radmasivre TO orfeousr;
GRANT ALL ON TABLE sgd_rmr_radmasivre TO postgres;
GRANT ALL ON TABLE sgd_rmr_radmasivre TO PUBLIC;


--
-- Name: sgd_san_sancionados; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_san_sancionados FROM PUBLIC;
REVOKE ALL ON TABLE sgd_san_sancionados FROM orfeousr;
GRANT ALL ON TABLE sgd_san_sancionados TO orfeousr;
GRANT ALL ON TABLE sgd_san_sancionados TO postgres;
GRANT ALL ON TABLE sgd_san_sancionados TO PUBLIC;


--
-- Name: sgd_san_sancionados_x; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_san_sancionados_x FROM PUBLIC;
REVOKE ALL ON TABLE sgd_san_sancionados_x FROM orfeousr;
GRANT ALL ON TABLE sgd_san_sancionados_x TO orfeousr;
GRANT ALL ON TABLE sgd_san_sancionados_x TO postgres;
GRANT ALL ON TABLE sgd_san_sancionados_x TO PUBLIC;


--
-- Name: sgd_sbrd_subserierd; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_sbrd_subserierd FROM PUBLIC;
REVOKE ALL ON TABLE sgd_sbrd_subserierd FROM orfeousr;
GRANT ALL ON TABLE sgd_sbrd_subserierd TO orfeousr;
GRANT ALL ON TABLE sgd_sbrd_subserierd TO postgres;
GRANT ALL ON TABLE sgd_sbrd_subserierd TO PUBLIC;


--
-- Name: sgd_sed_sede; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_sed_sede FROM PUBLIC;
REVOKE ALL ON TABLE sgd_sed_sede FROM orfeousr;
GRANT ALL ON TABLE sgd_sed_sede TO orfeousr;
GRANT ALL ON TABLE sgd_sed_sede TO postgres;
GRANT ALL ON TABLE sgd_sed_sede TO PUBLIC;


--
-- Name: sgd_senuf_secnumfe; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_senuf_secnumfe FROM PUBLIC;
REVOKE ALL ON TABLE sgd_senuf_secnumfe FROM orfeousr;
GRANT ALL ON TABLE sgd_senuf_secnumfe TO orfeousr;
GRANT ALL ON TABLE sgd_senuf_secnumfe TO postgres;
GRANT ALL ON TABLE sgd_senuf_secnumfe TO PUBLIC;


--
-- Name: sgd_sexp_secexpedientes; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_sexp_secexpedientes FROM PUBLIC;
REVOKE ALL ON TABLE sgd_sexp_secexpedientes FROM orfeousr;
GRANT ALL ON TABLE sgd_sexp_secexpedientes TO orfeousr;
GRANT ALL ON TABLE sgd_sexp_secexpedientes TO postgres;
GRANT ALL ON TABLE sgd_sexp_secexpedientes TO PUBLIC;


--
-- Name: sgd_srd_seriesrd; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_srd_seriesrd FROM PUBLIC;
REVOKE ALL ON TABLE sgd_srd_seriesrd FROM orfeousr;
GRANT ALL ON TABLE sgd_srd_seriesrd TO orfeousr;
GRANT ALL ON TABLE sgd_srd_seriesrd TO postgres;
GRANT ALL ON TABLE sgd_srd_seriesrd TO PUBLIC;


--
-- Name: sgd_tar_tarifas; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_tar_tarifas FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tar_tarifas FROM orfeousr;
GRANT ALL ON TABLE sgd_tar_tarifas TO orfeousr;
GRANT ALL ON TABLE sgd_tar_tarifas TO postgres;
GRANT ALL ON TABLE sgd_tar_tarifas TO PUBLIC;


--
-- Name: sgd_tdec_tipodecision; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_tdec_tipodecision FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tdec_tipodecision FROM orfeousr;
GRANT ALL ON TABLE sgd_tdec_tipodecision TO orfeousr;
GRANT ALL ON TABLE sgd_tdec_tipodecision TO postgres;
GRANT ALL ON TABLE sgd_tdec_tipodecision TO PUBLIC;


--
-- Name: sgd_tid_tipdecision; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_tid_tipdecision FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tid_tipdecision FROM orfeousr;
GRANT ALL ON TABLE sgd_tid_tipdecision TO orfeousr;
GRANT ALL ON TABLE sgd_tid_tipdecision TO postgres;
GRANT ALL ON TABLE sgd_tid_tipdecision TO PUBLIC;


--
-- Name: sgd_tidm_tidocmasiva; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_tidm_tidocmasiva FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tidm_tidocmasiva FROM orfeousr;
GRANT ALL ON TABLE sgd_tidm_tidocmasiva TO orfeousr;
GRANT ALL ON TABLE sgd_tidm_tidocmasiva TO postgres;
GRANT ALL ON TABLE sgd_tidm_tidocmasiva TO PUBLIC;


--
-- Name: sgd_tip3_tipotercero; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_tip3_tipotercero FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tip3_tipotercero FROM orfeousr;
GRANT ALL ON TABLE sgd_tip3_tipotercero TO orfeousr;
GRANT ALL ON TABLE sgd_tip3_tipotercero TO postgres;
GRANT ALL ON TABLE sgd_tip3_tipotercero TO PUBLIC;


--
-- Name: sgd_tma_temas; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_tma_temas FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tma_temas FROM orfeousr;
GRANT ALL ON TABLE sgd_tma_temas TO orfeousr;
GRANT ALL ON TABLE sgd_tma_temas TO postgres;
GRANT ALL ON TABLE sgd_tma_temas TO PUBLIC;


--
-- Name: sgd_tme_tipmen; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_tme_tipmen FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tme_tipmen FROM orfeousr;
GRANT ALL ON TABLE sgd_tme_tipmen TO orfeousr;
GRANT ALL ON TABLE sgd_tme_tipmen TO postgres;
GRANT ALL ON TABLE sgd_tme_tipmen TO PUBLIC;


--
-- Name: sgd_tpr_tpdcumento; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_tpr_tpdcumento FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tpr_tpdcumento FROM orfeousr;
GRANT ALL ON TABLE sgd_tpr_tpdcumento TO orfeousr;
GRANT ALL ON TABLE sgd_tpr_tpdcumento TO postgres;
GRANT ALL ON TABLE sgd_tpr_tpdcumento TO PUBLIC;


--
-- Name: sgd_trad_tiporad; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_trad_tiporad FROM PUBLIC;
REVOKE ALL ON TABLE sgd_trad_tiporad FROM orfeousr;
GRANT ALL ON TABLE sgd_trad_tiporad TO orfeousr;
GRANT ALL ON TABLE sgd_trad_tiporad TO postgres;
GRANT ALL ON TABLE sgd_trad_tiporad TO PUBLIC;


--
-- Name: sgd_ttr_transaccion; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_ttr_transaccion FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ttr_transaccion FROM orfeousr;
GRANT ALL ON TABLE sgd_ttr_transaccion TO orfeousr;
GRANT ALL ON TABLE sgd_ttr_transaccion TO postgres;
GRANT ALL ON TABLE sgd_ttr_transaccion TO PUBLIC;


--
-- Name: sgd_ush_usuhistorico; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_ush_usuhistorico FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ush_usuhistorico FROM orfeousr;
GRANT ALL ON TABLE sgd_ush_usuhistorico TO orfeousr;
GRANT ALL ON TABLE sgd_ush_usuhistorico TO postgres;
GRANT ALL ON TABLE sgd_ush_usuhistorico TO PUBLIC;


--
-- Name: sgd_usm_usumodifica; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE sgd_usm_usumodifica FROM PUBLIC;
REVOKE ALL ON TABLE sgd_usm_usumodifica FROM orfeousr;
GRANT ALL ON TABLE sgd_usm_usumodifica TO orfeousr;
GRANT ALL ON TABLE sgd_usm_usumodifica TO postgres;
GRANT ALL ON TABLE sgd_usm_usumodifica TO PUBLIC;


--
-- Name: ubicacion_fisica; Type: ACL; Schema: public; Owner: orfeousr
--

REVOKE ALL ON TABLE ubicacion_fisica FROM PUBLIC;
REVOKE ALL ON TABLE ubicacion_fisica FROM orfeousr;
GRANT ALL ON TABLE ubicacion_fisica TO orfeousr;
GRANT ALL ON TABLE ubicacion_fisica TO postgres;
GRANT ALL ON TABLE ubicacion_fisica TO PUBLIC;


--
-- PostgreSQL database dump complete
--

