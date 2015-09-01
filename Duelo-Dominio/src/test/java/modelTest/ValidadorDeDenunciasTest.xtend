package modelTest

import org.junit.Test
import org.junit.Assert
import static model.ValidadorDeDenuncias.*

class ValidadorDeDenunciasTest extends AbstractTest{
	
	@Test
	def void unaDenunciaConMasDe20CaracteresYMasDe3PalabrasDeberiaSerValida(){
		Assert.assertTrue( validar(denunciaConMasDe20CaracteresYMasde3Palabras));
	}
	
	@Test
	def void unaDenunciaConMenosDe20CaracteresYMasDe3PalabrasDeberiaSerNoValida(){
		Assert.assertFalse( validar(denunciaConMenosDe20CaracteresYMasde3Palabras));
	}
	
	@Test
	def void unaDenunciaConMasDe20CaracteresYMenosDe3PalabrasDeberiaSerNoValida(){
		Assert.assertFalse( validar(denunciaConMenosDe20CaracteresYMenosde3Palabras));
	}
	
	@Test
	def void unaDenunciaConMenosDe20CaracteresYMenosDe3PalabrasDeberiaSerNoValida(){
		Assert.assertFalse( validar(denunciaConMenosDe20CaracteresYMenosde3Palabras));
	}
	
}