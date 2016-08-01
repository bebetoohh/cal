<?php
namespace User\Controller;
use Think\Controller;

class PublicController extends Controller{
	public function index(){
		if($_POST){
			$data = I('post.');
			if(!$data['account'] || $data['account'] == ''){
				return show(0,'请填写一卡通或邮箱');
			}
			if(!$data['password'] || $data['password'] == ''){
				return show(0,'密码不能为空');
			}
			if(!$data['verify'] || $data['verify'] == ''){
				return show(0,'验证码不能为空');
			}
			if(!check_verify($data['verify'],1)){
				// return show(0,'验证码错误');
			}
			//获取数据
			$type = checkAccountType($data['account']);
			$res = D('User')->getAccount($type,$data['account']);

			if(getMd5Password($data['password']) != $res['password']){
				return show(0,'账号或密码错误');
			}

			//登录成功
			session('calUser',$res); 
			return show(1,'登录成功');

		}else{
			if(session('calUser')){
				$this->redirect("Index/index");
			}
			$this->display('login');
		}
	}

	public function reg(){
		if(IS_POST){
			$data = I('post.');
			if(!$data['ecard'] || $data['ecard'] == ''){
				$this->error('一卡通填写有问题');
			}
			if(M('User')->where('ecard='.$data['ecard'])->find()){
				$this->error('该一卡通已经注册');
			}

			if(!$data['password'] || $data['password'] != $data['repassword']){
				$this->error('密码有问题');
			}
			if(!$data['name'] || $data ==''){
				$this->error('姓名不能为空');
			}
			if(!$data['email'] || $data['email'] == ''){
				$this->error('email不能为空');
			}
			if(M('User')->where('email="'.$data['email'].'"')->find()){
				$this->error('该邮箱已经注册');
			}
			if(!$data['department'] || $data['department'] == ''){
				$this->error('请选择单位');
			}
			$res = D("User")->insert($data);
			if($res){
				$this->success("注册成功，去登陆吧",U('Public/index'));
			}else{
				$this->error("注册出错了");
			}
		}else{
			// 获取单位信息
			$this->department = D("Department")->select();
			$this->display();
		}
	}
	//登录操作
	public function login(){

		//todo 验证码
		$type = checkAccountType(I('post.account'));
			if(!$type){
				return show(0,"账户不对，请填写一卡通或电子邮箱");
		}
	}
	/* 验证码，用于登录和注册 */
	public function verify(){
		$verify = new \Think\Verify();
		$verify->entry(1);
	}
	
}