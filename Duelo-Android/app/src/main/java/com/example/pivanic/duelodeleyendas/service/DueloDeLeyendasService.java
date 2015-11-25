package com.example.pivanic.duelodeleyendas.service;

import com.example.pivanic.duelodeleyendas.model.DatosJuego;
import com.example.pivanic.duelodeleyendas.model.Estadistica;
import com.example.pivanic.duelodeleyendas.model.Personaje;

import java.util.List;

import retrofit.Call;
import retrofit.http.GET;
import retrofit.http.Path;

public interface DueloDeLeyendasService {

    @GET("del/{idJugador}")
    public Call<DatosJuego> getDatosJuego(@Path("idJugador") int idJugador);

    @GET("del/estPj/{idPj}")
    public Call<Estadistica> getEstadisticaPersonaje(@Path("idPj") int idPj);
}