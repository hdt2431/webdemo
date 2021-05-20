package com.hdt.auction.service;

import java.util.List;

import com.hdt.auction.entity.Information;

public interface InformationService {
	void insertInfo(Information information);

	void updateInfo(Information information);

	void deleteInfo(Long id);

	Information getInfo(Long id);

	List<Information> getInfoByuserId(Long user_id);
	
	List<Information> getInfoByis_audit(Byte is_audit);
	
	void deleteBatch(List<Long> ids);
}
