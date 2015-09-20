package arena.desktop.views

import appModel.LobbyDueloAppModel
import java.awt.Color
import model.PersonajePuntaje
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import model.Posicion
import model.NoHayRivalesPosiblesException
import appModel.ResultadoDueloAppModel
import model.Caracteristica

class LobbyDueloWindow extends SimpleWindow<LobbyDueloAppModel> {
	
	new(WindowOwner parent, LobbyDueloAppModel model) {
		super(parent, model)
	}

	override createContents(Panel mainPanel){
		title = "Lobby"
		mainPanel.layout = new VerticalLayout 
		
		new Label(mainPanel)=>[
			text = '''Bienvenido: «modelObject.nombreRetador»! Desde esta pantalla podrás elegir un personaje para batirte a duelo con otro jugador. Recuerda siempre revisar tus stats!'''
			fontSize = 10
		]
		
		new Label(mainPanel)=>[
			text = "Selecciona tu personaje para el duelo wachiiiin!"
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]
		
		panelPrincipal(mainPanel)
		
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
			bindValueToProperty("personajeABuscar")
		]
		
		var table = new Table<PersonajePuntaje>(mainPanelSelPj, PersonajePuntaje) => [
			height = 300
			width = 200
			bindItemsToProperty("generarVinculos")
			bindValueToProperty("pjPuntaje")
		]
		
		new Column<PersonajePuntaje>(table) => [
			title = "Personaje"
			bindContentsToProperty("personaje.nombre")
		]
		
		new Column<PersonajePuntaje>(table) => [
			title = "Puntaje"
			bindContentsToProperty("puntaje")
		]
	}
	
	def panelDescripcionPersonaje(Panel mainPanel){
		var panelDescripcionPj = new Panel(mainPanel)
		panelDescripcionPj.layout = new VerticalLayout
		
		new Label(panelDescripcionPj) => [
			bindValueToProperty("personajeSeleccionado.nombre")
			fontSize = 15
			foreground = Color::BLUE
		]
		
		new Label(panelDescripcionPj) => [
			text = "Especialidades:"
			fontSize = 11
			foreground = Color :: GREEN
		]
		
		//Lista de especialidades (enum)
		
		new List<Caracteristica>(panelDescripcionPj) =>[
			allowNull = false
			bindItemsToProperty("personajeSeleccionado.especialidades")
		]
		
		
		new Label(panelDescripcionPj) => [
			text = "Debilidad:"
			fontSize = 11
			foreground = Color :: GREEN
		]
		
		//Lista de debilidades
		new List<Caracteristica>(panelDescripcionPj) =>[
			allowNull = false
			bindItemsToProperty("personajeSeleccionado.debilidades")
		]
		
		new Label(panelDescripcionPj) => [
			text = "Mejor Posición:"
			fontSize = 11
			foreground = Color :: GREEN
		]
		
		//Mejor Posicion
		new Label(panelDescripcionPj) =>[
			bindValueToProperty("personajeSeleccionado.posicionIdeal")
		]
		
	}
	
	def etiquetaConString(Panel mainPanel, String texto) {
		new Label(mainPanel) => [
			text = texto
			fontSize = 8
		]
	}
	
	def etiquetaBindeadaAPropiedad(Panel mainPanel , String propiedad) {
		new Label(mainPanel) => [
			bindValueToProperty(propiedad)
			fontSize = 8
		]
	}
	
	def statsDePersonajeEnColumna(Panel mainPanel) {
		var panelDatosDeStats = new Panel(mainPanel)
		panelDatosDeStats.layout = new ColumnLayout(2)

		new Label(mainPanel) => [
			text = "Stats"
			fontSize = 15
			foreground = Color :: GREEN
		]
		
		etiquetaConString(panelDatosDeStats, "Jugadas")
		etiquetaBindeadaAPropiedad(panelDatosDeStats, "jugadas")
		etiquetaConString(panelDatosDeStats, "Ganadas")
		etiquetaBindeadaAPropiedad(panelDatosDeStats, "ganadas")
		etiquetaConString(panelDatosDeStats, "Kills")
		etiquetaBindeadaAPropiedad(panelDatosDeStats, "kills")
		etiquetaConString(panelDatosDeStats, "Deads")
		etiquetaBindeadaAPropiedad(panelDatosDeStats, "deads")
		etiquetaConString(panelDatosDeStats, "Assists")
		etiquetaBindeadaAPropiedad(panelDatosDeStats, "assists")
		etiquetaConString(panelDatosDeStats, "Mejor ubicacion")
		etiquetaBindeadaAPropiedad(panelDatosDeStats, "ubicacion")
		etiquetaConString(panelDatosDeStats, "Puntaje")
		etiquetaBindeadaAPropiedad(panelDatosDeStats, "puntaje")
	}
	
	def panelJugarPosicion(Panel mainPanel){
		var panelJugar = new Panel(mainPanel)
		panelJugar.layout = new VerticalLayout
		
		new Label(panelJugar) => [
			text = "Jugar"
			fontSize = 15
			foreground = Color :: BLUE
		]
		
		var panelBotones = new Panel(panelJugar)
		panelBotones.layout = new ColumnLayout(2)
		
		
		buttonEnumPosicion(Posicion.TOP,    panelBotones)
		buttonEnumPosicion(Posicion.MIDDLE, panelBotones)
		buttonEnumPosicion(Posicion.BOTTOM, panelBotones)
		buttonEnumPosicion(Posicion.JUNGLE, panelBotones)
		 
	}
	
	def buttonEnumPosicion(Posicion pos, Panel mainPanel){
		new Button(mainPanel)=>[
			caption = pos.toString
			onClick[
				try {
					modelObject.setPosicionYJugar(pos)
					new ResultadoDueloWindow(this, new ResultadoDueloAppModel(modelObject.duelo)).open					
				}
				catch (NoHayRivalesPosiblesException e) new NoTienesRivalWindows(this, modelObject.duelo).open
			]
		]
	}
	
	def panelStatsJugar(Panel mainPanel){
		var panelStatsJugar = new Panel(mainPanel)
		panelStatsJugar.layout = new VerticalLayout
		
		statsDePersonajeEnColumna(panelStatsJugar)
		panelJugarPosicion(panelStatsJugar)
		
	}
	
	def panelPrincipal(Panel mainPanel){
		var panelPrincipal = new Panel(mainPanel)
		panelPrincipal.layout = new HorizontalLayout
		
		panelSeleccionPersonaje(panelPrincipal)
		panelDescripcionPersonaje(panelPrincipal)
		panelStatsJugar(panelPrincipal)
	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
		
}