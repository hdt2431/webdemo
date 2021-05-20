package com.hdt.auction.service;

import java.util.List;

import com.hdt.auction.entity.ReceiptInformation;

public interface ReceiptInformationService {
	List<ReceiptInformation> getReceiptInfoByUserId(long id);

	ReceiptInformation getReceiptInfoById(long id);

	void insertReceiptInfo(ReceiptInformation receiptInformation);

	void deleteReceiptInfoById(long id);

	void updateReceiptInfo(ReceiptInformation receiptInformation);
	
	ReceiptInformation selectByIdandIs_default(Long user_id,Byte is_DefaultAddress);
	
}
