<?php
namespace app\admin\controller;
use think\Db;
use think\Controller;
class Index extends Controller
{
    public function index()
    {
        return "this is admin page";
    }

    public function  test()
    {
        return " this is a admin test";
    }

}
