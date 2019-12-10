package com.zjt.mapper;

import com.zjt.pojo.H;
import com.zjt.pojo.HExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HMapper {
    int countByExample(HExample example);

    int deleteByExample(HExample example);

    int insert(H record);

    int insertSelective(H record);

    List<H> selectByExample(HExample example);

    int updateByExampleSelective(@Param("record") H record, @Param("example") HExample example);

    int updateByExample(@Param("record") H record, @Param("example") HExample example);
}