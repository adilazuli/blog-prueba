<script setup>
import PostCard from "@/Components/PostCard.vue"
import { Link } from "@inertiajs/inertia-vue3";


const props = defineProps({
    posts: Object
})
</script>

<template>
    <div class="grid md:grid-cols-3 gap-8 mt-16 max-w-6xl mx-auto" >
        <PostCard :post="item" v-for="(item, index) in posts.data" :key="index"/>
    </div>
    <ul class="flex justify-between w-64 mx-auto text-white my-16">
        <li v-for="(item, index) in posts.links">
            <Link v-html="item.label" :href="item.url" :class="item.active ? 'text-sky-500' : ''"></Link>
        </li>
    </ul>
</template>

