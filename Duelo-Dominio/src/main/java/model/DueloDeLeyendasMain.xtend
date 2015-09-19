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
		personajesDisponibles.add(pj)
	}
	
	def void agregarJugador(Jugador plyr) {
		jugadoresDEL.add(plyr)
	}
}