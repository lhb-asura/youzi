<?php
/**
 * Created by PhpStorm.
 * User: lhb
 * Date: 2017/11/16
 * Time: 12:36
 */

namespace app\hr\controller;


use think\Controller;

class Error extends Controller
{
    public function _empty()
    {
    //    return $this->fetch();
        return $this->fetch('/Error/404');

    }
    public function  index()
    {
        return $this->fetch('/Error/404');
    }

}