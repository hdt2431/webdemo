package com.hdt.auction.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.hdt.auction.BaseTest;
import com.hdt.auction.entity.Art;
import com.hdt.auction.entity.ReceiptInformation;

public class ArtDaoTest extends BaseTest{
	@Autowired
	SqlSession sqlSession;
	@Autowired
	ReceiptInformationMapper receiptInformationMapper;
	@Autowired
	BidMapper bidMapper;
	
	public void testInsert() throws Exception {
		
		ArtMapper mapper = sqlSession.getMapper(ArtMapper.class);
		for(int i =0 ;i<100;i++) {
			long a = 1000;
			long b= 26;
			Byte c = 0;
			mapper.insertSelective(new Art("东阳木雕", null, "东阳木雕（Dongyang woodcarving）中国民间雕刻艺术之一，因产于浙江东阳而得名，“东阳木雕”与“青田石雕”“黄杨木雕”并称“浙江三雕”。被誉为中国木雕之乡的浙江东阳，有千余年的木雕历史，北京故宫及苏、杭、皖等地，都有精美的东阳木雕留世。", "现代", null, null, a, a, b, 0, null, 6l, 1l, null, null, null, null, null,c));
		}
	}
	
	public void testtypelist()throws Exception{
		ArtMapper mapper = sqlSession.getMapper(ArtMapper.class);
		List<Art> arts = mapper.getArtByTypeId(1l, 3l);
		for (Art art : arts) {
			System.out.println(art.getArt_name());
		}
	}
	@Test
	public void test1()throws Exception{
		BidMapper mapper = sqlSession.getMapper(BidMapper.class);
		List<Long> arts = mapper.getArtByUserFromBid(26l);
		for (Long art:arts) {
			System.out.println(art);	
		}
		
	}
	
	public void test2()throws Exception{
		ReceiptInformationMapper mapper = sqlSession.getMapper(ReceiptInformationMapper.class);
		Byte a = 1;
		ReceiptInformation receiptInformation = mapper.selectByIdandIs_default(26l, a);
		System.out.println(receiptInformation);
		
	}
	public void testdeleteBatch()throws Exception{
		InformationMapper mapper = sqlSession.getMapper(InformationMapper.class);
		List<Long> ids = new ArrayList<Long>();
		ids.add(3l);
		ids.add(4l);
		ids.add(5l);
		ids.add(6l);
		mapper.deleteBatch(ids);
	}
}
