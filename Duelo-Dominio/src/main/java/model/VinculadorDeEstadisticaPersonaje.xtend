package model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

class VinculadorDeEstadisticaPersonaje {
	
	def static generarVinculosDeTodosLosPersonajes(List<Personaje> pjPosibles, List<Estadistica> estadisticas) {
		pjPosibles.map[ generarVinculoDePersonaje(it, estadisticas)]
	}
	
	def static generarVinculoDePersonaje(Personaje pj, List<Estadistica> estadisticas) {
		var estadistica = estadisticas.findFirst[ personaje == pj ]
		var String puntaje
		
		if(estadistica == null) puntaje = ""
			else if(estadistica.calificacion == null) puntaje = ""
				else puntaje = estadistica.calificacion.puntaje
		
		new PersonajePuntaje(pj, puntaje)
	}
}

@Observable
@Accessors
class PersonajePuntaje {
	
	var Personaje personaje
	var String puntaje
	
	new(Personaje pj, String puntaje){
		personaje = pj
		this.puntaje = puntaje
	}
}