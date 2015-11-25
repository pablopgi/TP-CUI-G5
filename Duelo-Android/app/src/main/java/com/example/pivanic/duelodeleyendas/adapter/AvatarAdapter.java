package com.example.pivanic.duelodeleyendas.adapter;

import com.example.pivanic.duelodeleyendas.R;
import com.example.pivanic.duelodeleyendas.model.Personaje;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Morlock on 25/11/2015.
 */
public class AvatarAdapter {

    static Map<String, Integer> mapaAvatares;

    private Map<String, Integer> getMapaAvatares() {
        if (mapaAvatares == null) {
            mapaAvatares = new HashMap<String, Integer>();
            mapaAvatares.put("Amumu", R.drawable.amumu);

        }
        return mapaAvatares;
    }

    public int getAvatar(Personaje personaje) {
        Integer result = getMapaAvatares().get(personaje.getAvatar());
        if (result == null) {
            return R.drawable.amumu;
        }
        return result.intValue();
    }

}
