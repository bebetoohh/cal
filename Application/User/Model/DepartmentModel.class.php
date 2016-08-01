<?php
namespace User\Model;
use Think\Model;

class DepartmentModel extends Model{
	private $_db = '';
	public function __construct(){
		$this->_db = M('Department');
	}
	public function select(){
		$data['status'] = 1;
		return $this->_db->where($data)->order('sort desc ,id asc')->select();
	}
}