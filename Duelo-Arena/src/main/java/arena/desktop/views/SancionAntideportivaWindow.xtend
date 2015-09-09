package arena.desktop.views

import model.Denuncia
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.Button

class SancionAntideportivaWindow extends MainWindow<Denuncia>{
	
	new(Denuncia model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		title = ""
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel)=>[
			text = "Has sido sancionado!"
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]
		
		new Label(mainPanel)=>[
			text = "Hemos detectado que tu denuncia no tiene fundamentos sólidos."
			fontSize = 11
		]
		
		new Label(mainPanel)=>[
			text = "En duelo de leyendas desalentamos este tipo de actitudes y"
			fontSize = 11
		]
		
		new Label(mainPanel)=>[
			text = "somos partidarios del fair play."
			fontSize = 11
		]
		
		new Label(mainPanel)=>[
			text = "Con lo que has recibido una sanción por tu actitud"
			fontSize = 11
		]
		
		new Label(mainPanel)=>[
			text = "antideportica, esperamos que reflexiones sobre tu actitud."
			fontSize = 11
		]
		
		new Button(mainPanel)=>[
			title = "Aceptar"
			fontSize = 11
		]
	}
	
}