<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Log;

class CollectionController extends Controller
{
    private $oneDimensionNumber;
    private $oneDimensionString;
    private $twoDimensions;
    private $data = [];

    public function __construct()
    {
        $this->oneDimensionNumber = range(1, 100);
        $this->oneDimensionString = ['Jackie Brown', 'Foo', 'Bar', '', null];

        $this->twoDimensions = [
            [
                'name' => 'Foo',
                'email' => 'foo@example.com',
                'credits' => 5000,
                'active' => 1,
                'created_at' => '2017-10-26 10:00:00',
            ],
            [
                'name' => 'Bar',
                'email' => 'bar@example.com',
                'credits' => 1000,
                'active' => 0,
                'created_at' => '2017-10-25 09:00:00',
            ]
        ];
    }



    public function __toString()
    {
        return 'object cannot convert to string';
    }

    public function index($name = '')
    {
        if(!method_exists($this, $name)){
            dump('this collection method not exist.');
        }

        self::$name();
    }

    protected function reject()
    {
        $collection = collect($this->oneDimensionString)->map(function ($name) {
            return strtoupper($name);
        })->reject(function($name){
            return empty($name);
        });
        dump($collection->all());
    }

    /**
     * 返回所有集合项的和
     * 如果集合包含嵌套的数组或对象，则需要指定键以判断计算哪些项的和
     */
    protected function sum()
    {
        $sumOne = collect($this->oneDimensionNumber)->sum();
        $sumTwo = collect($this->twoDimensions)->sum('credits');
        dump($sumOne);
        dump($sumTwo);
    }

    /**
     * 返回所有集合项的平均值
     * 如果集合包含嵌套的数组或对象，则需要指定键以判断计算哪些项的平均值
     */
    protected function avg()
    {
        $avgOne = collect($this->oneDimensionNumber)->avg();
        $avgTwo = collect($this->twoDimensions)->avg('credits');
        dump($avgOne);
        dump($avgTwo);
    }

    /**
     * 将一个集合分割成多个小尺寸的集合
     */
    protected function chunk()
    {
        foreach (collect($this->oneDimensionNumber)->chunk(5) as $chunk){
            $sumChunk = 0;
            foreach ($chunk as $item){
                $sumChunk += $item;
            }
            dump($sumChunk);
        }
    }

    /**
     * 判断集合中是否包含给定项
     */
    protected function contains()
    {
        $isExistOne = collect($this->oneDimensionString)->contains('Foo');
        dump($isExistOne);
        $isExistTwo = collect($this->twoDimensions)->contains('name', 'Foo');
        dump($isExistTwo);
    }

    /**
     * 返回集合中所有项的总数
     */
    protected function count()
    {
        $count = collect($this->twoDimensions)->count();
        dd($count);
    }

    /**
     * 迭代集合中的每一项并传递每一项到回调函数
     * 通过回调中返回false终止迭代
     */
    protected function each()
    {
        collect($this->twoDimensions)->each(function($item, $key){
            if($key > 0){
                return false;
            }
            echo $key . '=' .$item['name']."<br/>";
        });
    }

    /**
     * 验证集合中的所有元素是否能通过给定的真理测试
     */
    protected function every()
    {
        $isTrue = collect($this->twoDimensions)->every(function($item){
            return is_array($item) && $item['credits'] >= 1000;
        });
        dd($isTrue);
    }

    /**
     * 返回集合中除了指定键的所有集合项
     */
    protected function except()
    {
        $filtered = collect($this->twoDimensions)->except([0]);
        dd($filtered->all());
    }

    /**
     * 返回集合中指定的集合项
     */
    protected function only()
    {
        $filtered = collect($this->twoDimensions)->only([1]);
        dd($filtered->all());
    }

    public function __call($method = '', $args = [])
    {
        if($method == 'avg'){
            echo 'call avg method.';
        }
    }

    public static function __callStatic($method = '', $args = [])
    {
        
    }

    public function __sleep()
    {
        Log::info('call __sleep() before serialize');
        return ['oneDimensionNumber', 'oneDimensionString'];
    }

    public function __wakeup()
    {
        
    }

    public function __clone()
    {
        // todo
    }

    public function __get($name)
    {
        if(array_key_exists($name, $this->data)){
            return $this->data[$name];
        }
    }

    public function __set($name, $value)
    {
        $this->data[$name] = $value;
    }

    public function __isset($name)
    {
        
    }

    public function __unset($name)
    {
        
    }

    public function __invoke()
    {
        
    }

    public function __debugInfo()
    {
        return [
            'oneDimensionString' => $this->oneDimensionString,
        ];
    }

    public function __destruct()
    {
        // todo
    }
}
