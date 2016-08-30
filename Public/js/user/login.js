// 前端业务登录类
var login ={
	check : function(){
		// 获取登录页面中的登录名和密码
		var account  = $('input[name="account"]').val();
		var password = $('input[name="password"]').val();
		var verify   = $('input[name="verify"]').val();
		if(!account){
			dialog.error('用户名不能为空');
			//TODO
			// 这里需要对account进行判断
		}
		if(!password){
			dialog.error('密码不能为空');
		}
		if(!verify){
			dialog.error('验证码不能为空');
		}
		var url = "index.php?m=user&c=public&a=index";
		var data = {'account':account,'password':password,'verify':verify};
		$.post(url,data,function(result){
			if(result.status == 0){
				return dialog.error(result.message);
			}
			if(result.status == 1){
				return dialog.success(result.message,'./index.php?m=user&c=index');
			}

		},'JSON');
		// alert(username);
	}

}