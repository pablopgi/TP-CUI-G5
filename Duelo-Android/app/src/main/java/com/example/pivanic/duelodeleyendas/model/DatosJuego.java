package com.example.pivanic.duelodeleyendas.model;

import java.util.List;

public class DatosJuego {
    List<Posicion> posicionesPosibles;
    List<Personaje> personajes;

    public DatosJuego() {}

    public void setPosicionesPosibles(List<Posicion> posicionesPosibles){
        this.posicionesPosibles = posicionesPosibles;
    }

    public List<Posicion> getPosicionesPosibles(){
        return posicionesPosibles;
    }

    public List<Personaje> getPersonajes(){
        return personajes;
    }

    public void setPersonajes(List<Personaje> personajes){
        this.personajes = personajes;
    }

}