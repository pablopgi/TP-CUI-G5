package modelTest

import model.DueloDeLeyendasMain
import model.Jugador
import model.Personaje
import model.Posicion
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class AsignadorIdsTest {
	
	DueloDeLeyendasMain main
	Posicion top = Posicion.TOP
	Personaje pj1
	Personaje pj2
	Personaje pj3
	Personaje pj4
	Jugador plyr1
	Jugador plyr2
	Jugador plyr3
	Jugador plyr4
	
	
	@Before
	def void setup(){
		main = new DueloDeLeyendasMain
		top = Posicion.TOP
		pj1 = new Personaje("pj1", top)
		pj2 = new Personaje("pj2", top)
		pj3 = new Personaje("pj3", top)
		pj4 = new Personaje("pj4", top)
		plyr1 = new Jugador("plyr1")
		plyr2 = new Jugador("plyr2")
		plyr3 = new Jugador("plyr3")
		plyr4 = new Jugador("plyr4")
	}
	
	@Test
	def void alAgregarPersonajesCadaUnoDeberiaTenerElIdQueLeCorrespondaSegunElOrdenEnElQueFueAgregado(){
		main.agregarPersonaje(pj1)
		main.agregarPersonaje(pj2)
		main.agregarPersonaje(pj3)
		main.agregarPersonaje(pj4)
		
		Assert.assertEquals(0, pj1.id)
		Assert.assertEquals(1, pj2.id)
		Assert.assertEquals(2, pj3.id)
		Assert.assertEquals(3, pj4.id)
	}
	
	@Test
	def void alAgregarJugadoresCadaUnoDeberiaTenerElIdQueLeCorrespondaSegunElOrdenEnElQueFueAgregado(){
		main.agregarJugador(plyr1)
		main.agregarJugador(plyr2)
		main.agregarJugador(plyr3)
		main.agregarJugador(plyr4)
		
		Assert.assertEquals(0, plyr1.id)
		Assert.assertEquals(1, plyr2.id)
		Assert.assertEquals(2, plyr3.id)
		Assert.assertEquals(3, plyr4.id)
	}
	
	@Test
	def void alAgregarJugadoresYPersonajeDeberianTenerElIdQueLeCorrespondaSegunElOrdenEnElQueFueAgregado(){
		main.agregarJugador(plyr1)
		main.agregarPersonaje(pj1)
		main.agregarJugador(plyr2)
		main.agregarPersonaje(pj2)
		main.agregarJugador(plyr3)
		main.agregarPersonaje(pj3)
		main.agregarJugador(plyr4)
		main.agregarPersonaje(pj4)
		
		Assert.assertEquals(0, plyr1.id)
		Assert.assertEquals(1, plyr2.id)
		Assert.assertEquals(2, plyr3.id)
		Assert.assertEquals(3, plyr4.id)
		
		Assert.assertEquals(0, pj1.id)
		Assert.assertEquals(1, pj2.id)
		Assert.assertEquals(2, pj3.id)
		Assert.assertEquals(3, pj4.id)		
	}
}