<?php

namespace App\Http\Controllers;

use App\Jobs\SendReminderEmail;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Post as Post;
use Illuminate\Support\Facades\Log;

class PostController extends Controller
{
    public function index()
    {
        $title = '文章列表';
        $posts = Post::orderby('created_at', 'desc')->paginate(10);
        return view('post.list', compact('title', 'posts'));
    }

    /**
     * 显示添加文章表单
     *
     * @author wangkun
     * @date 2017/10/18
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function create()
    {
        $title = '添加文章';
        return view('post.add', compact('title'));
    }

    /**
     * 新增文章
     *
     * @author wangkun
     * @date 2017/10/18
     * @param Request $request
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|min:5|max:128',
            'summary' => 'required|max:255',
            'content' => 'required'
        ]);

        $post = Post::create($request->all());
        SendReminderEmail::dispatch($post)->delay(Carbon::now()->addMinutes(5));

        return redirect('posts');
    }

    /**
     * 文章详情页
     *
     * @author wangkun
     * @date 2017/10/18
     * @param $id
     */
    public function show($id)
    {
        $post = Post::findOrFail($id);
        $post->views = $post->views+1;
        $post->save();
        return view('post.detail', compact('post'));
    }

    /**
     * 显示编辑文章表单
     *
     * @author wangkun
     * @date 2017/10/18
     * @param $id
     */
    public function edit($id)
    {
        
    }

    /**
     * 更新文章信息
     *
     * @author wangkun
     * @date 2017/10/18
     * @param Request $request
     * @param $id
     */
    public function update(Request $request, $id)
    {
        
    }

    /**
     * 删除文章
     *
     * @author wangkun
     * @date 2017/10/18
     * @param $id
     */
    public function destroy($id)
    {
        
    }
}
