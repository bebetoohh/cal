<?php
namespace User\Controller;
use Think\Controller;

class EventsController extends CommonController{
	public function add(){
		if(IS_POST){
			p(I('post.'));
		}else{
			$this->brands = D("Brands")->getBrandsByUid($_SESSION['calUser']['uid']);
			$this->display();
		}
	}


	public function ajaxuploadimage(){
		$upload = D("UploadImage");
		$res = $upload->imageUpload();
		if($res === false){
			return show(0,"上传失败",'');
		}else{
			return show(1,"上传成功",$res);
		}
	}
}