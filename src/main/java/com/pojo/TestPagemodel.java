package com.pojo;

public class TestPagemodel {

    /*这个是递归获取文件名字的模型类*/
    private  String name;
    private String url;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public TestPagemodel(String name, String url) {

        this.name = name;
        this.url = url;
    }
}
