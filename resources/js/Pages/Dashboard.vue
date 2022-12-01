<script setup>
import AuthenticatedLayout from '@/Layouts/Authenticated.vue';
import { Head } from '@inertiajs/inertia-vue3';
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <div class="py-12">
            <div class="max-w-screen-2xl mx-auto sm:px-6 lg:px-8">
                <h1 class="md:text-5xl text-bold text-slate-200">Bienvenido</h1>
                <h3 class="text-white mt-8">Estadisticas</h3>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
