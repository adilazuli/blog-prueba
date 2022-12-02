<script>
export default {
    // Obtener preview de imagen
    data(){
        return{
            imgPreview: null
        }
    },

   methods: {
    GetImage(e){
        console.log("Aqui", e.target.files);
        let image =  e.target.files[0];
        let reader = new FileReader();
        reader.readAsDataURL(image)
        reader.onload = e => {
            console.log(e)
            this.imgPreview = e.target.result
        }
    }
   }
}
</script>

<script setup>
import Button from '@/Components/Button.vue';
import ValidationErrors from '@/Components/ValidationErrors.vue';
import AuthenticatedLayout from '@/Layouts/Authenticated.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';

defineProps({
    authors: Object
})

const form = useForm({
    title: '',
    author_id: '',
    imgUrl: null,
    description: ''
    
});


const submit = () => {
    form.post(route('publicaciones.store'), {
        onSuccess: () => alert("Post creado"),
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
                    <Button @click="submit">
                        <img src="@/assets/plus.svg" alt="" class="h-4 mr-2.5" >
                        Añadir publicación
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
                        <div class="h-96">
                            <img v-if="imgPreview" :src="imgPreview" alt="Imagen" class="h-full">
                            <img v-else src="@/assets/default_image.jpg" alt="Imagen">
                        </div>
                        <input @change="GetImage" type="file" class="text-white mt-3" @input="form.imgUrl = $event.target.files[0]" accept=".jpg, .jpeg, .png">
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
