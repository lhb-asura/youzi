<?php

/**
 * Created by PhpStorm.
 * User: lhb
 * Date: 2017/11/20
 * Time: 17:47
 */
namespace app\hr\controller;

use app\common\model\Employment;
use app\common\model\Hr;
use app\hr\model\ExamCandidate;
use think\Controller;
use think\Session;

class Index extends Controller
{
    public function index()
    {
        if (Session::has('hr')) {
            $email = Session::get('hr')['email'];
            $token = Session::get('hr')['token'];
            if (Hr::getPrivilege($email, $token)) {
                $c_id = Session::get('hr')['c_id'];
                $exam = new ExamCandidate();
                $emp_list = $exam->getAllEmploylist($c_id);
                $unchecked_list=$exam->getUnCheckedlist($c_id);
                $adopt_list=$exam->getAdoptlist($c_id);
                $pre_list=$exam->getPrelist($c_id);
                $unpre_list = $exam->getUnPrelist($c_id);

         //       dump($emp_list);
                $this->assign('emp_list', $emp_list);
                $this->assign('unpre_list', $unpre_list);
                $this->assign('pre_list', $pre_list);
                $this->assign('adopt_list', $adopt_list);
                $this->assign('unchecked_list', $unchecked_list);

                //  dump(session('hr'));
                // dump($emp_list);
                return $this->fetch("index");
            }
            return 'illigal privilege';
        } else {
            return $this->fetch("login");
        }
    }

    public  function changeStatus()
    {
        //echo 'fadf';
        $email=input('email');
        $token=input('token');
        $status=input('status');
        $e_id=input('e_id');
        if (Hr::getPrivilege($email, $token))
        {
            $employment=Employment::get($e_id);
            $employment->status=$status;
            $employment->ex_hr_id=session('hr')['id'];
            echo $employment->save();
        }
    }

    public function _empty()
    {
        return $this->fetch('/Error/404');
    }


}