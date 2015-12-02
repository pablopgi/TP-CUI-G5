package model

class HardCodeDELMain {
	val main = new DueloDeLeyendasMain
	
	val top = Posicion.TOP
	val bot = Posicion.BOTTOM
	val mid = Posicion.MIDDLE
	val jg = Posicion.JUNGLE
	
	val ap = Caracteristica.PoderDeHabilidad
	val ad = Caracteristica.PoderDeAtaque
	val mr = Caracteristica.ResistenciaMagica
	val tank = Caracteristica.PoderDeDefensa
	
	//Se hardcodean pj y jugadores aca
	
	val plyr_Robochop = new Jugador("Robochop")
	val plyr_FeederCosmico = new Jugador("Feeder Cosmico")
	val plyr_ElGroneBaltazar = new Jugador("El Grone Baltazar")
	val plyr_JohnMambo = new Jugador("John Mambo")
	val plyr_PupoConPelusa = new Jugador("Pupo con Pelusa")
	val plyr_ElGeorgeClooneyDeVarela = new Jugador("El George de Varela")
	val plyr_LasManaosDePeron = new Jugador("Las Manaos De Peron")
	
	val pj_Axe = new Personaje("Axe", top)
	val pj_Tryndamere = new Personaje("Tryndamere", top)
	val pj_Ashe = new Personaje("Ashe", bot)
	val pj_DrowRanger = new Personaje("Drow Ranger", bot)
	val pj_DeathProphet = new Personaje("Death Prophet", mid)
	val pj_FiddleSticks = new Personaje("FiddleSticks", mid)
	val pj_LifeStealer = new Personaje("LifeStealer", jg)
	val pj_LeeSin = new Personaje("Lee Sin", jg)

	def seteoValoresPlyrsPjs() {
		pj_Axe.agregarEspecialidad(tank)
		pj_Axe.agregarEspecialidad(ad)
		pj_Axe.agregarDebilidad(ap)
		pj_Tryndamere.agregarEspecialidad(ad)
		pj_Tryndamere.agregarDebilidad(ap)
		pj_Ashe.agregarEspecialidad(ad)
		pj_Ashe.agregarEspecialidad(ap)
		pj_Ashe.agregarDebilidad(tank)
		pj_DrowRanger.agregarEspecialidad(ad)
		pj_DrowRanger.agregarDebilidad(tank)
		pj_DeathProphet.agregarEspecialidad(ap)
		pj_DeathProphet.agregarDebilidad(mr)
		pj_FiddleSticks.agregarEspecialidad(ap)
		pj_FiddleSticks.agregarDebilidad(mr)
		pj_LifeStealer.agregarEspecialidad(ad)
		pj_LifeStealer.agregarDebilidad(tank)
		pj_LeeSin.agregarEspecialidad(ad)
		pj_LeeSin.agregarDebilidad(tank)
		
		//Hardcode de un par de estadisticas
		plyr_PupoConPelusa.agregarEstadistica(new Estadistica(pj_Axe) => [ 
													cantidadDeVecesQueInicioConPersonaje = 2
													cantidadDeVecesQueGano = 1
													cantidadDeKills = 1
													cantidadDeDeads = 1
													cantidadDeAssists = 0
													ubicacionesUtilizadas = #[top]
													mejorUbicacion = top
													calificacion = new KillingSpread
													personaje = pj_Axe 
												])
												
		plyr_PupoConPelusa.agregarEstadistica(new Estadistica(pj_Ashe) => [ 
													cantidadDeVecesQueInicioConPersonaje = 5
													cantidadDeVecesQueGano = 3
													cantidadDeKills = 3
													cantidadDeDeads = 1
													cantidadDeAssists = 1
													ubicacionesUtilizadas = #[bot, mid]
													mejorUbicacion = bot
													calificacion = new Dominador
													personaje = pj_Ashe
												])

		plyr_PupoConPelusa.agregarEstadistica(new Estadistica(pj_DeathProphet) => [ 
													cantidadDeVecesQueInicioConPersonaje = 1
													cantidadDeVecesQueGano = 0
													cantidadDeKills = 0
													cantidadDeDeads = 0
													cantidadDeAssists = 1
													ubicacionesUtilizadas = #[jg]
													mejorUbicacion = jg
													calificacion = new Noob
													personaje = pj_DeathProphet
												])


	}

	def agregarPlysPjs() {
		main.agregarJugador(plyr_PupoConPelusa)
//		main.agregarJugador(plyr_ElGeorgeClooneyDeVarela)
//		main.agregarJugador(plyr_ElGroneBaltazar)
//		main.agregarJugador(plyr_FeederCosmico)
//		main.agregarJugador(plyr_JohnMambo)
//		main.agregarJugador(plyr_LasManaosDePeron)
//		main.agregarJugador(plyr_Robochop)
		
		main.agregarPersonaje(pj_Ashe)
		main.agregarPersonaje(pj_Axe)
		main.agregarPersonaje(pj_DeathProphet)
		main.agregarPersonaje(pj_DrowRanger)
		main.agregarPersonaje(pj_FiddleSticks)
		main.agregarPersonaje(pj_LeeSin)
		main.agregarPersonaje(pj_LifeStealer)
		main.agregarPersonaje(pj_Tryndamere)
	}
	
	def giveMeANewHardCodedInstance() {
		seteoValoresPlyrsPjs
		agregarPlysPjs
		main
	}
	
}