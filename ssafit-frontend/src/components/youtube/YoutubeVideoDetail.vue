<template>
  <div v-if="store.selectedVideo" class="container text-center">
    <iframe
      width="1008"
      height="566"
      :src="videoURL"
      title="YouTube video player"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      allowfullscreen
    ></iframe>
  </div>
</template>

<script setup>
import { useYoutubeStore } from '@/stores/youtube';
import {computed} from 'vue'
const store = useYoutubeStore();

const videoURL = computed(()=>{
    const videoId = store.selectedVideo.id.videoId
    return `https://www.youtube.com/embed/${videoId}`
})


</script>

<style scoped></style>
