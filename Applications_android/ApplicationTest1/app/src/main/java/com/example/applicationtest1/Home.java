package com.example.applicationtest1;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.textfield.TextInputEditText;

import java.util.Objects;

public class Home extends AppCompatActivity {
    TextInputEditText senddep;
    TextInputEditText sendarr;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        senddep = findViewById(R.id.depart);
        sendarr = findViewById(R.id.arrivee);
    }

    public void valide(View v) {

        AlertDialog.Builder alert = new AlertDialog.Builder(Home.this);

        alert.setTitle("Confirmation");
        alert.setMessage("Voulez vous envoyer le formulaire ?");

        alert.setPositiveButton("Oui", (dialog, which) -> {
            final String depart = Objects.requireNonNull(senddep.getText()).toString();

            final String arrive = Objects.requireNonNull(sendarr.getText()).toString();

            final Intent intent = new Intent(getApplicationContext(), activite2.class);

            intent.putExtra("dep", depart);
            intent.putExtra("arr", arrive);

            startActivity(intent);
        });


        alert.setNegativeButton("Non", (dialog, which) -> Toast.makeText(getApplicationContext(),
                "Annulation de l'envoi", Toast.LENGTH_SHORT).show());

        AlertDialog dialog = alert.create();
        dialog.show();

    }


}