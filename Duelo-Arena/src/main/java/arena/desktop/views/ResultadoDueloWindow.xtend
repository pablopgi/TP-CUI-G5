package arena.desktop.views

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import java.awt.Color
import model.Jugador
import model.Personaje
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import appModel.DenunciasAppModel
import appModel.ResultadoDueloAppModel
import org.uqbar.arena.layout.VerticalLayout

class ResultadoDueloWindow extends SimpleWindow<ResultadoDueloAppModel> {

	new(WindowOwner parent, ResultadoDueloAppModel model) {
		super(parent, model)
	}

	override createMainTemplate(Panel mainPanel) {
		title = "Resultado duelo"

		crearPanelEncabezado(mainPanel)
		
		var panelStats = new Panel(mainPanel)
		panelStats.layout = new HorizontalLayout
		crearPanelStatJugador(panelStats, modelObject.retador, modelObject.pjRetador)
		crearPanelStatJugador(panelStats, modelObject.retado, modelObject.pjRetado)
		
		panelIndicadorGanadorYPuntosDeAtaque(mainPanel)
		panelBotones(mainPanel)

	}

	def crearPanelEncabezado(Panel mainPanel) {
		new Label(mainPanel) => [
			text = '''«modelObject.nombrePjRetador» vs «modelObject.nombrePjRetado»'''
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]

		new Label(mainPanel) => [
			text = modelObject.resultadoPartida + modelObject.nombreRetado
			fontSize = 15
			foreground = Color::GREEN
			background = Color::YELLOW
		]		
	}

	def crearPanelStatJugador(Panel mainPanel, Jugador jugador, Personaje personaje) {
		var panelStatJugador = new Panel(mainPanel)
		panelStatJugador.layout = new VerticalLayout()
		
		new Label(panelStatJugador) => [
			text = jugador.nombreJugador
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLUE
		]

		statsDePersonajeEnColumna(panelStatJugador, jugador, personaje)
	}

	def etiquetaConString(Panel mainPanel, String texto) {
		new Label(mainPanel) => [
			text = texto
			fontSize = 8
		]
	}

	def statsDePersonajeEnColumna(Panel mainPanel, Jugador jugador, Personaje personaje) {
		var panelDatosDeStats = new Panel(mainPanel)
		panelDatosDeStats.layout = new ColumnLayout(2)

		new Label(mainPanel) => [
			text = '''Stats - «personaje.nombre»'''
		]

		etiquetaConString(panelDatosDeStats, "Jugadas")
		etiquetaConString(panelDatosDeStats, modelObject.jugadasDeConPersonaje(jugador, personaje))
		etiquetaConString(panelDatosDeStats, "Ganadas")
		etiquetaConString(panelDatosDeStats, modelObject.ganadasDeConPersonaje(jugador, personaje))
		etiquetaConString(panelDatosDeStats, "Kills")
		etiquetaConString(panelDatosDeStats, modelObject.killsDeConPersonaje(jugador, personaje))
		etiquetaConString(panelDatosDeStats, "Deads")
		etiquetaConString(panelDatosDeStats, modelObject.deadsDeConPersonaje(jugador, personaje))
		etiquetaConString(panelDatosDeStats, "Assists")
		etiquetaConString(panelDatosDeStats, modelObject.assistsDeConPersonaje(jugador, personaje))
		etiquetaConString(panelDatosDeStats, "Mejor ubicacion")
		etiquetaConString(panelDatosDeStats, modelObject.mejorUbicacionDeConPersonaje(jugador, personaje))
		etiquetaConString(panelDatosDeStats, "Puntaje")
		etiquetaConString(panelDatosDeStats, modelObject.puntajeDeConPersonaje(jugador, personaje))
	}

	def panelIndicadorGanadorYPuntosDeAtaque(Panel mainPanel) {
		var panel = new Panel(mainPanel)
		panel.layout = new HorizontalLayout

		if (modelObject.huboGanador) {
			new Label(panel) => [
				text = '''Ganador : '''
				fontSize = 8
				background = Color::YELLOW
			]

			new Label(panel) => [
				text = '''«modelObject.ganadorDuelo» !!'''
				fontSize = 15
				foreground = Color::GREEN
				background = Color::YELLOW
			]
		} else {
			new Label(panel) => [
				text = "Empate!! "
				fontSize = 8
				background = Color::YELLOW
			]
		}

		new Label(panel) => [
			text = '''- «modelObject.poderDeRetador» puntos contra «modelObject.poderDeRetado» puntos'''
			fontSize = 8
			background = Color::YELLOW
		]
	}

	def panelBotones(Panel mainPanel) {
		var panel = new Panel(mainPanel)
		panel.layout = new ColumnLayout(2)

		new Button(panel) => [
			caption = modelObject.textoParaBotonCorrepondienteAResultadoDelDuelo
			onClick[
				modelObject.refrescarLobby
				this.close
			]
		]

		new Button(panel) => [
			caption = "Denunciar actitud antideportiva"
			onClick[
				new DenunciarJugadorWindow(this, new DenunciasAppModel(modelObject.retador,
																	   modelObject.retado,
																	   modelObject)).open
			]
			bindEnabledToProperty("noSeEnvioDenuncia")
		]
	}

	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
