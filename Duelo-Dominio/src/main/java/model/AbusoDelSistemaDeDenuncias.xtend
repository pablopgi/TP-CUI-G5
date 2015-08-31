package model

import model.Denuncia

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
