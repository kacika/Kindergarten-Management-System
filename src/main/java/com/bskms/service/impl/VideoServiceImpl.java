package com.bskms.service.impl;

import com.bskms.mapper.VideoMapper;
import com.bskms.model.MMGridPageVoBean;
import com.bskms.model.QingjiaEntity;
import com.bskms.model.VideoEntity;
import com.bskms.service.VideoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


@Service("videoService")
public class VideoServiceImpl extends ServiceImpl<VideoMapper, VideoEntity> implements VideoService {
    private final Logger logger = LoggerFactory.getLogger(VideoServiceImpl.class);

    @Override
    public Object getAllVideoByLimit(VideoEntity videoEntity) {
        int size = 0;

        Integer begin = (videoEntity.getPage() - 1) * videoEntity.getLimit();
        videoEntity.setPage(begin);
        List<VideoEntity> rows = new ArrayList<>();
        try {
            size=baseMapper.getCount();
            rows = baseMapper.getData(videoEntity);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("根据查询 异常", e);
        }
        MMGridPageVoBean<VideoEntity> vo = new MMGridPageVoBean<>();
        vo.setTotal(size);
        vo.setRows(rows);

        return vo;
    }

    @Override
    public void delVideo(int id) {
        baseMapper.delVideo(id);
    }

    @Override
    public VideoEntity selectByPrimaryKey(Integer id) {
        return baseMapper.selectByPrimaryKey(id);
    }

    @Override
    public void addVideo(VideoEntity videoEntity) {
        baseMapper.addVideo(videoEntity);
    }

    @Override
    public String updateVideo(VideoEntity videoEntity) {
        if (baseMapper.updateVideo(videoEntity)>0){
            return "SUCCESS";
        }
        return "ERROR";
    }
}