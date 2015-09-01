package model

class PersonajeNoElegidoException extends Exception {
	
	new(){
		super("Primero elija un personaja para combatir")
	}
}