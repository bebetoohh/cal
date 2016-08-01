<?php
namespace User\Controller;
// use Think\Controller;

class IndexController extends CommonController {
    public function index(){
    	//用户首页
        
		
        $this->display();
    }
    public function addEvents(){
    	$this->display();
    }
    public function addNotices(){
    	$this->display();
    }
}