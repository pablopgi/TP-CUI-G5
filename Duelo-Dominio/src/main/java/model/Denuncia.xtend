package model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
abstract class Denuncia {

	Jugador denunciante
	Jugador denunciado
	String justificacion
	Integer penalizacion

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		this.denunciante = denunciante
		this.denunciado = denunciado
		this.justificacion = justificacion

	}

	new(){}

	protected def abusoDeDenuncia(Denuncia denuncia) {
		this.denunciado.denunciasRecibidas.add(this)
		return new AbusoDelSistemaDeDenuncias(denuncia.denunciante, denuncia.denunciante,
			'''El jugador intenta denunciar a: «denuncia.denunciado» por: «denuncia.class» sin tener una justificacion suficiente: «this.
				justificacion»''')
	}
	
	def abstract String getMotivo()

}

@Accessors
class AbusoDeHabilidad extends Denuncia {

	new(){}

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

	new(){}

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

	new(){}

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

	new(){}

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		super(denunciante, denunciado, justificacion)
		this.penalizacion = 25

	}
	
	override getMotivo() {
		//No hace falta, no se selecciona como motivo
	}

}
