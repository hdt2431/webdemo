package com.hdt.auction.service;

import java.util.List;

import com.hdt.auction.entity.ArtTypes;

public interface ArtTypeService {
	ArtTypes getArtTypeById(Long id);

	List<ArtTypes> listallArtTypes();
	
	int deletetypesBatch(List<Long> ids);
	
	void insertTypes(ArtTypes artTypes);
}
