package toSendClasses

import model.Personaje

class PersonajeToSend {
	int id
	String nombre
	
	new (Personaje personaje) {
		this.id = personaje.id
		this.nombre = personaje.nombre
	}
}