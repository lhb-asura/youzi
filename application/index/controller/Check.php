<?php
/**
 * Created by PhpStorm.
 * User: lhb
 * Date: 2017/11/17
 * Time: 14:07
 */

namespace app\index\controller;

use app\common\model\User;
use think\Controller;
use think\Db;
use think\Session;
use think\Request;

class Check extends Controller
{
    public function reg(Request $request)
    {

        $passwd = md5(input('password'));
        $request->filter('htmlspecialchars');
        $email = input('email');
        $phone = input('phone');
        $name = input('name');
        $token = md5(date("Y-m-dH:i:s") . $email);
        $data = [
            'u_name' => $name,
            'u_phone' => $phone,
            'u_email' => $email,
            'u_passwd' => $passwd,
            'u_token' => $token
        ];
        Db::table('user')->insert($data);

        Session::set('user',
            [
                'name' => $name,
                'email' => $email,
                'phone' => $phone,
                'token' => $token
            ]);

        //  Db::table('user')->where('');
        $this->success('注册成功,正在登录', '/');
    }

    public function email_is_exist()
    {
        $email = input('email');
        $phone_count = Db::table('user')->where('u_email', $email)->count();
        echo $phone_count;
    }

    public function phone_is_exist()
    {
        $phone = input('phone');
        $phone_count = Db::table('user')->where('u_phone', 'phone')->count();
        echo $phone_count;
    }
    public function name_is_exist()
    {
        $name=input('name');
        $name_count = Db::table('user')->where('u_name', $name)->count();
        return $name_count;
    }
    public function login()
    {
        $passwd = md5(input('password'));
        $email = input('email');
        $user = Db::table('user')->
        field('u_id as id ,u_name as name,u_email as email,u_phone as phone')
            ->where('u_passwd', $passwd)->where('u_email', $email)->find();

        if ($user) {
            $token = md5(date("Y-m-dH:i:s") . $email);
            $user['token'] = $token;
            dump($user);
            Db::table('user')
                ->where('u_email', $email)
                ->update(['u_token' => $token]);
            Session::set("user", $user);
            $this->redirect('/');
        } else {
            $this->error('邮箱或密码错误');
        }
    }

    public function logout()
    {
        Session::delete('user');
        // $this->success('注销成功','/');
        $this->redirect('/');
    }


}