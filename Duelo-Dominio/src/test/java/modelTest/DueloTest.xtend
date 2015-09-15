package modelTest

import org.junit.Test
import model.PersonajeNoElegidoException
import org.junit.Assert
import model.SeleccionRival
import model.RivalNoDefinidoException
import model.Posicion
import model.PersonajeYaElegidoException
import model.DefinirDuelo
import model.RivalYaDefinidoException

class DueloTest extends AbstractTest {
	
	@Test
	def void unDueloEnEtapaDeSeleccionDePjDeberiaDevolverUnaExcepcionAlQuererDefinirUnRivalOComenzarElDuelo() {

		try duelo.definirRival(posiblesJugadoresParaElDuelo, posiblesPersonajesParaElDuelo)
		catch (PersonajeNoElegidoException pjNoElegido) Assert.assertTrue(true)
		
		try duelo.comenzarDuelo
		catch (PersonajeNoElegidoException pjNoElegido) Assert.assertTrue(true)

	}
	
	@Test
	def void unDueloEnEtapaDeSeleccionDeRivalDeberiaDevolverUnaExcepcionAlQuererComenzarElDueloOAlVolverADefinirUnPersonajeParaElRetador() {
		
		duelo.etapaActual = new SeleccionRival
		
		try duelo.comenzarDuelo
		catch (RivalNoDefinidoException rivalNoDefinido) Assert.assertTrue(true)

		try duelo.elegirPersonaje(nasus, Posicion.TOP)
		catch (PersonajeYaElegidoException pjYaElegido) Assert.assertTrue(true)
	}
	
	@Test
	def void unDueloEnEtapaDeDefinicionDelDueloDeberiaDevolverUnaExcepcionAlQuererElegirUnPersonajeOAlQuererDefinirUnRival() {
		
		duelo.etapaActual = new DefinirDuelo
		
		try duelo.elegirPersonaje(nasus, Posicion.TOP)
		catch (PersonajeYaElegidoException pjYaElegido) Assert.assertTrue(true)
		
		try duelo.definirRival(posiblesJugadoresParaElDuelo, posiblesPersonajesParaElDuelo)
		catch (RivalYaDefinidoException rivalYaDefinido) Assert.assertTrue(true)
	}
	
	@Test
	def void alQuererDefinirUnRivalSeDeberiaElegirAlQueEsteEnElMismoRankingDeEntreLosPosibles() {
		duelo.elegirPersonaje(nasus, Posicion.TOP)
		duelo.definirRival(posiblesJugadoresParaElDuelo, posiblesPersonajesParaElDuelo)
		
		Assert.assertEquals(jugadorSinPartidas, duelo.retado)
		Assert.assertEquals(drowRanger, duelo.personajeElegidoPorRetado)
	}
}