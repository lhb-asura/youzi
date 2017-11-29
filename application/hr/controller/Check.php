<?php
/**
 * Created by PhpStorm.
 * User: lhb
 * Date: 2017/11/21
 * Time: 17:30
 */

namespace app\hr\controller;
use think\Db;
use think\Controller;
use think\Session;
class Check extends Controller
{
    public function login()
    {
        $passwd = md5(input('password'));
        $email = input('email');
        $hr = Db::table('cor_hr')
           -> field('h_id as id,h_level,h_name as name,h_email as email,h_img_url,c_id,c_name')
            ->where('h_passwd','=', $passwd)
            ->where('h_email', '=',$email)
        ->find();
        if ($hr) {
            $token = md5(date("Y-m-dH:i:s") . $email);
            $hr['token'] = $token;
            Db::table('hr')
                ->where('h_email', $email)
                ->update(['h_token' => $token]);
            Session::set("hr", $hr);
            $this->redirect('/hr.php');
        } else {
            $this->error('邮箱或密码不正确');
        }
    }

    public function logout()
    {
        Session::clear();
        $this->redirect('/hr.php');
    }
    public  function _empty()
    {
        return $this->fetch('/Error/404');
    }
}