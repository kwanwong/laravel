<?php

namespace App\Listeners;

use App\Events\AddPost;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Log;

class SendEmail implements ShouldQueue
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  AddPost  $event
     * @return void
     */
    public function handle(AddPost $event)
    {
//        dump($event->post);
        Log::info('post '.$event->post->title.' add successfully! send email..');
    }

    public function failed(AddPost $event, $exception)
    {
        
    }
}
