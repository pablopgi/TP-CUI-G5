package arena.desktop.views

import model.Denuncia
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class SancionAntideportivaWindow extends SimpleWindow<Denuncia>{

	new(WindowOwner parent, Denuncia model) {
		super(parent, model)
	}

override protected addActions(Panel simpleWindow) {
		new Button(simpleWindow)=>[
			caption = "Aceptar"
			fontSize = 11
			onClick[this.close]
		]
}

override protected createFormPanel(Panel simpleWindow) {
	
		title = ""
		simpleWindow.layout = new VerticalLayout
		
		new Label(simpleWindow)=>[
			text = "Has sido sancionado!"
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]
		
		new Label(simpleWindow)=>[
			text = "Hemos detectado que tu denuncia no tiene fundamentos sólidos."
			fontSize = 11
		]
		
		new Label(simpleWindow)=>[
			text = "En duelo de leyendas desalentamos este tipo de actitudes y"
			fontSize = 11
		]
		
		new Label(simpleWindow)=>[
			text = "somos partidarios del fair play."
			fontSize = 11
		]
		
		new Label(simpleWindow)=>[
			text = "Con lo que has recibido una sanción por tu actitud"
			fontSize = 11
		]
		
		new Label(simpleWindow)=>[
			text = "antideportiva, esperamos que reflexiones sobre tu actitud."
			fontSize = 11
		]
}

//	def static void main(String[] args) {
//	var Jugador jugador1 = new Jugador("asd")
//	var Jugador jugador2 = new Jugador("qwe")
//	var Duelo duelo = new Duelo(jugador1)
//	var Denuncia denuncia = new FeedIntencional(jugador1,jugador2,"FAFAFAF FAFAFA FAFAFA")
//	jugador1.agregarDenuncia(denuncia)
//	new SancionAntideportivaWindow(denuncia).startApplication()
	
}
