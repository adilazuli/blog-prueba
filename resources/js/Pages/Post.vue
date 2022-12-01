<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';
import BlogLayout from '@/Layouts/Blog.vue'
import Footer from '@/Components/footer.vue';


defineProps({
    post: Object
})
</script>

<template>

    <Head title="Aqui va un titulo" />
    <BlogLayout canLogin="canLogin">
        <div class="relative min-h-screen sm:items-center mt-10 sm:pt-0 max-w-6xl mx-auto text-white">
            <div class="grid grid-cols-3">
                <div class="post-content col-span-2">
                    <Link :href="route('home')">
                    <p class="mb-3">&lt; volver</p>
                    </Link>
                    <span class="bg-cyan-400 px-3 py-1 text-xs">Etiqueta - Categoria</span>
                    <h1 class="uppercase text-5xl mb-10 pt-3">{{post.title}}</h1>
                    <img class="mb-10 max-h-96" :src="(post.imgUrl)" alt="post-image">
                    <p class="mb-5 text-justify">
                        {{post.description}}
                    </p>
                    
                    <div class="prev-next-btn flex justify-between mt-14">
                        <Link v-if="post.previous" :href="route('blog.show', post.previous)">
                           Articulo Anterior
                        </Link>
                        <Link v-if="post.next" :href="route('blog.show', post.next)">
                            Siguiente Articulo
                        </Link>
                    </div>
                </div>
                <div class="advertise grid">
                    <img class="w-4/5 justify-self-end pt-20" src="@/assets/1200px-Laravel.png" alt="">
                </div>
            </div>
            <Footer />
        </div>
    </BlogLayout>
</template>

<style scoped>
.pattern{
    background-image: none;
}

</style>
