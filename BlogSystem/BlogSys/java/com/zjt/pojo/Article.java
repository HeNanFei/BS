package com.zjt.pojo;

import java.io.Serializable;

public class Article implements Serializable{
    private Integer aid;

    private String username;

    private String writed;

    private String title;

    private Integer uid;

    private String status;

    private String attribute;

    private Integer click;

    private String imgurl;

    private String content2;

    private String content;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getWrited() {
        return writed;
    }

    public void setWrited(String writed) {
        this.writed = writed == null ? null : writed.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute == null ? null : attribute.trim();
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    public String getContent2() {
        return content2;
    }

    public void setContent2(String content2) {
        this.content2 = content2 == null ? null : content2.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }



    @Override
    public String toString() {
        return "Article{" +
                "aid=" + aid +
                ", username='" + username + '\'' +
                ", writed='" + writed + '\'' +
                ", title='" + title + '\'' +
                ", uid=" + uid +
                ", status='" + status + '\'' +
                ", attribute='" + attribute + '\'' +
                ", click=" + click +
                ", imgurl='" + imgurl + '\'' +
                ", content2='" + content2 + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}