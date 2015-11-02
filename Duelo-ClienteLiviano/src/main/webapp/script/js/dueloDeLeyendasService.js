angular.module('dueloDeLeyendasApp')
	.service('DueloDeLeyendasService', function(){

		this.resultadoPartida = function() {

		};

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
			            'nombre':'Amumu',
			            'fulldir':'resources/amumuFull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/riki.png',
			            'nombre':'Riki',
			            'fulldir':'resources/rikiFull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/axe.png',
			            'nombre':'Axe',
			            'fulldir':'resources/axefull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/Tryndamere.png',
			            'nombre':'Tryndamere',
			            'fulldir':'resources/tryndamerefull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicionIdeal':'Jungle'
			        } , {
				        'dir':'resources/Drow Ranger.png',
			            'nombre':'Drow Ranger',
			            'fulldir':'resources/drowrangerfull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/Death Prophet.png',
			            'nombre':'Death Prophet',
			            'fulldir':'resources/deathprophefull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/Lee Sin.png',
			            'nombre':'Lee Sin',
			            'fulldir':'resources/leesinfull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicion':'Jungle'
			        } , {
			            'dir':'resources/Fiddlesticks.png',
			            'nombre':'Fiddlesticks',
			            'fulldir':'resources/fiddlesticksfull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicion':'Jungle'
			        }
		    	]
			};
		}
	});