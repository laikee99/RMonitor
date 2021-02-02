<?php
namespace app\common\model;
use think\Model;
use think\Db;
use app\common\model\Storage;
class Server extends Model{

    protected $readonly = ['id'];
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
    protected $autoWriteTimestamp = 'datetime';
    protected $name = 'node';
    
    public static function getLog($id){
    	$arr = Db::name('node_log')->where('node',$id)->order('id desc')->find();
    	return $arr;
    }
}