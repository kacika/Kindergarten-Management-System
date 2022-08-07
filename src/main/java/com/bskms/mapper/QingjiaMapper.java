package com.bskms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bskms.bean.Children;
import com.bskms.model.QingjiaEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;


public interface QingjiaMapper extends BaseMapper<QingjiaEntity> {

    List<QingjiaEntity> getData(@Param("ch") Children ch, @Param("startDate") Date startDate,@Param("endDate") Date endDate);

    QingjiaEntity selectByPrimaryKey(Integer id);

    void addQJ(QingjiaEntity qingjiaEntity);

    int updateQJ(QingjiaEntity qingjiaEntity);

    void delById(Integer id);

    int getcount();
}
