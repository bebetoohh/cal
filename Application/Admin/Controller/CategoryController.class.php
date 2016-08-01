<?php

namespace Admin\Controller;
use Think\Controller;
class CategoryController extends CommonController {
    public function index(){
    	// 获取分类数据
    	
    	$result = M('Category')->order('sort ASC')->select();
    	$Category = new \Common\Lib\Category;
    	$cate = $Category::unlimitedForLevel($result);
    	// p($cate);
    	// die;
    	$this->cate = $cate;
		$this->display();
    }

    public function add(){
    	if(IS_POST){
    		var_dump($_POST);
    		if($_POST['id']==''){ //id为空，为新增分类
    			echo "新增分类";
    			if(M('Category')->add($_POST)){
    				$this->success('添加分类成功');
    			}
    		}else{//修改分类
    			echo "修改分类";
    		}
    	}else{
    		$this->pid=isset($_GET['pid'])?$_GET['pid']:0;
	    	$mb['title']='添加分类';
	    	$this->assign('mb',$mb);
	    	$this->display();
	   	}
    }
    public function edit(){
    	if(IS_POST){
    		$id = $_POST['id'];
    		$data = $_POST;
    		unset($data['id']);
    		$res = M('Category')->where('id = '.$id)->save($data);
    		if($res){
    			$this->success("更新成功",U("Category/index"));
    		}else{
    			$this->error("更新失败");
    		}
    	}elseif($_GET['id']){
    		$res = M('Category')->where('id = '.$_GET['id'])->find();
    		p($res);
    		$this->assign('Cate',$res);
    		$this->display();
    	}
    	
    }
    public function update(){
    	// 负责添加和更新
    }

    public function sortCate(){
    	$db = M('Category');
    	foreach ($_POST as $id => $sort) {
    		$db -> where(array('id'=>$id)) -> setField('sort',$sort);
    	}
    	$this->redirect(U('Category/index'));
    }
}