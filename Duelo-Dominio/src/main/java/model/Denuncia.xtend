package model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
abstract class Denuncia {

	Jugador denunciante
	Jugador denunciado
	String justificacion
	Motivo motivo

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		this.denunciante = denunciante
		this.denunciado = denunciado
		this.justificacion = justificacion

	}

	new(){}

	def abstract String getMotivo()
	
	def Integer getPenalizacion(){
		motivo.penalizacion
	}

}

@Accessors
class AbusoDeHabilidad extends Denuncia {

	new(){penalizacion = 5}

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		super(denunciante, denunciado, justificacion)
		this.penalizacion = 5

	}
	
	override getMotivo() {
		"Abuso de Habilidad"
	}

}

@Accessors
class ComunicacionAbusiva extends Denuncia {

	new(){penalizacion = 7}

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		super(denunciante, denunciado, justificacion)
		this.penalizacion = 7

	}
	
	override getMotivo() {
		"Comunicacion abusiva"
	}

}

@Accessors
class FeedIntencional extends Denuncia {

	new(){penalizacion = 10}

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		super(denunciante, denunciado, justificacion)
		this.penalizacion = 10

	}
	
	override getMotivo() {
		"Feed intencional"
	}

}

@Accessors
class AbusoDelSistemaDeDenuncias extends Denuncia {

	new(){penalizacion = 25}

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		super(denunciante, denunciado, justificacion)
		this.penalizacion = 25

	}
	
	override getMotivo() {
		//No hace falta, no se selecciona como motivo
	}

}
