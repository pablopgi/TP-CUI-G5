package com.example.pivanic.duelodeleyendas.service;

import retrofit.Retrofit;

public class DueloDeLeyendasConnect {

    String SERVER_IP = "10.0.2.2"; //Para comunicarse en el emulador de Android Studio
    String SERVER_IP_GENY = "192.168.56.1"; //Para comunicarse con el localhost en el emulador de Genymotion
    String API_URL = "http://" + SERVER_IP_GENY + ":9000";

    public DueloDeLeyendasService getService(){
        Retrofit restAdapter = new Retrofit.Builder().baseUrl(API_URL).build();
        return restAdapter.create(DueloDeLeyendasService.class);
    }

}
