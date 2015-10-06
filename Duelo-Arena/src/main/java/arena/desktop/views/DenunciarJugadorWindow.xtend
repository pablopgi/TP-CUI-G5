package arena.desktop.views

import appModel.DenunciasAppModel
import java.awt.Color
import model.DenunciaInvalidaException
import model.Motivo
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class DenunciarJugadorWindow extends SimpleWindow<DenunciasAppModel>{
	
	new(WindowOwner parent, DenunciasAppModel model) {
		super(parent, model)
	}

	override createMainTemplate(Panel mainPanel) {
		new Label(mainPanel) => [
			text = "Hacer denuncia"
			fontSize = 20
			foreground = Color::WHITE
			background = Color::BLACK
		]
		
		new Label(mainPanel) => [
			text = '''Estas queriendo denunciar a:«modelObject.nombreJugadorDenunciado»'''
			fontSize = 12
		]
		
		panelColums(mainPanel)
		panelButtons(mainPanel)
		
	}

	def panelButtons(Panel simpleWindow){
		var mainPanelButtons = new Panel(simpleWindow)
		mainPanelButtons.layout = new HorizontalLayout
		
		new Button(mainPanelButtons)=>[
			caption = "Cancelar"
			fontSize = 11
			onClick[this.close]
		]
		
		new Button(mainPanelButtons)=>[
			caption = "Denunciar"
			fontSize = 11
			onClick[
				try{
					modelObject.denunciar
					new DenunciaExitosaWindow(this, modelObject.denuncia).open
				}
				catch (DenunciaInvalidaException e){
					new SancionAntideportivaWindow(this, modelObject.denuncia).open	
				}
				this.close
			]
			bindEnabledToProperty("datosIngresados")
		]
		
	}
	
	def panelColums(Panel simpleWindow){
		
		var panelC = new Panel(simpleWindow)
		
		panelC.layout = new ColumnLayout(2)
		
		new Label(panelC).text = "Motivo:"
		
		new Selector<Motivo>(panelC) => [
			allowNull = false
			bindItemsToProperty("denunciasPosibles").adapter = new PropertyAdapter(Motivo, "descripcion")
			bindValueToProperty("motivo")
		]
		
		new Label(panelC).text = "Detalles:"
		new TextBox(panelC).bindValueToProperty("detalles")
		
	}
	
	override protected addActions(Panel simpleWindow) {
	//No se usa	
	}
	
	override protected createFormPanel(Panel mainPanel) {
		// No se usa
	}
	
}