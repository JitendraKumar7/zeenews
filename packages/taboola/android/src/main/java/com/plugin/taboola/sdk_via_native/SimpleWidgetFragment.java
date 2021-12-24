package com.plugin.taboola.sdk_via_native;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import com.taboola.android.TaboolaWidget;
import com.plugin.taboola.R;

import java.util.HashMap;

public class SimpleWidgetFragment extends Fragment {

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_simple_widget, container, false);
        TaboolaWidget taboolaWidget = view.findViewById(R.id.taboola_view);
        HashMap<String, String> extraProperties = new HashMap<>();
        extraProperties.put("useOnlineTemplate", "true");
        taboolaWidget.setExtraProperties(extraProperties);
        taboolaWidget.fetchContent();
        return view;
    }
}
