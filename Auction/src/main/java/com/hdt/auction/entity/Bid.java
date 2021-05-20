package com.hdt.auction.entity;

import java.util.Date;

public class Bid {
    private Long id;

    private Long bid_price;

    private Date bid_date;

    private Long art_id;

    private Long user_id;

    private Date gmt_create;

    private Date gmt_modified;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getBid_price() {
        return bid_price;
    }

    public void setBid_price(Long bid_price) {
        this.bid_price = bid_price;
    }

    public Date getBid_date() {
        return bid_date;
    }

    public void setBid_date(Date bid_date) {
        this.bid_date = bid_date;
    }

    public Long getArt_id() {
        return art_id;
    }

    public void setArt_id(Long art_id) {
        this.art_id = art_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Date getGmt_create() {
        return gmt_create;
    }

    public void setGmt_create(Date gmt_create) {
        this.gmt_create = gmt_create;
    }

    public Date getGmt_modified() {
        return gmt_modified;
    }

    public void setGmt_modified(Date gmt_modified) {
        this.gmt_modified = gmt_modified;
    }
}