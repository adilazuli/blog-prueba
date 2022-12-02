<script setup>
import Button from '@/Components/Button.vue';
import ValidationErrors from '@/Components/ValidationErrors.vue';
import AuthenticatedLayout from '@/Layouts/Authenticated.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import { ref } from 'vue';
import Swal from 'sweetalert2';

const props = defineProps({
    authors: Object
})

const form = useForm({
    name: '',
});

const author = useForm({
    name: '',
    id: 0
})


const indexInput = ref(null)

const submit = () => {
    form.post(route('autores.store'), {
        onSuccess: () => Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Autor añadido',
            showConfirmButton: false,
            timer: 1500
        }),
    });
};

const deleteAuthor = (id) => {
    form.delete(route('autores.destroy', id), {
        onSuccess: () => Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Autor eliminado',
            showConfirmButton: false,
            timer: 1500
        }),
    });
};

const selectInput = (index) => {
    author.id = props.authors.data[index].id
    author.name = props.authors.data[index].name
    indexInput.value = index
}

const update = () => {
    author.put(route('autores.update', author.id), {
        onSuccess: () => {
            author.id = 0
            indexInput.value = null

            Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Nombre actualizado',
            showConfirmButton: false,
            timer: 1500
        })
        },
    });
};

</script>

<template>

    <Head title="Autores" />

    <AuthenticatedLayout>
        <div class="py-12  h-full">
            <div class="max-w-screen-2xl mx-auto px-3 sm:px-6 lg:px-8 ">
                <div class="flex flex-wrap justify-center sm:justify-between">
                    <div class="w-2/3">
                        <h1 class="text-5xl text-bold text-slate-200">Autores</h1>
                        <span class="text-sky-500 font-light text-xs mt-1">{{ authors.data.length }} autores</span>
                    </div>
                    <input type="text" v-model="form.name" placeholder="Nombre"
                        class="h-8 mt-8 sm:mt-0.5 focus:border-slate-700 focus:ring-slate-600 border-slate-400/10 rounded-md bg-transparent text-white w-full sm:w-auto">
                    <Button @click="submit" class="sm:w-fit w-full mt-2 sm:mt-0">
                        <img src="@/assets/plus.svg" alt="" class="h-4 mr-2.5">
                        Añadir autor
                    </Button>
                </div>
                <div class=" overflow-hidden">
                    <div>
                        <ValidationErrors class="mb-4" />
                        <p class="border-b mb-2 py-2 border-slate-400/10 mt-10 text-gray-200 text-xs">Nombre</p>
                        <ul>
                            <li v-for="(item, index) in authors.data" :key="index">
                                <div
                                    class="flex justify-between border-b mb-2 py-2 border-slate-400/10 text-sm text-indigo-300">
                                    <p v-if="(indexInput != index)">{{ item.name }}</p>
                                    <div v-else-if="(author && author.id == item.id)">
                                        <input type="text" v-model="author.name"
                                            class="focus:border-slate-700 focus:ring-slate-600 border-slate-400/10 rounded-md bg-transparent text-white">
                                        <Button class="sm:ml-3" @click="update">Actualizar</Button>
                                    </div>
                                    <div class="flex">
                                        <a href="#" @click="selectInput(index)">
                                            <img src="@/assets/pen.svg" alt="" class="h-4 mr-2.5">
                                        </a>
                                        <a href="#" @click="deleteAuthor(item.id)">
                                            <img src="@/assets/trash-alt.svg" alt="" class="h-4 mr-2.5">
                                        </a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <ul class="flex justify-between w-64 mx-auto text-white my-16">
                        <li v-for="(item, index) in authors.links">
                            <Link v-html="item.label" :href="item.url" :class="item.active ? 'text-sky-500' : ''">
                            </Link>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
