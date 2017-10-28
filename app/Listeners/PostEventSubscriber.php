<?php
/**
 * Created by PhpStorm.
 * User: Kwan Wong
 * Date: 2017/10/28
 * Time: 14:37
 */

namespace App\Listeners;

class PostEventSubscriber
{
    public function onPostAdd($event)
    {
        Log::info('post '.$event->post->title.' add successfully!');
    }

    public function onPostDelete($event)
    {
        Log::info('post deleted!');
    }

    public function subscribe($events)
    {
        $events->listen(
            'App\Events\AddPost',
            'App\Listeners\PostEventSubscriber@onPostAdd'
        );

        $events->listen(
            'App\Events\DeletePost',
            'App\Listeners\PostEventSubscriber@onPostDelete'
        );
    }
}