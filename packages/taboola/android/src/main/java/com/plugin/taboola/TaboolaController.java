package com.plugin.taboola;

import android.app.Application;

import com.taboola.android.api.TaboolaApi;
import com.taboola.android.js.TaboolaJs;

public class TaboolaController extends Application {
    @Override
    public void onCreate() {
        super.onCreate();


        /*
         * Taboola Integration Verifier is a special mode that helps you check your Taboola
         * SDK integration into your project
         *
         * Important: Do not distribute your app with the verifier enabled.
         *
         * Use the following link for more information about the Integration Verifier:
         * NTFU
         *
         * Uncomment the line below to enable this tool.
         */

        // IntegrationVerifier.getInstance().verifyIntegration(this, true);

        // Required when using TaboolaJS integration
        TaboolaJs.getInstance().init(getApplicationContext());

        // Required when using TaboolaApi (Native Android) integration
        TaboolaApi.getInstance().init(getApplicationContext(), "sdk-tester-demo", "30dfcf6b094361ccc367bbbef5973bdaa24dbcd6");
    }

}