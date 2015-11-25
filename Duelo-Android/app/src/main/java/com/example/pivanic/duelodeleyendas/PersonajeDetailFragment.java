package com.example.pivanic.duelodeleyendas;

import android.app.Activity;
import android.support.design.widget.CollapsingToolbarLayout;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.pivanic.duelodeleyendas.adapter.AvatarAdapter;
import com.example.pivanic.duelodeleyendas.dummy.DummyContent;
import com.example.pivanic.duelodeleyendas.model.Personaje;

/**
 * A fragment representing a single Personaje detail screen.
 * This fragment is either contained in a {@link PersonajeListActivity}
 * in two-pane mode (on tablets) or a {@link PersonajeDetailActivity}
 * on handsets.
 */
public class PersonajeDetailFragment extends Fragment {
    /**
     * The fragment argument representing the item ID that this fragment
     * represents.
     */
    public static final String ARG_ITEM_ID = "item_id";

    /**
     * The dummy content this fragment is presenting.
     */
    private Personaje personaje;

    /**
     * Mandatory empty constructor for the fragment manager to instantiate the
     * fragment (e.g. upon screen orientation changes).
     */
    public PersonajeDetailFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (getArguments().containsKey(ARG_ITEM_ID)) {
            // Load the dummy content specified by the fragment
            // arguments. In a real-world scenario, use a Loader
            // to load content from a content provider.
            personaje = (Personaje) getArguments().get(ARG_ITEM_ID);


            Activity activity = this.getActivity();
            CollapsingToolbarLayout appBarLayout = (CollapsingToolbarLayout) activity.findViewById(R.id.toolbar_layout);
            if (appBarLayout != null ) {
                appBarLayout.setTitle(personaje.toString());
                ImageView imgPj = ((ImageView) appBarLayout.findViewById(R.id.imgPj));
                imgPj.setImageDrawable(getResources().getDrawable(new AvatarAdapter().getAvatar(personaje)));
            } else {
                activity.setTitle(personaje.toString());
                ImageView imgPj = ((ImageView) activity.findViewById(R.id.imgPj));
                imgPj.setImageDrawable(getResources().getDrawable(new AvatarAdapter().getAvatar(personaje)));
            }
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_personaje_detail, container, false);

        // Show the dummy content as text in a TextView.
        if (personaje == null) {
            ((TextView) rootView.findViewById(R.id.lblPersonajeSelect)).setText(personaje.toString());
            ImageView imgPj = ((ImageView) rootView.findViewById(R.id.imgPj));
            imgPj.setImageDrawable(getResources().getDrawable(new AvatarAdapter().getAvatar(personaje)));
        }

        return rootView;
    }
}
