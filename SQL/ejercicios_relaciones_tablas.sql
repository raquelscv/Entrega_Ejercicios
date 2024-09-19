
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.

select 
		t."Name" as nombre_pista,
		a."Title" as titulo_album
from "Track" as t 
inner join "Album" as a 
		on t."AlbumId" = a."AlbumId"; 

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.

select 
		a2."Name" as nombre_artista,
		a."Title" as titulo_album
from "Artist" as a2 
inner join "Album" as a
		on a."ArtistId" = a2."ArtistId"
order by nombre_artista;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 

select 
		concat(c."FirstName", ' ' ,c."LastName") as nombre_cliente,
		sum(i."Total") as total_facturas
from "Customer" as c
inner join "Invoice" as i 
		on c."CustomerId" = i."CustomerId"
group by c."CustomerId" 
order by total_facturas desc 
limit 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.

select 
		concat(e."FirstName", ' ' ,e."LastName") as nombre_empleado,
		concat(c."FirstName", ' ' ,c."LastName") as nombre_cliente
from "Employee" as e 
inner join "Customer" as c 
		on e."EmployeeId" = c."SupportRepId";

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.

select 
		il."InvoiceId" as ID_factura,
		t."Name" as nombre_pista
from "InvoiceLine" as il 
inner join "Track" as t 
		on il."TrackId" = t."TrackId";

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.

select 
		a."Name" as nombre_artista,
		g."Name" as generos_musicales
from "Artist" as a
inner join "Album" as a2 
		on a."ArtistId" = a2."ArtistId" 
inner join "Track" as t 
		on a2."AlbumId" = t."AlbumId" 
inner join "Genre" as g 
		on t."GenreId" = g."GenreId";

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.

select 
		t."Name" as nombre_pista,
		mt."Name" as tipo_medio
from "Track" as t 
inner join "MediaType" as mt 
		on t."MediaTypeId" = mt."MediaTypeId"; 

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**

select 
		t."Name" as nombre_pista,
		g."Name" as genero_musical
from "Track" as t 
left join "Genre" as g 
		on t."GenreId" = g."GenreId"; 

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.

select 
		concat(c."FirstName", ' ' ,c."LastName") as nombre_cliente,
		i."InvoiceId" as factura_realizada
from "Customer" as c 
left join "Invoice" as i 
		on c."CustomerId" = i."CustomerId";

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).

select 
		a."Title" as titulo_album,
		a2."Name" as nombre_artista
from "Album" as a 
left join "Artist" as a2 
		on a."ArtistId" = a2."ArtistId";

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 

select 
		g."Name" as genero_musical,
		count(t."TrackId") as numero_canciones
from "Genre" as g 
inner join "Track" as t 
		on g."GenreId" = t."GenreId" 
group by g."Name"
order by numero_canciones desc;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.

select 
		a."Title" as titulo_album,
		sum(t."Milliseconds") as duracion_total
from "Album" as a 
inner join "Track" as t 
		on a."AlbumId" = t."AlbumId" 
group by a."AlbumId";

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.

select 
		concat(c."FirstName", ' ' ,c."LastName") as nombre_cliente,
		sum(i."Total") as total_gastado
from "Customer" as c 
inner join "Invoice" as i 
		on c."CustomerId" = i."CustomerId" 
group by c."CustomerId";

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.

select 
		concat(e."FirstName", ' ' ,e."LastName") as nombre_empleado,
		concat(c."FirstName", ' ' ,c."LastName") as nombre_cliente
from "Employee" as e 
left join "Customer" as c 
		on e."EmployeeId" = c."SupportRepId"; 

