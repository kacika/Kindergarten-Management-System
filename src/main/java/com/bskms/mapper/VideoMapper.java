package com.bskms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bskms.model.VideoEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


public interface VideoMapper extends BaseMapper<VideoEntity> {

    List<VideoEntity> getData(VideoEntity videoEntity);

    void delVideo(int id);

    VideoEntity selectByPrimaryKey(Integer id);

    void addVideo(VideoEntity videoEntity);

    int updateVideo(VideoEntity videoEntity);

    int getCount();
}
