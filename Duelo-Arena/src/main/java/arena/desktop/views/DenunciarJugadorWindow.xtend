package arena.desktop.views

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import model.Denuncia
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class DenunciarJugadorWindow extends SimpleWindow<Denuncia>{
	
	new(WindowOwner parent, Denuncia model) {
		super(parent, model)
	}
	
	def panelButtons(Panel simpleWindow){
		var mainPanelButtons = new Panel(simpleWindow)
		mainPanelButtons.layout = new HorizontalLayout
		
		new Button(mainPanelButtons)=>[
			caption = "Denunciar"
			fontSize = 11
			onClick[this.close]
		]
		
		new Button(mainPanelButtons)=>[
			caption = "Cancelar"
			fontSize = 11
			onClick[this.close]
		]
		
	}
	
	override protected addActions(Panel simpleWindow) {
		
		
		
	}
	
	override protected createFormPanel(Panel simpleWindow) {
		
	}
	
}