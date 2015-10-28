angular.module('dueloDeLeyendasApp')
	.service('DueloDeLeyendasService', function(){
		this.datosJuego = function() {
			return {
				'posicionesPosibles' : [ 'TOP', 'BOT', 'MID', 'JUNGLE'],
				'personajes' : [
			        {
			            'dir':'resources/amumu.png',
			            'nombre':'Amumu',
			            'fulldir':'resources/amumuFull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicion':'Jungle'
			        } , {
			            'dir':'resources/riki.png',
			            'nombre':'Riki',
			            'fulldir':'resources/rikiFull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicion':'Jungle'
			        } , {
			            'dir':'resources/amumu.png',
			            'nombre':'Amumu',
			            'fulldir':'resources/amumuFull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicion':'Jungle'
			        } , {
			            'dir':'resources/riki.png',
			            'nombre':'Riki',
			            'fulldir':'resources/rikiFull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicion':'Jungle'
			        } , {
				        'dir':'resources/amumu.png',
			            'nombre':'Amumu',
			            'fulldir':'resources/amumuFull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicion':'Jungle'
			        } , {
			            'dir':'resources/riki.png',
			            'nombre':'Riki',
			            'fulldir':'resources/rikiFull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicion':'Jungle'
			        } , {
			            'dir':'resources/amumu.png',
			            'nombre':'Amumu',
			            'fulldir':'resources/amumuFull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicion':'Jungle'
			        } , {
			            'dir':'resources/riki.png',
			            'nombre':'Riki',
			            'fulldir':'resources/rikiFull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicion':'Jungle'
			        }
		    	]
			};
		}
	});