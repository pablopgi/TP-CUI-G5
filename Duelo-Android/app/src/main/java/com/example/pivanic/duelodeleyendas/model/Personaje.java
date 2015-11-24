package com.example.pivanic.duelodeleyendas.model;

/**
 * Created by Morlock on 24/11/2015.
 */
public class Personaje {
    Integer id;
    String name;

    public Personaje(Integer id, String name){

        this.id = id;
        this.name = name;

    }

    public String toString(){
        return name;
    }

    public Integer getId(){
        return id;
    }

}
