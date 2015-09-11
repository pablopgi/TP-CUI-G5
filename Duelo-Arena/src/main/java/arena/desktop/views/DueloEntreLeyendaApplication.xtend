package arena.desktop.views

import org.uqbar.arena.Application
import appModel.DenunciasAppModel
import model.Jugador

class DueloEntreLeyendaApplication extends Application {
	
	override protected createMainWindow() {
//		var model = new DueloEntreLeyendaAppModel
//		new DELMainWindow(this, model)
		var denunciante = new Jugador("Pwpw")
		var denunciado = new Jugador("Pypy")
		new DenunciarJugadorWindow(this, new DenunciasAppModel(denunciante, denunciado))
	}
	
	def static void main(String[] args) {
		new DueloEntreLeyendaApplication().start()
	}

}