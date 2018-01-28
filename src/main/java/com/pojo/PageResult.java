package com.pojo;

import java.util.List;

public class PageResult {
    /*分页用的模型类*/

    private long total;
    private List<?> amounts;
    private Integer currentPage;


    public PageResult() {
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public PageResult(long total, List<?> amounts, Integer currentPage) {
        this.total = total;
        this.amounts = amounts;
        this.currentPage = currentPage;
    }

    public long gettotal() {
        return total;
    }

    public void settotal(long total) {
        this.total = total;
    }

    public List<?> getAmounts() {
        return amounts;
    }

    public void setAmounts(List<?> amounts) {
        this.amounts = amounts;
    }
}
