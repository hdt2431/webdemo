package com.hdt.auction.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdt.auction.entity.Art;

public interface ArtMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Art record);

	int insertSelective(Art record);

	Art selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Art record);

	int updateByPrimaryKey(Art record);

	List<Art> listAllArt(Art art);

	List<Art> getArtByTypeId(@Param("arttype_id")Long arttype_id,@Param("state_id")Long state_id);
	
	List<Art> getArtByuserIdAndstateId(@Param("user_id")Long user_id,@Param("state_id")Long state_id);

	List<Art> getArtsByArtName(String art_name);

	List<Art> getArtsByis_audit(Long state_id);
	
	List<Art> getArtsByUserId(Long user_id);
	
	int deleteBatch(List<Long> ids);
	
	List<Art> getArtsBytype(Long arttype_id);
}