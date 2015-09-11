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


@Observable
@Accessors
class DenunciasAppModel {
	var String detalles
	var Jugador jugadorDenunciante
	var Jugador jugadorDenunciado
	var Denuncia denunciaSeleccionada
	
<<<<<<< Updated upstream
	new(){}
	
=======
	def isDatosIngresados() {
		detalles != null && denunciaSeleccionada != null
	}
	
	def void setDenunciaSeleccionada(Denuncia denuncia) {
		denunciaSeleccionada = denuncia
		firePropertyChanged(this, "denunciaSeleccionada", denunciaSeleccionada)
	}
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado) {
		denunciaSeleccionada = null
		detalles = null
		this.jugadorDenunciante = jugadorDenunciante
		this.jugadorDenunciado = jugadorDenunciado
	}

>>>>>>> Stashed changes
	def void validarDenuncia() {
		validar(denunciaSeleccionada=>[
			justificacion = detalles
			denunciante = new Jugador("Pepe")//jugadorDenunciante
			denunciado = new Jugador("Pipo")//jugadorDenunciado
		])
	}
	
	def getDenunciasPosibles() {
		#[new AbusoDeHabilidad, new FeedIntencional, new ComunicacionAbusiva]
	}
	
}