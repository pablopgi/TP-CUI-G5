package model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Personaje {
	
	var String nombre
	var Posicion posicionIdeal
	var List<Caracteristica> especialidades
	var List<Caracteristica> debilidades 
	
	new (String nombre, Posicion posIdeal){
		this.nombre = nombre
		posicionIdeal = posIdeal
		especialidades = newArrayList
		debilidades = newArrayList
	}
	
	def void agregarEspecialidad(Caracteristica caracteristica){
		especialidades.add(caracteristica)
	}
	
	def void agregarDebilidad(Caracteristica caracteristica){
		debilidades.add(caracteristica)
	}
	
	def esPosicionIdeal(Posicion posicionElegida){
		posicionIdeal == posicionElegida
	}
}