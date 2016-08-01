<?php
namespace User\Controller;
use Think\Controller;

class EventsController extends CommonController{
	public function add(){
		$this->brands = D("Brands")->getBrandsByUid($_SESSION['calUser']['uid']);
		$this->display();
	}
}