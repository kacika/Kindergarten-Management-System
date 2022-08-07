package com.bskms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.bskms.bean.Children;
import com.bskms.model.QingjiaEntity;

import java.util.Date;
import java.util.Map;


public interface QingjiaService extends IService<QingjiaEntity> {

    Object getAllDataByLimit(Children stuParameter, Date startDate1, Date endDate1);

    QingjiaEntity selectByPrimaryKey(Integer id);

    void addQJ(QingjiaEntity qingjiaEntity);

    String updateQJ(QingjiaEntity qingjiaEntity);

    void deleteById(Integer id);
}

