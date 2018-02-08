package com.model;

import java.io.Serializable;

public class KlKnowledge implements Serializable{
    private Integer klId;

    private Integer userId;

    private Integer klKind;

    private String klTitle;

    private String klIntroduction;

    private String klContent;

    private String klTags;

    private String klAppendix;

    private Integer klAppendixNumber;

    private String klVideo;

    private Integer klVideoNumber;

    private Integer klHints;

    private Integer klCollectionNumber;

    private String klConnectIds;

    private Integer klParentFileId;

    public KlKnowledge(Integer klId, Integer userId, Integer klKind, String klTitle, String klIntroduction, String klContent, String klTags, String klAppendix, Integer klAppendixNumber, String klVideo, Integer klVideoNumber, Integer klHints, Integer klCollectionNumber, String klConnectIds, Integer klParentFileId) {
        this.klId = klId;
        this.userId = userId;
        this.klKind = klKind;
        this.klTitle = klTitle;
        this.klIntroduction = klIntroduction;
        this.klContent = klContent;
        this.klTags = klTags;
        this.klAppendix = klAppendix;
        this.klAppendixNumber = klAppendixNumber;
        this.klVideo = klVideo;
        this.klVideoNumber = klVideoNumber;
        this.klHints = klHints;
        this.klCollectionNumber = klCollectionNumber;
        this.klConnectIds = klConnectIds;
        this.klParentFileId = klParentFileId;
    }

    public KlKnowledge() {
        super();
    }

    public Integer getKlId() {
        return klId;
    }

    public void setKlId(Integer klId) {
        this.klId = klId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getKlKind() {
        return klKind;
    }

    public void setKlKind(Integer klKind) {
        this.klKind = klKind;
    }

    public String getKlTitle() {
        return klTitle;
    }

    public void setKlTitle(String klTitle) {
        this.klTitle = klTitle == null ? null : klTitle.trim();
    }

    public String getKlIntroduction() {
        return klIntroduction;
    }

    public void setKlIntroduction(String klIntroduction) {
        this.klIntroduction = klIntroduction == null ? null : klIntroduction.trim();
    }

    public String getKlContent() {
        return klContent;
    }

    public void setKlContent(String klContent) {
        this.klContent = klContent == null ? null : klContent.trim();
    }

    public String getKlTags() {
        return klTags;
    }

    public void setKlTags(String klTags) {
        this.klTags = klTags == null ? null : klTags.trim();
    }

    public String getKlAppendix() {
        return klAppendix;
    }

    public void setKlAppendix(String klAppendix) {
        this.klAppendix = klAppendix == null ? null : klAppendix.trim();
    }

    public Integer getKlAppendixNumber() {
        return klAppendixNumber;
    }

    public void setKlAppendixNumber(Integer klAppendixNumber) {
        this.klAppendixNumber = klAppendixNumber;
    }

    public String getKlVideo() {
        return klVideo;
    }

    public void setKlVideo(String klVideo) {
        this.klVideo = klVideo == null ? null : klVideo.trim();
    }

    public Integer getKlVideoNumber() {
        return klVideoNumber;
    }

    public void setKlVideoNumber(Integer klVideoNumber) {
        this.klVideoNumber = klVideoNumber;
    }

    public Integer getKlHints() {
        return klHints;
    }

    public void setKlHints(Integer klHints) {
        this.klHints = klHints;
    }

    public Integer getKlCollectionNumber() {
        return klCollectionNumber;
    }

    public void setKlCollectionNumber(Integer klCollectionNumber) {
        this.klCollectionNumber = klCollectionNumber;
    }

    public String getKlConnectIds() {
        return klConnectIds;
    }

    public void setKlConnectIds(String klConnectIds) {
        this.klConnectIds = klConnectIds == null ? null : klConnectIds.trim();
    }

    public Integer getKlParentFileId() {
        return klParentFileId;
    }

    public void setKlParentFileId(Integer klParentFileId) {
        this.klParentFileId = klParentFileId;
    }
}