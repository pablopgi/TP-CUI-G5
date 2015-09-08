package model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Estadistica {
	var int cantidadDeVecesQueInicioConPersonaje
	var int cantidadDeVecesQueGano
	var int cantidadDeKills
	var int cantidadDeDeads
	var int cantidadDeAssists
	var List<Posicion> ubicacionesUtilizadas
	var Posicion mejorUbicacion
	var Calificacion calificacion
	var Personaje personaje
	
	new( int cantidadDeVecesQueInicioConPersonaje,
		 int cantidadDeVecesQueGano,
		 int cantidadDeKills,
		 int cantidadDeDeads,
		 int cantidadDeAssists,
		 List<Posicion> ubicacionesUtilizadas,
		 Posicion mejorUbicacion,
		 Calificacion calificacion,
		 Personaje personaje) {
		 	
		this.cantidadDeVecesQueInicioConPersonaje = cantidadDeVecesQueInicioConPersonaje
		this.cantidadDeVecesQueGano = cantidadDeVecesQueGano
		this.cantidadDeKills = cantidadDeKills
		this.cantidadDeDeads = cantidadDeDeads
		this.cantidadDeAssists = cantidadDeAssists
		this.ubicacionesUtilizadas = ubicacionesUtilizadas
		this.mejorUbicacion = mejorUbicacion
		this.calificacion = calificacion
		this.personaje = personaje
		
	}
	
}