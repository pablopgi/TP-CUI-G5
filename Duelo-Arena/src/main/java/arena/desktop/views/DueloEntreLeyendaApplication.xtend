package arena.desktop.views

import org.uqbar.arena.Application
import appModel.DenunciasAppModel
import model.Jugador
import model.DueloDeLeyendasMain
import appModel.LobbyDueloAppModel

class DueloEntreLeyendaApplication extends Application {
	
	override protected createMainWindow() {
		var denunciante = new Jugador("Pwpw")
		var denunciado = new Jugador("Pypy")
		
		var main = new DueloDeLeyendasMain
		
		//Se hardcodean pj y jugadores aca
		
		main.agregarJugador
		main.agregarPersonaje
		
		//Aca se setea y se inicia
		
		var lobby = new LobbyDueloAppModel(denunciante)
		new LobbyDueloWindow(this, lobby)
		
		new DenunciarJugadorWindow(this, new DenunciasAppModel(denunciante, denunciado))
	}
	
	def static void main(String[] args) {
		new DueloEntreLeyendaApplication().start()
	}

}