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

	def resultadoPartida() {
		if (poderDeRetador > poderDeRetado)
			"Ganaste contra "
		else if(poderDeRetado > poderDeRetador) "Perdiste contra " else "Empataste contra "
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

	def esGanador() {

		poderDeRetador > poderDeRetado
	}

	def textoParaBotonCorrepondienteAResultadoDelDuelo() {

		if (poderDeRetador > poderDeRetado)
			"Ganaste Maquinola "
		else if(poderDeRetado > poderDeRetador) "Aceptar Derrorta con Honor " else "Bardeaste lincea "

	}

}
