package com.example.pivanic.duelodeleyendas.adapter;

import android.app.Activity;

import com.example.pivanic.duelodeleyendas.R;
import com.example.pivanic.duelodeleyendas.model.Personaje;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Morlock on 25/11/2015.
 */
public class AvatarAdapter {

    public int getAvatar(Activity context, Personaje personaje) {
        return context.getResources().getIdentifier(personaje.getAvatar(), "drawable", context.getPackageName());
    }

}
