package model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static model.CondicionParaValidador.*

@Accessors
@Observable
class Denuncia {

	Jugador denunciante
	Jugador denunciado
	String justificacion
	Motivo motivo

	new(Jugador denunciante, Jugador denunciado) {
		this.denunciante = denunciante
		this.denunciado = denunciado
	}

	new(Jugador denunciante, Jugador denunciado, String justificacion) {

		this.denunciante = denunciante
		this.denunciado = denunciado
		this.justificacion = justificacion

	}

	def validar() {
		if (!(tamanioValido(this.justificacion) && cantidadValidaPalabras(this.justificacion)))
			throw new DenunciaInvalidaException
	}

	def denunciar(Jugador denunciado, Jugador denunciante) {
		try{
			validar()
			denunciado.agregarDenuncia(this)
		} 
		catch (DenunciaInvalidaException denunciaException) {
			denunciante.agregarDenuncia(abusoDeDenuncia(this))
			throw denunciaException
		}
	}

	def abusoDeDenuncia(Denuncia denuncia) {
		denuncia.motivo = Motivo.Abuso_Del_Sistema_De_Denuncias
		denuncia.justificacion = '''El jugador intenta denunciar a: «denuncia.denunciado» por: «denuncia.motivo.
			descripcion» sin tener una justificacion suficiente: «denuncia.justificacion»'''
		return denuncia
	}
}
