package com.hdt.auction.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Art {
	private Long id;

	private String art_name;

	private String art_remark;

	private String art_desc;

	private String art_years;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date start_time;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date end_time;

	private Long init_price;

	private Long max_price;

	private Long owner_id;

	private Integer bidtimes;

	private Long winner_id;

	private Long arttype_id;

	private Long state_id;

	private Date gmt_create;

	private Date gmt_modified;

	private String rank;

	private String picture_url;

	private Integer heat;
	
	private Byte is_audit;

	public Art() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Art(String art_name, String art_remark, String art_desc, String art_years, Date start_time, Date end_time,
			Long init_price, Long max_price, Long owner_id, Integer bidtimes, Long winner_id, Long arttype_id,
			Long state_id, Date gmt_create, Date gmt_modified, String rank, String picture_url, Integer heat,Byte is_audit) {
		super();
		this.art_name = art_name;
		this.art_remark = art_remark;
		this.art_desc = art_desc;
		this.art_years = art_years;
		this.start_time = start_time;
		this.end_time = end_time;
		this.init_price = init_price;
		this.max_price = max_price;
		this.owner_id = owner_id;
		this.bidtimes = bidtimes;
		this.winner_id = winner_id;
		this.arttype_id = arttype_id;
		this.state_id = state_id;
		this.gmt_create = gmt_create;
		this.gmt_modified = gmt_modified;
		this.rank = rank;
		this.picture_url = picture_url;
		this.heat = heat;
		this.is_audit = is_audit;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getArt_name() {
		return art_name;
	}

	public void setArt_name(String art_name) {
		this.art_name = art_name == null ? null : art_name.trim();
	}

	public String getArt_remark() {
		return art_remark;
	}

	public void setArt_remark(String art_remark) {
		this.art_remark = art_remark == null ? null : art_remark.trim();
	}

	public String getArt_desc() {
		return art_desc;
	}

	public void setArt_desc(String art_desc) {
		this.art_desc = art_desc == null ? null : art_desc.trim();
	}

	public String getArt_years() {
		return art_years;
	}

	public void setArt_years(String art_years) {
		this.art_years = art_years == null ? null : art_years.trim();
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

	public Long getInit_price() {
		return init_price;
	}

	public void setInit_price(Long init_price) {
		this.init_price = init_price;
	}

	public Long getMax_price() {
		return max_price;
	}

	public void setMax_price(Long max_price) {
		this.max_price = max_price;
	}

	public Long getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(Long owner_id) {
		this.owner_id = owner_id;
	}

	public Integer getBidtimes() {
		return bidtimes;
	}

	public void setBidtimes(Integer bidtimes) {
		this.bidtimes = bidtimes;
	}

	public Long getWinner_id() {
		return winner_id;
	}

	public void setWinner_id(Long winner_id) {
		this.winner_id = winner_id;
	}

	public Long getArttype_id() {
		return arttype_id;
	}

	public void setArttype_id(Long arttype_id) {
		this.arttype_id = arttype_id;
	}

	public Long getState_id() {
		return state_id;
	}

	public void setState_id(Long state_id) {
		this.state_id = state_id;
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

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank == null ? null : rank.trim();
	}

	public String getPicture_url() {
		return picture_url;
	}

	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url == null ? null : picture_url.trim();
	}

	public Integer getHeat() {
		return heat;
	}

	public void setHeat(Integer heat) {
		this.heat = heat;
	}

	public Byte getIs_audit() {
		return is_audit;
	}

	public void setIs_audit(Byte is_audit) {
		this.is_audit = is_audit;
	}
	
}