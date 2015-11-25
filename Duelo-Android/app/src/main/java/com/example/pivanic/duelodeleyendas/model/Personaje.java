package com.example.pivanic.duelodeleyendas.model;

import java.io.Serializable;

/**
 * Created by Morlock on 24/11/2015.
 */
public class Personaje implements Serializable {
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

    public String getAvatar() {
        return name.toLowerCase();
    }
}
