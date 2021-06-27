package com.example.applicationtest1;

import android.content.Intent;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.util.HashMap;

public class activite2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_activite2);

        final HashMap<String, String[]> h = new HashMap<>();
        String[] a = {"10h15", "11h25"};
        String[] b = {"10h15", "11h25", "21h30"};
        String[] c = {"10h15", "11h25", "23h00"};
        String[] d = {"10h15", "11h25", "22h00,13h00"};
        String[] e = {"10h15", "11h25", "22h00,13h00", "4h23", "6h35"};

        h.put("Montpellier-Paris", a);
        h.put("Montpellier-Marseille", b);
        h.put("Paris-Marseille", c);
        h.put("Marseille-Montpellier", d);
        h.put("Paris-Montpellier", a);
        h.put("Marseille-Paris", e);
        h.put("Paris-Toulouse", c);
        h.put("Marseille-Toulouse", e);

        Intent intent = getIntent();
        final String depr = intent.getStringExtra("dep").trim();
        final String arrr = intent.getStringExtra("arr").trim();
        final String res = depr + "-" + arrr;
        final ListView mListView = findViewById(R.id.listView);
        final TextView t = findViewById(R.id.monText);
        t.setText("Les horaires de " + res);

        if (h.containsKey(res)) {
            String[] horaire = h.get(res);

            final ArrayAdapter<String> adapter = new ArrayAdapter<>(activite2.this,
                    android.R.layout.simple_list_item_1, horaire);
            mListView.setAdapter(adapter);
        } else {
            String[] aucun = {"Aucun itinéraire trouvé"};

            final ArrayAdapter<String> adapter1 = new ArrayAdapter<>(activite2.this,
                    android.R.layout.simple_list_item_1, aucun);
            mListView.setAdapter(adapter1);
        }
    }
}