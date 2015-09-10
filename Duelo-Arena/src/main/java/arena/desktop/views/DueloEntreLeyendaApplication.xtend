package arena.desktop.views

import org.uqbar.arena.Application
import appModel.DenunciasAppModel

class DueloEntreLeyendaApplication extends Application {
	
	override protected createMainWindow() {
//		var model = new DueloEntreLeyendaAppModel
//		new DELMainWindow(this, model)
		new DenunciarJugadorWindow(this, new DenunciasAppModel)
	}
	
	def static void main(String[] args) {
		new DueloEntreLeyendaApplication().start()
	}

}