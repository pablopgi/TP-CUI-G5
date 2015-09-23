package model

class PersonajeNoElegidoException extends Throwable {
	
	new(){
		super("Primero se debe elegir un personaja para combatir")
	}
}

class NoHayRivalesPosiblesException extends Throwable {
	private var Duelo duelo
	
	new(Duelo duelo) {
		super("No hay rivales con el mismo ranking del retador")
		this.duelo = duelo
	}
}

class PersonajeYaElegidoException extends Throwable {
	
	new() {
		super("Ya se ha elegido un personaje")
	}
}

class RivalNoDefinidoException extends Throwable {

	new() {
		super("Aun no se ha definido un rival")
	}
}

class RivalYaDefinidoException extends Throwable {
	
	new() {
		super("Ya se ha definido un rival")
	}
	
}

class DenunciaInvalidaException extends Throwable {
	new() {
		super("La denuncia es inválida")
	}
}