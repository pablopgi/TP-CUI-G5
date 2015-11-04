package model

import org.eclipse.xtend.lib.annotations.Accessors

class Calificador {
	
	def static void calificarPartidaDeJugador(Partida partida, Jugador jugador){
		var criterios = newArrayList
		
		if(partida.gano){
			criterios.add(new CriterioKillingSpread)
			criterios.add(new CriterioRampage)
			criterios.add(new CriterioDominador)
		}
		else{
			criterios.add(new CriterioShameOnYou)
			criterios.add(new CriterioManco)
			criterios.add(new CriterioNoob)
		}
		
		criterios.forEach[ asignarCalificacionAPartida(partida, jugador) ]
	}
	
}

@Accessors
abstract class CriterioCalificacion {
	
	var Calificacion calificacion
	
	def void asignarCalificacionAPartida(Partida partida, Jugador jugador){
		if(cumpleCondicion(partida, jugador)){
			partida.calificacionObtenida = calificacion
		}
	}

	abstract def boolean cumpleCondicion(Partida partida, Jugador jugador)

}

class CriterioRampage extends CriterioCalificacion {
	
	new (){
		calificacion = new Rampage
	}
	
	override cumpleCondicion(Partida partida, Jugador jugador) {
		partida.gano &&
		partida.usoPosicionIdeal &&
		jugador.partidasConPersonajeEnLaPosicion(partida.personajeElegido, partida.posicionElegida).size >= 5
	}
	
}

class CriterioDominador extends CriterioCalificacion {
	new (){
		calificacion = new Dominador
	}
	
	override cumpleCondicion(Partida partida, Jugador jugador) {
		var cantidadPartidas = jugador.partidasEnLaPosicion(partida.posicionElegida).size
		partida.gano &&
		partida.usoPosicionIdeal &&
		cantidadPartidas >= 2 &&
		cantidadPartidas < 5
	}

}

class CriterioKillingSpread extends CriterioCalificacion {
	new (){
		calificacion = new KillingSpread
	}
	
	override cumpleCondicion(Partida partida, Jugador jugador) {
		partida.gano
	}

}

class CriterioShameOnYou extends CriterioCalificacion {
	new (){
		calificacion = new ShameOnYou
	}
	
	override cumpleCondicion(Partida partida, Jugador jugador) {
		partida.perdio &&
		partida.usoPosicionIdeal &&
		jugador.partidasEnLaPosicion(partida.posicionElegida).size >= 2
	}

}

class CriterioManco extends CriterioCalificacion {
	new (){
		calificacion = new Manco
	}
	
	override cumpleCondicion(Partida partida, Jugador jugador) {
		partida.perdio &&
		partida.usoPosicionIdeal
		jugador.partidasEnLaPosicion(partida.posicionElegida).size <= 2

	}

}

class CriterioNoob extends CriterioCalificacion {
	new (){
		calificacion = new Noob
	}
	
	override cumpleCondicion(Partida partida, Jugador jugador) {
		partida.perdio &&
		!partida.usoPosicionIdeal
	}

}