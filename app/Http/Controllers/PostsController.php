<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Authors;
use App\Models\Posts;
use Inertia\Inertia;

class PostsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Posts::with('author')->get();
        return Inertia::render('Publicaciones',[
            "posts" => $posts
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $authors = Authors::get();
        return Inertia::render('PostForm',[
         "authors" => $authors
     ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'imgUrl' => 'required | mimes:jpg,png',
            'title' => 'required',
            'description' => 'required',
            'author_id' => 'required',
        ]);

        if (!$validated) {
            return false;
        }

        $pathImage = $this->uploadImage($request, "imgUrl", "postImage");

        $posts = new Posts;

        $posts->title = $request->title;
        $posts->imgUrl = $pathImage;
        $posts->description = $request->description;
        $posts->author_id = $request->author_id;

        $posts->save();
        return redirect()->route("publicaciones.index");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $authors = Authors::get();
        $post = Posts::find($id);
        $post->imgUrl = asset('storage/'.$post->imgUrl);

        return Inertia::render('PostUpdate',[
            "post" => $post,
            "authors" => $authors
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'imgUrl' => 'nullable|mimes:jpg,png',
            'title' => 'required',
            'description' => 'required',
            'author_id' => 'required',
        ]);

        if (!$validated) {
            return false;
        }

        $pathImage = $this->uploadImage($request, "imgUrl", "postImage");

        $post = Posts::find($id);

        $post->title = $request->title;
        if ($pathImage != ''){
            $post->imgUrl = $pathImage;
        }else{
            $post->imgUrl = $post->imgUrl;
        }
        $post->description = $request->description;
        $post->author_id = $request->author_id;

        $post->save();
        return redirect()->route("publicaciones.index");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Posts::find($id);
        $post->delete();

        return redirect()->route("publicaciones.index");

    }

    public function uploadImage($file, $element, $direction)
    {
        $path = '';
        if($file->file($element)){
            $imageFile = $file->file($element);
            $imageName = time().'.'.$imageFile->getClientOriginalExtension();
            $path = $direction.'/'.$imageName;
            $imageFile->storeAs($direction ,$imageName);
        }
        return $path;
    }
}
