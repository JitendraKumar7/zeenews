package com.plugin.taboola.tabs;

public interface TabsContract {

    interface TabsView {
        void setCurrentPage(int currentPage);

    }

    interface TabsPresenter extends BasePresenter<TabsView> {
        void setCurrentPage(int position);
    }

}
