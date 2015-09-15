package model

import static model.GeneradorDeEstadistica.*

class CalculadorPoderDeAtaque {
	
	//Calcula el poder de ataque multiplicado por un random entre 0 y 1
	def static calcularPoderDeAtaque(Jugador jugador, Personaje personaje) {
		(poderDeAtaque(jugador, personaje) * Math.random) as int
	}
	
	//Calcula el poder de ataque segun las estadisticas del jugador con el personaje
	private def static poderDeAtaque(Jugador jugador, Personaje personaje) {
		var estadistica = jugador.getEstadisticaDe(personaje)

		if(estadistica.equals(null)){
			estadistica = crearEstadistica(personaje, jugador)
		}

		(estadistica.calificacion.valorCalificacion +
		(estadistica.cantidadDeKills + (estadistica.cantidadDeAssists/2) - estadistica.cantidadDeDeads) *
		estadistica.cantidadDeVecesQueInicioConPersonaje)  
		
	}
	
}