package com.example.pivanic.duelodeleyendas;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.app.AppCompatDialogFragment;

import com.example.pivanic.duelodeleyendas.model.Estadistica;
import com.example.pivanic.duelodeleyendas.model.Personaje;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasConnect;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasService;

import retrofit.Call;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;

public class EstadisticasDialog extends AppCompatActivity {

    Estadistica estadistica;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        int idPj = getIntent().getIntExtra(PersonajeDetailFragment.ARG_ITEM_ID,0);
        obtenerEstadisticaDePj(idPj);
        setContentView(R.layout.activity_estadisticas_dialog);
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

