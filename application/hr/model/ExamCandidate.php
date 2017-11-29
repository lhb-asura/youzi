<?php

namespace app\hr\model;

use think\Model;

class ExamCandidate extends Model
{

    public  function getEmploylist($c_id,$status)
    {
        return $this->where("c_id",$c_id)->where('status',$status)->order('e_time')->paginate(6);
    }
    /*
 * 获取所有申请者
 */
    public  function  getAllEmploylist($c_id)
    {
        return $this->where("c_id",$c_id)->order('status','desc')->paginate(6);
    }
    //获取录用
    public  function getAdoptlist($c_id)
    {
        return $this->getEmploylist($c_id,2);
    }

    /*
     * 获取通过筛选
     */
    public  function  getPrelist($c_id)
    {
        return $this->getEmploylist($c_id,1);
    }
    /*
     * 未通过筛选
     */
    public  function  getUnPrelist($c_id)
    {
        return $this->getEmploylist($c_id, 3);
    }
    /*
     * 已查看
     */
    public  function  getCheckedlist($c_id)
    {
        return $this->where("c_id",$c_id)->where('status','<>',0)->select();
    }
    public  function  getUnCheckedlist($c_id)
    {
        return $this->where("c_id",$c_id)->where('status',0)->select();
    }
}
