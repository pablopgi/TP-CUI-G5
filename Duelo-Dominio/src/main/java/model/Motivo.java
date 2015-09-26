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
	},	FEED_INTENCIONAL {
		@Override
		public String getDescripcion() {
			return null;
		}

		@Override
		public Integer getPenalizacion() {
			return null;
		}
	};	
	public abstract String getDescripcion();
	public abstract Integer getPenalizacion()

}
