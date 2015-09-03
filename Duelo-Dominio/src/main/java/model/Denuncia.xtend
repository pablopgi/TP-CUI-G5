package model

import org.eclipse.xtend.lib.annotations.Accessors
import static model.ValidadorDeDenuncias.*

@Accessors
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

	protected def abusoDeDenuncia(Denuncia denuncia) {
		this.denunciado.denunciasRecibidas.add(this)
		return new AbusoDelSistemaDeDenuncias(denuncia.denunciante, denuncia.denunciante,
			'''El jugador intenta denunciar a: «denuncia.denunciado» por: «denuncia.class» sin tener una justificacion suficiente: «this.
				justificacion»''')
	}

	def void ejecutarDenuncia(Denuncia denuncia) {
		if (validar(denuncia)) {
			this.denunciado.denunciasRecibidas.add(denuncia)
		} else {

			this.abusoDeDenuncia(denuncia)

		}
	}

}

class AbusoDeHabilidad extends Denuncia {

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		super(denunciante, denunciado, justificacion)
		this.penalizacion = 5

	}

}

class ComunicacionAbusiva extends Denuncia {

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		super(denunciante, denunciado, justificacion)
		this.penalizacion = 7

	}

}

class FeedIntencional extends Denuncia {

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		super(denunciante, denunciado, justificacion)
		this.penalizacion = 10

	}

}

class AbusoDelSistemaDeDenuncias extends Denuncia {

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		super(denunciante, denunciado, justificacion)
		this.penalizacion = 25

	}

}
