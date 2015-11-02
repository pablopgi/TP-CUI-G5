package model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DueloDeLeyendasMain {
	
	static DueloDeLeyendasMain main
	Jugador mainPlayer
	List<Personaje> personajesDisponibles
	List<Jugador> jugadoresDEL
	
	new() {
		personajesDisponibles = newArrayList
		jugadoresDEL = newArrayList
	}
	
	def void agregarPersonaje(Personaje pj) {
		asignarId(pj, personajesDisponibles)
		personajesDisponibles.add(pj)
	}
	
	def void agregarJugador(Jugador plyr) {
		asignarId(plyr, jugadoresDEL)
		jugadoresDEL.add(plyr)
	}
	
	def asignarId(IdInterface personajeOJugador, List<? extends IdInterface> listaPersonajeOJugador){
		var ids = listaPersonajeOJugador.map[ id ]
		personajeOJugador.id = if(ids.isEmpty) 0 else ids.max + 1
	}
	
	def setMainPlayer(int id) {
		val mainPlayer = jugadoresDEL.findFirst[ it.id == id]
		
		if(mainPlayer == null) throw new NoExisteJugadorConEseId
		
		this.mainPlayer = mainPlayer
		jugadoresDEL.remove(mainPlayer)
	}
	
	def getPersonajePorId(int id) {
		val pj = personajesDisponibles.findFirst[ it.id == id ]
		if (pj == null) throw new NoExistePersonajeConEseId
		pj
	}
	
	static def instance() {
		if(main == null) main = new HardCodeDELMain().giveMeANewHardCodedInstance
		main
	}
	
	def nuevoDuelo(int idUsuario, int idPjSeleccionado, Posicion posicionSeleccionado) {
		val dueloActual = new Duelo(mainPlayer)
		dueloActual.elegirPersonaje(getPersonajePorId(idPjSeleccionado), posicionSeleccionado)
		dueloActual.definirRival(jugadoresDEL, personajesDisponibles)
		dueloActual
	}
	
	def estadisticaDeMainPlayerParaPj(int id) {
		val pj = getPersonajePorId(id)
		var estadistica = mainPlayer.getEstadisticaDe(pj)
		if(estadistica == null) estadistica = new Estadistica(pj)
		estadistica
	}
	
}