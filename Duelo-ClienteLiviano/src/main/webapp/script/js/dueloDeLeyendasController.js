angular.module('dueloDeLeyendasApp')
  .controller('DueloDeLeyendasCtrl', function($scope, DueloDeLeyendasService) {
    var main = this;

    var datosJuego = DueloDeLeyendasService.datosJuego()

    $scope.pjs = datosJuego.personajes;
    $scope.posicionesPosibles = datosJuego.posicionesPosibles;

    $scope.pjSeleccionado;
    $scope.estadisticaPjActual = DueloDeLeyendasService.estadisticaPj();

    $scope.resultadoPartida = DueloDeLeyendasService.resultadoPartida();

	$scope.refreshPj = function(pj) {
		$scope.pjSeleccionado = pj
	};

    $scope.retarMrX = function(){
        $scope.noRival = false;
        $scope.ganador = false;
        $scope.perdedor = true;
    };

    $scope.jugar = function(pos) {
        $("#dueloModal").modal();
    }

    $scope.ganador = false;
    $scope.perdedor = false;

    $scope.noRival = true;
    
  });
