package com.example.pivanic.duelodeleyendas.model;

import java.util.List;

public class Estadistica {

    List<EstadisticaDatoParticular> estadisticaParticular;

    public Estadistica(){}

    public Estadistica(List<EstadisticaDatoParticular> estadisticas){
        setEstadisticaParticular(estadisticas);
    }

    public void setEstadisticaParticular(List<EstadisticaDatoParticular> estadisticas){
        estadisticaParticular = estadisticas;
    }

    public List<EstadisticaDatoParticular> getEstadisticasDatoParticular(){
        return estadisticaParticular;
    }

}
