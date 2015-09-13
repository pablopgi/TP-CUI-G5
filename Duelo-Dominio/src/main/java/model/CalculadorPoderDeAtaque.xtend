package model

import static model.GeneradorDeEstadistica.*

class CalculadorPoderDeAtaque {
	
	def static poderDeAtaque(Jugador jugador, Personaje personaje) {
		(calcularPoderDeAtaque(jugador, personaje) * Math.random) as int
	}
	
	private def static calcularPoderDeAtaque(Jugador jugador, Personaje personaje) {
		var estadistica = jugador.getEstadisticaDe(personaje)

		if(estadistica.equals(null)){
			estadistica = crearEstadistica(personaje, jugador)
		}

		(estadistica.calificacion.valorCalificacion +
		(estadistica.cantidadDeKills + (estadistica.cantidadDeAssists/2) - estadistica.cantidadDeDeads) *
		estadistica.cantidadDeVecesQueInicioConPersonaje)  
		
	}
	
}