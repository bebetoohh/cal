<?php
namespace User\Controller;
use Think\Controller;


class CommonController extends Controller {
	
	// public function __construct(){
	// 	parent::__construct();
	// 	echo "__construct";
	// 	// if(!$this->checkLogin()){
	// 	// 	$this->redirect("Public/index");
	// 	// }
	// }
	public function _initialize(){
		if(!$this->checkLogin()){
			$this->redirect("Public/index");
		}
	}

	public function checkLogin(){
		// return 1;
		if(session('calUser')){
			return 1;
		}
		return 0;
	}

	//改变状态方法，这里改为公共函数，可以方便所有的模块调用
	public function setStatus($data,$model){
		try{
			if(IS_POST){
				$id = $data['id'];
				$status = $data['status'];
				if(!$id){
					return show(0,'id不合法');
				}
				$res = D($model)->updateStatusById($id,$status);
				if($res){
					return show(1,'操作成功');
				}else{
					return show(0,'操作失败');
				}
			}
		}catch(Exception $e){
			return show(0,$e->getMessage());
		}
	}
}