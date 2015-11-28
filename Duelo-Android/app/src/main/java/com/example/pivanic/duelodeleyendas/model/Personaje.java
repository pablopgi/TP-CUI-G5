package com.example.pivanic.duelodeleyendas.model;

import java.io.Serializable;
import java.util.List;

public class Personaje implements Serializable {
    Integer id;
    String nombre;
    Posicion posicionIdeal;
    List<Caracteristica> especialidades;
    List<Caracteristica> debilidades;

    public Personaje(){}

    public Personaje(Integer id, String name){
        this.id = id;
        this.nombre = name;
    }

    public String toString(){ return nombre; }

    public Integer getId(){ return id; }
    public void setId(Integer id) { this.id = id; }

    public String getName() { return nombre; }
    public void setName(String name) { this.nombre = name; }

    public Posicion getPosicionIdeal() { return posicionIdeal; }
    public void setPosicionIdeal(Posicion posicionIdeal) { this.posicionIdeal = posicionIdeal; }

    public List<Caracteristica> getEspecialidades() { return especialidades; }
    public void setEspecialidades(List<Caracteristica> especialidades) { this.especialidades = especialidades; }

    public List<Caracteristica> getDebilidades() { return debilidades; }
    public void setDebilidades(List<Caracteristica> debilidades) { this.debilidades = debilidades; }


    public String getAvatar() {
        return nombre.toLowerCase().replace(" ", "_");
    }
}
