package modelTest

import org.junit.Test
import static model.Calificador.*
import model.Rampage
import org.junit.Assert
import model.Dominador
import model.KillingSpread
import model.ShameOnYou
import model.Manco
import model.Noob

class CalificadorTest extends AbstractTest {
	
	@Test
	def void unJugadorConPorLoMenosCincoPartidasConElPersonajeEnPosIdealYGanaElDueloDeberiaSerCalificadoComoRamapage() {
		
		calificarPartidaDeJugador(partidaGanadaConPosicionIdealTop, jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop)
		
		Assert.assertEquals(new Rampage.class, partidaGanadaConPosicionIdealTop.calificacionObtenida.class)

	}
	
	@Test
	def void unJugadorConPorLoMenosDosPartidasEnLaPosicionIdeaParaElPersonajeUsadoYGanaElDueloDeberiaSerCalificadoComoDominador() {

		calificarPartidaDeJugador(partidaGanadaConPosicionIdealTop, jugadorConTresPartidasConPosicionTop)
		
		Assert.assertEquals(new Dominador.class, partidaGanadaConPosicionIdealTop.calificacionObtenida.class)
		
	}
	
	@Test
	def void unJugadorSinPartidasEnLaPosicionUsadaYGanaElDueloDeberiaSerCalificadoKillingSpread() {

		calificarPartidaDeJugador(partidaGanadaConPosicionIdealTop, jugadorSinPartidas)
		
		Assert.assertEquals(new KillingSpread.class, partidaGanadaConPosicionIdealTop.calificacionObtenida.class)
		
	}
	
	@Test
	def void unJugadorConAlMenosDosPartidasEnLaPosicionUsadaYPierdeElDueloDeberiaSerCalificadoShameonYou() {

		calificarPartidaDeJugador(partidaPerdidaConPosicionIdealTop, jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop)
		
		Assert.assertEquals(new ShameOnYou.class, partidaPerdidaConPosicionIdealTop.calificacionObtenida.class)
		
	}
	
	@Test
	def void unJugadorQuePierdeElDueloJugandoEnLaPosicionIdealParaElPersonajeDeberiaSerCalificadoManco() {
		
		calificarPartidaDeJugador(partidaPerdidaConPosicionIdealTop, jugadorSinPartidas)
		
		Assert.assertEquals(new Manco.class, partidaPerdidaConPosicionIdealTop.calificacionObtenida.class)

	}
	
	@Test
	def void unJugadorQuePierdeElDueloyNoJuegaEnLaPosicionIdealParaElPersonajeDeberiaSerCalificadoNoob() {
		
		calificarPartidaDeJugador(partidaPerdidaSinPosicionIdealTop, jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop)
		
		Assert.assertEquals(new Noob.class, partidaPerdidaSinPosicionIdealTop.calificacionObtenida.class)
		
	}
	
}