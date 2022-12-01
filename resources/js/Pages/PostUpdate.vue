<script setup>
import Button from '@/Components/Button.vue';
import ValidationErrors from '@/Components/ValidationErrors.vue';
import AuthenticatedLayout from '@/Layouts/Authenticated.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';


const props = defineProps({
    authors: Object,
    post: Object
})

const form = useForm({
    _method: 'put',
    title: props.post.title,
    author_id: props.post.author_id,
    imgUrl: null,
    description: props.post.description

});

const update= () => {
    form.post(route('publicaciones.update', props.post.id), {
        onFinish: () => alert("Post actualizado"),
    });
};

</script>

<template>

    <Head title="Publicaciones" />

    <AuthenticatedLayout>
        <div class="py-12  h-full">
            <ValidationErrors class="mb-4" />
            <div class="max-w-screen-2xl mx-auto sm:px-6 lg:px-8 ">
                <div class="flex w-full justify-between">
                    <h1 class="text-5xl text-bold text-slate-200">Crear publicacion</h1>
                    <Button @click="update">
                        Actualizar publicación
                    </Button>
                </div>
                <div class="mt-20 overflow-hidden grid grid-cols-2 gap-5">
                    <div class="flex flex-col gap-5">
                        <select name="Autor" id="" class="rounded-md" v-model="form.author_id">
                            <option value="" selected class="text-gray-300 hover:text-gray-300">Seleccionar autor
                            </option>
                            <option :value="item.id" v-for="(item, index) in authors" :key="index">{{ item.name }}
                            </option>
                        </select>
                        <input v-model="form.title" type="text" placeholder="Titulo de la publicación" class="rounded-md w-full">
                        <textarea v-model="form.description" placeholder="Descripción" class="rounded-md w-full h-4/5" />
                    </div>
                    <div class="flex flex-col justify-end">
                        <img :src="props.post.imgUrl" alt="">
                        <input type="file" class="text-white mt-3" @input="form.imgUrl = $event.target.files[0]" accept=".jpg, .jpeg, .png">
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
