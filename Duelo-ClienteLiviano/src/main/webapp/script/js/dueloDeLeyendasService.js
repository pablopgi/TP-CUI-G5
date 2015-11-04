angular.module('dueloDeLeyendasApp')
	.service('DueloDeLeyendasService', function($http){

        this.datosJuego = function(idPlayer, callback) {
            $http.get('/del/' + idPlayer)
            	.success(callback)
            	.error(function(error){
            		alert('Error al recibir datos de juego');
            	});
        }

        this.jugar = function(decision, callback) {
            $http.post('/del/', decision)
            	.success(callback)
            	.error(function(error){
            		alert('Error al procesar el duelo')
            	});
        }

        this.jugarContraMrx = function(callback) {
            $http.get('/del/mrx')
            	.success(callback)
            	.error(function(error){
            		alert('Error en el duelo con MrX')
            	});
        }

        this.estadisticaPj = function(pj, callback) {
            $http.get('/del/estPj/' + pj.id)
            	.success(callback)
            	.error(function(error){
            		alert('Error en las estadisticas')
            	});
        }
/*
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
			            'dir':'resources/Amumu.png',
			            'nombre':'Amumu',
			            'fulldir':'resources/Amumufull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/Riki.png',
			            'nombre':'Riki',
			            'fulldir':'resources/Rikifull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/Axe.png',
			            'nombre':'Axe',
			            'fulldir':'resources/Axefull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/Tryndamere.png',
			            'nombre':'Tryndamere',
			            'fulldir':'resources/Tryndamerefull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicionIdeal':'Jungle'
			        } , {
				        'dir':'resources/Drow Ranger.png',
			            'nombre':'Drow Ranger',
			            'fulldir':'resources/Drow Rangerfull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/Death Prophet.png',
			            'nombre':'Death Prophet',
			            'fulldir':'resources/Death Prophetfull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicionIdeal':'Jungle'
			        } , {
			            'dir':'resources/LeeSin.png',
			            'nombre':'Lee Sin',
			            'fulldir':'resources/Lee Sinfull.jpg',
			            'especialidades':['Poder de Defensa','Poder de Habilidad'],
			            'debilidades':['Poder de Habilidad'],
			            'posicion':'Jungle'
			        } , {
			            'dir':'resources/Fiddlesticks.png',
			            'nombre':'Fiddlesticks',
			            'fulldir':'resources/Fiddlesticksfull.jpg',
			            'especialidades':['Poder de Habilidad'],
			            'debilidades':['Resistencia Magica', 'Control de Masas'],
			            'posicion':'Jungle'
			        }
		    	]
			};
		}*/
	});