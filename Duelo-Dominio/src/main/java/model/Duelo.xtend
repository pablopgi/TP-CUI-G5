package model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Duelo {
	
	var Jugador retador
	var Jugador retado
	var Personaje personajeElegidoPorRetador
	var Personaje personajeElegidoPorRetado
	var EtapaDeDuelo etapaActual
	
	new (Jugador retador) {
		this.retador = retador
		etapaActual = new SeleccionPersonaje
	}
	
	def void elegirPersonaje(Personaje pj) {
		etapaActual.elegirPersonaje(pj, this)
	}
	
	def void definirRival() {
		etapaActual.definirRival(this)
	}
	
	def void comenzarDuelo() {
		etapaActual.comenzarDuelo(this)
	}
	
}

abstract class EtapaDeDuelo {
	
	abstract def void elegirPersonaje(Personaje pj, Duelo duelo)
	
	abstract def void definirRival(Duelo duelo)
	
	abstract def void comenzarDuelo(Duelo duelo)
	
}

class SeleccionPersonaje extends EtapaDeDuelo {
	
	override elegirPersonaje(Personaje pj, Duelo duelo) {
		
		duelo.personajeElegidoPorRetador = pj
		duelo.etapaActual = new SeleccionRival
		
	}
	
	override definirRival(Duelo duelo) {
		throw new PersonajeNoElegidoException
	}
	
	override comenzarDuelo(Duelo duelo) {
		throw new PersonajeNoElegidoException
	}
	
}

class SeleccionRival extends EtapaDeDuelo {
	
	override elegirPersonaje(Personaje pj, Duelo duelo) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override definirRival(Duelo duelo) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override comenzarDuelo(Duelo duelo) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}