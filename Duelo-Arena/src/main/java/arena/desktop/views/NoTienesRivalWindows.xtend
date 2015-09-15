package arena.desktop.views

import org.uqbar.arena.windows.SimpleWindow
import model.Duelo
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.windows.MainWindow
import model.Jugador
import org.uqbar.arena.layout.VerticalLayout

class NoTienesRivalWindows extends MainWindow<Duelo> {

	new(Duelo model) {
		super(model)
	}

	override createContents(Panel main) {
		var mainPanelButtons = new Panel(main)
		title = "Sin Rival"

		new Label(main) => [
			text = "No tines Rival!!!"
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]

		panelText(main)
		panelButtons(main)
	}

	def panelButtons(Panel mainPanel) {
		var mainPanelButtons = new Panel(mainPanel)
		mainPanelButtons.layout = new HorizontalLayout

		new Button(mainPanelButtons) => [
			caption = "Retar a MR-X !!!"
			fontSize = 11
			onClick[this.close]
		]

		new Button(mainPanelButtons) => [
			caption = "Descansar en mi Gloria"
			fontSize = 11
			onClick[this.close]
		]
	}

	def panelText(Panel mainPanel) {

		var panelText = new Panel(mainPanel)
		panelText.layout = new VerticalLayout

		new Label(panelText) => [
			text = "NO HY QUINE SE TE ANIME EN TU RANKING ACTUAL."
		]
		new Label(panelText) => [
			text = "Puedes optar por retar al bot del nivel y tratar de avanzar de "
		]
		new Label(panelText) => [
			text = "nivel en le ranking  o disfrutar de tu gloria y decansar ¿que"
		]
		new Label(panelText) => [
			text = "quieres hacer?"
		]

	}

	/* 
	new(WindowOwner parent, Duelo model) {
		super(parent, model)
	}

	override protected createFormPanel(Panel mainPanel) {
		title = "Sin Rival"

		new Label(mainPanel) => [
			text = "No tines Rival!!!"
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]

		new Label(mainPanel) => [
			text = "No tines Rival!!!"
		]

	}

	override protected addActions(Panel mainPanel) {
		panelButtons(mainPanel)
	}

	def panelButtons(Panel mainPanel) {
		var mainPanelButtons = new Panel(mainPanel)
		mainPanelButtons.layout = new HorizontalLayout

		new Button(mainPanelButtons) => [
			caption = "Retar a MR-X !!!"
			fontSize = 11
			onClick[this.close]
		]

		new Button(mainPanelButtons) => [
			caption = "Descansar en mi Gloria"
			fontSize = 11
			onClick[this.close]
		]
	}
*/
	def static void main(String[] args) {
		new NoTienesRivalWindows(new Duelo(new Jugador("Prpr"))).startApplication()
	}

}
