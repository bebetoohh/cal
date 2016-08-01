<?php
namespace User\Model;
use Think\Model;
class BrandsModel extends Model{
	private $_db = '';

	public function __construct(){
		$this->_db = M('Brands');
	}

	public function insert($data = array()){
		if(!is_array($data) || !$data){
			return 0;
		}
		$data['create_time'] = time();
		$data['status'] = '1'; //1-启用，0-停用，-1-删除
		return $this->_db->add($data);
	}


	public function getList($data,$page,$pageSize=10){
		$conditions = $data;

		$offset = ($page-1)*$pageSize;
		return $this->_db->where($conditions)->order('listorder desc ,bid desc')->limit($offset,$pageSize)->select();

	}

	public function getListCount($data = array()){
		$conditions = $data;
		if(isset($data['title']) && $data['title']){
			$conditions['title'] = array('like','%'.$data['title'].'%');
		}
		if(isset($data['catid']) && $data['catid']){
			$conditions['catid'] = intval($data['catid']);
		}

		return $this->_db->where($conditions)->count();
	}

	public function find($bid){
		return $this->_db->where('bid='.$bid)->find();
	}

	public function updateById($bid,$data){
		if(!$bid || ! is_numeric($bid)){
			throw_exception("更新id不合法1");

		}
		if(!$data || !is_array($data)){
			throw_exception("更新数据不合法1");

		}
		
		if(isset($data['content']) && $data['content']){
			$data['content'] = htmlspecialchars($data['content']);
		}
		return $this->_db->where('bid='.$bid)->save($data);
	}

	public function updateStatusById($id,$status){
		if(!is_numeric($status)){
			throw_exception('status不能为非数字');
		}
		if(!$id || !is_numeric($id)){
			throw_exception('id不合法');
		}
		$data['status'] = $status;
		return $this->_db->where('bid='.$id)->save($data);
	}

	public function getBrandsByUid($uid){
		if(!$uid || $uid == ' '){
			throw_exception('uid不合法，获取品牌列表出错');
		}
		$data['uid'] = $uid;
		$data['status'] = 1;
		//todo:增加是否为公开品牌的时候，需要增加一个OR查询条件
		return $this->_db->where($data)->select();
	}
}