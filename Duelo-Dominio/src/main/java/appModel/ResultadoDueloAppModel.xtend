package appModel

import model.Duelo
import model.Estadistica
import model.Jugador
import model.Personaje
import static model.GeneradorDeEstadistica.*
import static model.CalculadorPoderDeAtaque.*
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class ResultadoDueloAppModel {
	var Duelo duelo
	var Jugador retador
	var Jugador retado
	var String nombreRetado
	var Estadistica estadistica

	def static numeroAString(int aConvertir) {

		Integer.toString(aConvertir)
	}

	def getNombrePjRetado() {
		duelo.retado.nombreJugador
	}

	def getRetador() {
		duelo.retador
	}

	def getRetado() {
		duelo.retado
	}

	def jugadasDeConPersonaje(Jugador jugador, Personaje personaje) {

		var numero = crearEstadistica(personaje, jugador).cantidadDeVecesQueInicioConPersonaje
		numeroAString(numero)
	}

	def ganadasDeConPersonaje(Jugador jugador, Personaje personaje) {
		var numero = crearEstadistica(personaje, jugador).cantidadDeVecesQueGano
		numeroAString(numero)
	}

	def killsDeConPersonaje(Jugador jugador, Personaje personaje) {
		var numero = crearEstadistica(personaje, jugador).cantidadDeKills
		numeroAString(numero)
	}

	def deadsDeConPersonaje(Jugador jugador, Personaje personaje) {
		var numero = crearEstadistica(personaje, jugador).cantidadDeDeads
		numeroAString(numero)
	}

	def assistsDeConPersonaje(Jugador jugador, Personaje personaje) {
		var numero = crearEstadistica(personaje, jugador).cantidadDeAssists
		numeroAString(numero)
	}

	def mejorUbicacionDeConPersonaje(Jugador jugador, Personaje personaje) {
		crearEstadistica(personaje, jugador).mejorUbicacion.toString
	}

	def puntajeDeConPersonaje(Jugador jugador, Personaje personaje) {
		var numero = crearEstadistica(personaje, jugador).calificacion.valorCalificacion
		numeroAString(numero)
	}

	def poderDeRetador() {

		poderDeAtaque(duelo.retador, duelo.personajeElegidoPorRetador)
	}

	def poderDeRetado() {

		poderDeAtaque(duelo.retado, duelo.personajeElegidoPorRetado)
	}

	def segunResultado(String ganador, String perdedor, String empate) {

		if (poderDeRetador > poderDeRetado)
			ganador
		else if(poderDeRetado > poderDeRetador) perdedor else empate

	}

	def resultadoPartida() {

		segunResultado("Ganaste contra ", "Perdiste contra ", "Empataste contra ")

	}

	def textoParaBotonCorrepondienteAResultadoDelDuelo() {

		segunResultado("Ganaste Maquinola ", "Aceptar Derrorta con Honor ", "Bardeaste lincea ")

	}

	def huboGanador() {
		resultadoPartida != "Empataste contra "
	}

	def ganadorDuelo() {

		if (poderDeRetador > poderDeRetado)
			duelo.retador.nombreJugador
		else
			duelo.retador.nombreJugador
	}

}
