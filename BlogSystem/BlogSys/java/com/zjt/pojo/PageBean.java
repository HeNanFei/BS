package com.zjt.pojo;

public class PageBean {
    private int total;

    private int pages;

    private int pageSize;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "total=" + total +
                ", pages=" + pages +
                ", pageSize=" + pageSize +
                '}';
    }
}
