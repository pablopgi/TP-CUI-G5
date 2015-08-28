package model

class ValidadorDeDenuncias {
	
	val int tamanioValido = 20
	val int cantidadMinPalabras = 3
	
	def validar(Denuncia denuncia){
		return (tamanioValido(denuncia.motivo) && cantidadValidaPalabras(denuncia.motivo))
	}
	
	def tamanioValido(String motivo){
		motivo.length >= tamanioValido
	}
	
	def cantidadValidaPalabras(String motivo){
		contarPalabras(motivo) >= cantidadMinPalabras
	}
	
	def private contarPalabras(String motivoDenuncia) {
	    var contador = 1 
	    var int pos
	    var motivo = motivoDenuncia.trim()
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