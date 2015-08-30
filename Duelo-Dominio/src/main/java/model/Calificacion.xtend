package model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Calificacion {
	
	int valorCalificacion
	
}

class Rampage extends Calificacion {
	
	new(){
		valorCalificacion = 100
	}
}

class Dominador extends Calificacion {
	
	new(){
		valorCalificacion = 75
	}
}

class KillingSpread extends Calificacion {
	
	new(){
		valorCalificacion = 60
	}
}

class ShameOnYou extends Calificacion {
	
	new(){
		valorCalificacion = 30
	}
}

class Manco extends Calificacion {
	
	new(){
		valorCalificacion = 15
	}
}

class Noob extends Calificacion {
	
	new(){
		valorCalificacion = 5
	}
}