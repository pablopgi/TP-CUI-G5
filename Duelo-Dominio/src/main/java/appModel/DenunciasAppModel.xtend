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
import model.Motivo

@Observable
@Accessors
class DenunciasAppModel {
//	var String detalles
//	var Jugador jugadorDenunciante
//	var Jugador jugadorDenunciado
	var Denuncia denunciaSeleccionada
//	var boolean datosIngresados
//	var ResultadoDueloAppModel resAppModel
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado, ResultadoDueloAppModel resultApp) {
		denunciaSeleccionada = null
		detalles = null
//		datosIngresados = false
//		this.jugadorDenunciante = jugadorDenunciante
//		this.jugadorDenunciado = jugadorDenunciado
//		resAppModel = resultApp
	}

	def Boolean isDatosIngresados() {
		denunciaSeleccionada.justificacion != null && denunciaSeleccionada.motivo != null
	}
	
	def void setMotivo(Motivo motivo) {
		denunciaSeleccionada.motivo = motivo
		cambioDatosIngresados
	}
	def Motivo getMotivo(){
		denunciaSeleccionada.motivo
	}

	def void setDetalles(String detalles) {
		denunciaSeleccionada.justificacion  = detalles
		cambioDatosIngresados
	}
	
	def void validarYAgregarDenuncia() {
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
		Motivo.values
		
		//#[new AbusoDeHabilidad, new FeedIntencional, new ComunicacionAbusiva]
	}
	
}