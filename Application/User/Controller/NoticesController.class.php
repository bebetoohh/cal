<?php
namespace User\Controller;
use Think\Controller;
class NoticesController extends CommonController {
    public function index(){
		$this->display();
    }
    public function add(){
    	if(IS_POST){
    		p(I('post.'));
    	}else{
    		$this->display();
    	}
    }
}
