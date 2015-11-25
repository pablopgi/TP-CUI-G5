package com.example.pivanic.duelodeleyendas.model;

public class EstadisticaDatoParticular {

    public String nombre;
    public String valor;

    public EstadisticaDatoParticular(){}

    public EstadisticaDatoParticular(String nombre, String valor){
        setNombre(nombre);
        setValor(valor);
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public void setValor(String valor){
        this.valor = valor;
    }

    public String getNombre(){
        return nombre;
    }

    public String getValor(){
        return valor;
    }

}
