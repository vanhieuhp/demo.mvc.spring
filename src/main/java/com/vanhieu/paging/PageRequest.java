package com.vanhieu.paging;

public class PageRequest implements Pageble{

    private Integer currentPage;
    private Integer maxPageItem;
    private Sorter sorter;

    public PageRequest(Integer currentPage, Integer maxPageItem, Sorter sorter) {
        this.currentPage = currentPage;
        this.maxPageItem = maxPageItem;
        this.sorter = sorter;
    }

    @Override
    public Integer getCurrentPage() {
        return this.currentPage;
    }

    @Override
    public Integer getOffSet() {
        if (this.currentPage != null && this.maxPageItem != null) {
            return (this.currentPage - 1) * this.maxPageItem;
        }
        return null;
    }

    @Override
    public Integer getMaxPageItem() {
        return this.maxPageItem;
    }

    @Override
    public Sorter getSorter() {
        return this.sorter;
    }

}
