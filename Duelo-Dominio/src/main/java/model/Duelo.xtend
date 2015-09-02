package model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import static model.CalculadorDeRanking.*

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
	
	def void definirRival(List<Jugador> posiblesRivales) {
		etapaActual.definirRival(posiblesRivales, this)
	}
	
	def void comenzarDuelo() {
		etapaActual.comenzarDuelo(this)
	}
	
}

abstract class EtapaDeDuelo {
	
	abstract def void elegirPersonaje(Personaje pj, Duelo duelo)
	
	abstract def void definirRival(List<Jugador> posiblesRivales, Duelo duelo)
	
	abstract def void comenzarDuelo(Duelo duelo)
	
}

class SeleccionPersonaje extends EtapaDeDuelo {
	
	override elegirPersonaje(Personaje pj, Duelo duelo) {
		
		duelo.personajeElegidoPorRetador = pj
		duelo.etapaActual = new SeleccionRival
		
	}
	
	override definirRival(List<Jugador> posiblesRivales, Duelo duelo) {
		throw new PersonajeNoElegidoException
	}
	
	override comenzarDuelo(Duelo duelo) {
		throw new PersonajeNoElegidoException
	}
	
}

class SeleccionRival extends EtapaDeDuelo {
	
	override elegirPersonaje(Personaje pj, Duelo duelo) {
		throw new PersonajeYaElegidoException
	}
	
	override definirRival(List<Jugador> posiblesRivales, Duelo duelo) {
		var rivalEnMismoRanking = posiblesRivales.findFirst[ sonMismoRanking(duelo.retador, it) ]
		
		if(rivalEnMismoRanking.equals(null)) {
			throw new NoHayRivalesPosiblesException
		}
		
		duelo.retado = rivalEnMismoRanking
	}
	
	override comenzarDuelo(Duelo duelo) {
		throw new RivalNoDefinido
	}
	
}