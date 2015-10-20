package model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DueloDeLeyendasMain {
	
	List<Personaje> personajesDisponibles
	List<Jugador> jugadoresDEL
	
	new() {
		personajesDisponibles = newArrayList
		jugadoresDEL = newArrayList
	}
	
	def void agregarPersonaje(Personaje pj) {
		asignarId(pj, personajesDisponibles)
		personajesDisponibles.add(pj)
	}
	
	def void agregarJugador(Jugador plyr) {
		asignarId(plyr, jugadoresDEL)
		jugadoresDEL.add(plyr)
	}
	
	def asignarId(IdInterface personajeOJugador, List<? extends IdInterface> listaPersonajeOJugador){
		var ids = listaPersonajeOJugador.map[ id ]
		personajeOJugador.id = if(ids.isEmpty) 0 else ids.max + 1
	}
}