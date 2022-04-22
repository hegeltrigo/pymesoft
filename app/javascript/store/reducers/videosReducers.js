import { videoTypes } from '../types'


const initialStateVideos = {
  videos: [],
  loading: true,
}

export const VideoListReducer = (state = initialStateVideos, action) => {
    switch(action.type){

      case videoTypes.GET_ALL_VIDEOS_SUCCESS:
        return {
          ...state,
          videos: action.videos,
          loading: false
        }

      case videoTypes.IS_LOADING_VIDEOS:
        return{
          ...state,
          loading: true
        }
      default: 
        return state; 
    }
}

const initialStateMyVideos = {
  videos: [],
  loading: true,
  creatingVideo: false,
  createdVideoSucces: false,
  ErrorVideo: false,
  removeVideo: {video: {}, loading: false, error: false},
  getVideo: {video: {}, loading: false, error: false},
  updateVideo: {video: {}, loading: false, error: false},
  currentVideo: {video: {title: '', description: '', video_url: ''}, loading: false, error: false, success: false, action: ''}
}

export const MyVideoList = (state = initialStateMyVideos, action) => {
  switch(action.type){

    case videoTypes.GET_ALL_MY_VIDEOS_SUCCESS:
      return {
        ...state,
         videos: action.videos,
         loading: false 
      }
    case videoTypes.IS_LOADING_MY_VIDEOS:
      return{
        ...state,
        loading: true
      }
    case videoTypes.CREATE_VIDEO_REQUEST:
      return{
        ...state,
        currentVideo: { ...state.currentVideo, loading: true, action: 'create' }
      }  
    case videoTypes.CREATE_VIDEO_SUCCESS:
      return{
        ...state,
        videos: [...state.videos, action.response.data],
        currentVideo: {video: {title: '', description: '', video_url: ''}, loading: false, success: true }
      }  
    case videoTypes.CREATE_VIDEO_FAILURE:
      return{
        ...state,
        currentVideo: {video: {}, loading: false, success: false }
      }    
    case videoTypes.REMOVE_VIDEO_REQUEST:
      return{
        ...state,
        removeVideo: { ...state.removeVideo, loading: true }
      }  
    case videoTypes.REMOVE_VIDEO_SUCCESS:
      return{
        ...state,
        removeVideo: { video: action.response.data, loading: false },
        videos: state.videos.filter((obj,index) => {return action.index !== index})
      }  
    case videoTypes.REMOVE_VIDEO_FAILURE:
      return{
        ...state,
        removeVideo: { video: {}, loading: false, error: true }

      }  
    case videoTypes.GET_VIDEO_REQUEST:
      return{
        ...state,
        getVideo: { ...state.getVideo, loading: true },

      }  
    case videoTypes.GET_VIDEO_SUCCESS:
      return{
        ...state,
        getVideo: {video: action.response.data, loading: false }
      }  
    case videoTypes.GET_VIDEO_FAILURE:
      return{
        ...state,
        getVideo: { video: {}, loading: false, error: true }
      }          
    case videoTypes.UPDATE_VIDEO_REQUEST:
      return{
        ...state,
        updateVideo: { ...state.updateVideo, loading: true },
      }  
    case videoTypes.UPDATE_VIDEO_SUCCESS:
      return{
        ...state,
        updateVideo: {video: action.response.data, loading: false }
      }  
    case videoTypes.UPDATE_VIDEO_FAILURE:
      return{
        ...state,
        updateVideo: { video: {}, loading: false, error: true }
      }            
    default: 
      return state; 
  }
}

// //The individual Reducer. It handles only one Todo Object.


// const todo = (state, action) => {

//   // If the mapped todo of the previous state matches with the new ID of the action, 
//   // Only then proceed to the Reducer Switch case

//   if (state._id != (action._id || action.todo._id)) {
//       return state;
//   }

//   switch (action.type) {

//       // Edit/modifies the individual Todos using ES6 spread operator. The cases are self explanatory.

//       case TodoActions.START_EDITING:
//           {
//               return {
//                   ...state,
//                   editing: true
//               }
//           }

//       case TodoActions.CANCEL_EDITING:
//           {
//               return {
//                   ...state,
//                   editing: false
//               }
//           }

//       case TodoActions.UPDATE_TODO:
//           {
//               return {
//                   ...state,
//                   editing: false,
//                   updating: true
//               }
//           }

//       case TodoActions.UPDATE_TODO_SUCCESS:
//           {
//               return {
//                   ...state,
//                   ...action.todo,
//                   updating: false
//               }
//           }

//       case TodoActions.DELETE_TODO:
//           {
//               return {
//                   ...state,
//                   deleting: true
//               }
//           }

//       case TodoActions.DELETE_TODO_SUCCESS:
//           {
//               return false
//           }

//       default:
//           {
//               return state;
//           }
//   }
// }


