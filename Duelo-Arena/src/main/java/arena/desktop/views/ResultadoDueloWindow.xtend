package arena.desktop.views

import org.uqbar.arena.windows.SimpleWindow
import model.Duelo
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import java.awt.Color

class ResultadoDueloWindow extends SimpleWindow<Duelo> {
	
	new(WindowOwner parent, Duelo model) {
		super(parent, model)
	}
	
	override createMainTemplate(Panel mainPanel) {
		title = "Resultado duelo"
		
		new Label(mainPanel) => [
			bindValueToProperty() text = model.personajeElegidoPorRetador.nombre + " vs " + model.personajeElegidoPorRetado.nombre
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]
	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}