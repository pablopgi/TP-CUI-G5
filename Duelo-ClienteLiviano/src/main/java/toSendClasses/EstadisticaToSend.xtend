package toSendClasses

import java.util.List
import model.Estadistica
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EstadisticaToSend {
	List<EstadisticaDatoParticular> estadistica

	new(){}

	new (Estadistica estadistica) {
		estadistica = listarEstadisticaConValor(estadistica)
	}

	def listarEstadisticaConValor(Estadistica it) {
		#[
			new EstadisticaDatoParticular(
				"Jugadas",
				cantidadDeVecesQueInicioConPersonaje.toString
			),
			new EstadisticaDatoParticular(
				"Ganadas",
				cantidadDeVecesQueGano.toString
			),
			new EstadisticaDatoParticular(
				"Kills",
				cantidadDeKills.toString
			),
			new EstadisticaDatoParticular(
				"Deads",
				cantidadDeDeads.toString
			),
			new EstadisticaDatoParticular(
				"Assists",
				cantidadDeAssists.toString
			),
			new EstadisticaDatoParticular(
				"Mejor Ubicacion",
				if(mejorUbicacion != null) mejorUbicacion.toString else ""
			),
			new EstadisticaDatoParticular(
				"Puntaje",
				if(calificacion != null) calificacion.puntaje else ""
			)
		]
	}
}

@Accessors
class EstadisticaDatoParticular {
	String nombre
	String valor
	
	new(){}
	
	new (String nombre, String valor) {
		this.nombre = nombre
		this.valor = valor
	}
}