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

	protected def AbusoDelSistemaDeDenuncias abusoDeDenuncia(Denuncia deuncia) {
		return new AbusoDelSistemaDeDenuncias(deuncia.denunciante, deuncia.denunciante,
			'''El jugador intenta denunciar a: «deuncia.denunciado» por: «deuncia.class» sin tener una justificación suficiente: «this.
				justificacion»''')
	}

	abstract def void ejecutarDenuncia()
}
