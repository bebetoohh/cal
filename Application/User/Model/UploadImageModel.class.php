<?php
namespace User\Model;
use Think\Model;

class UploadImageModel extends Model{
	private $_uploadObj = '';
	private $_uploadImageData = '';

	const UPLOAD = 'upload';  //定义上传的文件夹

	public function __construct(){
		$this->_uploadObj = new \Think\upload();
		$this->_uploadObj->rootPath = './'.self::UPLOAD.'/';   
		$this->_uploadObj->subName = date(Y) .'/'. date(m) .'/'. date(d) ; //上传文件夹的命名方式
	}

	public function upload(){
		$res = $this->_uploadObj->upload();
		if($res){
            return '/' .self::UPLOAD . '/' . $res['imgFile']['savepath'] . $res['imgFile']['savename'];
		}else{
			return false;
		}
	}

	public function imageUpload(){
		$res = $this->_uploadObj->upload();
        if($res) {
            return '/' .self::UPLOAD . '/' . $res['file']['savepath'] . $res['file']['savename'];
        }else{
            return false;
        }
	}
}
