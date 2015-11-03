angular.module('dueloDeLeyendasApp')
  .controller('DueloDeLeyendasCtrl', function($scope, DueloDeLeyendasService) {

    $scope.idPlayer = 0;
    var datosJuego = DueloDeLeyendasService.datosJuego($scope.idPlayer)

    $scope.pjs = datosJuego.personajes;
    $scope.posicionesPosibles = datosJuego.posicionesPosibles;


    $scope.decision = { idUsuario : $scope.idPlayer };

	$scope.refreshPj = function(pj) {
		$scope.pjSeleccionado = pj
        $scope.decision.idPjSeleccionado = pj.id
        $scope.estadisticaPjActual = DueloDeLeyendasService.estadisticaPj(pj)
	};

    $scope.jugar = function(pos) {
        $scope.decision.posicionSeleccionado = pos;
        $scope.resultadoPartida = DueloDeLeyendasService.jugar($scope.decision)
        $("#dueloModal").modal();
    }

    $scope.retarMrX = function(){
        $scope.resultadoPartida = DueloDeLeyendasService.jugarContraMrX();
    };
    
  });