package com.vanhieu.paging;
public interface Pageble {

        public Integer getCurrentPage();
        public Integer getOffSet();
        public Integer getMaxPageItem();
        public Sorter getSorter();
}
