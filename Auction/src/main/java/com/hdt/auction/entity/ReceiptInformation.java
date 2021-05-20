package com.hdt.auction.entity;

import java.util.Date;

public class ReceiptInformation {
    private Long id;

    private Long user_id;

    private String phone;

    private String province;

    private String city;

    private String county;

    private String street;

    private String address;

    private Byte is_DefaultAddress;

    private Date gmt_create;

    private Date gmt_modified;
    
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county == null ? null : county.trim();
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street == null ? null : street.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Byte getIs_DefaultAddress() {
        return is_DefaultAddress;
    }

    public void setIs_DefaultAddress(Byte is_DefaultAddress) {
        this.is_DefaultAddress = is_DefaultAddress;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ReceiptInformation [id=" + id + ", user_id=" + user_id + ", phone=" + phone + ", province=" + province
				+ ", city=" + city + ", county=" + county + ", street=" + street + ", address=" + address
				+ ", is_DefaultAddress=" + is_DefaultAddress + ", gmt_create=" + gmt_create + ", gmt_modified="
				+ gmt_modified + ", name=" + name + "]";
	}
    
    
    
}