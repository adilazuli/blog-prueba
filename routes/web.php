<?php

use Illuminate\Foundation\Application;
use App\Http\Controllers\PostsController;
use App\Http\Controllers\AuthorsController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function ()
    {
        return redirect('/blog');
    })->name('home');

Route::resource('blog', HomeController::class);


// Route::get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::prefix('admin')->middleware('auth')->group(function(){
    Route::get('/', function ()
    {
        return redirect('/admin/dashboard');
    });

    Route::get('/dashboard', function ()
    {
        return Inertia::render('Dashboard');
    })->name('dashboard');

    Route::resource('publicaciones', PostsController::class);
    Route::resource('autores', AuthorsController::class);
});





require __DIR__.'/auth.php';
