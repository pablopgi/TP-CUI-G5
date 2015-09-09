package arena.desktop.views

import org.uqbar.arena.windows.SimpleWindow
import model.Denuncia
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.Button

class DenunciaExitosaWindow extends SimpleWindow<Denuncia> {
	
	new(WindowOwner parent, Denuncia model) {
		super(parent, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Denuncia exitosa!"
		
		new Label(mainPanel) => [
			text = "Hemos sancionado a «model.denunciado»"
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]
		
		new Label(mainPanel) => [
			text = "En Duelo de Leyendas somos partidarios del fairplay.\nGracias por ayudarnos a mantenernos asi!!"
			fontSize = 12
		]
	}
	
	override protected addActions(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick[ this.close ] 
		]
	}
		
}