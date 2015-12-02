package com.example.pivanic.duelodeleyendas;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import com.example.pivanic.duelodeleyendas.model.DatosJuego;
import com.example.pivanic.duelodeleyendas.model.Personaje;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasConnect;
import com.example.pivanic.duelodeleyendas.service.DueloDeLeyendasService;

import java.util.ArrayList;
import java.util.List;

import retrofit.Call;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;

/**
 * A list fragment representing a list of Personajes. This fragment
 * also supports tablet devices by allowing list items to be given an
 * 'activated' state upon selection. This helps indicate which item is
 * currently being viewed in a {@link PersonajeDetailFragment}.
 * <p/>
 * Activities containing this fragment MUST implement the {@link Callbacks}
 * interface.
 */
public class PersonajeListFragment extends ListFragment{

    public static int MIN_BUSQUEDA_PERSONAJE = 0;
    public List<Personaje> personajes = new ArrayList<>();
    /**
     * The serialization (saved instance state) Bundle key representing the
     * activated item position. Only used on tablets.
     */
    private static final String STATE_ACTIVATED_POSITION = "activated_position";

    /**
     * The fragment's current callback object, which is notified of list item
     * clicks.
     */
    private Callbacks mCallbacks = sDummyCallbacks;

    /**
     * The current activated item position. Only used on tablets.
     */
    private int mActivatedPosition = ListView.INVALID_POSITION;
    private int unIdJugadorHardcodeado = 0;


    /**
     * A callback interface that all activities containing this fragment must
     * implement. This mechanism allows activities to be notified of item
     * selections.
     */
    public interface Callbacks {
        /**
         * Callback for when an item has been selected.
         */
        public void onItemSelected(Personaje pj);
    }

    /**
     * A dummy implementation of the {@link Callbacks} interface that does
     * nothing. Used only when this fragment is not attached to an activity.
     */
    private static Callbacks sDummyCallbacks = new Callbacks() {
        @Override
        public void onItemSelected(Personaje pj) {
        }
    };

    /**
     * Mandatory empty constructor for the fragment manager to instantiate the
     * fragment (e.g. upon screen orientation changes).
     */
    public PersonajeListFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //Guardo los personajes en una variable de instancia
        getDatosJuego();

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_personaje_list, null, false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        // Restore the previously serialized activated item position.
        if (savedInstanceState != null
                && savedInstanceState.containsKey(STATE_ACTIVATED_POSITION)) {
            setActivatedPosition(savedInstanceState.getInt(STATE_ACTIVATED_POSITION));
        }

        // Comportamiento del título de búsqueda
        EditText tituloContiene = (EditText) this.getView().findViewById(R.id.pjBusqueda);
        tituloContiene.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable editable) {
                if (editable.length() >= MIN_BUSQUEDA_PERSONAJE) {
                    buscarPersonajeCoincidente();
                }
            }
        });
    }

    public void buscarPersonajeCoincidente(){

        EditText campoBusqueda = (EditText) this.getView().findViewById(R.id.pjBusqueda);
        String indice = campoBusqueda.getText().toString().toLowerCase();

        List<Personaje> coincidentes= new ArrayList<>();

        for (Personaje pj : personajes) {

          if (pj.getName().toLowerCase().startsWith(indice))
              coincidentes.add(pj);
        }

        setPersonajes(coincidentes);
    }


    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);

        // Activities containing this fragment must implement its callbacks.
        if (!(activity instanceof Callbacks)) {
            throw new IllegalStateException("Activity must implement fragment's callbacks.");
        }

        mCallbacks = (Callbacks) activity;
    }

    @Override
    public void onDetach() {
        super.onDetach();

        // Reset the active callbacks interface to the dummy implementation.
        mCallbacks = sDummyCallbacks;
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {
        super.onListItemClick(listView, view, position, id);

        // Notify the active callbacks interface (the activity, if the
        // fragment is attached to one) that an item has been selected.

        Personaje personaje = (Personaje) listView.getAdapter().getItem(position);
        Toast.makeText(getContext(), personaje.toString(), Toast.LENGTH_SHORT).show();

        mCallbacks.onItemSelected(personaje);
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (mActivatedPosition != ListView.INVALID_POSITION) {
            // Serialize and persist the activated item position.
            outState.putInt(STATE_ACTIVATED_POSITION, mActivatedPosition);
        }
    }

    /**
     * Turns on activate-on-click mode. When this mode is on, list items will be
     * given the 'activated' state when touched.
     */
    public void setActivateOnItemClick(boolean activateOnItemClick) {
        // When setting CHOICE_MODE_SINGLE, ListView will automatically
        // give items the 'activated' state when touched.
        getListView().setChoiceMode(activateOnItemClick
                ? ListView.CHOICE_MODE_SINGLE
                : ListView.CHOICE_MODE_NONE);
    }

    private void setActivatedPosition(int position) {
        if (position == ListView.INVALID_POSITION) {
            getListView().setItemChecked(mActivatedPosition, false);
        } else {
            getListView().setItemChecked(position, true);
        }

        mActivatedPosition = position;
    }

    private void getDatosJuego(){
        DueloDeLeyendasService delService = new DueloDeLeyendasConnect().getService();

        Call<DatosJuego> datosCall = delService.getDatosJuego(unIdJugadorHardcodeado);

        datosCall.enqueue(new Callback<DatosJuego>() {
            @Override
            public void onResponse(Response<DatosJuego> response, Retrofit retrofit) {
                personajes.addAll(response.body().getPersonajes());

                setPersonajes(personajes);
            }

            @Override
            public void onFailure(Throwable t) {
                Toast.makeText(getContext(), "Por favor revise su conexion", Toast.LENGTH_LONG).show();
            }
        });
    }

    public void setPersonajes(List<Personaje> pjs){
        setListAdapter(new ArrayAdapter<Personaje>(
                getActivity(),
                android.R.layout.simple_list_item_activated_1,
                android.R.id.text1,
                pjs));
    }

}
