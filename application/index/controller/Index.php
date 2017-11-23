<?php
namespace app\index\controller;
use app\common\model\User;
use think\Db;
use think\Controller;
class Index extends Controller
{
    /**
     * @return mixed
     */
    public function index()
    {
       // $data=Db::table("user")->select();

        //$this->assign('name','fsadf');
        //echo APP_PATH.request()->module();

        $corporation=Db::table('corporation')->where('c_icon_url' ,'not null')->paginate(6);
        $this->assign('corporation_list',$corporation);
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
        $hr=Db::table('hr')->limit(4)->select();
        $this->assign('hr_list',$hr);
        return $this->fetch();
    }
    //校招岗位
    public  function schoolPost()
    {
        $job_list=Db::view('cor_job')->select();
        $this->assign('job_list',$job_list);
        return $this->fetch();
    }

    //空操作
    public function _empty()
    {
        return $this->fetch('/Error/404');
    }





}
