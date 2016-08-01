<?php

namespace User\Controller;
use Think\Controller;
use Think\Upload;

class ImageController extends CommonController{
	private $_uploadObj;
	public function __construct(){

	}

	public function ajaxuploadimage(){
		$upload = D("UploadImage");
		$res = $upload->imageUpload();
		if($res){
			return show(1,"upload success上传成功",$res);
		}else{
			return show(0,"upload error");
		}
	}
}