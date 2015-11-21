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
            $http.get('/del/mrx/')
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
	});