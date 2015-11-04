package toSendClasses

import model.Estadistica
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ResultadoPartidaToSend {
	// booleanos para verificar estado del duelo
	boolean ganador // indica si el retador gano
	boolean perdedor // indica si el retador perdio
	boolean noRival // indica que no hay rival posible

	// datos retador
	String nombrePjRetador
	int ataqueRetador
	EstadisticaToSend estadisticaRetador

	// datos retado
	String nombrePjRetado
	int ataqueRetado
	String nombreJugadorRetado
	EstadisticaToSend estadisticaRetado

	new() {}

	// constructor para el caso que no haya rival
	new (boolean noRival) {
		this.noRival = noRival
	}

	// constructor para el caso que haya un resultado
	new (boolean ganador, String nombrePjRetador, int ataqueRetador, Estadistica estadisticaRetador,
		 String nombrePjRetado, int ataqueRetado, String nombreRetado, Estadistica estadisticaRetado) {
		// datos resultado
	 	this.noRival = false
	 	this.ganador = ganador
	 	this.perdedor = !ganador
	 	// datos retador
	 	this.nombrePjRetador = nombrePjRetador
	 	this.ataqueRetador = ataqueRetador
	 	this.estadisticaRetador = new EstadisticaToSend(estadisticaRetador)
	 	// datos retado
	 	this.nombrePjRetado = nombrePjRetado
	 	this.ataqueRetado = ataqueRetado
	 	nombreJugadorRetado = nombreRetado
	 	this.estadisticaRetado = new EstadisticaToSend(estadisticaRetado)
	}
}