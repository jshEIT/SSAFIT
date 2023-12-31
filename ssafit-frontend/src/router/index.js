import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import BoardView from '../views/BoardView.vue'
import VideoView from '../views/VideoView.vue'
import MypageView from '../views/MyPageView.vue'
import KakaoMapView from "../views/KakaoMapView.vue"

import AnnounceList from '../components/article/AnnounceList.vue'
import FreeList from '../components/article/FreeList.vue'
import ArticleCreate from '../components/article/ArticleCreate.vue'
import ArticleDetail from '../components/article/ArticleDetail.vue'
import ArticleModify from '../components/article/ArticleModify.vue'

import VideoList from '../components/video/VideoList.vue'
import AbsList from '../components/video/AbsList.vue'
import ArmList from '../components/video/ArmList.vue'
import BackList from '../components/video/BackList.vue'
import ChestList from '../components/video/ChestList.vue'
import LegList from '../components/video/LegList.vue'
import ShoulderList from '../components/video/ShoulderList.vue'
import VideoDetail from '../components/video/VideoDetail.vue'
import Youtube from '../components/youtube/Youtube.vue'

import Mypage from "../components/user/Mypage.vue"
import UserSignupForm from "../components/user/UserSignupForm.vue"
import UserUpdateForm from "../components/user/UserUpdateForm.vue"

import FollowList from "../components/follow/FollowList.vue"
import VideoLikeList from "../components/video/VideoLikeList.vue"
import ArticleLikeList from "../components/article/ArticleLikeList.vue"
import MyArticleList from "../components/article/MyArticleList.vue"

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path : "/signup",
      name : "Signup",
      component : UserSignupForm
    },
    {
      path: '/login',
      name: 'Login',
      component: LoginView
    },
    {
      path: '/board',
      name: 'Board',
      component: BoardView,
      children : [
        {
          path : "free",
          name : "free",
          component : FreeList,
        },
        {
          path : "announce",
          name : "announce",
          component : AnnounceList,
        },
        {
          path : "create",
          name : "articleCreate",
          component : ArticleCreate,
        },
        {
          path : ":articleId",
          name : "ArticleDetail",
          component : ArticleDetail,
        },
        {
          path : ":articleId/modify",
          name : "ArticleModify",
          component : ArticleModify,
        },
      ]
    },
    {
      path : "/mypage",
      name : "Mypage",
      component : MypageView,
      props : true,
      children : [
        {
          path : "",
          name : "Mypage",
          component : Mypage,
          props : true,
        },
        {
          path : "update",
          name : "UserUpdate",
          component : UserUpdateForm,
        },
        {
          path : "myFollowList",
          name : "MyFollowList",
          component : FollowList,
        },
        {
          path : "myArticleLikeList",
          name : "MyArticleLikeList",
          component : ArticleLikeList,
        },
        {
          path : "videoLikeList",
          name : "VideoLikeList",
          component : VideoLikeList ,
        },
        {
          path : "myArticleList",
          name : "MyArticleList",
          component : MyArticleList ,
        },
      ]
    },
    
    {
      path: '/video',
      name: 'Video',
      component: VideoView,
      children : [
        {
          path : "",
          name : "VideoList",
          component : VideoList,
        },
        {
          path : ":videoId",
          name : "VideoDetail",
          component : VideoDetail,
        },
        {
          path : "absList",
          name : "AbsList",
          component : AbsList,
        },
        {
          path : "armList",
          name : "ArmList",
          component : ArmList,
        },
        {
          path : "backList",
          name : "BackList",
          component : BackList,
        },
        {
          path : "chestList",
          name : "ChestList",
          component : ChestList,
        },
        {
          path : "legList",
          name : "LegList",
          component : LegList,
        },
        {
          path : "shoulderList",
          name : "ShoulderList",
          component : ShoulderList,
        },
        {
          path : "youtube",
          name : "Youtube",
          component : Youtube,
        },
      ]
    },
    {
      path : "/map",
      name : "map",
      component : KakaoMapView,
      // component : () => import("@/views/KakaoMapView.vue")
    },
    {
      path : "/followList",
      name : "followList",
      component : FollowList,
    },
    {
      path : "/articleLikeList",
      name : "articleLikeList",
      component : ArticleLikeList,
    },


  ]
})


export default router