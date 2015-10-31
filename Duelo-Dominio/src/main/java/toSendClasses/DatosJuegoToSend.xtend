package toSendClasses

import java.util.List
import model.Personaje
import model.Posicion

class DatosJuegoToSend {
	List<Posicion> posicionesPosibles
	List<PersonajeToSend> personajes
	
	new (List<Personaje> pjs) {
		posicionesPosibles = #[ Posicion.TOP, Posicion.BOTTOM, Posicion.MIDDLE, Posicion.JUNGLE]
		personajes = pjs.map[ new PersonajeToSend(it) ]
	}
}