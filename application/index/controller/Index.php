<?php
namespace app\index\controller;

use app\common\model\Employment;
use app\hr\model\ExamCandidate;
use think\Db;
use think\Controller;
use think\Request;
use think\Session;

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

        $corporation = Db::table('corporation')->where('c_icon_url', 'not null')->paginate(6);
        $this->assign('corporation_list', $corporation);
        return $this->fetch();
    }

    public function upload(Request $request)
    {
        $u_id=input("u_id");
        $j_id=input("j_id");
        $path = ROOT_PATH . 'public' . DS . 'resume';
        // 获取表单上传文件 例如上传了001.jpg
        $file = $request->file('resume');

        dump($file);
        $info = $file->validate(['size'=>3000000,'ext'=>'pdf'])->move($path);
        if ($info) {
            // 成功上传后 获取上传信息
            // 输出 jpg

            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            $employ=new Employment();
            $employ->fk_u_id=$u_id;
            $employ->fk_j_id=$j_id;
            $employ->u_resume_url='resume/'.$info->getSaveName();
            $employ->save();
        /*    echo $info->getSaveName(); echo '<br>';
            // 输出 42a79759f284b767dfcb2a0197904287.jpg
            echo $info->getFilename();*/
           $this->success("投递成功！","/schoolpost");
        } else {
            // 上传失败获取错误信息
            $this->error( $file->getError());
        }
    }

    public function person()
    {
        $socket_name="游客".time();
      //  dump($socket_name);
        $this->assign('socket_name',$socket_name);
      //  dump(session('user'));
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
    public function orientation()
    {
        $hr = Db::table('hr')->limit(4)->select();
        $this->assign('hr_list', $hr);
        return $this->fetch();
    }

    //校招岗位
    public function schoolPost()
    {
        $job_list = Db::table('cor_job')->select();
        $this->assign('job_list', $job_list);

        if (Session::has('user')) {
            $employ_j_list = Employment::where('fk_u_id', session('user')['id'])->column('fk_j_id');
            $status_list = Employment::where('fk_u_id', session('user')['id'])->column('fk_j_id,status');
         //   dump($employ_j_list);
         //   dump($status_list[1]);

            $this->assign('employ_j_list', $employ_j_list);
            $this->assign('status_list', $status_list);
        }

        return $this->fetch();
    }

    public function getStatus()
    {
        $u_id = input('u_id');
        $j_id = input('j_id');
        $employ = Employment::get(['fk_j_id' => $j_id, 'fk_u_id' => $u_id]);
        return $employ->status;
    }

    //空操作
    public function _empty()
    {
        return $this->fetch('/Error/404');
    }


}
