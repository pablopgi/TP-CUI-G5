package arena.desktop.views

import appModel.ResultadoDueloAppModel
import java.awt.Color
import model.Duelo
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class NoTienesRivalWindows extends SimpleWindow<Duelo> {

	new(WindowOwner parent, Duelo model) {
		super(parent, model)
	}

	override protected createFormPanel(Panel mainPanel) {
		title = "Sin Rival"

		new Label(mainPanel) => [
			text = "No tienes Rival!!!"
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]

		panelText(mainPanel)

	}

	override protected addActions(Panel mainPanel) {
		panelButtons(mainPanel)
	}

	def panelText(Panel mainPanel) {

		var panelText = new Panel(mainPanel)
		panelText.layout = new VerticalLayout

		new Label(panelText) => [
			text = "NO HAY QUIEN SE TE ANIME EN TU RANKING ACTUAL."
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

	def panelButtons(Panel mainPanel) {
		var mainPanelButtons = new Panel(mainPanel)
		mainPanelButtons.layout = new HorizontalLayout

		new Button(mainPanelButtons) => [
			caption = "Retar a MR-X !!!"
			fontSize = 11
			onClick[
				
				modelObject.lucharContraMrEx
				new ResultadoDueloWindow(this, new ResultadoDueloAppModel(modelObject, modelObject)).open	
				this.close
					
			]
		]

		new Button(mainPanelButtons) => [
			caption = "Descansar en mi Gloria"
			fontSize = 11
			onClick[this.close]
		]
	}

}
