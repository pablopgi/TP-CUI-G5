package appModel

import model.Duelo
import model.Jugador
import model.Personaje
import static model.GeneradorDeEstadistica.*
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class ResultadoDueloAppModel {
	var Duelo duelo

	def static numeroAString(int aConvertir) {

		Integer.toString(aConvertir)
	}

	def getPjRetador() {
		duelo.personajeElegidoPorRetador
	}

	def getPjRetado() {
		duelo.personajeElegidoPorRetado
	}

	def getNombrePjRetador() {
		duelo.personajeElegidoPorRetador.nombre
	}

	def getNombrePjRetado() {
		duelo.personajeElegidoPorRetado.nombre
	}

	def getNombreRetador() {
		duelo.retador.nombreJugador
	}

	def getNombreRetado() {
		duelo.retado.nombreJugador
	}

	def getRetador() {
		duelo.retador
	}

	def getRetado() {
		duelo.retado
	}

	def jugadasDeConPersonaje(Jugador jugador, Personaje personaje) {
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeVecesQueInicioConPersonaje)
	}

	def ganadasDeConPersonaje(Jugador jugador, Personaje personaje) {
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeVecesQueGano)
	}

	def killsDeConPersonaje(Jugador jugador, Personaje personaje) {
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeKills)
	}

	def deadsDeConPersonaje(Jugador jugador, Personaje personaje) {
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeDeads)
	}

	def assistsDeConPersonaje(Jugador jugador, Personaje personaje) {
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeAssists)
	}

	def mejorUbicacionDeConPersonaje(Jugador jugador, Personaje personaje) {
		jugador.getEstadisticaDe(personaje).mejorUbicacion.toString
	}

	def puntajeDeConPersonaje(Jugador jugador, Personaje personaje) {
		var numero = crearEstadistica(personaje, jugador).calificacion.valorCalificacion
		numeroAString(numero)
	}

	def poderDeRetador() {
		duelo.poderDeRetador
	}

	def poderDeRetado() {
		duelo.poderDeRetado
	}

	def huboGanador() {
		poderDeRetador != poderDeRetado
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

	def ganadorDuelo() {

		if (poderDeRetador > poderDeRetado)
			duelo.retador.nombreJugador
		else
			duelo.retador.nombreJugador
	}

}
