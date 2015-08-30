package model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Jugador {
	
	var String nombreJugador
	var List<Partida> partidas
	var List<Denuncia> denunciasRecibidas
	
	new (String nombre){
		nombreJugador = nombre
		partidas = newArrayList
		denunciasRecibidas = newArrayList
	}
	
	def void agregarPartida(Partida partida) {
		partidas.add(partida)
	}
	
	def partidasEnLaPosicion(Posicion posicion) {
		partidas.filter[ posicionElegida == posicion ]
	}
	
	def partidasConPersonajeEnLaPosicion(Personaje personaje, Posicion posicion) {
		partidasEnLaPosicion(posicion).filter[ personajeElegido == personaje ]
	}
	
}