package model

class Estadistica {
	
	def cantidadDeVecesQueInicioConPersonaje(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador ].size
	}
	
	def cantidadDeVecesQueGano(Jugador jugador){
		jugador.partidas.filter[ gano ].size
	}
	
	def cantidadDeKills(Jugador jugador){
		jugador.partidas.filter[ iniciador == jugador && gano ].size
	}
	
	def cantidadDeDeads(Jugador jugador){
		jugador.partidas.filter[ iniciador != jugador && perdio ].size
	}
	
	def cantidadDeAssists(Jugador jugador){
		jugador.partidas.filter[ empato ].size
	}
	
	def ubicacionesUtilizadas(Jugador jugador){
		jugador.partidas.filter[ iniciador == jugador ].map[ posicionElegida ].toSet
	}
	
	def mejorUbicacion(Jugador jugador){
		jugador.partidas.filter[ iniciador == jugador && gano ].last.posicionElegida
	}
	
	def calificacion(Jugador jugador){
		jugador.partidas.filter[ iniciador == jugador ].last.calificacionObtenida
	}
	
}