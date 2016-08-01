<?php
namespace Home\Controller;
use Think\Controller;
class PublicController extends Controller {
    public function login(){
    	if(!IS_POST){
    		$this->display();
    	}
		var_dump($_POST);
    }

    public function reg(){
    	if(!IS_POST){
    		$this->display();
    	}
		//过滤数据
		$data = I('post.');
		var_dump($data);
		// todo:校验数据
		// 写入数据库
		
		

    }


}