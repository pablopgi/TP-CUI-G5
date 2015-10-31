package toSendClasses

import model.Estadistica

class ResultadoPartidaToSend {
	// booleanos para verificar estado del duelo
	boolean ganador // indica si el retador gano
	boolean perdedor // indica si el retador perdio
	boolean noRival // indica que no hay rival posible

	// datos retador
	int idPersonajeRetador
	int ataqueRetador
	EstadisticaToSend estadisticaRetador

	// datos retado
	int idPersonajeRetado
	int ataqueRetado
	String retado
	EstadisticaToSend estadisticaRetado

	// constructor para el caso que no haya rival
	new () {
		noRival = true
	}

	// constructor para el caso que haya un resultado
	new (boolean ganador, int idPjRetador, int ataqueRetador, Estadistica estadisticaRetador,
		 int idPjRetado, int ataqueRetado, String nombreRetado, Estadistica estadisticaRetado) {
		// datos resultado
	 	this.noRival = false
	 	this.ganador = ganador
	 	this.perdedor = !ganador
	 	// datos retador
	 	this.idPersonajeRetador = idPjRetador
	 	this.ataqueRetador = ataqueRetador
	 	this.estadisticaRetador = new EstadisticaToSend(estadisticaRetador)
	 	// datos retado
	 	this.idPersonajeRetado = idPjRetado
	 	this.ataqueRetado = ataqueRetado
	 	retado = nombreRetado
	 	this.estadisticaRetado = new EstadisticaToSend(estadisticaRetador)
	}
}