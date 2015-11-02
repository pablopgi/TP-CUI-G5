package toSendClasses

import model.Posicion
import model.ParametrosInvalidos
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DecisionUsuarioToSend {
	Integer idUsuario
	Integer idPjSeleccionado
	Posicion posicionSeleccionado
	
	new() {
		
	}
	
	def validar() {
		if(idUsuario == null ||
		   idPjSeleccionado == null ||
		   posicionSeleccionado == null
		) throw new ParametrosInvalidos
	}
}