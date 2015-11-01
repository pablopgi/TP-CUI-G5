package controller

import model.Duelo
import model.DueloDeLeyendasMain
import toSendClasses.DecisionUsuarioToSend
import model.NoExisteJugadorConEseId
import model.NoExistePersonajeConEseId
import model.NoHayRivalesPosiblesException
import toSendClasses.ResultadoPartidaToSend
import toSendClasses.EstadisticaToSend

@Controller
class DueloEntreLeyendaController {
	extension JSONUtils = new JSONUtils
	Duelo dueloSinRival
	
	//Envia la respuesta inicial con los datos del juego
	@Get("/del/:id")
	def Result datosJuego() {
		val idParam = Integer.valueOf(id)
    	DueloDeLeyendasMain.instance.setMainPlayer(idParam)
		val datos = DueloDeLeyendasMain.instance.datosDeJuego
		
		response.contentType = ContentType.APPLICATION_JSON
		ok(datos.toJson)
	}

	//Envia el resultado de la partida
	@Get("/del/")
	def Result jugar(@Body String decisionParam) {
		dueloSinRival = null
		val decision = decisionParam.fromJson(DecisionUsuarioToSend)
		
		try {
			decision.validar
			var dueloActual = DueloDeLeyendasMain.instance.nuevoDuelo(decision.idUsuario,
																	  decision.idPjSeleccionado,
																	  decision.posicionSeleccionado
														   )
			ok(dueloToResultadoPartidaToSend(dueloActual).toJson)
		}
		catch (NoExisteJugadorConEseId noPlyr) {
			notFound("No existe jugador con id '" + decision.idUsuario + "'")
		}
		catch (NoExistePersonajeConEseId noPj) {
			notFound("No existe personaje con id '" + decision.idPjSeleccionado + "'")
		}
		catch (NoHayRivalesPosiblesException noRival) {
			dueloSinRival = noRival.duelo
			ok(new ResultadoPartidaToSend().toJson)
		}
	}
	
	@Get("del")
	def Result jugarContraMrX() {
		dueloSinRival.lucharContraMrEx
		ok(dueloToResultadoPartidaToSend(dueloActual).toJson)
	}
	
	@Get("del/:id")
	def Result estadisticaDePersonaje() {
		val idParam = Integer.valueOf(id)
		val estadistica = DueloDeLeyendasMain.instance.estadisticaDeMainPlayerParaPj(idParam)
		ok(new EstadisticaToSend(estadistica).toJson)
	}
	
	def dueloToResultadoPartidaToSend(Duelo duelo) {
		new ResultadoPartidaToSend(
					duelo.poderDeRetador > duelo.poderDeRetado,
					duelo.personajeElegidoPorRetador.nombre,
					duelo.poderDeRetador,
					duelo.retador.getEstadisticaDe(duelo.personajeElegidoPorRetador),
			 		duelo.personajeElegidoPorRetado.nombre,
			 		duelo.poderDeRetado,
			 		duelo.retado.nombreJugador,
			 		duelo.retado.getEstadisticaDe(duelo.personajeElegidoPorRetado)
 		)
	}
	
	def static void main(String[] args) {
		XTRest.start(DueloEntreLeyendaController, 9000)
	}
}