package com.example.pivanic.duelodeleyendas;

import android.app.AlertDialog;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v7.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.view.View;
import android.support.v4.app.NavUtils;
import android.view.MenuItem;
import android.widget.ImageView;

import com.example.pivanic.duelodeleyendas.adapter.AvatarAdapter;
import com.example.pivanic.duelodeleyendas.model.Estadistica;
import com.example.pivanic.duelodeleyendas.model.Personaje;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasConnect;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasService;

import retrofit.Call;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;

/**
 * An activity representing a single Personaje detail screen. This
 * activity is only used on handset devices. On tablet-size devices,
 * item details are presented side-by-side with a list of items
 * in a {@link PersonajeListActivity}.
 * <p/>
 * This activity is mostly just a 'shell' activity containing nothing
 * more than a {@link PersonajeDetailFragment}.
 */
public class PersonajeDetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_personaje_detail);
        Toolbar toolbar = (Toolbar) findViewById(R.id.detail_toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), EstadisticasDialog.class);
                int idPj = ((Personaje) getIntent().getSerializableExtra(PersonajeDetailFragment.ARG_ITEM_ID)).getId();
                intent.putExtra(PersonajeDetailFragment.ARG_ITEM_ID, idPj);
                startActivity(intent);
            }
        });

        // savedInstanceState is non-null when there is fragment state
        // saved from previous configurations of this activity
        // (e.g. when rotating the screen from portrait to landscape).
        // In this case, the fragment will automatically be re-added
        // to its container so we don't need to manually add it.
        // For more information, see the Fragments API guide at:
        //
        // http://developer.android.com/guide/components/fragments.html
        //
        if (savedInstanceState == null) {
            // Create the detail fragment and add it to the activity
            // using a fragment transaction.
            Bundle arguments = new Bundle();

            arguments.putSerializable(PersonajeDetailFragment.ARG_ITEM_ID,
                    getIntent().getSerializableExtra(PersonajeDetailFragment.ARG_ITEM_ID));

            PersonajeDetailFragment fragment = new PersonajeDetailFragment();

            fragment.setArguments(arguments);
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.personaje_detail_container, fragment)
                    .commit();
        }
    }

    public void setToolBarAndButton(Personaje personaje) {
        CollapsingToolbarLayout appBarLayout = (CollapsingToolbarLayout) this.findViewById(R.id.toolbar_layout);
        if (appBarLayout != null ) {
            appBarLayout.setTitle(personaje.toString());
            ImageView imgPj = ((ImageView) appBarLayout.findViewById(R.id.imgPj));
            imgPj.setImageDrawable(getResources().getDrawable(new AvatarAdapter().getAvatar(personaje)));
        } else {
            this.setTitle(personaje.toString());
            ImageView imgPj = ((ImageView) this.findViewById(R.id.imgPj));
            imgPj.setImageDrawable(getResources().getDrawable(new AvatarAdapter().getAvatar(personaje)));
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == android.R.id.home) {
            // This ID represents the Home or Up button. In the case of this
            // activity, the Up button is shown. Use NavUtils to allow users
            // to navigate up one level in the application structure. For
            // more details, see the Navigation pattern on Android Design:
            //
            // http://developer.android.com/design/patterns/navigation.html#up-vs-back
            //
            NavUtils.navigateUpTo(this, new Intent(this, PersonajeListActivity.class));
            return true;
        }
        return super.onOptionsItemSelected(item);
    }


}
