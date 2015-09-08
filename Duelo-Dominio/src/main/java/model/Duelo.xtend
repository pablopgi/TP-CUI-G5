package model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import static model.CalculadorDeRanking.*
import static model.GeneradorDeEstadistica.*

@Accessors
class Duelo {
	
	var Jugador retador
	var Jugador retado
	var Personaje personajeElegidoPorRetador
	var Personaje personajeElegidoPorRetado
	var Posicion posicionElegidaPorRetador
	var Posicion posicionElegidaPorRetado
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
	
//	def void setearAMR-XComoRival() {
//		retado = new MRX
//	}
	
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
		
		duelo.etapaActual = new DefinirDuelo
	}
	
	override comenzarDuelo(Duelo duelo) {
		throw new RivalNoDefinidoException
	}
	
}

class DefinirDuelo extends EtapaDeDuelo {
	
	override elegirPersonaje(Personaje pj, Duelo duelo) {
		throw new PersonajeYaElegidoException
	}
	
	override definirRival(List<Jugador> posiblesRivales, Duelo duelo) {
		throw new RivalYaDefinidoException
	}
	
	override comenzarDuelo(Duelo duelo) {
		
		var partidaRetador = new Partida(duelo.retador, duelo.personajeElegidoPorRetador,
										 null, duelo.posicionElegidaPorRetador)

		var partidaRetado  = new Partida(duelo.retado, duelo.personajeElegidoPorRetado,
										 null, duelo.posicionElegidaPorRetado)

		var ataqueRetador = poderDeAtaque(duelo.retador, duelo.personajeElegidoPorRetador)
		var ataqueRetado  = poderDeAtaque(duelo.retado, duelo.personajeElegidoPorRetado)

		if(ataqueRetador > ataqueRetado) {
			setearVictoriaDerrotaEnParDePartidas(partidaRetador, partidaRetado)
		}
		else if(ataqueRetador < ataqueRetado) {
			setearVictoriaDerrotaEnParDePartidas(partidaRetado, partidaRetador)
		}
		else {
			setearEmpateEnParDePartidas(partidaRetador, partidaRetado)
		}
		
		duelo.retador.agregarPartida(partidaRetador)
		duelo.retado.agregarPartida(partidaRetado)
		
		duelo.retador.actualizarEstadistica(crearEstadistica(duelo.personajeElegidoPorRetador,duelo.retador))
		duelo.retado.actualizarEstadistica(crearEstadistica(duelo.personajeElegidoPorRetado,duelo.retado))
	}
	
	def poderDeAtaque(Jugador jugador, Personaje personaje) {
		var estadistica = jugador.getEstadisticaDe(personaje)
		(estadistica.calificacion.valorCalificacion +
		(estadistica.cantidadDeKills + (estadistica.cantidadDeAssists/2) - estadistica.cantidadDeDeads) *
		estadistica.cantidadDeVecesQueInicioConPersonaje)  
	}
	
//	El poder de ataque de los personajes dependen de las estadísticas que cada 
//	jugador tenga para ese personaje y se calcula como:
//	Valor de la Clasificación + (kills + assists / 2  - deads) * cantidad de veces usado el personaje para iniciar un duelo.

//	NOTA: Si un jugador nunca había jugado con un personaje tomamos como clasificación la más baja (NOOOB).
//	Tanto el retador como el contrincante del duelo actualizan sus estadísticas una vez finalizado el reto sabiendo el resultado obtenido.
//	(Ver detalle de estadísticas en la sección Estadísticas)
	
	private def void setearVictoriaDerrotaEnParDePartidas(Partida vencedor, Partida perdedor) {
		vencedor.resultadoPartida = ResultadoPartida.Victoria
		perdedor.resultadoPartida  = ResultadoPartida.Derrota
	}
	
	private def void setearEmpateEnParDePartidas(Partida empate1, Partida empate2) {
		empate1.resultadoPartida = ResultadoPartida.Empate
		empate2.resultadoPartida  = ResultadoPartida.Empate
	}
	
}