package com.example.pivanic.duelodeleyendas.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.example.pivanic.duelodeleyendas.R;
import com.example.pivanic.duelodeleyendas.model.EstadisticaDatoParticular;

import java.util.ArrayList;

public class EstadisticaDatoParticularAdapter extends BaseAdapter {
    private static ArrayList<EstadisticaDatoParticular> estadisticas;

    private LayoutInflater mInflater;

    public EstadisticaDatoParticularAdapter(Context context, ArrayList<EstadisticaDatoParticular> estadist) {
        estadisticas = estadist;
        mInflater = LayoutInflater.from(context);
    }

    public int getCount() {
        return estadisticas.size();
    }

    public Object getItem(int position) {
        return estadisticas.get(position);
    }

    public long getItemId(int position) {
        return position;
    }

    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;
        if (convertView == null) {
            convertView = mInflater.inflate(R.layout.row_estadistica_dialog, null);
            holder = new ViewHolder();
            holder.nombre = (TextView) convertView.findViewById(R.id.tipo_dato);
            holder.valor = (TextView) convertView.findViewById(R.id.valor_dato);

            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }

        holder.nombre.setText(estadisticas.get(position).getNombre());
        holder.valor.setText(estadisticas.get(position).getValor());

        return convertView;
    }

    static class ViewHolder {
        TextView nombre;
        TextView valor;
    }
}