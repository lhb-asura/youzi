<?php
namespace app\index\controller;
use think\Db;
use think\Controller;
class Index extends Controller
{
    public function index()
    {
       // $data=Db::table("user")->select();

        //$this->assign('name','fsadf');
        //echo APP_PATH.request()->module();
        return $this->fetch();
    }
    public function person()
    {
        return $this->fetch();
    }
    public function service()
    {
        return $this->fetch();
    }
    //注册
    public function regist()
    {
        return $this->fetch();
    }
    //职业定位
    public function  orientation()
    {
        $hr=Db::table('hr')->select();
        $this->assign('hr_list',$hr);
        return $this->fetch();
    }
    //校招岗位
    public  function schoolPost()
    {
        return $this->fetch();
    }
    public  function  check()
    {
        $this->success("註冊成功",'/');
    }

/*    public function _empty()
    {
        return $this->fetch('/Error/404');
    }*/
    public function  diaoyong()
    {
        $model=controller('admin/Index');
        return $model->test();
    }
    public function  test()
    {
        return "this is a user test".input('id');
    }

    public function config()
    {
        var_dump( \think\Config::get(".cor"));
    }
    public function  user()
    {
        dump(url("Index/Index/user"));
        print_r($_GET);
        echo "this is user function";
    }
    public function getQiantai()
    {
        dump(config("name"));
    }
    public function getname()
    {
        echo 'this is get name';
    }
    public function getId()
    {
        echo 'this is get Id';
    }
    public function  course()
    {
        echo 'id:'.input('id');
        echo '<hr>';
        echo 'name:'.input('name');
    }

}
