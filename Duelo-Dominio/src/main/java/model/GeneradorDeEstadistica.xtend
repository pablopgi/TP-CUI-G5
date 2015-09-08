package model

import javax.swing.text.Position.Bias

class GeneradorDeEstadistica {
	
	def cantidadDeVecesQueInicioConPersonaje(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador ].size
	}
	
	def cantidadDeVecesQueGano(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ gano ].size
	}
	
	def cantidadDeKills(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador && gano ].size
	}
	
	def cantidadDeDeads(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador != jugador && perdio ].size
	}
	
	def cantidadDeAssists(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ empato ].size
	}
	
	def ubicacionesUtilizadas(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador ].map[ posicionElegida ].toSet
	}
	
	def mejorUbicacion(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador && gano ].last.posicionElegida
	}
	
	def calificacion(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador ].last.calificacionObtenida
	}
	
	def crearEstadistica(Personaje personaje, Jugador jugador){
		 new Estadistica(
		 	cantidadDeVecesQueInicioConPersonaje(jugador,personaje),
		 	cantidadDeVecesQueGano(jugador,personaje),
		 	cantidadDeKills(jugador,personaje),
		 	cantidadDeDeads(jugador,personaje),
		 	cantidadDeAssists(jugador,personaje),
		 	ubicacionesUtilizadas(jugador,personaje).toList,
		 	mejorUbicacion(jugador,personaje),
		 	calificacion(jugador,personaje),
		 	personaje)
	}
	
}