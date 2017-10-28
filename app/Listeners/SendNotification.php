<?php

namespace App\Listeners;

use App\Events\AddPost;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Log;

class SendNotification
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
        Log::info('post '.$event->post->title.' added, send notification');
    }
}
