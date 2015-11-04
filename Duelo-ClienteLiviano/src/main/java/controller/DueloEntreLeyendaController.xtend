package controller

import model.Duelo
import model.DueloDeLeyendasMain
import model.NoExisteJugadorConEseId
import model.NoExistePersonajeConEseId
import model.NoHayRivalesPosiblesException
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import toSendClasses.DatosJuegoToSend
import toSendClasses.DecisionUsuarioToSend
import toSendClasses.EstadisticaToSend
import toSendClasses.ResultadoPartidaToSend

@Controller
class DueloEntreLeyendaController {
	extension JSONUtils = new JSONUtils
	Duelo dueloSinRival
		
	//Envia la respuesta inicial con los datos del juego
	@Get("/del/:id")
	def Result datosJuego() {
		val idParam = Integer.valueOf(id)
    	DueloDeLeyendasMain.instance.setMainPlayer(idParam)
		val pjsDelJuego = DueloDeLeyendasMain.instance.personajesDisponibles
		val datos = new DatosJuegoToSend(pjsDelJuego)
		
		response.contentType = ContentType.APPLICATION_JSON
		ok(datos.toJson)
	}

	//Envia el resultado de la partida
	@Post("/del/")
	def Result jugar(@Body String decisionParam) {
		dueloSinRival = null
		val decision = decisionParam.fromJson(DecisionUsuarioToSend)
		
		try {
			decision.validar
			var dueloActual = DueloDeLeyendasMain.instance.nuevoDuelo(decision.idUsuario,
																	  decision.idPjSeleccionado,
																	  decision.posicionSeleccionado
														   )
			response.contentType = ContentType.APPLICATION_JSON
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
			response.contentType = ContentType.APPLICATION_JSON
			ok(new ResultadoPartidaToSend(true).toJson)
		}
	}
	
	@Get("/del/mrx")
	def Result jugarContraMrX() {
		dueloSinRival.lucharContraMrEx
		ok(dueloToResultadoPartidaToSend(dueloSinRival).toJson)
	}
	
	@Get("/del/estPj/:id")
	def Result estadisticaDePersonaje() {
		val idParam = Integer.valueOf(id)
		val estadistica = DueloDeLeyendasMain.instance.estadisticaDeMainPlayerParaPj(idParam)
		response.contentType = ContentType.APPLICATION_JSON
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