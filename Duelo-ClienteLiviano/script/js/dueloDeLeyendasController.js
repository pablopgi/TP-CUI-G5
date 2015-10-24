angular.module('dueloDeLeyendasApp')
  .controller('DueloDeLeyendasCtrl', function($scope, DueloDeLeyendasService) {
    var main = this;

    var datosJuego = DueloDeLeyendasService.datosJuego()

    $scope.pjs = datosJuego.personajes;
    $scope.posicionesPosibles = datosJuego.posicionesPosibles;

	$scope.refreshPj = function(pj) {
		$scope.nombrePj = pj.nombre;
		$scope.fullImage = pj.fulldir;
        $scope.especialidadesPj = pj.especialidades
        $scope.debilidadesPj = pj.debilidades
        $scope.posicionPj = pj.posicion
	};

    $scope.resultadoBool = function() {
        return false;
    };
    
  });
