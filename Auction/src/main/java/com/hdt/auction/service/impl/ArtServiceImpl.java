package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.ArtMapper;
import com.hdt.auction.entity.Art;
import com.hdt.auction.service.ArtService;
@Service
public class ArtServiceImpl implements ArtService {
	
	@Autowired
	ArtMapper artMapper;
	public List<Art> getAll() {		
		return artMapper.listAllArt(null);
	}
	public Art getArt(long id) {
		// TODO Auto-generated method stub
		return artMapper.selectByPrimaryKey(id);
	}
	public void updateArt(Art art) {
		// TODO Auto-generated method stub
		artMapper.updateByPrimaryKeySelective(art);
	}
	public void insertArt(Art art) {
		// TODO Auto-generated method stub
		artMapper.insertSelective(art);
	}
	public List<Art> getArtsByArtTypeId(Long typeid,Long state_id) {
		// TODO Auto-generated method stub
		return artMapper.getArtByTypeId(typeid,state_id);
	}
	public List<Art> getArtsByArtName(String name) {
		// TODO Auto-generated method stub
		return artMapper.getArtsByArtName(name);
	}
	public List<Art> getArtsByis_audit(Long state_id) {
		// TODO Auto-generated method stub
		return artMapper.getArtsByis_audit(state_id);
	}
	public List<Art> getArtsByUserId(Long user_id) {
		// TODO Auto-generated method stub
		return artMapper.getArtsByUserId(user_id);
	}
	public List<Art> getArtByuserIdAndstateId(Long user_id, Long state_id) {
		// TODO Auto-generated method stub
		return artMapper.getArtByuserIdAndstateId(user_id, state_id);
	}
	public int deletArtrBatch(List<Long> ids) {
		// TODO Auto-generated method stub
		return artMapper.deleteBatch(ids);
	}
	public List<Art> getArtsBytype(Long arttype_id) {
		// TODO Auto-generated method stub
		return artMapper.getArtsBytype(arttype_id);
	}
	
}
