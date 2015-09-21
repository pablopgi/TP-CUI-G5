package appModel

import model.Jugador
import static model.ValidadorDeDenuncias.*
import model.ComunicacionAbusiva
import model.FeedIntencional
import model.AbusoDeHabilidad
import org.eclipse.xtend.lib.annotations.Accessors
import model.Denuncia
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*
import model.DenunciaInvalidaException

@Observable
@Accessors
class DenunciasAppModel {
	var String detalles
	var Jugador jugadorDenunciante
	var Jugador jugadorDenunciado
	var Denuncia denunciaSeleccionada
	var boolean datosIngresados
	var ResultadoDueloAppModel resAppModel
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado, ResultadoDueloAppModel resultApp) {
		denunciaSeleccionada = null
		detalles = null
		datosIngresados = false
		this.jugadorDenunciante = jugadorDenunciante
		this.jugadorDenunciado = jugadorDenunciado
		resAppModel = resultApp
	}

	def isDatosIngresados() {
		detalles != null && denunciaSeleccionada != null
	}
	
	def void cambioDatosIngresados() {
		datosIngresados = this.isDatosIngresados
		firePropertyChanged(this, "datosIngresados", datosIngresados)
	}
	
	def void setDenunciaSeleccionada(Denuncia denuncia) {
		denunciaSeleccionada = denuncia
		cambioDatosIngresados
	}

	def void setDetalles(String detalles) {
		if(detalles.equals("")) {
			this.detalles = null
		}
		else {
			this.detalles = detalles			
		}
		cambioDatosIngresados
	}
	
	def void validarYAgregarDenuncia() {
		denunciaSeleccionada => [
			justificacion = detalles
			denunciante = jugadorDenunciante
			denunciado = jugadorDenunciado
		]

		try {
			validar(denunciaSeleccionada)
			jugadorDenunciado.agregarDenuncia(denunciaSeleccionada)
		}
		catch(DenunciaInvalidaException e) {
			jugadorDenunciante.agregarDenuncia(abusoDeDenuncia(denunciaSeleccionada))
			throw e
		}
		finally {
			resAppModel.noSeEnvioDenuncia = false
		}
	}
	
	def getDenunciasPosibles() {
		#[new AbusoDeHabilidad, new FeedIntencional, new ComunicacionAbusiva]
	}
	
}