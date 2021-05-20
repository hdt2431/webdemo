package com.hdt.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdt.auction.dao.ShowMapper;
import com.hdt.auction.entity.Show;
import com.hdt.auction.service.ShowService;
@Service
public class ShowServiceImpl implements ShowService {
	@Autowired
	ShowMapper showMapper;
	public void insertShow(Show show) {
		// TODO Auto-generated method stub
		showMapper.insertSelective(show);
	}

	public void deleteShow(Long id) {
		// TODO Auto-generated method stub
		showMapper.deleteByPrimaryKey(id);
	}

	public void updateShow(Show show) {
		// TODO Auto-generated method stub
		showMapper.updateByPrimaryKeySelective(show);
	}

	public List<Show> getShowByname(String name) {
		// TODO Auto-generated method stub
		return showMapper.getShowByname(name);
	}

	public int deleteShowOrderBatch(List<Long> ids) {
		// TODO Auto-generated method stub
		showMapper.deletArtrBatch(ids);
		return 0;
	}

}
