package appModel

import model.Jugador
import static model.ValidadorDeDenuncias.*
import model.ComunicacionAbusiva
import model.FeedIntencional
import model.AbusoDeHabilidad
import org.eclipse.xtend.lib.annotations.Accessors
import model.Denuncia

@Accessors
class DenunciasAppModel {
	var String detalles
	var Jugador jugadorDenunciante
	var Jugador jugadorDenunciado
	var Denuncia denunciaSeleccionada
	
	def void validarDenuncia() {
		validar(denunciaSeleccionada=>[
			justificacion = detalles
			denunciante = jugadorDenunciante
			denunciado = jugadorDenunciado
		])
	}
	
	def denunciasPosibles() {
		#[new AbusoDeHabilidad, new FeedIntencional, new ComunicacionAbusiva]
	}
}