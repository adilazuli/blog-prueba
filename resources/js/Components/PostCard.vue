<script setup>
import { Link } from '@inertiajs/inertia-vue3';
import { format } from 'date-fns'

defineProps({
    post: Object
})
</script>

<template>
    <Link :href="route('blog.show', post.id)">
        <div class="bg-black/70 h-full text-white p-4 hover:outline  hover:outline-cyan-500 cursor-pointer">
            <img :src="post.imgUrl" alt="post-image" class="h-52 mx-auto">
            <span class="bg-cyan-400 px-3 py-1 text-xs">Etiqueta - Categoria</span>
            <h1 class="text-lg mt-4 uppercase tracking-wider">{{ post.title }}</h1>
            <span class="text-sm font-thin">{{ format(new Date(post.created_at), "dd MMM y")}}</span>
            <p class="text-slate-500 text-sm leading-6 line-clamp-3 mt-5">{{ post.description }}</p>
        </div>
    </Link>
</template>