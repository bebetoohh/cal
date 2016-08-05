<?php
namespace User\Model;
use Think\Model;

class NoticesModel extends Model{
	private $_db = '';
	public function __construct(){
		$this->_db=M("Notices");
	}
	public function insert($data = array()){
		if(!is_array($data) || !$data){
			return 0;
		}
		return $this->_db->add($data);
	}

	public function find($id){
		return $this->_db->where('id='.$id)->find();
	}

	public function updateById($id,$data){
		return $this->_db->where('id='.$id)->save($data);
	}
}