<?php
namespace User\Controller;
use Think\Controller;

class BrandsController extends CommonController{
	public function index(){
		$conds = array();  //todo:增加检索条件
		$conds['uid'] = $_SESSION['calUser']['uid'];
		//分页
		$page = $_REQUEST['p'] ? $_REQUEST['p'] :1;
		$pageSize = 5;
		$conds['status'] = array('neq',-1);   //去掉已经删除的内容
		$list = D('Brands')->getList($conds,$page,$pageSize);
		$count = D('Brands')->getListCount($conds);
		$res = new \Think\Page($count,$pageSize);
		// $res->setConfig('theme','<li><a>%totalRow% %header%</a></li> %upPage% %downPage% %first%  %prePage%  %linkPage%  %nextPage% %end%');
		$res->setConfig('theme',"<li><a>%TOTAL_ROW% %HEADER% %NOW_PAGE%/%TOTAL_PAGE% 页</a></li><li>%FIRST%</li><li>%UP_PAGE%</li><li>%LINK_PAGE%</li><li>%DOWN_PAGE%</li><li>%END%</li>");
		$pageres = $res->show();
		$this->assign('pageres',$pageres);
		$this->assign('list',$list);
		$this->display();
	}

	public function add(){
		if(IS_POST){
			$data = I('post.');
			// p($data);exit;
			if(!isset($data['name']) || $data['name']==' '){
				return show(0,'品牌名称不能为空');
			}
			if(!isset($data['thumb']) || $data['thumb'] == ' '){
				return show(0,'品牌图不能为空');
			}
			if(I('post.bid')){
				return $this->save($_POST);
			}
			$brandId = D("Brands")->insert($data);
			if($brandId){
				return show(1,'新增品牌成功');
			}else{
				return show(0,'新增品牌失败');
			}
		}else{
			$this->display();
		}
	}

	public function edit(){
		$bid = I('get.bid');
		if(!$bid){
			$this->redirect("Brands/index");
		}
		$brand = D("Brands")->find($bid);
		if(!$brand){
			return show(0,'参数错误');
		}
		$this->assign('brand',$brand);
		$this->display();
	}

	public function save($data){
		$bid = $data['bid'];
		unset($data['bid']);
		try{
			$id = D("Brands")->updateById($bid,$data);
			if($id === false){
				return show(0,"更新失败");
			}
			return show(1,"更新成功");
		}catch(Exception $e){
			return show(0,$e->getMessage());
		}		
	}

	public function setStatus(){
		$data = array(
			'id' => intval($_POST['id']),  //此处理可以防止不同Model中表的id名称不同
			'status' => intval($_POST['status']),
		);
		return parent::setStatus($data,'Brands');
	}
}