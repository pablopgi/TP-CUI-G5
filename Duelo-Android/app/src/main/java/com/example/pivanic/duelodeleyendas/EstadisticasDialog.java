package com.example.pivanic.duelodeleyendas;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

import com.example.pivanic.duelodeleyendas.model.Estadistica;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasConnect;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasService;

import retrofit.Call;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;

public class EstadisticasDialog extends AppCompatActivity {

    Estadistica estadistica = new Estadistica();
    String namePj = "";
    int idPj;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_estadisticas_dialog);

        idPj = getIntent().getIntExtra("idPj", 0);
        namePj = getIntent().getStringExtra("nombrePj");
        obtenerEstadisticaDePj(idPj);

        ((TextView) this.findViewById(R.id.coso)).setText("cosito");


    }

    private void obtenerEstadisticaDePj(int idPj){
        DueloDeLeyendasService ddlService = new DueloDeLeyendasConnect().getService();
        Call<Estadistica> estadisticaPj = ddlService.getEstadisticaPersonaje(idPj);
        estadisticaPj.enqueue(new Callback<Estadistica>() {

            @Override
            public void onResponse(Response<Estadistica> response, Retrofit retrofit) {
                estadistica = response.body();
            }

            @Override
            public void onFailure(Throwable t) {
                // TODO: 25/11/15
            }
        });
    }

}

