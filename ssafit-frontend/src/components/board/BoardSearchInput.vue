<template>
    <div class="text-center py-4">
        <div class="row align-items-center">
            <div class="col-2">
                <select class="form-select" v-model="searchInfo.key">
                    <option value="none">검색기준</option>
                    <option value="writer">글쓰니</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </div>
            <div class="col-6">
                <input type="text" placeholder="검색내용" class="form-control" v-model="searchInfo.word" />
            </div>
            <div class="col-2">
                <select class="form-select" v-model="searchInfo.orderBy">
                    <option value="none">정렬기준</option>
                    <option value="title">제목</option>
                    <option value="viewCnt">조회수</option>
                </select>
            </div>
            <div class="col-1 p-0">
                <span v-if="searchInfo.orderByDir === 'asc'">
                    <button class="btn btn-secondary" @click="sortChange" style="font-size: medium; padding: 6px">내림차순</button>
                </span>
                <span v-else>
                    <button class="btn btn-secondary" @click="sortChange" style="font-size: medium; padding: 6px">오름차순</button>  
                </span>
            </div>
            <!-- <div class="form-check form-check-inline">
                <input v-model="searchInfo.orderBy" class="form-check-input" type="radio" id="title" value="title" />
                <label class="form-check-label" for="title"><i class="bi bi-fonts"></i></label>
            </div>
            <div class="form-check form-check-inline">
                <input v-model="searchInfo.orderBy" class="form-check-input" type="radio" id="viewCnt"
                    value="view_cnt" />
                <label class="form-check-label" for="viewCnt"><i class="bi bi-eye-fill"></i></label>
            </div>
            <div @click="sortChange">
                <span v-if="searchInfo.orderByDir === 'asc'">
                    <i class="bi bi-arrow-up-right-square-fill"></i>
                </span>
                <span v-else><i class="bi bi-arrow-down-right-square-fill"></i></span>
            </div> -->
            <div class="col-1">
                <button class="btn btn-secondary" @click="searchArticles">검색</button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from "vue";
import { useBoardStore } from "@/stores/board";

const store = useBoardStore();
const searchInfo = ref({
    key: "none",
    word: "",
    orderBy: "none",
    orderByDir: "desc",
});

const searchArticles = function () {
    if(searchInfo.value.key == "none") {
        alert("검색 기준을 선택해주세요.")
        return ;
    }
    if(searchInfo.value.word == ""){
        alert("검색어를 입력해주세요.")
        return ;
    }
    store.searchCondition = searchInfo.value
    store.getArticlesBySearchInfo(searchInfo.value);
    store.getArticlesBySearchInfoWithPage(1);
};

const sortChange = function () {
    if (searchInfo.value.orderByDir === "asc")
        searchInfo.value.orderByDir = "desc";
    else searchInfo.value.orderByDir = "asc";
};
</script>

<style scoped>

</style>