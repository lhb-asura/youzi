<?php

namespace app\common\model;

use think\Model;

class DicStatus extends Model
{

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
}
