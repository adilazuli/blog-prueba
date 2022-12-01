<script setup>
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import { Link } from '@inertiajs/inertia-vue3';
</script>

<template>
    <div class=" pattern">
        <div class="min-h-screen backdrop-blur flex flex-col justify-center items-center pt-6 sm:pt-0">
            <div>
                <Link href="/">
                    <ApplicationLogo class="sm:w-96 w-60 fill-current mb-10" />
                </Link>
            </div>
            <div class="w-full sm:max-w-md mt-6 px-6 py-4 sam:shadow-md overflow-hidden sm:bg-black/70">
                <slot />
            </div>
        </div>

    </div>
</template>
<style>
.loading{
    display: none;
}
</style>
