package model

import java.util.List

class CalculadorDeRanking {
	
	val static int variacionEscalon = 500
	
	def static sonMismoRanking(Jugador unJugador, Jugador otroJugador) {
		
		( calcularRankingDeJugador(unJugador) / variacionEscalon ) as int ==
		( calcularRankingDeJugador(otroJugador) / variacionEscalon ) as int
		
	}
	
	def static calcularRankingDeJugador(Jugador jugador) {
		
		( promedioCalificacionesJugador(jugador.partidas) - pesoTotalDenuncias(jugador.denunciasRecibidas) ) *
		cantidadPartidasGanadas(jugador.partidas) 
		
	}
	
	private def static promedioCalificacionesJugador(List<Partida> partidas) {

		partidas.fold(0)[ resultado, partida | resultado + partida.valorCalificacionObtenida ] /
		partidas.size
		
	}
	
	private def static pesoTotalDenuncias(List<Denuncia> denuncias) {
		
		denuncias.fold(0)[ resultado, denuncia | resultado + denuncia.penalizacion ]
		
	}
	
	private def static cantidadPartidasGanadas(List<Partida> partidas) {
		
		partidas.filter[ gano ].size
		
	}

}