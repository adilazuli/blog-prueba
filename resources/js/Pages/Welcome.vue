<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';
import BlogLayout from '@/Layouts/Blog.vue'
import Posts from '@/Components/Posts.vue'
import Footer from '@/Components/footer.vue';

defineProps({
    canLogin: Boolean,
    laravelVersion: String,
    phpVersion: String,
    posts: Object
})

</script>

<template>
    <Head title="Bienvenido" />
    <BlogLayout :canLogin="canLogin">
        <div class="relative min-h-screen sm:items-center sm:pt-0">
            <div class="container mx-auto sm:px-6 lg:px-8 px-5">
                <div class="grid md:grid-cols-3 md:my-20 gap-6 max-w-6xl py-5 mx-auto">
                    <div
                        class="md:text-8xl uppercase text-xl text-white md:col-span-2 md:text-right mr-4 leading-tight">
                        <h1>Mi <br>
                            primer <i>blog</i> </h1>
                        <h1>con Laravel <span class="sm:flex justify-end">y <div class="typewriter ml-8">vue</div></span>
                        </h1>
                    </div>
                    <div class="image md:h-full h-48"></div>
                </div>
                <Posts :posts="posts"/>
            </div>
            <Footer />
        </div>
    </BlogLayout>
</template>


