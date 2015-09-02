package model

class PersonajeNoElegidoException extends Exception {
	
	new(){
		super("Primero se debe elegir un personaja para combatir")
	}
}

class NoHayRivalesPosiblesException extends Exception {
	
	new() {
		super("No hay rivales con el mismo ranking del retador")
	}
}

class PersonajeYaElegidoException extends Exception {
	
	new() {
		super("Ya se ha elegido un personaje")
	}
}