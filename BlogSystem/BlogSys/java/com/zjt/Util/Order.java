package com.zjt.Util;

public class Order {
    private int first;
    private int last;
    private String click;

    public int getFirst() {
        return first;
    }

    public void setFirst(int first) {
        this.first = first;
    }

    public int getLast() {
        return last;
    }

    public void setLast(int last) {
        this.last = last;
    }

    public String getClick() {
        return click;
    }

    public void setClick(String click) {
        this.click = click;
    }

    @Override
    public String toString() {
        return "Order{" +
                "first=" + first +
                ", last=" + last +
                ", click='" + click + '\'' +
                '}';
    }
}
