<?php
namespace User\Controller;
use Think\Controller;
class NoticesController extends CommonController {
    public function index(){
		$this->display();
    }
    public function add(){
    	if(IS_POST){
    		// p(I('post.'));
            $data = I('post.');
            if(!isset($data['title']) || $data['title']==' '){
                return show(0,'标题不能为空');
            }
            if($data['id']){
                return $this->save($data);
            }
            $resId = D("Content")->insert($data);
            if($resId){
                $notice['id'] = $resId;
                $notice['content'] = $data['content'];
                $notice['title'] = $data['title'];
                $res = D("Notices")->insert($notice);
                if($res){
                    return show(1,"新增成功，待审核");
                }else{
                    return show(0,"content新增成功,notice新增失败");
                }
            }else{
                return show(0,"新增失败");
            }

    	}else{
    		$this->display();
    	}
    }


    public function edit(){
        $id = I('get.id');
        if(!$id){
            $this->redirect("Index/contentlist");
        }
        $content = D('Content')->find($id);

        if(!$content){
            return show(0,"参数错误");
        }
        $notice = D("Notices")->find($id);  //如果不存在，则表示附表里并没有该数据，为空

        $content['content'] = $notice['content'];
        // p($content);exit;
        $this->content = $content;
        $this->display();
    }

    public function save($data){
        $id = $data['id'];
        $data['status'] = 0;//所有修改过的文档，必须重新审核
        $data['end_time'] = $data['create_time']+$data['limitday']*60*60*24;
        $data['modify_time'] = time();
        $data['ip'] = get_client_ip();
        unset($data['id']);
        try{
            $id = D("Content")->updateById($id,$data);
            $notice['content'] = $data['content'];

            $nId = D("Notices")->updateById($id,$notice);   
            if($id === false || $nId === false){
                return show(0,"更新失败");
            }
            return show(1,"更新成功，需要重新审核");
        }catch(Exception $e){
            return show(0,$e->getMessage());
        }
        

    }
}
