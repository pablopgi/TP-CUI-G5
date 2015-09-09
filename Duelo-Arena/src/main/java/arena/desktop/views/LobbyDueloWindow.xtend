package arena.desktop.views

import org.uqbar.arena.windows.SimpleWindow
import model.Duelo
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import model.Jugador
import org.uqbar.arena.windows.MainWindow
import java.awt.Color
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import model.Personaje

class LobbyDueloWindow extends MainWindow<Duelo> {
	
//	new(WindowOwner parent, Duelo model) {
//		super(parent, model)
//	}

	new(Duelo model) {
		super(model)
	}
	
	override createContents(Panel mainPanel){
		title = "Lobby"
		mainPanel.layout = new VerticalLayout 
		
		new Label(mainPanel)=>[
			text = "Bienvenido: «model.jugador.nombre»! Desde esta pantalla podrás elegir un personaje para batirte a duelo con otro jugador. Recuerda siempre revisar tus stats!"
			fontSize = 10
		]
		
		new Label(mainPanel)=>[
			text = "Selecciona tu personaje para el duelo wachiiiin!"
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]
		
		panelSeleccionPersonaje(mainPanel)
		
	}
	
	def panelSeleccionPersonaje(Panel mainPanel) {
		var mainPanelSelPj = new Panel(mainPanel)
		mainPanelSelPj.layout = new VerticalLayout
		
		var panelBusquedaPj = new Panel(mainPanelSelPj)
		panelBusquedaPj.layout = new HorizontalLayout
		
		new Label(panelBusquedaPj) =>[
			text= "Personaje Buscado: "
			fontSize = 10
		]
		
		new TextBox(panelBusquedaPj) =>[
			//bindValueToProperty("Personaje")
		]
		
//		var table = new Table<Personaje>(mainPanelSelPj,typeof(Personaje)) => [
//			height = 300
//			width = 200
//			bindItemsToProperty("personajes")
//			bindValueToProperty("personajeElegido")
//		]
		
//		new Column<Personaje>(table) => [
//			title = "Personaje"
//			bindContentsToProperty("nombre")
//		]
		
//		new Column<Puntaje>(table) => [
//			title = "Puntaje"
//			bindContentsToProperty("puntaje")
//		]
	}
	
//	override protected addActions(Panel arg0) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
//	
//	override protected createFormPanel(Panel arg0) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
	
	def static void main(String[] args) {
		new LobbyDueloWindow(new Duelo(new Jugador("Pablinguis"))).startApplication
	}
	
	
}