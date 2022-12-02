<script setup>
import PieCharts from '@/Components/PieCharts.vue';
import BarChart from '@/Components/BarChart.vue';
import AuthenticatedLayout from '@/Layouts/Authenticated.vue';
import { Head } from '@inertiajs/inertia-vue3';

</script>

<template>

    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <div class="py-12">
            <div class="max-w-screen-2xl mx-auto sm:px-6 lg:px-8">
                <h1 class="md:text-5xl text-bold text-slate-200">Bienvenido</h1>
                <div class="grid grid-cols-3 gap-5">
                    <div class="rounded-md w-96 mt-10 bg-slate-800 p-9 flex justify-center items-center">
                        <PieCharts width="300" css-classes="text-white"/>
                    </div>
                    <div class="rounded-md mt-10 bg-slate-800 p-9 col-span-2">
                        <BarChart height="200"/>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
