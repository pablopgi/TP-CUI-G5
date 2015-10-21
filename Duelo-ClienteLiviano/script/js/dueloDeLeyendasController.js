angular.module('dueloDeLeyendasApp', [])
  .controller('DueloDeLeyendasCtrl', function($scope) {
    var main = this;

    main.fullImage = 'resources/amumuFull.png';

	$scope.pjs = [
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
    ];

  $scope.habilidades = [
        {'dir':'resources/AmumuSquare.png','nombre':'Amumu','fulldir':'resources/AmumuFull.jpg'},
        {'dir':'resources/hero-rikimaru.png','nombre':'Riki','fulldir':'resources/rikiFull.jpg'},
        {'dir':'resources/AmumuSquare.png','nombre':'Amumu','fulldir':'resources/AmumuSquare.png'},
        {'dir':'resources/hero-rikimaru.png','nombre':'Riki','fulldir':'resources/hero-rikimaru.png'}
    ];    

	$scope.refreshPj = function(pj) {
		$scope.nombrePj = pj.nombre;
		$scope.fullImage = pj.fulldir;
        $scope.especialidadesPj = pj.especialidades
        $scope.debilidadesPj = pj.debilidades
        $scope.posicionPj = pj.posicion
	};

    $scope.resultadoBool = function() {
        return false;
    }
    
  });
