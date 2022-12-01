<script setup>
import { ref } from 'vue';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
import { Link } from '@inertiajs/inertia-vue3';

const props = defineProps({
    canLogin: Boolean,
})
const showingNavigationHome = ref(false);
</script>

<template>
    <div class="pattern">
        <div class="min-h-screen backdrop-blur relative pb-10">
            <nav class="sticky top-0 bg-black/70 z-10 backdrop-blur-lg">
                <!-- Primary Navigation Menu -->
                <div class="mx-auto px-5 pt-4 sm:px-6 lg:px-8">
                    <div class="flex justify-between h-16">
                        <!-- Logo -->
                        <div class="shrink-0 flex items-center">
                            <Link :href="route('home')">
                                <ApplicationLogo class="block h-9 w-auto" />
                            </Link>
                        </div>

                        <!-- Admin Links -->
                        <div v-if="canLogin" class="hidden px-6 py-4 sm:block">
                            <Link v-if="$page.props.auth.user" :href="route('dashboard')"
                                class="text-sm text-white uppercase">
                            Administrar
                            </Link>

                            <template v-else>
                                <Link :href="route('login')" class="text-sm text-white uppercase">
                                Iniciar sesión
                                </Link>
                            </template>
                        </div>

                        <!-- Hamburger -->
                        <div class="-mr-2 flex items-center sm:hidden">
                            <button @click="showingNavigationHome = !showingNavigationHome"
                                class="inline-flex items-center justify-center p-2 rounded-md text-white hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out">
                                <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                                    <path
                                        :class="{ 'hidden': showingNavigationHome, 'inline-flex': !showingNavigationHome }"
                                        stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M4 6h16M4 12h16M4 18h16" />
                                    <path
                                        :class="{ 'hidden': !showingNavigationHome, 'inline-flex': showingNavigationHome }"
                                        stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Responsive Navigation Menu -->
                <div :class="{ 'block': showingNavigationHome, 'hidden': !showingNavigationHome }" class="sm:hidden">
                    <div class="pt-2 space-y-1 text-white">
                        <ResponsiveNavLink :href="route('dashboard')" :active="route().current('dashboard')">
                            Administrar
                        </ResponsiveNavLink>
                    </div>
                    <div class="pt-2 pb-3 space-y-1 text-white">
                        <ResponsiveNavLink :href="route('logout')" method="post" as="button">
                            Cerrar sesión
                        </ResponsiveNavLink>
                    </div>
                    <!-- Responsive Settings Options -->
                    <div class="pt-4 pb-3 border-y border-gray-200">
                        <div class="px-4 flex justify-between">
                            <!-- <div class="font-medium text-base text-white">{{ $page.props.auth.user.name }}</div>
                            <div class="font-medium text-sm text-white">{{ $page.props.auth.user.email }}</div> -->
                        </div>
                    </div>
                </div>
            </nav>

            <!-- Page Heading -->
            <header v-if="$slots.header">
                <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8 1">
                    <slot name="header" />
                </div>
            </header>

            <!-- Page Content -->
            <main>
                <slot />
            </main>
        </div>
    </div>
</template>

<style>
.loading{
    display: none;
}
</style>
