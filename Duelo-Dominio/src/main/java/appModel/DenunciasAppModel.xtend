package appModel

import model.Denuncia
import model.Jugador
import model.Motivo
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class DenunciasAppModel {
	var String detalles
	var Denuncia denuncia
	var ResultadoDueloAppModel resAppModel
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado, ResultadoDueloAppModel resultApp) {
		denuncia = new Denuncia(jugadorDenunciante, jugadorDenunciado)
		detalles = null
		resAppModel = resultApp
	}

	def Boolean isDatosIngresados() {
		denuncia.justificacion != null && denuncia.motivo != null
	}
	
	def getNombreJugadorDenunciado() {
		denuncia.denunciado.nombreJugador
	}
	
	def void setMotivo(Motivo motivo) {
		denuncia.motivo = motivo
		firePropertyChanged(this, "datosIngresados")
	}
	def Motivo getMotivo(){
		denuncia.motivo
	}

	def void setDetalles(String detalles) {
		denuncia.justificacion  = detalles
		firePropertyChanged(this, "datosIngresados")
	}
	
	def void denunciar() {
			resAppModel.noSeEnvioDenuncia = false
			denuncia.denunciar(denuncia.denunciado, denuncia.denunciante)
	}
	
	def getDenunciasPosibles() {
		Motivo.values.toList
	}
	
}