<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';
import BlogLayout from '@/Layouts/Blog.vue'
import Footer from '@/Components/footer.vue';
import Button from '@/Components/Button.vue';

defineProps({
    post: Object
})
</script>

<template>
    <Head :title="post.title" />
    <BlogLayout canLogin="canLogin">
        <div class="relative min-h-screen sm:items-center mt-10 sm:pt-0 xl:px-0 px-5 max-w-6xl mx-auto text-white">
            <Link :href="route('home')">
            <p class="mb-3">&lt; Inicio</p>
            </Link>
            <span class="bg-cyan-400 px-3 py-1 text-xs">Etiqueta - Categoria</span>
            <h1 class="uppercase text-5xl mb-10 pt-3">{{ post.title }}</h1>
            <div class="grid lg:grid-cols-3 grid-cols-1 xl:px-0 gap-10">
                <div class="post-content col-span-2">
                    <img class="mb-10 max-h-96" :src="(post.imgUrl)" alt="post-image">
                    <p class="text-gray-200 text-sm mb-10 font-thin">Autor - {{ post.author.name }}</p>
                    <p class="mb-5 text-justify font-light">
                        {{ post.description }}
                    </p>
                    <!-- Buttons -->
                    <div class="prev-next-btn flex mt-14">
                        <div class="w-1/2">
                            <Link v-if="post.next" :href="route('blog.show', post.next)">
                            <Button>
                                Anterior
                            </Button>
                            </Link>
                        </div>
                        <div class="w-1/2 flex justify-end">
                            <Button>
                                <Link v-if="post.previous" :href="route('blog.show', post.previous)">
                                Siguiente
                                </Link>
                            </Button>
                        </div>
                    </div>
                </div>
                <div class="advertise">
                    <p class="text-white w-fit h-fit">Espacio pubicitario</p>
                    <img src="@/assets/default_image.jpg" alt="">
                    <img class="w-4/5 justify-self-end mt-10 mx-auto" src="@/assets/1200px-Laravel.png" alt="">
                </div>
            </div>
            <Footer />
        </div>
    </BlogLayout>
</template>

<style scoped>
.pattern {
    background-image: none;
}
</style>
