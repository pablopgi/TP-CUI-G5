package com.example.pivanic.duelodeleyendas.model;

import java.util.List;

public class Estadistica {

    List<EstadisticaDatoParticular> estadistica;

    public Estadistica(){}

    public Estadistica(List<EstadisticaDatoParticular> estadisticas){
        setEstadisticaParticular(estadisticas);
    }

    public void setEstadisticaParticular(List<EstadisticaDatoParticular> estadisticas){
        estadistica = estadisticas;
    }

    public List<EstadisticaDatoParticular> getEstadisticasDatoParticular(){
        return estadistica;
    }

}
