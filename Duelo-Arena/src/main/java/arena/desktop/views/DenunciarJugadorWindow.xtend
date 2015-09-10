package arena.desktop.views

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import model.Denuncia
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import appModel.DenunciasAppModel
import org.uqbar.arena.bindings.PropertyAdapter
import model.DenunciaInvalidaException
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox

class DenunciarJugadorWindow extends SimpleWindow<DenunciasAppModel>{
	
	new(WindowOwner parent, DenunciasAppModel model) {
		super(parent, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [
			text = "Hacer denuncia"
		]
		
		new Label(mainPanel) => [
			text = "Estas queriendo denunciar a:«jugadorDenunciado»"
		]
		
		panelColums(mainPanel)
		panelButtons(mainPanel)
				
		
	}
	
	def panelButtons(Panel simpleWindow){
		var mainPanelButtons = new Panel(simpleWindow)
		mainPanelButtons.layout = new HorizontalLayout
		
		new Button(mainPanelButtons)=>[
			caption = "Denunciar"
			fontSize = 11
			onClick[
				try{
					modelObject.validarDenuncia
				}
				catch (DenunciaInvalidaException e){
					new SancionAntideportivaWindow(this, modelObject.denunciaSeleccionada).open	
				}
				new DenunciaExitosaWindow(this, modelObject.denunciaSeleccionada).open
			]
		]
		
		new Button(mainPanelButtons)=>[
			caption = "Cancelar"
			fontSize = 11
			onClick[this.close]
		]
		
	}
	
	def panelColums(Panel simpleWindow){
		
		var panelC = new Panel(simpleWindow)
		
		panelC.layout = new ColumnLayout(2)
		
		new Label(panelC).text = "Motivo:"
		
		new Selector(panelC) => [
			allowNull = false
			bindItemsToProperty("denunciasPosibles").adapter = new PropertyAdapter(Denuncia,"motivo")
			bindValueToProperty("denunciaSeleccionada")
		]
		
		new Label(panelC).text = "Detalles:"
		new TextBox(panelC).bindValueToProperty("detalles")
		
		
		
	}
	
	override protected addActions(Panel simpleWindow) {
	//No se usa	
	}
	

		
}