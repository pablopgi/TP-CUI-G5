package modelTest

import org.junit.Assert
import org.junit.Test

import model.DenunciaInvalidaException

class ValidadorDeDenunciasTest extends AbstractTest{
	
	@Test
	def void unaDenunciaConMasDe20CaracteresYMasDe3PalabrasDeberiaSerValida(){
		var denunciado = denunciaConMasDe20CaracteresYMasde3Palabras.denunciado
		var denunciante = denunciaConMasDe20CaracteresYMasde3Palabras.denunciante
		
		Assert.assertTrue(denunciado.denunciasRecibidas.isEmpty)
		
		denunciaConMasDe20CaracteresYMasde3Palabras.denunciar(denunciado, denunciante)
		
		Assert.assertEquals(denunciaConMasDe20CaracteresYMasde3Palabras, denunciado.denunciasRecibidas.get(0))
	}
	
	@Test
	def void unaDenunciaConMenosDe20CaracteresYMasDe3PalabrasDeberiaSerNoValida(){
		var denunciante = denunciaConMenosDe20CaracteresYMasde3Palabras.denunciante
		var denunciado = denunciaConMenosDe20CaracteresYMasde3Palabras.denunciado
		
		Assert.assertTrue(denunciante.denunciasRecibidas.isEmpty)
		
		try{
			denunciaConMasDe20CaracteresYMasde3Palabras.denunciar(denunciado, denunciante)
		}catch (DenunciaInvalidaException e){
			Assert.assertFalse(denunciante.denunciasRecibidas.isEmpty)
		}
	}
		
	@Test
	def void unaDenunciaConMenosDe20CaracteresYMenosDe3PalabrasDeberiaSerNoValida(){
		var denunciante = denunciaConMenosDe20CaracteresYMenosde3Palabras.denunciante
		var denunciado = denunciaConMenosDe20CaracteresYMenosde3Palabras.denunciado
		
		Assert.assertTrue(denunciante.denunciasRecibidas.isEmpty)
		
		try{
			denunciaConMasDe20CaracteresYMasde3Palabras.denunciar(denunciado, denunciante)
		}catch (DenunciaInvalidaException e){
			Assert.assertFalse(denunciante.denunciasRecibidas.isEmpty)
		}
	}
	
}