package com.example.pivanic.duelodeleyendas;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;
import android.widget.Toast;

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

        namePj = getIntent().getStringExtra("nombrePj");
        setTitle(namePj);

        idPj = getIntent().getIntExtra("idPj", 0);
        obtenerEstadisticaDePj(idPj);

        // Disabling 'back' button in toolbar
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(false);
        }

    }

    private void obtenerEstadisticaDePj(int idPj){
        DueloDeLeyendasService ddlService = new DueloDeLeyendasConnect().getService();
        Call<Estadistica> estadisticaPj = ddlService.getEstadisticaPersonaje(idPj);
        estadisticaPj.enqueue(new Callback<Estadistica>() {

            @Override
            public void onResponse(Response<Estadistica> response, Retrofit retrofit) {
                ((ListView) findViewById(R.id.estadisticas_list)).setAdapter(new EstadisticaDatoParticularAdapter(getBaseContext(), response.body().getEstadisticasDatoParticular()));
            }

            @Override
            public void onFailure(Throwable t) {
                Toast.makeText(getBaseContext(), "Sin estadistica dispinible", Toast.LENGTH_LONG).show();
            }
        });
    }
}