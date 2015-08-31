package model

import model.Denuncia

class AbusoDeHabilidad extends Denuncia {

	new(Jugador denuciante, Jugador denunciado, String justificacion, Integer penalizacion) {

		this.denunciante = denunciante
		this.denunciado = denunciado
		this.justificacion = justificacion
		this.penalizacion = 5

	}

	override void ejecutarDenuncia() {
		if (valDenucias.validar(this)) {
			this.sumarPenalizacion(this)
		} else {

			this.abusoDeDenuncia(this)

		}

	}

}
