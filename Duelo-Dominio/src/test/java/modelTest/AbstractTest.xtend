package modelTest

import org.junit.Test
import org.junit.Assert
import org.eclipse.xtend.lib.annotations.Accessors
import model.Jugador
import model.Partida
import org.junit.Before
import model.Personaje
import model.Posicion
import model.ResultadoPartida

@Accessors
abstract class AbstractTest {
	
	var Jugador jugadorIniciador
	var Jugador jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop
	var Jugador jugadorConTresPartidasConPosicionTop
	var Jugador jugadorSinPartidas
	
	var Partida partidaGanadaConPosicionIdealTop
	var Partida partidaGanadaSinPosicionIdeal
	var Partida partidaPerdidaConPosicionIdealTop
	var Partida partidaPerdidaSinPosicionIdealTop
	
	var Personaje nasus
	var Personaje drowRanger
	
	@Before
	def void setUp() {
		
		nasus = new Personaje("Nasus", Posicion.TOP)
		drowRanger = new Personaje("Drow Ranger", Posicion.BOTTOM)
		
		jugadorIniciador = new Jugador("ElIniciador")
		jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop = new Jugador("PeruanoFeeder")
		jugadorConTresPartidasConPosicionTop = new Jugador("Huehue")
		jugadorSinPartidas = new Jugador("Robochop")

		partidaGanadaConPosicionIdealTop = new Partida(jugadorIniciador, nasus,
													   ResultadoPartida.Victoria, Posicion.TOP)
   
		partidaGanadaSinPosicionIdeal = new Partida(jugadorIniciador, nasus,
													ResultadoPartida.Victoria, Posicion.JUNGLE)

		partidaPerdidaConPosicionIdealTop = new Partida(jugadorIniciador, nasus,
														ResultadoPartida.Derrota, Posicion.TOP)

		partidaPerdidaSinPosicionIdealTop = new Partida(jugadorIniciador, nasus,
														ResultadoPartida.Derrota, Posicion.MIDDLE)

	}
}