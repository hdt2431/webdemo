package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.ArtTypesMapper;
import com.hdt.auction.entity.ArtTypes;
import com.hdt.auction.service.ArtTypeService;
@Service
public class ArtTypeServiceImpl implements ArtTypeService {
	@Autowired
	ArtTypesMapper artTypesMapper;
	
	public ArtTypes getArtTypeById(Long  id) {
		// TODO Auto-generated method stub
		
		return artTypesMapper.selectByPrimaryKey(id);
	}

	public List<ArtTypes> listallArtTypes() {
		// TODO Auto-generated method stub
		return artTypesMapper.listallArtTypes();
	}

	public int deletetypesBatch(List<Long> ids) {
		// TODO Auto-generated method stub
		artTypesMapper.deletetypesBatch(ids);
		return 0;
	}

	public void insertTypes(ArtTypes artTypes) {
		// TODO Auto-generated method stub
		artTypesMapper.insertSelective(artTypes);
	}

}
