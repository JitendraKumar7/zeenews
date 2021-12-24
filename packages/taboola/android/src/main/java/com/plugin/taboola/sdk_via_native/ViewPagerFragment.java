package com.plugin.taboola.sdk_via_native;

import 	androidx.annotation.NonNull;

import com.plugin.taboola.tabs.BaseTabFragment;
import com.plugin.taboola.tabs.BaseTaboolaFragment;
import com.plugin.taboola.tabs.FragmentsAdapter;

public class ViewPagerFragment extends BaseTabFragment<BaseTaboolaFragment> {

    @Override
    protected void setupViewPagerAdapter(FragmentsAdapter<BaseTaboolaFragment> adapter) {
        super.setupViewPagerAdapter(adapter);
        String viewId = Long.toString(System.currentTimeMillis());
        adapter.addFragment(FeedInsideRecyclerViewFragment.getInstance(viewId));
        adapter.addFragment(FeedInsideScrollViewFragment.getInstance(viewId));
    }

    @NonNull
    @Override
    protected String getTextForItem(int currentItem) {

        switch (currentItem) {
            case 0:
                return "FeedInsideRecyclerView";
            case 1:
                return "FeedInsideScrollView";

            default:
                return super.getTextForItem(currentItem);
        }
    }
}
