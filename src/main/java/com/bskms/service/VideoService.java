package com.bskms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.bskms.model.VideoEntity;

import java.util.Map;


public interface VideoService extends IService<VideoEntity> {

    Object getAllVideoByLimit(VideoEntity videoEntity);

    void delVideo(int parseInt);

    VideoEntity selectByPrimaryKey(Integer id);

    void addVideo(VideoEntity videoEntity);

    String updateVideo(VideoEntity videoEntity);
}

