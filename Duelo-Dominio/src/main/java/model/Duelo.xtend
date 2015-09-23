package model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import static model.CalculadorDeRanking.*
import static model.CalculadorPoderDeAtaque.*
import static model.Calificador.*
import java.util.Random

@Accessors
class Duelo {
	
	var Jugador retador
	var Jugador retado
	var Personaje personajeElegidoPorRetador
	var Personaje personajeElegidoPorRetado
	var Posicion posicionElegidaPorRetador
	var Posicion posicionElegidaPorRetado
	var int poderDeRetador
	var int poderDeRetado
	var EtapaDeDuelo etapaActual
	
	new (Jugador retador) {
		this.retador = retador
		etapaActual = new SeleccionPersonaje
	}
	
	def void elegirPersonaje(Personaje pj, Posicion pos) {
		etapaActual.elegirPersonajeEnPosicion(pj, pos, this)
	}
	
	def void definirRival(List<Jugador> posiblesRivales, List<Personaje> personajesPosibles) {
		etapaActual.definirRival(posiblesRivales, personajesPosibles, this)
	}
	
	def void comenzarDuelo() {
		etapaActual.comenzarDuelo(this)
	}
	
	def void setearAMRXComoRival(){
		etapaActual.setearAMRXComoRival(this)
	}
	
}

abstract class EtapaDeDuelo {
	
	abstract def void elegirPersonajeEnPosicion(Personaje pj, Posicion pos, Duelo duelo)
	
	abstract def void definirRival(List<Jugador> posiblesRivales, List<Personaje> personajesPosibles, Duelo duelo)
	
	abstract def void comenzarDuelo(Duelo duelo)
	
	abstract def void setearAMRXComoRival(Duelo duelo)
	
}

//El duelo consta de tres etapas, estas son:
// - SeleccionPersonaje en la que el retador selecciona al personaje y a la posicion
//   con las cuales se batira a duelo
// - SeleccionRival en donde se definira al rival retado para el duelo, en esta se
//   busca un rival que este en el mismo ranking que el retador, se seleccionara un
//   personaje para el mismo y una posicion, en el caso de no tener rivales en el
//   mismo ranking en esta etapa se dara la posibilidad de batirse a duelo con MR-X
// - DefinirDuelo en donde se calculara el poderDeAtaque de los jugadores, se crearan
//   las partidas con los respectivos datos de la partida para cada jugador y se
//   actualizarn las estadisticas de cada jugador para el personaje usado

class SeleccionPersonaje extends EtapaDeDuelo {
	
	override elegirPersonajeEnPosicion(Personaje pj, Posicion pos, Duelo duelo) {
		
		duelo.personajeElegidoPorRetador = pj
		duelo.posicionElegidaPorRetador = pos
		duelo.etapaActual = new SeleccionRival
		
	}
	
	override definirRival(List<Jugador> posiblesRivales, List<Personaje> personajesPosibles, Duelo duelo) {
		throw new PersonajeNoElegidoException
	}
	
	override comenzarDuelo(Duelo duelo) {
		throw new PersonajeNoElegidoException
	}
	
	override setearAMRXComoRival(Duelo duelo) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}

class SeleccionRival extends EtapaDeDuelo {
	
	override elegirPersonajeEnPosicion(Personaje pj, Posicion pos, Duelo duelo) {
		throw new PersonajeYaElegidoException
	}
	
	override comenzarDuelo(Duelo duelo) {
		throw new RivalNoDefinidoException
	}
	
	override definirRival(List<Jugador> posiblesRivales, List<Personaje> personajesPosibles, Duelo duelo) {
		setearRival(posiblesRivales, duelo)
		setearPersonajeRival(personajesPosibles, duelo)
		duelo.etapaActual = new DefinirDuelo
	}
	
	//Metodos propios de la clase
	
