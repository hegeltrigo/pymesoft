//Import the Todo API 

import { VideosApi } from "../../api/videosApi";
import { videoTypes} from '../types'

export const GetAllVideos = () => {
    return (dispatch) => {
        dispatch(isLoadingVideos())
        VideosApi.getAllVideos().then(res => {
            return dispatch(GetAllVideosSuccess(res.data));
        })
    }
}

const GetAllVideosSuccess = (videos) => {return { type: videoTypes.GET_ALL_VIDEOS_SUCCESS, videos }}
const isLoadingVideos = () =>{ return { type: videoTypes.IS_LOADING_VIDEOS, loading: true } }


export const GetAllMyVideos = () => {
  return (dispatch) => {
      dispatch(isLoadingMyVideos())
      VideosApi.getAllMyVideos().then(res => {
          return dispatch(GetAllMyVideosSuccess(res.data));
      })
  }
}

const GetAllMyVideosSuccess = (videos) => {return { type: videoTypes.GET_ALL_MY_VIDEOS_SUCCESS, videos }}
const isLoadingMyVideos = () =>{ return { type: videoTypes.IS_LOADING_MY_VIDEOS, loading: true } }


export const createVideo = (video) => {
  return (dispatch) => {
    dispatch(createVideoRequest())
    VideosApi.createVideo(video).then(res => {
        return dispatch(createVideoSuccess(res));
    }).catch((e) => {
      return dispatch(createVideoFailure(e));
    })
  }
}

const createVideoRequest = () => { return { type: videoTypes.CREATE_VIDEO_REQUEST }}
const createVideoSuccess = (response) => { return { type: videoTypes.CREATE_VIDEO_SUCCESS, response }}
const createVideoFailure = (errorMessage) => { return { type: videoTypes.CREATE_VIDEO_FAILURE, errorMessage }}


export const removeVideo = (index,id) => {
  return (dispatch) => {
    dispatch(removeVideoRequest())
    VideosApi.removeVideo(id).then(res => {
        return dispatch(removeVideoSuccess(res, index));
    }).catch((e) => {
      return dispatch(removeVideoFailure(e));
    })
  }
}

const removeVideoRequest = () => { return { type: videoTypes.REMOVE_VIDEO_REQUEST }}
const removeVideoSuccess = (response, index) => { return { type: videoTypes.REMOVE_VIDEO_SUCCESS, response, index }}
const removeVideoFailure = (errorMessage) => { return { type: videoTypes.REMOVE_VIDEO_FAILURE, errorMessage }}

export const getVideo = (id) => {
  return (dispatch) => {
    dispatch(getVideoRequest())
    VideosApi.getVideo(id).then(res => {
        return dispatch(getVideoSuccess(res));
    }).catch((e) => {
      return dispatch(getVideoFailure(e));
    })
  }
}

const getVideoRequest = () => { return { type: videoTypes.GET_VIDEO_REQUEST }}
const getVideoSuccess = (response) => { return { type: videoTypes.GET_VIDEO_SUCCESS, response }}
const getVideoFailure = (errorMessage) => { return { type: videoTypes.GET_VIDEO_FAILURE, errorMessage }}

export const updateVideo = (video) => {
  return (dispatch) => {
    dispatch(updateVideoRequest())
    VideosApi.updateVideo(video).then(res => {
        return dispatch(updateVideoSuccess(res));
    }).catch((e) => {
      return dispatch(updateVideoFailure(e));
    })
  }
}

const updateVideoRequest = () => { return { type: videoTypes.UPDATE_VIDEO_REQUEST }}
const updateVideoSuccess = (response) => { return { type: videoTypes.UPDATE_VIDEO_SUCCESS, response }}
const updateVideoFailure = (errorMessage) => { return { type: videoTypes.UPDATE_VIDEO_FAILURE, errorMessage }}