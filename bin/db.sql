CREATE TABLE spring_hibernate.app_user
(
    id bigint NOT NULL,
    sso_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    password character varying(100) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    email character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT app_user_pkey PRIMARY KEY (id),
    CONSTRAINT app_user_sso_id_key UNIQUE (sso_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE spring_hibernate.app_user
    OWNER to postgres;
    


CREATE TABLE spring_hibernate.app_user_user_profile
(
    user_id bigint NOT NULL,
    user_profile_id bigint NOT NULL,
    CONSTRAINT app_user_user_profile_pkey PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT fk_app_user FOREIGN KEY (user_id)
        REFERENCES spring_hibernate.app_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_user_profile FOREIGN KEY (user_profile_id)
        REFERENCES spring_hibernate.user_profile (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE spring_hibernate.app_user_user_profile
    OWNER to postgres;
    


CREATE TABLE spring_hibernate.persistent_logins
(
    username character varying(64) COLLATE pg_catalog."default" NOT NULL,
    series character varying(64) COLLATE pg_catalog."default" NOT NULL,
    token character varying(64) COLLATE pg_catalog."default" NOT NULL,
    last_used timestamp without time zone NOT NULL,
    CONSTRAINT persistent_logins_pkey PRIMARY KEY (series)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE spring_hibernate.persistent_logins
    OWNER to postgres;
    
    

CREATE TABLE spring_hibernate.user_profile
(
    id bigint NOT NULL,
    type character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_profile_pkey PRIMARY KEY (id),
    CONSTRAINT user_profile_type_key UNIQUE (type)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE spring_hibernate.user_profile
    OWNER to postgres;            