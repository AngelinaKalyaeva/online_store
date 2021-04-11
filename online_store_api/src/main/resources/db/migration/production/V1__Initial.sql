CREATE TABLE IF NOT EXISTS public.courier
(
    id SERIAL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    phone_number character varying(30) COLLATE pg_catalog."default" NOT NULL,
    status character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT courier_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.customer
(
    id SERIAL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    phone_number character varying(30) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT customer_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product
(
    id SERIAL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    price numeric NOT NULL,
    currency character varying(3) COLLATE pg_catalog."default" NOT NULL,
    description character varying(300) COLLATE pg_catalog."default",
    availability boolean NOT NULL,
    available_items_number numeric NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.order
(
    id SERIAL,
    order_date timestamp with time zone NOT NULL,
    receive_date timestamp with time zone,
    address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    status character varying(100) COLLATE pg_catalog."default" NOT NULL,
    courier_id integer NOT NULL,
    customer_id integer NOT NULL,
    price numeric NOT NULL,
    currency character varying(3) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT order_pkey PRIMARY KEY (id),
    CONSTRAINT fk_courier_id FOREIGN KEY (courier_id)
        REFERENCES public.courier (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_customer_id FOREIGN KEY (id)
        REFERENCES public.customer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.order_detail
(
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    items_number numeric NOT NULL,
    CONSTRAINT order_detail_pkey PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_id)
        REFERENCES public.order (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_product_id FOREIGN KEY (product_id)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);