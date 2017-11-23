<?php

namespace app\common\model;

use think\Model;

class Hr extends Model
{
    //
    public static function getPrivilege($email,$token)
    {
        return boolval(self::get(["h_email"=>$email,"h_token"=>$token]));
    }
}
