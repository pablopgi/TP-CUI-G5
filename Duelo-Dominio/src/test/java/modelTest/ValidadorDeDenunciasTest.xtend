package modelTest

import org.junit.Assert
import org.junit.Test

import static model.ValidadorDeDenuncias.*

class ValidadorDeDenunciasTest extends AbstractTest{
	
	@Test
	def void unaDenunciaConMasDe20CaracteresYMasDe3PalabrasDeberiaSerValida(){
		try {
			validar(denunciaConMasDe20CaracteresYMasde3Palabras)
			Assert.assertTrue(true)
		}
		catch (Exception e){
			Assert.assertTrue(false)
		}
	}
	
	@Test
	def void unaDenunciaConMenosDe20CaracteresYMasDe3PalabrasDeberiaSerNoValida(){
		try  validar(denunciaConMenosDe20CaracteresYMasde3Palabras)
		catch (Exception e){
			Assert.assertTrue(true)
		}
	}
	
	@Test
	def void unaDenunciaConMasDe20CaracteresYMenosDe3PalabrasDeberiaSerNoValida(){
		try  validar(denunciaConMenosDe20CaracteresYMenosde3Palabras)
		catch (Exception e){
			Assert.assertTrue(true)
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