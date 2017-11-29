<?php

namespace app\common\model;

use think\Model;

class Employment extends Model
{
//    protected $autoWriteTimestamp = true;
      protected $createTime = 'e_time';
 //   protected $updateTime = 'update_at';
    protected $autoWriteTimestamp = 'datetime';
    //
    public function getStatusAttr($value)
    {
        $status = [0=>'未处理',1=>'通过筛选',2=>'录用',3=>'淘汰'];
        return $status[$value];
    }
    public function getStatusTextAttr($value,$data)
    {
        $status = [0=>'未处理',1=>'通过筛选',2=>'录用',3=>'淘汰'];
        return $status[$data['status']];
    }
    public   function changeStatus()
    {

    }
}
