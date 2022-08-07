package com.bskms.service.impl;

import com.bskms.bean.Children;
import com.bskms.mapper.QingjiaMapper;
import com.bskms.model.MMGridPageVoBean;
import com.bskms.model.QingjiaEntity;
import com.bskms.service.QingjiaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


@Service("qingjiaService")
public class QingjiaServiceImpl extends ServiceImpl<QingjiaMapper, QingjiaEntity> implements QingjiaService {
    private final Logger logger = LoggerFactory.getLogger(QingjiaServiceImpl.class);
    @Override
    public Object getAllDataByLimit(Children stuParameter, Date startDate, Date endDate) {
        int size = 0;

        Integer begin = (stuParameter.getPage() - 1) * stuParameter.getLimit();
        stuParameter.setPage(begin);
        List<QingjiaEntity> rows = new ArrayList<>();
        try {

            rows = baseMapper.getData(stuParameter,startDate,endDate);
            size = baseMapper.getcount();
        } catch (Exception e) {
            logger.error("根据查询 异常", e);
        }
        MMGridPageVoBean<QingjiaEntity> vo = new MMGridPageVoBean<>();
        vo.setTotal(size);
        vo.setRows(rows);

        return vo;
    }

    @Override
    public QingjiaEntity selectByPrimaryKey(Integer id) {
        return baseMapper.selectByPrimaryKey(id);
    }

    @Override
    public void addQJ(QingjiaEntity qingjiaEntity) {
        qingjiaEntity.setStatus(false);
        qingjiaEntity.setApplyDate(new Date());
        baseMapper.addQJ(qingjiaEntity);
    }

    @Override
    public String updateQJ(QingjiaEntity qingjiaEntity) {
        if (baseMapper.updateQJ(qingjiaEntity)>0){
            return "SUCCESS";
        }
        return "ERROR";
    }

    @Override
    public void deleteById(Integer id) {
        baseMapper.delById(id);
    }
}