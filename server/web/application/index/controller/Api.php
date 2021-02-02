<?php
namespace app\index\controller;
use app\common\model\Server;
use think\Request;
class Api
{
	public function server(){
		$user = input('post.username');
		$password = input('post.password');
		$data = input('post.data');
		$node = input('post.node');
		$token = input('post.token');
		$action = input('post.action','heartbeat');
		$time = input('post.time/d');
		//获取任务 ,['<',10],['>',100],'or' ['<>','paused'] ,'and'->
		
		//var_dump($arr);exit;
		$server = Server::where('id',$node)->find();
		if($server && $time+600>=time() && md5('novel_'.$server['token'].$time)==$token){
		    
		    $data = json_decode($data,true);
		    switch ($action) {
		        case 'heartbeat':
        			$data['node'] = $node;
        			$data['time'] = time();
        			M('node_log')->insert($data);
        			exit("heart beat is okay!");//exit("echo");
		            break;
		        case 'config':
		            if(!empty($data['name'])){
		                if($data['name'] == 'node'){
		                    // 获取节点设置
		                    exit(json_encode([]));
		                }else{
		                    // 获取系统配置
		                    exit(json_encode(F('setting')));
		                }
		            }
		            break;
		        default:
		            // code...
		            break;
		    }
		    
			
		}else{
			exit("{'msg':'error'}");
		}
	}
	
    public function serverstatus(){
    	if(Request::instance()->isAjax()){
    		//传递数据
			$server = Server::where(1)->select();
    		$data = [];
    		//$int_arr = ['network_rx','network_tx','network_in','network_out','load_1'];
    		//$float_arr = ['ping_10010','ping_189','ping_10086','']
    		$count = ['tcp','udp','process','thread'];
    		foreach($server as $v){
    			$arr=Server::getLog($v['id']);
    			if(empty($arr['online6'])){continue;}
    			//$arr['load_1'] = (int)$v['load_1'];
    			$arr['online4'] = (boolean)$arr['online4'];
    			$arr['online6'] = (boolean)$arr['online6'];
    			$arr['uptime'] = floor($arr['uptime']/(24*3600)).'天';
    			foreach($arr as $kk=>$vv){
    				if(is_float($vv)){
    					$arr[$kk] = (float)$vv;
    				}
    				if(is_numeric($vv)){
    					$arr[$kk] = (int)$vv;
    				}
    				if(in_array($kk,$count)){
    					$arr[$kk.'_count'] = (int)$vv;
    					unset($arr[$kk]);	
    				}
    			}
    			$arr['name'] = $v['name'];
    			$arr['type'] = $v['type'];
    			$arr['location'] = $v['location'];
    			$data[] = $arr;
    		}
    		$json = ['servers'=>$data,'updated'=>time()];
    		exit(json_encode($json));
    	}else{
    		
    		return view('serverstatus',['data'=>Server::where(1)->select()]);
    	}
    	
    	
    }
}