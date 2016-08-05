<?php
namespace User\Controller;
// use Think\Controller;

class IndexController extends CommonController {
    public function index(){
    	//用户首页
        
		
        $this->display();
    }
    public function contentlist(){
        $result = D("Content")->getByUserId(session('calUser.uid'));
        foreach ($result as $key => $value) {
        	$result[$key]['modelName'] = getModelById($result[$key]['model']);
        }
        $this->assign('list',$result);
        $this->display();

    }
}