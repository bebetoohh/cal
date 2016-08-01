<?php
namespace Home\Controller;
use Think\Controller;

class CommonController extends Controller {
	public function _initialize(){
		// 获取当前用户ID
        // define('UID',is_login());
        define('UID',1);
        if( !UID ){// 还没登录 跳转到登录页面
            $this->redirect('Public/login');
        }
        /* 读取数据库中的配置 */
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            // $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
        }
        C($config); //添加配置

        // 是否是超级管理员
        // define('IS_ROOT',   is_administrator());
        if(!IS_ROOT && C('ADMIN_ALLOW_IP')){
            // 检查IP地址访问
            if(!in_array(get_client_ip(),explode(',',C('ADMIN_ALLOW_IP')))){
                $this->error('403:禁止访问');
            }
        }
        // 检测访问权限
  //       $access =   $this->accessControl();
  //       if ( $access === false ) {
  //           $this->error('403:禁止访问');
  //       }elseif( $access === null ){
  //           $dynamic        =   $this->checkDynamic();//检测分类栏目有关的各项动态权限
  //           if( $dynamic === null ){
  //               //检测非动态权限
  //               $rule  = strtolower(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME);
  //               if ( !$this->checkRule($rule,array('in','1,2')) ){
  //                   $this->error('未授权访问!');
  //               }
  //           }elseif( $dynamic === false ){
  //               $this->error('未授权访问!');
  //           }
  //       }
  //       $this->assign('__MENU__', $this->getMenus());
		// //todo:保存登陆信息		
	}
}
