package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.InformationMapper;
import com.hdt.auction.entity.Information;
import com.hdt.auction.service.InformationService;
@Service
public class InformationServiceImpl implements InformationService {
	@Autowired
	InformationMapper iMapper;
	public void insertInfo(Information information) {
		// TODO Auto-generated method stub
		iMapper.insertSelective(information);
	}

	public void updateInfo(Information information) {
		// TODO Auto-generated method stub
		iMapper.updateByPrimaryKeySelective(information);
	}

	public void deleteInfo(Long id) {
		// TODO Auto-generated method stub
		iMapper.deleteByPrimaryKey(id);
	}

	public Information getInfo(Long id) {
		// TODO Auto-generated method stub
		return iMapper.selectByPrimaryKey(id);
	}

	public List<Information> getInfoByuserId(Long user_id) {
		// TODO Auto-generated method stub
		return iMapper.getInfoByuserId(user_id);
	}

	public List<Information> getInfoByis_audit(Byte is_audit) {
		// TODO Auto-generated method stub
		return iMapper.getInfoByis_audit(is_audit);
	}

	public void deleteBatch(List<Long> ids) {
		// TODO Auto-generated method stub
		iMapper.deleteBatch(ids);
	}

}
