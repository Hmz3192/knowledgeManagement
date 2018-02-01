package com.model;

import java.io.Serializable;
import java.util.Date;

public class KlRatingComment implements Serializable {
    private Integer userId;

    private Integer klId;

    private Integer klRating;

    private String klComment;

    private Date klCommentTime;

    public KlRatingComment(Integer userId, Integer klId, Integer klRating, String klComment, Date klCommentTime) {
        this.userId = userId;
        this.klId = klId;
        this.klRating = klRating;
        this.klComment = klComment;
        this.klCommentTime = klCommentTime;
    }

    public KlRatingComment() {
        super();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getKlId() {
        return klId;
    }

    public void setKlId(Integer klId) {
        this.klId = klId;
    }

    public Integer getKlRating() {
        return klRating;
    }

    public void setKlRating(Integer klRating) {
        this.klRating = klRating;
    }

    public String getKlComment() {
        return klComment;
    }

    public void setKlComment(String klComment) {
        this.klComment = klComment == null ? null : klComment.trim();
    }

    public Date getKlCommentTime() {
        return klCommentTime;
    }

    public void setKlCommentTime(Date klCommentTime) {
        this.klCommentTime = klCommentTime;
    }
}