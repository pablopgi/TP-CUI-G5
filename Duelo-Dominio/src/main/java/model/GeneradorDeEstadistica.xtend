package model

class GeneradorDeEstadistica {
	
	def static cantidadDeVecesQueInicioConPersonaje(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador ].size
	}
	
	def static cantidadDeVecesQueGano(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ gano ].size
	}
	
	def static cantidadDeKills(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador && gano ].size
	}
	
	def static cantidadDeDeads(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador != jugador && perdio ].size
	}
	
	def static cantidadDeAssists(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ empato ].size
	}
	
	def static ubicacionesUtilizadas(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador ].map[ posicionElegida ].toSet
	}
	
	def static mejorUbicacion(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador && gano ].last.posicionElegida
	}
	
	def static calificacion(Jugador jugador, Personaje pj){
		jugador.partidasConPersonaje(pj).filter[ iniciador == jugador ].last.calificacionObtenida
	}
	
	def static crearEstadistica(Personaje personaje, Jugador jugador){
		if(!jugador.partidasConPersonaje(personaje).isEmpty){
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
		else{
			new Estadistica(personaje)
		}
	}
	
}