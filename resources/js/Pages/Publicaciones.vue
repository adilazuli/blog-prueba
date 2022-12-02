<script setup>
import Button from '@/Components/Button.vue';
import AuthenticatedLayout from '@/Layouts/Authenticated.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import { format } from 'date-fns'

const props = defineProps({
    posts: Object
})
const form = useForm();

const deletePost = (id) => {
    form.delete(route('publicaciones.destroy', id), {
        onFinish: () => alert("Post eliminado"),
    });
};

</script>

<template>

    <Head title="Publicaciones" />

    <AuthenticatedLayout>
        <div class="py-12  h-full">
            <div class="max-w-screen-2xl mx-auto px-3 sm:px-6 lg:px-8 ">
                <div class="flex flex-wrap justify-center sm:justify-between">
                    <div class="sm:w-2/3 w-full text-center sm:text-left">
                        <h1 class="md:text-5xl text-bold text-slate-200">Publicaciones</h1>
                        <span class="text-sky-500 font-light text-xs mt-1">{{ posts.length }} publicaciones</span>
                    </div>
                    <Link :href="route('publicaciones.create')">
                    <Button class="sm:w-fit w-full mt-8 sm:mt-0">
                        <img src="@/assets/plus.svg" alt="icon" class="h-4 mr-2.5">
                        Añadir publicación
                    </Button>
                    </Link>
                </div>
                <div class=" overflow-hidden">
                    <div>
                        <ValidationErrors class="mb-4" />
                        <div
                            class="border-b mb-2 py-2 border-slate-400/10 mt-10 text-gray-200 text-xs grid grid-cols-4">
                            <p>Título</p>
                            <p>Autor</p>
                            <p>Fecha</p>
                            <div class="w-16"></div>
                        </div>
                        <ul>
                            <li v-for="(item, index) in posts.data" :key="index">
                                <div class="grid grid-cols-4 border-b mb-2 py-2 border-slate-400/10 text-sm text-indigo-300">
                                    <p class="text-ellipsis pr-4">{{ item.title }}</p>
                                    <p class="text-ellipsis pr-4">{{ item.author.name }}</p>
                                    <p class="text-ellipsis">{{ format(new Date(item.created_at), "dd MMM y") }}</p>
                                    <div class="flex w-full justify-end">
                                        <Link :href="route('publicaciones.edit', item.id)">
                                            <img src="@/assets/pen.svg" alt="" class="h-4 mr-2.5">
                                        </Link>
                                        <a href="#" @click="deletePost(item.id)">
                                            <img src="@/assets/trash-alt.svg" alt="" class="h-4 mr-2.5">
                                        </a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <ul class="flex justify-between w-64 mx-auto text-white my-16">
                        <li v-for="(item, index) in posts.links">
                            <Link v-html="item.label" :href="item.url" :class="item.active ? 'text-sky-500' : ''">
                            </Link>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
