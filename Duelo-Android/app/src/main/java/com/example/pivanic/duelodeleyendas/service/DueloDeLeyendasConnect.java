package com.example.pivanic.duelodeleyendas.service;

import retrofit.GsonConverterFactory;
import retrofit.Retrofit;

public class DueloDeLeyendasConnect {

    String SERVER_IP = "10.12.7.11"; //Para comunicarse en el emulador de Android Studio
    String SERVER_IP_GENY = "192.168.56.1"; //Para comunicarse con el localhost en el emulador de Genymotion
    String API_URL = "http://" + SERVER_IP + ":9000";

    public DueloDeLeyendasService getService(){
        Retrofit restAdapter = new Retrofit.Builder().addConverterFactory(GsonConverterFactory.create()).baseUrl(API_URL).build();
        return restAdapter.create(DueloDeLeyendasService.class);
    }

}
