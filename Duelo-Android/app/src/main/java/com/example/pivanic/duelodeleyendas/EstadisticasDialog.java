package com.example.pivanic.duelodeleyendas;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;
import android.widget.TextView;

import com.example.pivanic.duelodeleyendas.adapter.EstadisticaDatoParticularAdapter;
import com.example.pivanic.duelodeleyendas.model.Estadistica;
import com.example.pivanic.duelodeleyendas.model.EstadisticaDatoParticular;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasConnect;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasService;

import java.util.ArrayList;

import retrofit.Call;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;

public class EstadisticasDialog extends AppCompatActivity {

    private ArrayList<EstadisticaDatoParticular> estadisticas = new ArrayList<>();
    private String namePj = "";
    private int idPj = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_estadisticas_dialog);

        idPj = getIntent().getIntExtra("idPj", 0);
        namePj = getIntent().getStringExtra("nombrePj");
        obtenerEstadisticaDePj(idPj);

        ((TextView) this.findViewById(R.id.coso)).setText("cosito");
        setTitle(namePj);

        ((ListView) findViewById(R.id.estadisticas_list)).setAdapter(new EstadisticaDatoParticularAdapter(this, estadisticas));

        java.lang.System.out.println("La concha de la lora");
    }

    /*
    @Override
    protected void onStart(){
        super.onStart();

        ((TextView) this.findViewById(R.id.coso)).setText("cosito");
        setTitle(namePj);

        setValuesInTable();
    }
*/

    private void obtenerEstadisticaDePj(int idPj){
        DueloDeLeyendasService ddlService = new DueloDeLeyendasConnect().getService();
        Call<Estadistica> estadisticaPj = ddlService.getEstadisticaPersonaje(idPj);
        estadisticaPj.enqueue(new Callback<Estadistica>() {

            @Override
            public void onResponse(Response<Estadistica> response, Retrofit retrofit) {
                estadisticas.clear();
                Estadistica est = response.body();
                estadisticas.addAll(est.getEstadisticasDatoParticular());
            }

            @Override
            public void onFailure(Throwable t) {
                // TODO: 25/11/15
            }
        });
    }
}