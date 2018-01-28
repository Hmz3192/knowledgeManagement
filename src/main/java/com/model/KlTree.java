package com.model;

import java.io.Serializable;

public class KlTree implements Serializable {
    private Integer fileId;

    private String fileName;

    private Integer fileParentId;

    public KlTree(Integer fileId, String fileName, Integer fileParentId) {
        this.fileId = fileId;
        this.fileName = fileName;
        this.fileParentId = fileParentId;
    }

    public KlTree() {
        super();
    }

    public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public Integer getFileParentId() {
        return fileParentId;
    }

    public void setFileParentId(Integer fileParentId) {
        this.fileParentId = fileParentId;
    }
}