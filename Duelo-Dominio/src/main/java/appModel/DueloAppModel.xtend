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
import model.Estadistica

@Observable
@Accessors
abstract class DueloAppModel {
	
	def static numeroAString(int aConvertir) {
		Integer.toString(aConvertir)
	}

	def crearEstadisticaEnCasoDeNull(Jugador jugador, Personaje personaje) {
		if ( jugador.getEstadisticaDe(personaje) == null )
			jugador.agregarEstadistica(new Estadistica(personaje))
	}

	def jugadasDeConPersonaje(Jugador jugador, Personaje personaje) {
		crearEstadisticaEnCasoDeNull(jugador, personaje)
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeVecesQueInicioConPersonaje)			
	}

	def ganadasDeConPersonaje(Jugador jugador, Personaje personaje) {
		crearEstadisticaEnCasoDeNull(jugador, personaje)
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeVecesQueGano)
	}

	def killsDeConPersonaje(Jugador jugador, Personaje personaje) {
		crearEstadisticaEnCasoDeNull(jugador, personaje)
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeKills)
	}

	def deadsDeConPersonaje(Jugador jugador, Personaje personaje) {
		crearEstadisticaEnCasoDeNull(jugador, personaje)
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeDeads)
	}

	def assistsDeConPersonaje(Jugador jugador, Personaje personaje) {
		crearEstadisticaEnCasoDeNull(jugador, personaje)
		numeroAString(jugador.getEstadisticaDe(personaje).cantidadDeAssists)
	}

	def mejorUbicacionDeConPersonaje(Jugador jugador, Personaje personaje) {
		if ( jugador.getEstadisticaDe(personaje).mejorUbicacion != null ) {
			jugador.getEstadisticaDe(personaje).mejorUbicacion.toString
		} else {
			""
		}
	}

	def puntajeDeConPersonaje(Jugador jugador, Personaje personaje) {
		if ( jugador.getEstadisticaDe(personaje).calificacion != null ) {
			jugador.getEstadisticaDe(personaje).calificacion.puntaje
		} else {
			""
		}
	}
	
}

@Observable
@Accessors
class LobbyDueloAppModel extends DueloAppModel{
	
	var PersonajePuntaje personajeCalificadoSeleccionado
	var DueloDeLeyendasMain mainDuelo
	var Jugador jugadorRetador
	var String personajeABuscar
	
	new(Jugador retador, DueloDeLeyendasMain main){
		jugadorRetador = retador
		mainDuelo = main
		personajeABuscar = ""
	}
	
	def void setPersonajeCalificadoSeleccionado(PersonajePuntaje p){
		this.personajeCalificadoSeleccionado = p
		firePropertyChanged(this, "personajeSeleccionado")
		avisarCambiosEnPropiedadesDeStat
	}
	
	def getPersonajeSeleccionado(){
		if(personajeCalificadoSeleccionado != null) personajeCalificadoSeleccionado.personaje
	}
	
	def void setPersonajeABuscar(String pj){
		personajeABuscar = pj
		firePropertyChanged(this, "personajesCalificados")
	}

	
	def getPersonajesCalificados(){
		var pjs = mainDuelo.personajesDisponibles.filter[ nombre.toLowerCase.startsWith(personajeABuscar.toLowerCase.trim)].toList
	 	generarVinculosDeTodosLosPersonajes(pjs, jugadorRetador.estadisticas)
	 }
	 
	def Duelo setPosicionYJugar(Posicion pos){
	 	var duelo = new Duelo(jugadorRetador)
	 	duelo.elegirPersonaje(personajeSeleccionado,pos)
	 	duelo.definirRival(mainDuelo.jugadoresDEL, mainDuelo.personajesDisponibles)
	 	duelo.comenzarDuelo
	 	duelo
	 }
	 
	def nombreRetador() {
		jugadorRetador.nombreJugador
	}
	
	def avisarCambiosListado() {
		firePropertyChanged(this, "generarVinculos", personajesCalificados)
	}
	
	def avisarCambiosEnPropiedadesDeStat() {
		firePropertyChanged(this, "jugadas", jugadas)
		firePropertyChanged(this, "ganadas", ganadas)
		firePropertyChanged(this, "kills", kills)
		firePropertyChanged(this, "deads", deads)
		firePropertyChanged(this, "assists", assists)
		firePropertyChanged(this, "ubicacion", ubicacion)
		firePropertyChanged(this, "puntaje", puntaje)
	}
	
	def jugadas() { jugadasDeConPersonaje(jugadorRetador, personajeSeleccionado) }
	def ganadas() { ganadasDeConPersonaje(jugadorRetador, personajeSeleccionado) }
	def kills() { killsDeConPersonaje(jugadorRetador, personajeSeleccionado) }
	def deads() { deadsDeConPersonaje(jugadorRetador, personajeSeleccionado) }
	def assists() { assistsDeConPersonaje(jugadorRetador, personajeSeleccionado) }
	def ubicacion() { mejorUbicacionDeConPersonaje(jugadorRetador, personajeSeleccionado) }
	def puntaje() { puntajeDeConPersonaje(jugadorRetador, personajeSeleccionado) }
}

@Observable
@Accessors
class ResultadoDueloAppModel extends DueloAppModel {
	
	var Duelo duelo
	var boolean noSeEnvioDenuncia
	var LobbyDueloAppModel lobbyAppModel
	
	new(Duelo duelo) {
		this.duelo = duelo
		noSeEnvioDenuncia = true
	}
	
	def setNoSeEnvioDenuncia(boolean seEnvio) {
		noSeEnvioDenuncia = seEnvio
		firePropertyChanged(this, "noSeEnvioDenuncia", noSeEnvioDenuncia)
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
			duelo.retado.nombreJugador
	}
	
}