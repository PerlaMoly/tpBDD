/* EJERCICIO 1 */

select P.fecha_hora Fecha_Partido, E.nombre Equipo1, E2.nombre Equipo2, ES.descripcion Estadio
from partido P join
	 equipo E on P.cod_equipo1 = E.cod_equipo join
     equipo E2 on P.cod_equipo2 = E2.cod_equipo join
     estadio ES on P.cod_estadio = ES.cod_estadio
where P.fecha_hora between '2018-06-22 00:00:00' and'2018-06-22 23:59:59';

/* EJERCICIO 2  rrevisar*/

select PE.nombre, PA.fecha_debut, P.descripcion
from equipo E join 
	 jugador J on E.cod_equipo = J.cod_jugador join
     posicion P on J.cod_pos = P.cod_pos join
     participante PA on PA.cod_participante = J.cod_jugador join
     persona PE on PE.cod_persona = PA.cod_participante
where E.cod_equipo = 13;
select * from jugador; 

select * from equipo;

/* EJERCICIO e */

select
p.fecha_hora, es.descripcion estadio, lo.descripcion localidad,
pr.descripcion provincia, f.descripcion ronda	  
from partido p join
equipo eq1 on eq1.cod_equipo=p.cod_equipo1 join
equipo eq2 on eq2.cod_equipo=p.cod_equipo2 join
estadio es on p.cod_estadio = es.cod_estadio join
localidad lo on lo.cod_loc = es.cod_loc join
provincia pr on pr.cod_prov = lo.cod_prov join
fase f on f.cod_fase=p.cod_fase

where p.gol_equipo1 > p.gol_equipo2
and eq1.nombre= 'Brasil'

OR p.gol_equipo2 > p.gol_equipo1
and eq2.nombre = 'Brasil';
	
/* EJERCICIO f */
		
select distinct e.nombre
from equipo e
where (select avg(p.gol_equipo1)>3
		from partido p join
        equipo e1 on p.cod_equipo1=e1.cod_equipo
        where (e1.cod_equipo=e.cod_equipo)
		)
or (select avg(p2.gol_equipo2)>3
		from partido p2 join
        equipo e2 on p2.cod_equipo1=e2.cod_equipo
        where (e2.cod_equipo=e.cod_equipo)
		);



