package com.example.pivanic.duelodeleyendas;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;

import com.example.pivanic.duelodeleyendas.model.Personaje;


/**
 * An activity representing a list of Personajes. This activity
 * has different presentations for handset and tablet-size devices. On
 * handsets, the activity presents a list of items, which when touched,
 * lead to a {@link PersonajeDetailActivity} representing
 * item details. On tablets, the activity presents the list of items and
 * item details side-by-side using two vertical panes.
 * <p/>
 * The activity makes heavy use of fragments. The list of items is a
 * {@link PersonajeListFragment} and the item details
 * (if present) is a {@link PersonajeDetailFragment}.
 * <p/>
 * This activity also implements the required
 * {@link PersonajeListFragment.Callbacks} interface
 * to listen for item selections.
 */
public class PersonajeListActivity extends AppCompatActivity
        implements PersonajeListFragment.Callbacks {

    /**
     * Whether or not the activity is in two-pane mode, i.e. running on a tablet
     * device.
     */
    private boolean esTablet;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_personaje_app_bar);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle(getTitle());

        if (estoyEnUnaTablet()) {
            habilitarModoTablet();
        }

    }

    private boolean estoyEnUnaTablet() {
        return findViewById(R.id.personaje_detail_container) != null;
    }

    private void habilitarModoTablet() {
        esTablet = true;
        ((PersonajeListFragment) getSupportFragmentManager()
                .findFragmentById(R.id.personaje_list))
                .setActivateOnItemClick(true);
    }

    /**
     * Callback method from {@link PersonajeListFragment.Callbacks}
     * indicating that the item with the given ID was selected.
     */
    @Override
    public void onItemSelected(Personaje pj) {
        if (esTablet) {
            // In two-pane mode, show the detail view in this activity by
            // adding or replacing the detail fragment using a
            // fragment transaction.
            Bundle arguments = new Bundle();
            arguments.putSerializable(PersonajeDetailFragment.ARG_ITEM_ID, pj);
            PersonajeDetailFragment fragment = new PersonajeDetailFragment();
            fragment.setArguments(arguments);
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.personaje_detail_container, fragment)
                    .commit();

        } else {
            // In single-pane mode, simply start the detail activity
            // for the selected item ID.
            Intent detailIntent = new Intent(this, PersonajeDetailActivity.class);
            detailIntent.putExtra(PersonajeDetailFragment.ARG_ITEM_ID, pj);
            startActivity(detailIntent);
        }
    }

}
