package com.example.pivanic.duelodeleyendas.service;

import com.example.pivanic.duelodeleyendas.model.Estadistica;
import com.example.pivanic.duelodeleyendas.model.Personaje;

import java.util.List;

import retrofit.Call;
import retrofit.http.GET;
import retrofit.http.Path;

/**
 * Created by jejo on 25/11/15.
 */
public interface DueloDeLeyendasService {

    @GET("del/{idJugador}")
    public Call<List<Personaje>> getDatosJuego(@Path("idJugador") String idJugador);

    @GET("del/estPj/{idPj}")
    public Call<Estadistica> getEstadisticaPersonaje(@Path("idPj") String idPj);
}
