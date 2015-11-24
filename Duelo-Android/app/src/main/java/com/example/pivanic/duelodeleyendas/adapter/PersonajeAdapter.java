package com.example.pivanic.duelodeleyendas.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.example.pivanic.duelodeleyendas.R;
import com.example.pivanic.duelodeleyendas.model.Personaje;

import java.util.List;

/**
 * Created by Morlock on 24/11/2015.
 */
public class PersonajeAdapter extends ArrayAdapter<Personaje> {

    public PersonajeAdapter(Context context, List<Personaje> pjs) {
        super(context, R.layout.activity_personaje_list, pjs);
    }

    @Override
    public long getItemId(int position) {
        return getItem(position).getId();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View listView = inflater.inflate(R.layout.activity_personaje_list, parent, false);
        final Personaje personaje = getItem(position);

        TextView tvPj = (TextView) listView.findViewById(R.id.lblPersonaje);
        tvPj.setText(personaje.toString());

        return listView;
    }
}
