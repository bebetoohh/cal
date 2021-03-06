<?php
//公共函数

// 美化打印数组 调试用
function p($data){
	print "<pre>\n";
	print_r($data);
	print "\n</pre>";
}

function category(){
	
}
//检测登录账户类型，返回ecard或email
function checkAccountType($account = ''){
	$length = strlen($account);
	if($length == 12 && substr($account, 0,5) == "10504"){  //教工的一卡通
		return "ecard";
	}
	if($length == 13){ //学生一卡通
		return "ecard";
	}
	if(ereg('^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+',$account)){
		return "email";
	}
	// return 0;
}

/**
 * @param  [bloon]
 * @param  [string]
 * @param  [array]
 * @return [json]
 */
function show($status,$message,$data){
	$result = array(
			'status'	=>	$status,
			'message'	=>	$message,
			'data'		=>	$data,
		);
	exit(json_encode($result));
}

function getDepartmentById($id = ''){
	$data = array();
	if(!F('department')){
		$department = D('Department')->select();
		foreach ($department as $k => $v) {
			$data[$v['id']]= $v['title'];
		}
		F('department',$data);
	}
	$data = F('department');
	return $data[$id];
}

function getMd5Password($password){
	return md5($password.C('MD5_PRE'));
}

// 检测输入的验证码是否正确，$code为用户输入的验证码字符串
function check_verify($code, $id = ''){
    $verify = new \Think\Verify();
    return $verify->check($code, $id);
}
// 状态码转换成汉字
function status($status){
	if($status == 0){
		$str = '关闭';
	}elseif($status == 1){
		$str = '正常';
	}elseif($status == -1){
		$str = '删除';
	}
	return $str;
}


/**
 * 遍历获取目录下的指定类型的文件  百度编辑器
 * @param $path
 * @param array $files
 * @return array
 */
function getfiles($path, $allowFiles, &$files = array()){
    if (!is_dir($path)) return null;
    if(substr($path, strlen($path) - 1) != '/') $path .= '/';
    $handle = opendir($path);
    while (false !== ($file = readdir($handle))) {
        if ($file != '.' && $file != '..') {
            $path2 = $path . $file;
            if (is_dir($path2)) {
                getfiles($path2, $allowFiles, $files);
            } else {
                if (preg_match("/\.(".$allowFiles.")$/i", $file)) {
                    $files[] = array(
                        'url'=> substr($path2, strlen($_SERVER['DOCUMENT_ROOT'])),
                        'mtime'=> filemtime($path2)
                    );
                }
            }
        }
    }
    return $files;
}

function getModelById($modelId = ' '){
	if(!$modelId || $modelId == ''){
		return false;
	}
	//todo 这里的Model类型应该是从数据库缓存后获得，目前只有1-活动 2-通知
	if($modelId == 1){
		return "Events";
	}
	if($modelId == 2){
		return "Notices";
	}
}