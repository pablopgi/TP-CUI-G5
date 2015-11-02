package toSendClasses

import java.util.List
import model.Personaje
import model.Posicion

class DatosJuegoToSend {
	List<Posicion> posicionesPosibles
	List<Personaje> personajes
	
	new (List<Personaje> pjs) {
		posicionesPosibles = #[ Posicion.TOP, Posicion.BOTTOM, Posicion.MIDDLE, Posicion.JUNGLE]
		personajes = pjs
	}
}