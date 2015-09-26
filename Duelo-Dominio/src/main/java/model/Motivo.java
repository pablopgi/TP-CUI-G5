package model;

public enum Motivo {

	ABUSO_DE_HABILIDAD {
		@Override
		public String getDescripcion() {
			return "Abuso de Habilidad";
		}

		@Override
		public Integer getPenalizacion() {
			return 5;
		}
	},

	FEED_INTENCIONAL {
		@Override
		public String getDescripcion() {
			return "Feed Intencional";
		}

		@Override
		public Integer getPenalizacion() {
			return 10;
		}
	},
	Comunicacion_Abusiva {
		@Override
		public String getDescripcion() {
			return "Comunicacion Abusiva";
		}

		@Override
		public Integer getPenalizacion() {
			return 7;
		}
	},
	Abuso_Del_Sistema_De_Denuncias {
		@Override
		public String getDescripcion() {
			return "Abuso del Sistema de Denuncias";
		}

		@Override
		public Integer getPenalizacion() {
			return 25;
		}
	};

	public abstract String getDescripcion();

	public abstract Integer getPenalizacion();

}
