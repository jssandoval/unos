create view clasificacionsuma AS	
select idClasificacion, count(*) as conteo, sum(HoraSoporte) as Horas from soporte
group by idClasificacion

SELECT * FROM soporte where idestado = 2

select idPerfil, idPrioridad, count(*) as conteo from soporte
group by idPerfil, IdPrioridad

select MONTH( Fecha ), count(*) from soporte
where year(Fecha) = 2021
group by MONTH( Fecha )

select idPerfil, count(*) as conteo from soporte
group by idPerfil
having count(*) > 10