angular.module('dueloDeLeyendasApp')
	.service('DueloDeLeyendasService', function(){

		this.estadisticaPj = function() {
			return [
					{
						'nombre' : 'Jugadas',
						'valor' : '1'
					} , {
						'nombre' : 'Ganadas',
						'valor' : '1'
					} , {
						'nombre' : 'Kills',
						'valor' : '1'
					} , {
						'nombre' : 'Assists',
						'valor' : '1'
					} , {
						'nombre' : 'Deads',
						'valor' : '1'
					} , {
						'nombre' : 'Mejor ubicacion',
						'valor' : 'TOP'
					} , {
						'nombre' : 'Puntaje',
						'valor' : 'S'
					}
			];
		}

		this.datosJuego = function() {
			return {
				'posicionesPosibles' : [ 'TOP', 'BOT', 'MID', 'JUNGLE'],
				'personajes' : [
			        {
			            'dir':'resources/amumu.png',
			            'nombre':'amumu',
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