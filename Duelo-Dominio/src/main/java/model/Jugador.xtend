package model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import static model.GeneradorDeEstadistica.*

@Accessors
class Jugador {
	
	var String nombreJugador
	var List<Partida> partidas
	var List<Denuncia> denunciasRecibidas
	var List<Estadistica> estadisticas
	
	new (String nombre){
		nombreJugador = nombre
		partidas = newArrayList
		denunciasRecibidas = newArrayList
		estadisticas = newArrayList
	}
	
	def void agregarDenuncia(Denuncia denuncia) {
		denunciasRecibidas.add(denuncia)
	}
	
	def void agregarPartida(Partida partida) {
		partidas.add(partida)
	}
	
	def partidasEnLaPosicion(Posicion posicion) {
		partidas.filter[ posicionElegida == posicion ]
	}
	
	def partidasConPersonajeEnLaPosicion(Personaje personaje, Posicion posicion) {
		partidasEnLaPosicion(posicion).filter[ personajeElegido == personaje ]
	}
	
	def partidasConPersonaje(Personaje personaje) {
		partidas.filter[ personajeElegido == personaje ]
	}
	
	def partidasQueInicio() {
		partidas.filter[ esIniciador(this) ]
	}
	
	def ultimoPersonajeConElQueInicio() {
		partidasQueInicio.last.personajeElegido
	}
	
	def getEstadisticaDe(Personaje personaje){
		estadisticas.findFirst[est | est.personaje == personaje]
		
	}

	def removeEstadisticaDePersonaje(Personaje personaje){
		var estPj= getEstadisticaDe(personaje)
		estadisticas.remove(estPj)
	}
	
	def void agregarEstadistica(Estadistica estadistica){
		estadisticas.add(estadistica)
	}
	
	def void agregarPartidaYActualizarEstadistica(Partida partida) {
		agregarPartida(partida)
		removeEstadisticaDePersonaje(partida.personajeElegido)
		agregarEstadistica(crearEstadistica(partida.personajeElegido, this))
	}
	
}

class MRX extends Jugador {
	new(){
		super("El legendario MR-X")
	}
	
	override ultimoPersonajeConElQueInicio() {
		new SubZero
	}
	
}