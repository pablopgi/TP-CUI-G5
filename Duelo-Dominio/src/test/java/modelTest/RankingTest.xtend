package modelTest

import org.junit.Test
import org.junit.Assert
import static model.CalculadorDeRanking.*

class RankingTest extends AbstractTest{
	
	@Test
	def void unJugadorConSeisPartidaGanadaComoDominadorYConUnaDenunciaPorFeedDeberiaTenerRanking65() {
		jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop.agregarDenuncia(denunciaConMasDe20CaracteresYMasde3Palabras)
		
		Assert.assertEquals(390, calcularRankingDeJugador(jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop))
	}
	
	@Test
	def void evaluandoDosJugadoresConDistintoRankingElMetodoDeberiaRetornarFalso() {
		jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop.agregarDenuncia(denunciaConMasDe20CaracteresYMasde3Palabras)
		Assert.assertFalse(sonMismoRanking(jugadorConSeisPartidasConMismoPersonajeConPosicionIdealTop, jugadorConVeintePartidasGanadas))
	}
	
}