angular.module('dueloDeLeyendasApp')
  .controller('DueloDeLeyendasCtrl', function($scope, $http, DueloDeLeyendasService) {

    $scope.idPlayer = 0;
    $scope.obtenerDatosJuego = function() {
        DueloDeLeyendasService.datosJuego($scope.idPlayer,
            function(data) { $scope.pjs = data.personajes;
                             $scope.posicionesPosibles = data.posicionesPosibles;
                           }
        );
    }
    $scope.obtenerDatosJuego();

    $scope.decision = { idUsuario : $scope.idPlayer };

	$scope.refreshPj = function(pj) {
		$scope.pjSeleccionado = pj
        $scope.decision.idPjSeleccionado = pj.id
        DueloDeLeyendasService.estadisticaPj(pj, function(data) {
            console.log(data);
            $scope.estadisticaPjActual = data;
        })
	};

    $scope.jugar = function(pos) {
        $scope.decision.posicionSeleccionado = pos;
        DueloDeLeyendasService.jugar($scope.decision, function(data) {
            $scope.ganador = data.ganador;
            $scope.perdedor = data.perdedor;
            $scope.noRival = data.noRival;
            $scope.nombrePjRetador = data.nombrePjRetador;
            $scope.ataqueRetador = data.ataqueRetador;
            $scope.estadisticaRetador = data.estadisticaRetador;
            $scope.nombrePjRetado = data.nombrePjRetado;
            $scope.ataqueRetado = data.ataqueRetado;
            $scope.nombreJugadorRetado = data.nombreJugadorRetado;
            $scope.estadisticaRetado = data.estadisticaRetado;
        })
        $("#dueloModal").modal();
    };

    $scope.retarMrX = function(){
        DueloDeLeyendasService.jugarContraMrx(function(data){
            $scope.ganador = data.ganador;
            $scope.perdedor = data.perdedor;
            $scope.noRival = data.noRival;
            $scope.nombrePjRetador = data.nombrePjRetador;
            $scope.ataqueRetador = data.ataqueRetador;
            $scope.estadisticaRetador = data.estadisticaRetador;
            $scope.nombrePjRetado = data.nombrePjRetado;
            $scope.ataqueRetado = data.ataqueRetado;
            $scope.nombreJugadorRetado = data.nombreJugadorRetado;
            $scope.estadisticaRetado = data.estadisticaRetado;
        });
    };

  });