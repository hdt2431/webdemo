package com.hdt.auction.entity;

import java.util.Date;

public class Order {
    private Long id;

    private Long artId;

    private Long buyerId;

    private Long sellerId;

    private Date startTime;

    private Date endTime;

    private Long adressId;

    private Long orderTypeId;

    private Long deliveryStatusId;

    private String logisticsCompany;

    private String logisticsNumber;

    private String comment;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getArtId() {
        return artId;
    }

    public void setArtId(Long artId) {
        this.artId = artId;
    }

    public Long getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Long buyerId) {
        this.buyerId = buyerId;
    }

    public Long getSellerId() {
        return sellerId;
    }

    public void setSellerId(Long sellerId) {
        this.sellerId = sellerId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Long getAdressId() {
        return adressId;
    }

    public void setAdressId(Long adressId) {
        this.adressId = adressId;
    }

    public Long getOrderTypeId() {
        return orderTypeId;
    }

    public void setOrderTypeId(Long orderTypeId) {
        this.orderTypeId = orderTypeId;
    }

    public Long getDeliveryStatusId() {
        return deliveryStatusId;
    }

    public void setDeliveryStatusId(Long deliveryStatusId) {
        this.deliveryStatusId = deliveryStatusId;
    }

    public String getLogisticsCompany() {
        return logisticsCompany;
    }

    public void setLogisticsCompany(String logisticsCompany) {
        this.logisticsCompany = logisticsCompany == null ? null : logisticsCompany.trim();
    }

    public String getLogisticsNumber() {
        return logisticsNumber;
    }

    public void setLogisticsNumber(String logisticsNumber) {
        this.logisticsNumber = logisticsNumber == null ? null : logisticsNumber.trim();
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

	@Override
	public String toString() {
		return "Order [id=" + id + ", artId=" + artId + ", buyerId=" + buyerId + ", sellerId=" + sellerId
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", adressId=" + adressId + ", orderTypeId="
				+ orderTypeId + ", deliveryStatusId=" + deliveryStatusId + ", logisticsCompany=" + logisticsCompany
				+ ", logisticsNumber=" + logisticsNumber + ", comment=" + comment + "]";
	}
    
}