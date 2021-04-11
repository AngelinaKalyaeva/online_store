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

INSERT INTO public.courier (id, name, phone_number, status) VALUES (1, 'Иванов Иван Иванович', '+79108726347', 'Free');
INSERT INTO public.courier (id, name, phone_number, status) VALUES (2, 'Петров Петр Петрович', '+78907283729', 'Free');

INSERT INTO public.customer (id, name, phone_number, email) VALUES (1, 'Сергеев Сергей Сергеевич', '+78396663782', 'test@mail.ru');
INSERT INTO public.customer (id, name, phone_number, email) VALUES (2, 'Семенов Семен Семенович', '+79111002030', 'test@gmail.com');

INSERT INTO public.product (id, name, price, currency, description, availability, available_items_number) VALUES (1, 'Xлеб', 40.00, 'RUB', NULL, true, 100);
INSERT INTO public.product (id, name, price, currency, description, availability, available_items_number) VALUES (2, 'Вода', 20.00, 'RUB', 'Бутылка 0.5 литра, негазированная', true, 10);
INSERT INTO public.product (id, name, price, currency, description, availability, available_items_number) VALUES (3, 'Яблоко', 100.00, 'RUB', 'Цена за кг', false, 13.5);

INSERT INTO public.order (id, order_date, receive_date, address, status, courier_id, customer_id, price, currency) VALUES (1, '2020-10-19 09:23:54+00', '2020-10-19 10:23:54+00', 'г. Санкт-Петербург, ул.Торжковская, д.15, кв. 264', 'Done', 1, 2, 60, 'RUB');
INSERT INTO public.order (id, order_date, receive_date, address, status, courier_id, customer_id, price, currency) VALUES (2, '2021-03-10 10:00:00+00', '2021-04-08 11:00:00+00', 'г. Санкт-Петербург, ул.Софийская, д.109, кв. 37', 'Done', 2, 1, 120, 'RUB');

INSERT INTO public.order_detail (order_id, product_id, items_number) VALUES (1, 1, 1);
INSERT INTO public.order_detail (order_id, product_id, items_number) VALUES (1, 2, 1);
INSERT INTO public.order_detail (order_id, product_id, items_number) VALUES (2, 2, 1);
INSERT INTO public.order_detail (order_id, product_id, items_number) VALUES (2, 3, 1);