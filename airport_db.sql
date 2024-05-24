PGDMP     +                    |         
   airport_db    15.3    15.3 G    t           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            u           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            v           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            w           1262    46098 
   airport_db    DATABASE     �   CREATE DATABASE airport_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE airport_db;
                postgres    false                        3079    46226    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false            x           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            �            1255    46214 %   get_flight_details(character varying)    FUNCTION       CREATE FUNCTION public.get_flight_details(flight_num character varying) RETURNS TABLE(flight_id integer, departure_time timestamp without time zone, arrival_time timestamp without time zone, origin character varying, destination character varying, gate_number character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT f.flight_id, f.departure_time, f.arrival_time, f.origin, f.destination, g.gate_number
    FROM Flights f
    JOIN Gates g ON f.gate_id = g.gate_id
    WHERE f.flight_number = flight_num;
END;
$$;
 G   DROP FUNCTION public.get_flight_details(flight_num character varying);
       public          postgres    false            �            1259    46127    aircraft    TABLE       CREATE TABLE public.aircraft (
    aircraft_id integer NOT NULL,
    model character varying(50) NOT NULL,
    capacity integer NOT NULL,
    maintenance_status character varying(50) NOT NULL,
    CONSTRAINT aircraft_capacity_check CHECK ((capacity > 0))
);
    DROP TABLE public.aircraft;
       public         heap    postgres    false            �            1259    46126    aircraft_aircraft_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aircraft_aircraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.aircraft_aircraft_id_seq;
       public          postgres    false    216            y           0    0    aircraft_aircraft_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.aircraft_aircraft_id_seq OWNED BY public.aircraft.aircraft_id;
          public          postgres    false    215            �            1259    46201    baggage    TABLE     �  CREATE TABLE public.baggage (
    baggage_id integer NOT NULL,
    passenger_id integer,
    weight numeric(5,2) NOT NULL,
    status character varying(20) NOT NULL,
    CONSTRAINT baggage_status_check CHECK (((status)::text = ANY ((ARRAY['checked-in'::character varying, 'in transit'::character varying, 'delivered'::character varying])::text[]))),
    CONSTRAINT baggage_weight_check CHECK ((weight > (0)::numeric))
);
    DROP TABLE public.baggage;
       public         heap    postgres    false            �            1259    46200    baggage_baggage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.baggage_baggage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.baggage_baggage_id_seq;
       public          postgres    false    228            z           0    0    baggage_baggage_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.baggage_baggage_id_seq OWNED BY public.baggage.baggage_id;
          public          postgres    false    227            �            1259    46184    employee_flight    TABLE     �   CREATE TABLE public.employee_flight (
    employee_flight_id integer NOT NULL,
    employee_id integer,
    flight_id integer
);
 #   DROP TABLE public.employee_flight;
       public         heap    postgres    false            �            1259    46183 &   employee_flight_employee_flight_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_flight_employee_flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.employee_flight_employee_flight_id_seq;
       public          postgres    false    226            {           0    0 &   employee_flight_employee_flight_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.employee_flight_employee_flight_id_seq OWNED BY public.employee_flight.employee_flight_id;
          public          postgres    false    225            �            1259    46177 	   employees    TABLE     �   CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    name character varying(100) NOT NULL,
    role character varying(50) NOT NULL,
    department character varying(50) NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    46176    employees_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.employees_employee_id_seq;
       public          postgres    false    224            |           0    0    employees_employee_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;
          public          postgres    false    223            �            1259    46144    flights    TABLE     k  CREATE TABLE public.flights (
    flight_id integer NOT NULL,
    flight_number character varying(10) NOT NULL,
    departure_time timestamp without time zone NOT NULL,
    arrival_time timestamp without time zone NOT NULL,
    origin character varying(50) NOT NULL,
    destination character varying(50) NOT NULL,
    gate_id integer,
    aircraft_id integer
);
    DROP TABLE public.flights;
       public         heap    postgres    false            }           0    0    TABLE flights    ACL     D   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.flights TO staff;
          public          postgres    false    220            �            1259    46143    flights_flight_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flights_flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.flights_flight_id_seq;
       public          postgres    false    220            ~           0    0    flights_flight_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.flights_flight_id_seq OWNED BY public.flights.flight_id;
          public          postgres    false    219            �            1259    46135    gates    TABLE     �   CREATE TABLE public.gates (
    gate_id integer NOT NULL,
    gate_number character varying(5) NOT NULL,
    location character varying(100) NOT NULL
);
    DROP TABLE public.gates;
       public         heap    postgres    false            �            1259    46134    gates_gate_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gates_gate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.gates_gate_id_seq;
       public          postgres    false    218                       0    0    gates_gate_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.gates_gate_id_seq OWNED BY public.gates.gate_id;
          public          postgres    false    217            �            1259    46163 
   passengers    TABLE       CREATE TABLE public.passengers (
    passenger_id integer NOT NULL,
    name character varying(100) NOT NULL,
    passport_number character varying(20) NOT NULL,
    contact_details character varying(255),
    flight_id integer,
    encrypted_passport_number bytea
);
    DROP TABLE public.passengers;
       public         heap    postgres    false            �            1259    46222    passenger_info    VIEW     x   CREATE VIEW public.passenger_info AS
 SELECT passengers.name,
    passengers.contact_details
   FROM public.passengers;
 !   DROP VIEW public.passenger_info;
       public          postgres    false    222    222            �            1259    46162    passengers_passenger_id_seq    SEQUENCE     �   CREATE SEQUENCE public.passengers_passenger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.passengers_passenger_id_seq;
       public          postgres    false    222            �           0    0    passengers_passenger_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.passengers_passenger_id_seq OWNED BY public.passengers.passenger_id;
          public          postgres    false    221            �           2604    46130    aircraft aircraft_id    DEFAULT     |   ALTER TABLE ONLY public.aircraft ALTER COLUMN aircraft_id SET DEFAULT nextval('public.aircraft_aircraft_id_seq'::regclass);
 C   ALTER TABLE public.aircraft ALTER COLUMN aircraft_id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    46204    baggage baggage_id    DEFAULT     x   ALTER TABLE ONLY public.baggage ALTER COLUMN baggage_id SET DEFAULT nextval('public.baggage_baggage_id_seq'::regclass);
 A   ALTER TABLE public.baggage ALTER COLUMN baggage_id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    46187 "   employee_flight employee_flight_id    DEFAULT     �   ALTER TABLE ONLY public.employee_flight ALTER COLUMN employee_flight_id SET DEFAULT nextval('public.employee_flight_employee_flight_id_seq'::regclass);
 Q   ALTER TABLE public.employee_flight ALTER COLUMN employee_flight_id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    46180    employees employee_id    DEFAULT     ~   ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);
 D   ALTER TABLE public.employees ALTER COLUMN employee_id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    46147    flights flight_id    DEFAULT     v   ALTER TABLE ONLY public.flights ALTER COLUMN flight_id SET DEFAULT nextval('public.flights_flight_id_seq'::regclass);
 @   ALTER TABLE public.flights ALTER COLUMN flight_id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    46138    gates gate_id    DEFAULT     n   ALTER TABLE ONLY public.gates ALTER COLUMN gate_id SET DEFAULT nextval('public.gates_gate_id_seq'::regclass);
 <   ALTER TABLE public.gates ALTER COLUMN gate_id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    46166    passengers passenger_id    DEFAULT     �   ALTER TABLE ONLY public.passengers ALTER COLUMN passenger_id SET DEFAULT nextval('public.passengers_passenger_id_seq'::regclass);
 F   ALTER TABLE public.passengers ALTER COLUMN passenger_id DROP DEFAULT;
       public          postgres    false    222    221    222            e          0    46127    aircraft 
   TABLE DATA           T   COPY public.aircraft (aircraft_id, model, capacity, maintenance_status) FROM stdin;
    public          postgres    false    216   ,W       q          0    46201    baggage 
   TABLE DATA           K   COPY public.baggage (baggage_id, passenger_id, weight, status) FROM stdin;
    public          postgres    false    228   �W       o          0    46184    employee_flight 
   TABLE DATA           U   COPY public.employee_flight (employee_flight_id, employee_id, flight_id) FROM stdin;
    public          postgres    false    226   �W       m          0    46177 	   employees 
   TABLE DATA           H   COPY public.employees (employee_id, name, role, department) FROM stdin;
    public          postgres    false    224   �W       i          0    46144    flights 
   TABLE DATA           �   COPY public.flights (flight_id, flight_number, departure_time, arrival_time, origin, destination, gate_id, aircraft_id) FROM stdin;
    public          postgres    false    220   vX       g          0    46135    gates 
   TABLE DATA           ?   COPY public.gates (gate_id, gate_number, location) FROM stdin;
    public          postgres    false    218   �X       k          0    46163 
   passengers 
   TABLE DATA           �   COPY public.passengers (passenger_id, name, passport_number, contact_details, flight_id, encrypted_passport_number) FROM stdin;
    public          postgres    false    222   Y       �           0    0    aircraft_aircraft_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.aircraft_aircraft_id_seq', 3, true);
          public          postgres    false    215            �           0    0    baggage_baggage_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.baggage_baggage_id_seq', 2, true);
          public          postgres    false    227            �           0    0 &   employee_flight_employee_flight_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.employee_flight_employee_flight_id_seq', 3, true);
          public          postgres    false    225            �           0    0    employees_employee_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.employees_employee_id_seq', 3, true);
          public          postgres    false    223            �           0    0    flights_flight_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.flights_flight_id_seq', 2, true);
          public          postgres    false    219            �           0    0    gates_gate_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.gates_gate_id_seq', 3, true);
          public          postgres    false    217            �           0    0    passengers_passenger_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.passengers_passenger_id_seq', 2, true);
          public          postgres    false    221            �           2606    46133    aircraft aircraft_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (aircraft_id);
 @   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT aircraft_pkey;
       public            postgres    false    216            �           2606    46208    baggage baggage_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.baggage
    ADD CONSTRAINT baggage_pkey PRIMARY KEY (baggage_id);
 >   ALTER TABLE ONLY public.baggage DROP CONSTRAINT baggage_pkey;
       public            postgres    false    228            �           2606    46189 $   employee_flight employee_flight_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.employee_flight
    ADD CONSTRAINT employee_flight_pkey PRIMARY KEY (employee_flight_id);
 N   ALTER TABLE ONLY public.employee_flight DROP CONSTRAINT employee_flight_pkey;
       public            postgres    false    226            �           2606    46182    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    224            �           2606    46151 !   flights flights_flight_number_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_flight_number_key UNIQUE (flight_number);
 K   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_flight_number_key;
       public            postgres    false    220            �           2606    46149    flights flights_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (flight_id);
 >   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_pkey;
       public            postgres    false    220            �           2606    46142    gates gates_gate_number_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.gates
    ADD CONSTRAINT gates_gate_number_key UNIQUE (gate_number);
 E   ALTER TABLE ONLY public.gates DROP CONSTRAINT gates_gate_number_key;
       public            postgres    false    218            �           2606    46140    gates gates_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.gates
    ADD CONSTRAINT gates_pkey PRIMARY KEY (gate_id);
 :   ALTER TABLE ONLY public.gates DROP CONSTRAINT gates_pkey;
       public            postgres    false    218            �           2606    46170 )   passengers passengers_passport_number_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_passport_number_key UNIQUE (passport_number);
 S   ALTER TABLE ONLY public.passengers DROP CONSTRAINT passengers_passport_number_key;
       public            postgres    false    222            �           2606    46168    passengers passengers_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (passenger_id);
 D   ALTER TABLE ONLY public.passengers DROP CONSTRAINT passengers_pkey;
       public            postgres    false    222            �           1259    46218    idx_checked_in_baggage    INDEX     ~   CREATE INDEX idx_checked_in_baggage ON public.baggage USING btree (passenger_id) WHERE ((status)::text = 'checked-in'::text);
 *   DROP INDEX public.idx_checked_in_baggage;
       public            postgres    false    228    228            �           1259    46215    idx_flight_number    INDEX     N   CREATE INDEX idx_flight_number ON public.flights USING btree (flight_number);
 %   DROP INDEX public.idx_flight_number;
       public            postgres    false    220            �           1259    46217    idx_flight_origin_destination    INDEX     `   CREATE INDEX idx_flight_origin_destination ON public.flights USING btree (origin, destination);
 1   DROP INDEX public.idx_flight_origin_destination;
       public            postgres    false    220    220            �           1259    46216    idx_passport_number    INDEX     U   CREATE INDEX idx_passport_number ON public.passengers USING btree (passport_number);
 '   DROP INDEX public.idx_passport_number;
       public            postgres    false    222            �           2606    46209 !   baggage baggage_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.baggage
    ADD CONSTRAINT baggage_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES public.passengers(passenger_id);
 K   ALTER TABLE ONLY public.baggage DROP CONSTRAINT baggage_passenger_id_fkey;
       public          postgres    false    228    3271    222            �           2606    46190 0   employee_flight employee_flight_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_flight
    ADD CONSTRAINT employee_flight_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);
 Z   ALTER TABLE ONLY public.employee_flight DROP CONSTRAINT employee_flight_employee_id_fkey;
       public          postgres    false    3273    226    224            �           2606    46195 .   employee_flight employee_flight_flight_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_flight
    ADD CONSTRAINT employee_flight_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES public.flights(flight_id);
 X   ALTER TABLE ONLY public.employee_flight DROP CONSTRAINT employee_flight_flight_id_fkey;
       public          postgres    false    3264    226    220            �           2606    46157     flights flights_aircraft_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_aircraft_id_fkey FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(aircraft_id);
 J   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_aircraft_id_fkey;
       public          postgres    false    3256    216    220            �           2606    46152    flights flights_gate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_gate_id_fkey FOREIGN KEY (gate_id) REFERENCES public.gates(gate_id);
 F   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_gate_id_fkey;
       public          postgres    false    220    218    3260            �           2606    46171 $   passengers passengers_flight_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES public.flights(flight_id);
 N   ALTER TABLE ONLY public.passengers DROP CONSTRAINT passengers_flight_id_fkey;
       public          postgres    false    3264    222    220            e   R   x�3�t�O��KW076�4�0��/H-J,���K��2�t�,J*-Vp462�44E�5�k51�463��M��+I�K�KN����� �b      q   ,   x�3�4�42�35�L�HM�NM����2�4�4��3B����� 	<@      o      x�3�4�4�2�4�ƜƜF\1z\\\ !��      m   o   x�M�A
�@@�ur��@О@*
�R�[7��8���4��K�.?�:/F����I_%h�J�P�Oб	����s�Xbh��Fm�?6��[hg7�U�Y�18�-v�〈�H*,      i   W   x�3�tt440�4202�50�52R04�2 !1��_j�Bd~Q6�O~^J~�!�!���#P-�zS,fXBŠZ�2�9�ڸb���� ���      g   ,   x�3�t4�I-���K�Q0�2�t2B����9��|c�=... {I�      k     x���MjC1��~��	�~lY�5��d#�$M)���u��f�L�۵������H��s�d/�m>��y����'L�˳3�P��(k��A��4�Uq�+��ex1����� ֆ!k१�Z����^	t��&�Z&j��5F-bl�����$�(�?�߯�3�窋��?��I���'r�����at�Q2�6ƈ�J��FY�i��d����ւF��}��:�a���V]`U�1p��m�(�j|     