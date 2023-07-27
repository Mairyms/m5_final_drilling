-- 4. Construye las siguientes consultas:
-- 4.A Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.
-- 4.A.1 Customer
-- 4.A.1.A Insertar 
-- Necesitamos una dirección, para poder agregar un nuevo Customer.
INSERT INTO public.address(
	address, address2, district, city_id, postal_code, phone)
	VALUES ('1326 Fukuyama Street', '', 'Heilongjiang', 537, '27107', '288241219999');
	
INSERT INTO public.customer(
	store_id, first_name, last_name, email, activebool, active, address_id)
	VALUES (2, 'Pedro', 'Perez', 'pedroperez@emailfalso.com', true, 1, 606);

-- 4.A.1.B Modificar
UPDATE public.customer
	SET email='pedroperez@nuevoemailfalso.com'
	WHERE customer_id = 600;
	
-- 4.A.1.C Eliminar
DELETE FROM public.customer
	WHERE customer_id = 600;
	
-- También borramos la dirección
DELETE FROM public.address
	WHERE address_id = 606;

-- 4.A.2 Staff
-- 4.A.2.A Insertar
-- Necesitamos una dirección, para poder agregar un nuevo Staff.
INSERT INTO public.address(
	address, address2, district, city_id, postal_code, phone)
	VALUES ('1326 Fukuyama Street', '', 'Heilongjiang', 537, '27107', '288241219999');
	
INSERT INTO public.staff(
	first_name, last_name, address_id, email, store_id, active, username, password)
	VALUES ('Antonio', 'Lopez', 607, 'antoniolopez@emailfalso.com', 2, true, 'antonio', '8cb2237d0679ca88db6464eac60da96345513964');

-- 4.A.2.B Modificar
UPDATE public.staff
	SET email='antoniolopez@nuevoemailfalso.com'
	WHERE staff_id = 3;

-- 4.A.1.C Eliminar
DELETE FROM public.staff
	WHERE staff_id = 3;
	
-- También borramos la dirección
DELETE FROM public.address
	WHERE address_id = 607;
	
-- 4.A.3 Actor
-- 4.A.3.A Insertar
INSERT INTO public.actor(
    first_name, last_name)
	VALUES ('Henry', 'Cavill');
	
-- 4.A.3.B Modificar
UPDATE public.actor
	SET first_name='Clark', last_name='Kent'
	WHERE actor_id = 201;
	
-- 4.A.3.C Eliminar
DELETE FROM public.actor
	WHERE actor_id = 201;
	
-- 4.B Listar todas las “rental” con los datos del “customer” dado un año y mes.
SELECT * 
FROM public.rental
INNER JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2005
  AND EXTRACT(MONTH FROM rental.rental_date) = 08
ORDER BY rental_id ASC;

-- 4.C Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.
SELECT payment_id as numero, payment_date as fecha, amount as total
FROM public.payment
ORDER BY numero;

-- 4.D Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.
SELECT * 
FROM public.film
WHERE release_year = 2006
  AND rental_rate > 4.0
ORDER BY film_id;

-- 5. Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente.
SELECT TABLE_CATALOG BASE_DE_DATOS, TABLE_NAME TABLA, COLUMN_NAME COLUMNA, IS_NULLABLE ACEPTA_NULOS, DATA_TYPE TIPO_DATO 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'public'
ORDER BY TABLE_NAME, ORDINAL_POSITION ASC;