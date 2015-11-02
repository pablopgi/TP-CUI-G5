package toSendClasses

import java.util.List
import model.Personaje
import model.Posicion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DatosJuegoToSend {
	List<Posicion> posicionesPosibles
	List<Personaje> personajes
	
	new() {}
	
	new (List<Personaje> pjs) {
		posicionesPosibles = #[ Posicion.TOP, Posicion.BOTTOM, Posicion.MIDDLE, Posicion.JUNGLE]
		personajes = pjs
	}
}