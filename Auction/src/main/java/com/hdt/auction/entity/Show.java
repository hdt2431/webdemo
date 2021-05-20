package com.hdt.auction.entity;

import java.util.Date;

public class Show {
    private Long id;

    private Long art_id;

    private String show_name;

    private Date start_time;

    private Date end_time;

    private Date gmt_create;

    private Date gmt_modified;
    
    private Long arttypes_id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getArt_id() {
        return art_id;
    }

    public void setArt_id(Long art_id) {
        this.art_id = art_id;
    }

    public String getShow_name() {
        return show_name;
    }

    public void setShow_name(String show_name) {
        this.show_name = show_name == null ? null : show_name.trim();
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
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

	public Long getArttypes_id() {
		return arttypes_id;
	}

	public void setArttypes_id(Long arttypes_id) {
		this.arttypes_id = arttypes_id;
	}

	
    
}