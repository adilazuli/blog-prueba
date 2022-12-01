<script setup>
import PostCard from "@/Components/PostCard.vue"


defineProps({
    posts: Object
})

</script>

<template>
    <div class="grid md:grid-cols-3 gap-8 mt-16 max-w-6xl mx-auto" >
        <PostCard :post="item" v-for="(item, index) in posts" :key="index"/>
    </div>
</template>

