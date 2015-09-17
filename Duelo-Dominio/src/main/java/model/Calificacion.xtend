package model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Calificacion {
	
	int valorCalificacion
	
	abstract def String puntaje()
	
}

class Rampage extends Calificacion {
	
	new(){
		valorCalificacion = 100
	}
	
	override puntaje() {
		"S"
	}
	
}

class Dominador extends Calificacion {
	
	new(){
		valorCalificacion = 75
	}
	
	override puntaje() {
		"A"
	}
	
}

class KillingSpread extends Calificacion {
	
	new(){
		valorCalificacion = 60
	}
	
	override puntaje() {
		"B"
	}
	
}

class ShameOnYou extends Calificacion {
	
	new(){
		valorCalificacion = 30
	}
	
	override puntaje() {
		"C"
	}
	
}

class Manco extends Calificacion {
	
	new(){
		valorCalificacion = 15
	}
	
	override puntaje() {
		"D"
	}
	
}

class Noob extends Calificacion {
	
	new(){
		valorCalificacion = 5
	}
	
	override puntaje() {
		"E"
	}
	
}