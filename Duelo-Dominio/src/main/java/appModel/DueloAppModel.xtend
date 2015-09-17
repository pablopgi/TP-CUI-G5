package appModel

import model.Duelo
import model.Jugador
import model.Personaje
import static model.VinculadorDeEstadisticaPersonaje.*
import model.DueloDeLeyendasMain
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import model.PersonajePuntaje
import static org.uqbar.commons.model.ObservableUtils.*
import model.Posicion

@Observable
@Accessors
abstract class DueloAppModel {
	
	def static numeroAString(int aConvertir) {
		Integer.toString(aConvertir)
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
		jugador.getEstadisticaDe(personaje).calificacion.puntaje
	}
	
}

@Observable
@Accessors
class LobbyDueloAppModel extends DueloAppModel{
	
	var PersonajePuntaje pjPuntaje
	var Personaje personajeSeleccionado
	var DueloDeLeyendasMain mainDuelo
	var Jugador jugadorRetador
	var Duelo duelo
	
	new(Jugador retador){
		jugadorRetador = retador
	}

	def void setPjPuntaje(PersonajePuntaje pjPuntaje) {
		this.pjPuntaje = pjPuntaje
		personajeSeleccionado = pjPuntaje.personaje
		firePropertyChanged(this, "personajeSeleccionado", personajeSeleccionado)
	}	
	
	 def generearVinculos(){
	 	generarVinculosDeTodosLosPersonajes(mainDuelo.personajesDisponibles, jugadorRetador.estadisticas)
	 }
	 
	 def setPosicionYJugar(Posicion pos){
	 	duelo = new Duelo(jugadorRetador)
	 	duelo.elegirPersonaje(personajeSeleccionado,pos)
	 	duelo.definirRival(mainDuelo.jugadoresDEL, mainDuelo.personajesDisponibles)
	 	duelo.comenzarDuelo
	 }
	
	def nombreRetador() {
		jugadorRetador.nombreJugador
	}
}

@Observable
@Accessors
class ResultadoDueloAppModel extends DueloAppModel {
	
	var Duelo duelo
	
	new(Duelo duelo) {
		this.duelo = duelo
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

		segunResultado("Ganaste Maquinola ", "Aceptar Derrota con Honor ", "Empataste lince ")

	}

	def ganadorDuelo() {

		if (poderDeRetador > poderDeRetado)
			duelo.retador.nombreJugador
		else
			duelo.retador.nombreJugador
	}

}