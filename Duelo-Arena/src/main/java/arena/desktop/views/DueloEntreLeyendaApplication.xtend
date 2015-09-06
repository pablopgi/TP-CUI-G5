package arena.desktop.views

import org.uqbar.arena.Application

class DueloEntreLeyendaApplication extends Application {
	
	override protected createMainWindow() {
//		var model = new DueloEntreLeyendaAppModel
//		new DELMainWindow(this, model)
	}
	
	def static void main(String[] args) {
		new DueloEntreLeyendaApplication().start()
	}

}