	def void setearRival(List<Jugador> posiblesRivales, Duelo duelo) {
		val rivalesEnMismoRanking = posiblesRivales.filter[ sonMismoRanking(duelo.retador, it) ]
				
		if(rivalesEnMismoRanking.isEmpty) throw new NoHayRivalesPosiblesException
		else duelo.retado = rivalesEnMismoRanking.get(new Random().nextInt(rivalesEnMismoRanking.size))
	}
	
	def void setearPersonajeRival(List<Personaje> personajesPosibles, Duelo duelo) {
		if(!duelo.retado.partidasQueInicio.isEmpty){
			duelo.personajeElegidoPorRetado = duelo.retado.ultimoPersonajeConElQueInicio
		}
		else {
			var posicionPersonajeRandom = new Random().nextInt(personajesPosibles.size)
			duelo.personajeElegidoPorRetado = personajesPosibles.get(posicionPersonajeRandom)
		}

		duelo.posicionElegidaPorRetado = duelo.personajeElegidoPorRetado.posicionIdeal
	}
	
	override void setearAMRXComoRival(Duelo duelo) {
		duelo.retado = new MRX
		duelo.personajeElegidoPorRetado = duelo.retado.ultimoPersonajeConElQueInicio
		duelo.posicionElegidaPorRetado = duelo.personajeElegidoPorRetado.posicionIdeal
		duelo.etapaActual = new DefinirDuelo
	}
}

class DefinirDuelo extends EtapaDeDuelo {
	
	override elegirPersonajeEnPosicion(Personaje pj, Posicion pos, Duelo duelo) {
		throw new PersonajeYaElegidoException
	}
	
	override definirRival(List<Jugador> posiblesRivales, List<Personaje> personajesPosibles, Duelo duelo) {
		throw new RivalYaDefinidoException
	}
	
	override comenzarDuelo(Duelo duelo) {
		
		var partidaRetador = new Partida(duelo.retador, duelo.personajeElegidoPorRetador,
										 null, duelo.posicionElegidaPorRetador)

		var partidaRetado  = new Partida(duelo.retado, duelo.personajeElegidoPorRetado,
										 null, duelo.posicionElegidaPorRetado)

		setearPoderesDeAtaque(duelo)

		if(duelo.poderDeRetador > duelo.poderDeRetado) {
			setearVictoriaDerrotaEnParDePartidas(partidaRetador, partidaRetado)
		}
		else if(duelo.poderDeRetador < duelo.poderDeRetado) {
			setearVictoriaDerrotaEnParDePartidas(partidaRetado, partidaRetador)
		}
		else {
			setearEmpateEnParDePartidas(partidaRetador, partidaRetado)
		}
		
		calificarPartidaDeJugador(partidaRetador, duelo.retador)
		calificarPartidaDeJugador(partidaRetado, duelo.retado)
		
		duelo.retador.agregarPartidaYActualizarEstadistica(partidaRetador)
		duelo.retado.agregarPartidaYActualizarEstadistica(partidaRetado)
	}
	
	//Metodos propios de la clase
	
	private def setearPoderesDeAtaque(Duelo duelo) {
		duelo.poderDeRetador = calcularPoderDeAtaque(duelo.retador, duelo.personajeElegidoPorRetador)
		duelo.poderDeRetado  = calcularPoderDeAtaque(duelo.retado, duelo.personajeElegidoPorRetado)
	}
	
	private def void setearVictoriaDerrotaEnParDePartidas(Partida vencedor, Partida perdedor) {
		vencedor.resultadoPartida = ResultadoPartida.Victoria
		perdedor.resultadoPartida  = ResultadoPartida.Derrota
	}
	
	private def void setearEmpateEnParDePartidas(Partida empate1, Partida empate2) {
		empate1.resultadoPartida = ResultadoPartida.Empate
		empate2.resultadoPartida  = ResultadoPartida.Empate
	}
	
	override setearAMRXComoRival(Duelo duelo) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}