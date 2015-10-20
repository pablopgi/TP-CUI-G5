package modelTest

import java.util.List
import model.Denuncia
import model.Dominador
import model.Duelo
import model.Jugador
import model.Motivo
import model.Partida
import model.Personaje
import model.Posicion
import model.Rampage
import model.ResultadoPartida
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Before

@Accessors
abstract class AbstractTest {
	
	var Jugador jugadorIniciador
	var Jugador jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop
	var Jugador jugadorConTresPartidasConPosicionTop
	var Jugador jugadorSinPartidas
	var Jugador jugadorConVeintePartidasGanadas
	
	var Partida partidaGanadaConPosicionIdealTop
	var Partida partidaGanadaSinPosicionIdeal
	var Partida partidaPerdidaConPosicionIdealTop
	var Partida partidaPerdidaSinPosicionIdealTop
	
	var Personaje nasus
	var Personaje drowRanger
	
	var Denuncia denunciaConMasDe20CaracteresYMasde3Palabras
	var Denuncia denunciaConMenosDe20CaracteresYMasde3Palabras
	var Denuncia denunciaConMenosDe20CaracteresYMenosde3Palabras
	
	var Duelo duelo
	
	var List<Jugador> posiblesJugadoresParaElDuelo
	var List<Personaje> posiblesPersonajesParaElDuelo
	
	@Before
	def void setUp() {
		
		nasus = new Personaje("Nasus", Posicion.TOP)
		drowRanger = new Personaje("Drow Ranger", Posicion.BOTTOM)
		
		jugadorIniciador = new Jugador("ElIniciador")
		jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop = new Jugador("PeruanoFeeder")
		jugadorConTresPartidasConPosicionTop = new Jugador("Huehue")
		jugadorSinPartidas = new Jugador("Robochop")
		jugadorConVeintePartidasGanadas = new Jugador("Asian Power")

		partidaGanadaConPosicionIdealTop = new Partida(jugadorIniciador, nasus,
													   ResultadoPartida.Victoria, Posicion.TOP)
		partidaGanadaConPosicionIdealTop.calificacionObtenida = new Dominador
   
		partidaGanadaSinPosicionIdeal = new Partida(jugadorIniciador, nasus,
													ResultadoPartida.Victoria, Posicion.JUNGLE)
		partidaGanadaSinPosicionIdeal.calificacionObtenida = new Rampage

		partidaPerdidaConPosicionIdealTop = new Partida(jugadorIniciador, nasus,
														ResultadoPartida.Derrota, Posicion.TOP)

		partidaPerdidaSinPosicionIdealTop = new Partida(jugadorIniciador, nasus,
														ResultadoPartida.Derrota, Posicion.MIDDLE)

		(1..20).forEach[jugadorConVeintePartidasGanadas.agregarPartida(partidaGanadaConPosicionIdealTop)]

		(1..6).forEach[jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop.agregarPartida(partidaGanadaConPosicionIdealTop)]
		
		(1..3).forEach[jugadorConTresPartidasConPosicionTop.agregarPartida(partidaGanadaConPosicionIdealTop)]
		
		denunciaConMasDe20CaracteresYMasde3Palabras = new Denuncia(jugadorIniciador,
															        	  jugadorSinPartidas,
																          "Un motivo de denuncia de un jugador")
		denunciaConMasDe20CaracteresYMasde3Palabras.motivo = Motivo.FEED_INTENCIONAL
		
		denunciaConMenosDe20CaracteresYMasde3Palabras = new Denuncia(jugadorIniciador,
																            jugadorSinPartidas,
																            "Ab Cd Ef Gh")
		denunciaConMenosDe20CaracteresYMasde3Palabras.motivo = Motivo.FEED_INTENCIONAL
																     
		denunciaConMenosDe20CaracteresYMenosde3Palabras = new Denuncia(jugadorIniciador,
																              jugadorSinPartidas,
																              "Aa Bb")
		denunciaConMenosDe20CaracteresYMenosde3Palabras.motivo = Motivo.FEED_INTENCIONAL
		
		duelo = new Duelo(jugadorIniciador)
		posiblesJugadoresParaElDuelo = #[jugadorConVeintePartidasGanadas,
										 jugadorSinPartidas
										]
		posiblesPersonajesParaElDuelo = #[drowRanger]
		
	}
}