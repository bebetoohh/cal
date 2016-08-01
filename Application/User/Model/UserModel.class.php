<?php
namespace User\Model;
use Think\Model;

class UserModel extends Model{
	private $_db = '';
	public function __construct(){
		$this->_db = M('User');
	}
	public function insert($data = array()){
		if(!$data || !is_array($data)){
			return 0;
		}
		$data['password'] = getMd5Password($data['password']);
		$data['create_time'] = time();
		$data['reg_ip'] = get_client_ip();
		return $this->_db->add($data);
	}

	public function getAccount($type = '',$val = ''){
		if(!$type || $type == ''){
			throw_exception('登录类型不合法');
		}
		if(!$val || $val == ''){
			throw_exception('登录信息有误');
		}
		$data[$type]=$val;
		$data['status']=1;
		return $this->_db->where($data)->find();
	}
}