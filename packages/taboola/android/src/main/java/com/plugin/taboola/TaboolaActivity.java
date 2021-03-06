package com.plugin.taboola;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;

public class TaboolaActivity extends AppCompatActivity implements MenuFragment.OnFragmentInteractionListener {

    private Toolbar mToolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mToolbar = findViewById(R.id.toolbar);
        setSupportActionBar(mToolbar);
        getSupportActionBar().setLogo(R.drawable.ic_taboola);
        resetToolbarTitle();

        // Code to handle toolbar title and back arrow
        getSupportFragmentManager().addOnBackStackChangedListener(() -> {
            int lastBackStackEntryCount = getSupportFragmentManager().getBackStackEntryCount() - 1;

            if (lastBackStackEntryCount < 0) {
                resetToolbarTitle();
                if (getSupportActionBar() != null) {
                    showBackArrow(false);
                }
            } else {
                if (getSupportActionBar() != null) {
                    getSupportActionBar().setTitle(getSupportFragmentManager().getBackStackEntryAt(lastBackStackEntryCount).getName());
                    showBackArrow(true);
                }
            }
        });

        getSupportFragmentManager().beginTransaction()
                .replace(R.id.container, new com.plugin.taboola.MenuFragment()).commit();

        prepareTaboolaLogoRotation();
    }

    private void showBackArrow(boolean shouldShowBackButton) {
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(shouldShowBackButton);
            getSupportActionBar().setDisplayShowHomeEnabled(!shouldShowBackButton);
        }
    }

    private void resetToolbarTitle() {
        mToolbar.setTitle(R.string.toolbar_title);
    }


    @Override
    public void onMenuItemClicked(Fragment fragmentToOpen, String screenName) {
        try {
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.container, fragmentToOpen)
                    .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
                    .addToBackStack(screenName)
                    .commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }


    private void prepareTaboolaLogoRotation() {
        try {
            Animation rotateAnim = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.rotate);
            View toolbarTaboolaLogo = mToolbar.getChildAt(1);
            toolbarTaboolaLogo.setOnClickListener(v -> toolbarTaboolaLogo.startAnimation(rotateAnim));
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}