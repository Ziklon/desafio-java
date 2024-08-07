--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3

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
--
-- Name: desafio_java; Type: DATABASE; Schema: -; Owner: postgres
--

\connect desafio_java

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.debezium_signal (id VARCHAR(100) PRIMARY KEY, type VARCHAR(100) NOT NULL, data VARCHAR(2048) NULL);


CREATE TABLE public.category (
                                 id bigint NOT NULL,
                                 name character varying(255) NOT NULL,
                                 created_at timestamp without time zone,
                                 updated_at timestamp without time zone
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
                                id bigint NOT NULL,
                                title character varying(255) NOT NULL,
                                description character varying(255) NOT NULL,
                                price numeric(38,2) NOT NULL,
                                rating numeric(38,2) DEFAULT 0 NOT NULL,
                                stock integer DEFAULT 0 NOT NULL,
                                created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
                                updated_at timestamp without time zone NOT NULL,
                                category_id bigint NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
                              user_id integer NOT NULL,
                              username character varying(50) NOT NULL,
                              password character varying(50) NOT NULL,
                              email character varying(255) NOT NULL,
                              created_at timestamp without time zone NOT NULL,
                              last_login timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, created_at, updated_at) FROM stdin;
1	Mens Shoes	2024-08-04 23:56:31.06874	2024-08-04 23:56:31.06874
2	Groceries	2024-08-04 23:56:31.069205	2024-08-04 23:56:31.069205
4	Mens Watches	2024-08-04 23:56:31.069455	2024-08-04 23:56:31.069455
7	Fragrances	2024-08-04 23:56:31.069752	2024-08-04 23:56:31.069752
6	Laptops	2024-08-04 23:56:31.069743	2024-08-04 23:56:31.069743
8	Furniture	2024-08-04 23:56:31.069965	2024-08-04 23:56:31.069965
5	Mens Shirts	2024-08-04 23:56:31.069544	2024-08-04 23:56:31.069544
10	Kitchen Accessories	2024-08-04 23:56:31.070384	2024-08-04 23:56:31.070384
9	Home Decoration	2024-08-04 23:56:31.069972	2024-08-04 23:56:31.069972
11	Mobile Accessories	2024-08-04 23:56:31.072399	2024-08-04 23:56:31.072399
12	Motorcycle	2024-08-04 23:56:31.072652	2024-08-04 23:56:31.072652
13	Skin Care	2024-08-04 23:56:31.072726	2024-08-04 23:56:31.072726
14	Smartphones	2024-08-04 23:56:31.072874	2024-08-04 23:56:31.072874
15	Sports Accessories	2024-08-04 23:56:31.072864	2024-08-04 23:56:31.072864
16	Sunglasses	2024-08-04 23:56:31.073101	2024-08-04 23:56:31.073101
17	Tablets	2024-08-04 23:56:31.073204	2024-08-04 23:56:31.073204
18	Tops	2024-08-04 23:56:31.073228	2024-08-04 23:56:31.073228
19	Vehicle	2024-08-04 23:56:31.073343	2024-08-04 23:56:31.073343
20	Womens Bags	2024-08-04 23:56:31.0734	2024-08-04 23:56:31.0734
21	Womens Dresses	2024-08-04 23:56:31.073573	2024-08-04 23:56:31.073573
22	Womens Jewellery	2024-08-04 23:56:31.073996	2024-08-04 23:56:31.073996
23	Womens Shoes	2024-08-04 23:56:31.074287	2024-08-04 23:56:31.074287
24	Womens Watches	2024-08-04 23:56:31.074336	2024-08-04 23:56:31.074336
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, title, description, price, rating, stock, created_at, updated_at, category_id) FROM stdin;
2	Dolce Shine Eau de	Dolce Shine by Dolce & Gabbana is a vibrant and fruity fragrance, featuring notes of mango, jasmine, and blonde woods. It's a joyful and youthful scent.	69.99	2.68	3	2024-08-04 23:58:14.803954	2024-08-04 23:58:14.803954	7
4	Chanel Coco Noir Eau De	Coco Noir by Chanel is an elegant and mysterious fragrance, featuring notes of grapefruit, rose, and sandalwood. Perfect for evening occasions.	129.99	2.76	41	2024-08-04 23:58:14.804177	2024-08-04 23:58:14.804177	7
6	Dior J'adore	J'adore by Dior is a luxurious and floral fragrance, known for its blend of ylang-ylang, rose, and jasmine. It embodies femininity and sophistication.	89.99	3.31	91	2024-08-04 23:58:14.80445	2024-08-04 23:58:14.80445	7
11	Annibale Colombo Bed	The Annibale Colombo Bed is a luxurious and elegant bed frame, crafted with high-quality materials for a comfortable and stylish bedroom.	1899.99	4.14	47	2024-08-04 23:58:14.807722	2024-08-04 23:58:14.807722	8
15	Bedside Table African Cherry	The Bedside Table in African Cherry is a stylish and functional addition to your bedroom, providing convenient storage space and a touch of elegance.	299.99	4.48	16	2024-08-04 23:58:14.808246	2024-08-04 23:58:14.808246	8
18	Cat Food	Nutritious cat food formulated to meet the dietary needs of your feline friend.	8.99	2.88	13	2024-08-04 23:58:14.808573	2024-08-04 23:58:14.808573	2
21	Cucumber	Crisp and hydrating cucumbers, ideal for salads, snacks, or as a refreshing side.	1.49	4.71	22	2024-08-04 23:58:14.809174	2024-08-04 23:58:14.809174	2
25	Ice Cream	Creamy and delicious ice cream, available in various flavors for a delightful treat.	5.49	3.77	76	2024-08-04 23:58:14.810491	2024-08-04 23:58:14.810491	2
27	Green Bell Pepper	Fresh and vibrant green bell pepper, perfect for adding color and flavor to your dishes.	1.29	4.28	89	2024-08-04 23:58:14.8106	2024-08-04 23:58:14.8106	2
30	Kiwi	Nutrient-rich kiwi, perfect for snacking or adding a tropical twist to your dishes.	2.49	4.37	1	2024-08-04 23:58:14.811291	2024-08-04 23:58:14.811291	2
33	Potatoes	Versatile and starchy potatoes, great for roasting, mashing, or as a side dish.	2.29	3.82	8	2024-08-04 23:58:14.811983	2024-08-04 23:58:14.811983	2
36	Protein Powder	Nutrient-packed protein powder, ideal for supplementing your diet with essential proteins.	19.99	3.91	65	2024-08-04 23:58:14.812322	2024-08-04 23:58:14.812322	2
40	Tissue Paper Box	Convenient tissue paper box for everyday use, providing soft and absorbent tissues.	2.49	4.55	97	2024-08-04 23:58:14.812984	2024-08-04 23:58:14.812984	2
48	Generic Motorcycle	The Generic Motorcycle is a versatile and reliable bike suitable for various riding preferences. With a balanced design, it provides a comfortable and efficient riding experience.	3999.99	4.85	63	2024-08-04 23:58:14.818741	2024-08-04 23:58:14.818741	12
52	Sportbike Motorcycle	The Sportbike Motorcycle is designed for speed and agility, with a sleek and aerodynamic profile. It's suitable for riders looking for a dynamic and thrilling riding experience.	7499.99	2.97	12	2024-08-04 23:58:14.818991	2024-08-04 23:58:14.818991	12
56	Oppo A57	The Oppo A57 is a mid-range smartphone known for its sleek design and capable features. It offers a balance of performance and affordability, making it a popular choice.	249.99	3.10	76	2024-08-04 23:58:14.819661	2024-08-04 23:58:14.819661	14
58	Oppo F19 Pro Plus	The Oppo F19 Pro Plus is a feature-rich smartphone with a focus on camera capabilities. It boasts advanced photography features and a powerful performance for a premium user experience.	399.99	2.57	92	2024-08-04 23:58:14.820775	2024-08-04 23:58:14.820775	14
61	Realme XT	The Realme XT is a feature-rich smartphone with a focus on camera technology. It comes equipped with advanced camera sensors, delivering high-quality photos and videos for photography enthusiasts.	349.99	4.14	53	2024-08-04 23:58:14.821246	2024-08-04 23:58:14.821246	14
66	Vivo V9	The Vivo V9 is a smartphone known for its sleek design and emphasis on capturing high-quality selfies. It features a notch display, dual-camera setup, and a modern design.	299.99	3.10	19	2024-08-04 23:58:14.821641	2024-08-04 23:58:14.821641	14
68	Vivo X21	The Vivo X21 is a premium smartphone with a focus on cutting-edge technology. It features an in-display fingerprint sensor, a high-resolution display, and advanced camera capabilities.	499.99	2.75	0	2024-08-04 23:58:14.822029	2024-08-04 23:58:14.822029	14
69	Green and Black Glasses	The Green and Black Glasses feature a bold combination of green and black colors, adding a touch of vibrancy to your eyewear collection. They are both stylish and eye-catching.	34.99	2.84	74	2024-08-04 23:58:14.823842	2024-08-04 23:58:14.823842	16
70	Party Glasses	The Party Glasses are designed to add flair to your party outfit. With unique shapes or colorful frames, they're perfect for adding a playful touch to your look during celebrations.	19.99	3.21	35	2024-08-04 23:58:14.823965	2024-08-04 23:58:14.823965	16
73	Samsung Galaxy Tab White	The Samsung Galaxy Tab in White is a sleek and versatile Android tablet. With a vibrant display, long-lasting battery, and a range of features, it offers a great user experience for various tasks.	349.99	3.70	0	2024-08-04 23:58:14.824324	2024-08-04 23:58:14.824324	17
79	Gray Dress	The Gray Dress is a versatile and chic option for various occasions. With a neutral gray color, it can be dressed up or down, making it a wardrobe staple for any fashion-forward individual.	34.99	3.49	81	2024-08-04 23:58:14.825719	2024-08-04 23:58:14.825719	18
82	Tartan Dress	The Tartan Dress features a classic tartan pattern, bringing a timeless and sophisticated touch to your wardrobe. Perfect for fall and winter, it adds a hint of traditional charm.	39.99	2.82	100	2024-08-04 23:58:14.825882	2024-08-04 23:58:14.825882	18
84	Charger SXT RWD	The Charger SXT RWD is a powerful and sporty rear-wheel-drive sedan, offering a blend of performance and practicality.	32999.99	2.92	85	2024-08-04 23:58:14.826	2024-08-04 23:58:14.826	19
12	Knoll Saarinen Executive Conference Chair	The Knoll Saarinen Executive Conference Chair is a modern and ergonomic chair, perfect for your office or conference room with its timeless design.	499.99	4.11	47	2024-08-04 23:58:14.807924	2024-08-04 23:58:14.807924	8
16	Apple	Fresh and crisp apples, perfect for snacking or incorporating into various recipes.	1.99	2.96	9	2024-08-04 23:58:14.808502	2024-08-04 23:58:14.808502	2
17	Beef Steak	High-quality beef steak, great for grilling or cooking to your preferred level of doneness.	12.99	2.83	96	2024-08-04 23:58:14.808498	2024-08-04 23:58:14.808498	2
22	Dog Food	Specially formulated dog food designed to provide essential nutrients for your canine companion.	10.99	2.74	40	2024-08-04 23:58:14.809946	2024-08-04 23:58:14.809946	2
26	Juice	Refreshing fruit juice, packed with vitamins and great for staying hydrated.	3.99	3.41	99	2024-08-04 23:58:14.810589	2024-08-04 23:58:14.810589	2
29	Honey Jar	Pure and natural honey in a convenient jar, perfect for sweetening beverages or drizzling over food.	6.99	3.50	25	2024-08-04 23:58:14.81076	2024-08-04 23:58:14.81076	2
32	Milk	Fresh and nutritious milk, a staple for various recipes and daily consumption.	3.49	3.14	57	2024-08-04 23:58:14.811417	2024-08-04 23:58:14.811417	2
37	Red Onions	Flavorful and aromatic red onions, perfect for adding depth to your savory dishes.	1.99	4.08	86	2024-08-04 23:58:14.812465	2024-08-04 23:58:14.812465	2
39	Soft Drinks	Assorted soft drinks in various flavors, perfect for refreshing beverages.	1.99	4.59	78	2024-08-04 23:58:14.812851	2024-08-04 23:58:14.812851	2
41	Strawberry	Sweet and succulent strawberries, great for snacking, desserts, or blending into smoothies.	3.99	4.50	9	2024-08-04 23:58:14.813062	2024-08-04 23:58:14.813062	2
43	Apple MacBook Pro 14 Inch Space Grey	The MacBook Pro 14 Inch in Space Grey is a powerful and sleek laptop, featuring Apple's M1 Pro chip for exceptional performance and a stunning Retina display.	1999.99	3.13	39	2024-08-04 23:58:14.816065	2024-08-04 23:58:14.816065	6
44	Huawei Matebook X Pro	The Huawei Matebook X Pro is a slim and stylish laptop with a high-resolution touchscreen display, offering a premium experience for users on the go.	1399.99	4.62	34	2024-08-04 23:58:14.816111	2024-08-04 23:58:14.816111	6
45	Asus Zenbook Pro Dual Screen Laptop	The Asus Zenbook Pro Dual Screen Laptop is a high-performance device with dual screens, providing productivity and versatility for creative professionals.	1799.99	3.14	38	2024-08-04 23:58:14.816165	2024-08-04 23:58:14.816165	6
49	MotoGP CI.H1	The MotoGP CI.H1 is a high-performance motorcycle inspired by MotoGP racing technology. It offers cutting-edge features and precision engineering for an exhilarating riding experience.	14999.99	4.15	85	2024-08-04 23:58:14.818794	2024-08-04 23:58:14.818794	12
54	iPhone 6	The iPhone 6 is a stylish and capable smartphone with a larger display and improved performance. It introduced new features and design elements, making it a popular choice in its time.	299.99	3.76	99	2024-08-04 23:58:14.819355	2024-08-04 23:58:14.819355	14
55	iPhone 13 Pro	The iPhone 13 Pro is a cutting-edge smartphone with a powerful camera system, high-performance chip, and stunning display. It offers advanced features for users who demand top-notch technology.	1099.99	3.42	26	2024-08-04 23:58:14.819478	2024-08-04 23:58:14.819478	14
62	Oppo K1	The Oppo K1 series offers a range of smartphones with various features and specifications. Known for their stylish design and reliable performance, the Oppo K1 series caters to diverse user preferences.	299.99	3.39	61	2024-08-04 23:58:14.821312	2024-08-04 23:58:14.821312	14
65	Samsung Galaxy S7	The Samsung Galaxy S7 is a flagship smartphone known for its sleek design and advanced features. It features a high-resolution display, powerful camera, and robust performance.	299.99	4.90	55	2024-08-04 23:58:14.821597	2024-08-04 23:58:14.821597	14
67	Vivo S1	The Vivo S1 is a stylish and mid-range smartphone offering a blend of design and performance. It features a vibrant display, capable camera system, and reliable functionality.	249.99	2.83	13	2024-08-04 23:58:14.821639	2024-08-04 23:58:14.821639	14
74	Blue Frock	The Blue Frock is a charming and stylish dress for various occasions. With a vibrant blue color and a comfortable design, it adds a touch of elegance to your wardrobe.	29.99	3.57	37	2024-08-04 23:58:14.824413	2024-08-04 23:58:14.824413	18
76	Sunglasses	The Sunglasses offer a classic and simple design with a focus on functionality. These sunglasses provide essential UV protection while maintaining a timeless look.	22.99	2.58	59	2024-08-04 23:58:14.824537	2024-08-04 23:58:14.824537	16
78	Girl Summer Dress	The Girl Summer Dress is a cute and breezy dress designed for warm weather. With playful patterns and lightweight fabric, it's perfect for keeping cool and stylish during the summer.	19.99	2.67	20	2024-08-04 23:58:14.824644	2024-08-04 23:58:14.824644	18
85	Pacifica Touring	The Pacifica Touring is a stylish and well-equipped minivan, offering comfort and convenience for family journeys.	31999.99	2.96	22	2024-08-04 23:58:14.826024	2024-08-04 23:58:14.826024	19
3	Calvin Klein CK One	CK One by Calvin Klein is a classic unisex fragrance, known for its fresh and clean scent. It's a versatile fragrance suitable for everyday wear.	49.99	4.85	17	2024-08-04 23:58:14.804012	2024-08-04 23:58:14.804012	7
20	Cooking Oil	Versatile cooking oil suitable for frying, sautéing, and various culinary applications.	4.99	4.01	22	2024-08-04 23:58:14.809022	2024-08-04 23:58:14.809022	2
31	Lemon	Zesty and tangy lemons, versatile for cooking, baking, or making refreshing beverages.	0.79	4.25	0	2024-08-04 23:58:14.811333	2024-08-04 23:58:14.811333	2
42	Water	Pure and refreshing bottled water, essential for staying hydrated throughout the day.	0.99	2.93	95	2024-08-04 23:58:14.813227	2024-08-04 23:58:14.813227	2
51	Scooter Motorcycle	The Scooter Motorcycle is a practical and fuel-efficient bike ideal for urban commuting. It features a step-through design and user-friendly controls for easy maneuverability.	2999.99	3.33	11	2024-08-04 23:58:14.818881	2024-08-04 23:58:14.818881	12
60	Realme C35	The Realme C35 is a budget-friendly smartphone with a focus on providing essential features for everyday use. It offers a reliable performance and user-friendly experience.	149.99	2.56	81	2024-08-04 23:58:14.821133	2024-08-04 23:58:14.821133	14
75	iPad Mini 2021 Starlight	The iPad Mini 2021 in Starlight is a compact and powerful tablet from Apple. Featuring a stunning Retina display, powerful A-series chip, and a sleek design, it offers a premium tablet experience.	499.99	3.87	32	2024-08-04 23:58:14.824528	2024-08-04 23:58:14.824528	17
83	300 Touring	The 300 Touring is a stylish and comfortable sedan, known for its luxurious features and smooth performance.	28999.99	4.56	53	2024-08-04 23:58:14.825938	2024-08-04 23:58:14.825938	19
7	Gucci Bloom Eau de	Gucci Bloom by Gucci is a floral and captivating fragrance, with notes of tuberose, jasmine, and Rangoon creeper. It's a modern and romantic scent.	79.99	2.69	93	2024-08-04 23:58:14.804529	2024-08-04 23:58:14.804529	7
13	Wooden Bathroom Sink With Mirror	The Wooden Bathroom Sink with Mirror is a unique and stylish addition to your bathroom, featuring a wooden sink countertop and a matching mirror.	799.99	3.26	95	2024-08-04 23:58:14.808083	2024-08-04 23:58:14.808083	8
14	Annibale Colombo Sofa	The Annibale Colombo Sofa is a sophisticated and comfortable seating option, featuring exquisite design and premium upholstery for your living room.	2499.99	3.08	16	2024-08-04 23:58:14.808117	2024-08-04 23:58:14.808117	8
19	Chicken Meat	Fresh and tender chicken meat, suitable for various culinary preparations.	9.99	4.61	69	2024-08-04 23:58:14.808879	2024-08-04 23:58:14.808879	2
23	Eggs	Fresh eggs, a versatile ingredient for baking, cooking, or breakfast.	2.99	4.46	10	2024-08-04 23:58:14.810235	2024-08-04 23:58:14.810235	2
24	Fish Steak	Quality fish steak, suitable for grilling, baking, or pan-searing.	14.99	4.83	99	2024-08-04 23:58:14.810335	2024-08-04 23:58:14.810335	2
28	Green Chili Pepper	Spicy green chili pepper, ideal for adding heat to your favorite recipes.	0.99	4.43	8	2024-08-04 23:58:14.810675	2024-08-04 23:58:14.810675	2
34	Mulberry	Sweet and juicy mulberries, perfect for snacking or adding to desserts and cereals.	4.99	3.19	79	2024-08-04 23:58:14.812152	2024-08-04 23:58:14.812152	2
35	Nescafe Coffee	Quality coffee from Nescafe, available in various blends for a rich and satisfying cup.	7.99	2.54	22	2024-08-04 23:58:14.812235	2024-08-04 23:58:14.812235	2
38	Rice	High-quality rice, a staple for various cuisines and a versatile base for many dishes.	5.99	3.94	49	2024-08-04 23:58:14.812541	2024-08-04 23:58:14.812541	2
46	New DELL XPS 13 9300 Laptop	The New DELL XPS 13 9300 Laptop is a compact and powerful device, featuring a virtually borderless InfinityEdge display and high-end performance for various tasks.	1499.99	2.98	18	2024-08-04 23:58:14.816306	2024-08-04 23:58:14.816306	6
47	Lenovo Yoga 920	The Lenovo Yoga 920 is a 2-in-1 convertible laptop with a flexible hinge, allowing you to use it as a laptop or tablet, offering versatility and portability.	1099.99	2.98	71	2024-08-04 23:58:14.816322	2024-08-04 23:58:14.816322	6
50	Kawasaki Z800	The Kawasaki Z800 is a powerful and agile sportbike known for its striking design and performance. It's equipped with advanced features, making it a favorite among motorcycle enthusiasts.	8999.99	4.06	88	2024-08-04 23:58:14.818881	2024-08-04 23:58:14.818881	12
53	iPhone 5s	The iPhone 5s is a classic smartphone known for its compact design and advanced features during its release. While it's an older model, it still provides a reliable user experience.	199.99	3.92	65	2024-08-04 23:58:14.819359	2024-08-04 23:58:14.819359	14
57	iPhone X	The iPhone X is a flagship smartphone featuring a bezel-less OLED display, facial recognition technology (Face ID), and impressive performance. It represents a milestone in iPhone design and innovation.	899.99	4.96	99	2024-08-04 23:58:14.819648	2024-08-04 23:58:14.819648	14
59	Realme X	The Realme X is a mid-range smartphone known for its sleek design and impressive display. It offers a good balance of performance and camera capabilities for users seeking a quality device.	299.99	4.42	87	2024-08-04 23:58:14.821137	2024-08-04 23:58:14.821137	14
63	Samsung Galaxy S8	The Samsung Galaxy S8 is a premium smartphone with an Infinity Display, offering a stunning visual experience. It boasts advanced camera capabilities and cutting-edge technology.	499.99	3.69	75	2024-08-04 23:58:14.8216	2024-08-04 23:58:14.8216	14
64	Samsung Galaxy S10	The Samsung Galaxy S10 is a flagship device featuring a dynamic AMOLED display, versatile camera system, and powerful performance. It represents innovation and excellence in smartphone technology.	699.99	2.81	40	2024-08-04 23:58:14.821596	2024-08-04 23:58:14.821596	14
71	Black Sun Glasses	The Black Sun Glasses are a classic and stylish choice, featuring a sleek black frame and tinted lenses. They provide both UV protection and a fashionable look.	29.99	3.23	100	2024-08-04 23:58:14.824236	2024-08-04 23:58:14.824236	16
72	Classic Sun Glasses	The Classic Sun Glasses offer a timeless design with a neutral frame and UV-protected lenses. These sunglasses are versatile and suitable for various occasions.	24.99	2.99	100	2024-08-04 23:58:14.824242	2024-08-04 23:58:14.824242	16
77	Samsung Galaxy Tab S8 Plus Grey	The Samsung Galaxy Tab S8 Plus in Grey is a high-performance Android tablet by Samsung. With a large AMOLED display, powerful processor, and S Pen support, it's ideal for productivity and entertainment.	599.99	3.43	76	2024-08-04 23:58:14.824562	2024-08-04 23:58:14.824562	17
80	Dodge Hornet GT Plus	The Dodge Hornet GT Plus is a compact and agile hatchback, perfect for urban driving with a touch of sportiness.	24999.99	3.93	81	2024-08-04 23:58:14.825837	2024-08-04 23:58:14.825837	19
81	Short Frock	The Short Frock is a playful and trendy dress with a shorter length. Ideal for casual outings or special occasions, it combines style and comfort for a fashionable look.	24.99	4.63	19	2024-08-04 23:58:14.825833	2024-08-04 23:58:14.825833	18
86	Durango SXT RWD	The Durango SXT RWD is a spacious and versatile SUV, known for its strong performance and family-friendly features.	36999.99	3.47	0	2024-08-04 23:58:14.826076	2024-08-04 23:58:14.826076	19
94	product1	desc1	20.50	4.90	10	2024-08-06 09:00:17.358868	2024-08-06 09:00:17.358872	1
95	product1	desc1	20.50	4.90	10	2024-08-06 09:00:18.965924	2024-08-06 09:00:18.965927	1
97	product1	desc1	20.50	4.90	10	2024-08-06 09:04:18.696243	2024-08-06 09:04:18.696247	1
98	product1	desc1	20.50	4.90	10	2024-08-06 09:04:19.53571	2024-08-06 09:04:19.535712	1
100	product1	desc1	20.50	4.90	10	2024-08-06 09:04:42.370112	2024-08-06 09:04:42.370115	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, email, created_at, last_login) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 24, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 100, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: product product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: product product_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_fk FOREIGN KEY (category_id) REFERENCES public.category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

