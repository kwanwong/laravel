<?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class ExampleTest extends DuskTestCase
{
    /**
     * A basic browser test example.
     *
     * @return void
     */
    public function testBasicExample()
    {
        $this->browse(function ($browser) {
            $browser->visit('/')
                    ->assertSeeLink('Laravel');
        });
    }

    public function testUserList()
    {
        $this->browse(function ($browser) {
            $browser->visit('/login')
                    ->type('email', 'kopiteken@163.com')
                    ->type('password', '123456')
                    ->press('登录')
                    ->assertPathIs('/');
        });
    }
}
