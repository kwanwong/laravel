<?php
/**
 * Created by PhpStorm.
 * User: Kwan Wong
 * Date: 2017/10/24
 * Time: 15:23
 */

namespace Repository\Eloquent;

use Illuminate\Support\Facades\Log;

class PostRepository extends Repository
{
    function model()
    {
        return 'App\Post';
    }

    public function delete($id)
    {
        Log::info('删除了文章'.$id);
        return parent::delete($id);
    }
}