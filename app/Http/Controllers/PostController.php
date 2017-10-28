<?php

namespace App\Http\Controllers;

use App\Events\AddPost;
use App\Events\DeletePost;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Jobs\SendReminderEmail;
use Repository\Eloquent\PostRepository;

class PostController extends Controller
{
    private $post;

    public function __construct(PostRepository $post)
    {
        $this->post = $post;
    }

    public function index()
    {
        $title = '文章列表';
        $posts = $this->post->paginate(10);

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

        $post = $this->post->create($request->all());

        // 调用文章添加事件
        event(new AddPost($post));

        // 队列延迟两分钟执行
        SendReminderEmail::dispatch($post)->delay(Carbon::now()->addMinutes(2));

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
        $post = $this->post->find($id);
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
        $this->post->delete($id);

        return response()->json([
            'code' => 200,
            'msg' => '文章'.$id.'已成功删除',
        ]);
    }
}
