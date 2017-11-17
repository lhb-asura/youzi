<?php
/**
 * Created by PhpStorm.
 * User: lhb
 * Date: 2017/11/17
 * Time: 14:07
 */

namespace app\index\controller;
use think\Controller;
use think\Db;

class Check extends Controller
{
    public  function  reg()
    {
        $passwd=md5(input('post.password'));
        $email=input('post.email');
        $phone=input('post.phone');
        echo $passwd.'<br>';
        echo $email;
        // 启动事务
        Db::startTrans();
        try{
            Db::table('user')->find(1);
            Db::table('user')->delete(1);
            // 提交事务
            Db::commit();
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
        }
      //  Db::table('user')->where('');
     //  $this->success('注册成功','/');
    }
    public function login()
    {

    }


}