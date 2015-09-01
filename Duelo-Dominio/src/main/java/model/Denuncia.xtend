package model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Denuncia {

	Jugador denunciante
	Jugador denunciado
	String justificacion
	ValidadorDeDenuncias valDenucias
	Integer penalizacion

	def void sumarPenalizacion(Denuncia denuncia) {
		denunciado.pesoDeDenuncias = denunciado.pedoDeDenuncias + denuncia.getPenalizacion
	}

	protected def AbusoDelSistemaDeDenuncias abusoDeDenuncia(Denuncia denuncia) {
		return new AbusoDelSistemaDeDenuncias(denuncia.denunciante, denuncia.denunciante,
			'''El jugador intenta denunciar a: «denuncia.denunciado» por: «denuncia.class» sin tener una justificacion suficiente: «this.
				justificacion»''', 25)
	}

	abstract def void ejecutarDenuncia()
}

class AbusoDeHabilidad extends Denuncia {

	new(Jugador denuciante, Jugador denunciado, String justificacion, Integer penalizacion) {

		this.denunciante = denunciante
		this.denunciado = denunciado
		this.justificacion = justificacion
		this.penalizacion = 5

	}

	override void ejecutarDenuncia() {
		if (valDenucias.validar(this)) {
			this.denunciado.denunciasRecibidas.add(this)
			this.sumarPenalizacion(this)
		} else {

			this.abusoDeDenuncia(this)

		}

	}

}

class AbusoDelSistemaDeDenuncias extends Denuncia {

	new(Jugador denuciante, Jugador denunciado, String justificacion, Integer penalizacion) {

		this.denunciante = denunciante
		this.denunciado = denunciado
		this.justificacion = justificacion
		this.penalizacion = 25

	}

	override void ejecutarDenuncia() {
		this.denunciado.denunciasRecibidas.add(this)
		this.abusoDeDenuncia(this)

	}

}

class ComunicacionAbusiva extends Denuncia {
	
	new(Jugador denuciante, Jugador denunciado, String justificacion, Integer penalizacion) {

		this.denunciante = denunciante
		this.denunciado = denunciado
		this.justificacion = justificacion
		this.penalizacion = 7

	}

	override void ejecutarDenuncia() {
		if (valDenucias.validar(this)) {
			this.denunciado.denunciasRecibidas.add(this)
			this.sumarPenalizacion(this)
		} else {

			this.abusoDeDenuncia(this)

		}

	}
	
}

class FeedIntencional extends Denuncia {

	new(Jugador denuciante, Jugador denunciado, String justificacion, Integer penalizacion) {

		this.denunciante = denunciante
		this.denunciado = denunciado
		this.justificacion = justificacion
		this.penalizacion = 10

	}

	override void ejecutarDenuncia() {
		if (valDenucias.validar(this)) {
			this.denunciado.denunciasRecibidas.add(this)
			this.sumarPenalizacion(this)
		} else {

			this.abusoDeDenuncia(this)

		}

	}


}
