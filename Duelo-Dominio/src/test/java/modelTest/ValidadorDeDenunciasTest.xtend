package modelTest

import org.junit.Assert
import org.junit.Test

import static model.ValidadorDeDenuncias.*
import model.DenunciaInvalidaException

class ValidadorDeDenunciasTest extends AbstractTest{
	
	@Test
	def void unaDenunciaConMasDe20CaracteresYMasDe3PalabrasDeberiaSerValida(){
		validar(denunciaConMasDe20CaracteresYMasde3Palabras)
	}
	
	@Test
	def void unaDenunciaConMenosDe20CaracteresYMasDe3PalabrasDeberiaSerNoValida(){
		try{
			validar(denunciaConMenosDe20CaracteresYMasde3Palabras)
			Assert.fail("Tenia menos de 20 caracteres, no deberia ser valida")
		}catch (DenunciaInvalidaException e){
			
		}
	}
	
	@Test
	def void unaDenunciaConMasDe20CaracteresYMenosDe3PalabrasDeberiaSerNoValida(){
		try {
			validar(denunciaConMenosDe20CaracteresYMenosde3Palabras)
			Assert.fail("Tenia menos de 3 palabras, no deberia ser valida")
		} 
		catch (DenunciaInvalidaException e){

		}
	}
	
	@Test
	def void unaDenunciaConMenosDe20CaracteresYMenosDe3PalabrasDeberiaSerNoValida(){
		try  validar(denunciaConMenosDe20CaracteresYMenosde3Palabras)
		catch (Exception e){
			Assert.assertTrue(true)
		}
	}
	
}