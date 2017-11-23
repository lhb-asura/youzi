<?php

namespace app\common\model;

use think\Model;

class User extends Model
{
    public  function getPrivilege($email,$token)
    {
        return $this->where("u_email",$email)->where("u_token",$token)->count();
    }
}
