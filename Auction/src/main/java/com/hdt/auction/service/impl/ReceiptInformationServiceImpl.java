package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.ReceiptInformationMapper;
import com.hdt.auction.entity.ReceiptInformation;
import com.hdt.auction.service.ReceiptInformationService;
@Service
public class ReceiptInformationServiceImpl implements ReceiptInformationService {
	
	@Autowired
	ReceiptInformationMapper receiptInformationMapper;
	
	public List<ReceiptInformation> getReceiptInfoByUserId(long id) {
		// TODO Auto-generated method stub
		return receiptInformationMapper.getReceiptInfoByUserId(id);
	}

	public ReceiptInformation getReceiptInfoById(long id) {
		// TODO Auto-generated method stub
		return receiptInformationMapper.selectByPrimaryKey(id);
	}

	public void insertReceiptInfo(ReceiptInformation receiptInformation) {
		// TODO Auto-generated method stub
		receiptInformationMapper.insertSelective(receiptInformation);
	}

	public void deleteReceiptInfoById(long id) {
		// TODO Auto-generated method stub
		receiptInformationMapper.deleteByPrimaryKey(id);
	}

	public void updateReceiptInfo(ReceiptInformation receiptInformation) {
		// TODO Auto-generated method stub
		receiptInformationMapper.updateByPrimaryKeySelective(receiptInformation);
	}

	public ReceiptInformation selectByIdandIs_default(Long user_id, Byte is_DefaultAddress) {
		// TODO Auto-generated method stub
		return receiptInformationMapper.selectByIdandIs_default(user_id, is_DefaultAddress);
	}

	

}
