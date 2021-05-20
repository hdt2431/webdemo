package com.hdt.auction.dao;

import com.hdt.auction.entity.Feedback;
import com.hdt.auction.entity.FeedbackWithBLOBs;

public interface FeedbackMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FeedbackWithBLOBs record);

    int insertSelective(FeedbackWithBLOBs record);

    FeedbackWithBLOBs selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FeedbackWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(FeedbackWithBLOBs record);

    int updateByPrimaryKey(Feedback record);
}