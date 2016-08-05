<?php
namespace User\Model;
use Think\Model;
class ContentModel extends Model{
	private $_db = '';

	public function __construct(){
		$this->_db = M('Content');
	}

	public function insert($data = array()){
		if(!is_array($data) || !$data){
			return 0;
		}
		$data['create_time'] = time();
		$data['modify_time'] = time();
		$data['end_time'] = $data['create_time']+$data['limitday']*60*60*24;
		$data['ip'] = get_client_ip();
		$data['status'] = 0;

		return  M("Content")->add($data);

	}

	public function getByUserId($uid = ' '){
		if(!$uid || $uid == ''){
			return 0;
		}
		$cond['uid'] = $uid;
		$cond['status'] = array('gt',-1);
		return $this->_db->where($cond)->select();
	}

	public function find($id){
		return $this->_db->where('id='.$id)->find();
	}

	public function updateById($id,$data){
		return $this->_db->where('id='.$id)->save($data);
	}
}