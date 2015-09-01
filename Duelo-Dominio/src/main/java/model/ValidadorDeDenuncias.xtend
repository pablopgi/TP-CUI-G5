package model

class ValidadorDeDenuncias{
	
	val static int tamanioValido = 20
	val static int cantidadMinPalabras = 3
	
	def static validar(Denuncia denuncia){
		return (tamanioValido(denuncia.justificacion) && cantidadValidaPalabras(denuncia.justificacion))
	}
	
	def static tamanioValido(String justificacion){
		justificacion.length >= tamanioValido
	}
	
	def static cantidadValidaPalabras(String justificacion){
		contarPalabras(justificacion) >= cantidadMinPalabras
	}
	
	def static private contarPalabras(String justificacion) {
	    var contador = 1 
	    var int pos
	    var motivo = justificacion.trim()
	    if (motivo.isEmpty()) { 
	        contador = 0;
	    } 
	    else {
	    	pos = motivo.indexOf(" "); 
	        while (pos != -1) {
	        	contador++;
	            pos = motivo.indexOf(" ", pos + 1);
	        }
	    }
	    return contador;
	}
	
}