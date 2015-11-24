package com.example.pivanic.duelodeleyendas.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Morlock on 24/11/2015.
 */
public class Repo {

    static Repo repo;
    List<Personaje> pjs;

    public Repo(){
        pjs = new ArrayList<Personaje>();
    }

    public static Repo instance(){
        if(repo == null) {
           repo = new Repo();
           repo.addPj(new Personaje(0, "El Rodri de Varela"));
           repo.addPj(new Personaje(1, "el Pablo de Varela"));
        }
        return repo;
    }

    public void addPj(Personaje pj){
        pjs.add(pj);
    }

    public List<Personaje> pjs(){
        return pjs;
    }
}
