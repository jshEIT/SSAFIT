package com.ssafit.video.service;

import com.ssafit.video.model.entity.Video;

import java.util.List;

public interface VideoService {
    List<Video> getList();

    List<Video> getListByPart(String part);

    Video getVideoById(String videoId);

    List<Video> getVideoLikeList(int userSeq);

    int checkVideoLike(int userSeq, String videoId);

    boolean doVideoLike(int userSeq, String videoId);

    boolean undoVideoLike(int userSeq, String videoId);

}
