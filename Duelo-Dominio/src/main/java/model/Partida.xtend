package model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Partida {
	
	var Jugador iniciador
	var Personaje personajeElegido
	var ResultadoPartida resultadoPartida
	var Posicion posicionElegida
	var Calificacion calificacionObtenida
	
	new (Jugador iniciador, Personaje persElegido, ResultadoPartida resultado, Posicion pos){
		this.iniciador = iniciador
		personajeElegido = persElegido
		resultadoPartida = resultado
		posicionElegida = pos
	}
	
	def usoPosicionIdeal() {
		personajeElegido.esPosicionIdeal(posicionElegida)
	}
	
	def gano() {
		resultadoPartida == ResultadoPartida.Victoria
	}
	
	def empato() {
		resultadoPartida == ResultadoPartida.Empate
	}
	
	def perdio() {
		resultadoPartida == ResultadoPartida.Derrota
	}
	
	def valorCalificacionObtenida() {
		calificacionObtenida.valorCalificacion
	}
}

enum ResultadoPartida {
	
	Victoria, Derrota, Empate
	
}