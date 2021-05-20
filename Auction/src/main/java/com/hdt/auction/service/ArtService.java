package com.hdt.auction.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdt.auction.entity.Art;

public interface ArtService {

	List<Art> getAll();

	Art getArt(long id);

	void updateArt(Art art);

	void insertArt(Art art);

	List<Art> getArtsByArtTypeId(Long arttype_id,Long state_id);

	List<Art> getArtsByArtName(String name);

	List<Art> getArtsByis_audit(Long state_id);
	
	List<Art> getArtsByUserId(Long user_id);
	
	List<Art> getArtByuserIdAndstateId(Long user_id,Long state_id);
	
	int deletArtrBatch(List<Long> ids);
	
	List<Art> getArtsBytype(Long arttype_id);
}
