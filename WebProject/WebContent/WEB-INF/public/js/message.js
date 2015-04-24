var MessageRemind = {
	_step : 0,
	_title : document.title,
	_timer : null,
	_msg : '新评论',
	
	// 显示新消息提示
	show : function(msg) {
		MessageRemind._msg = msg == null?MessageRemind._msg:msg;
		var temps = MessageRemind._title.replace("【　　　】", "").replace("【" + MessageRemind._msg + "】", "");
		clearTimeout(MessageRemind._timer);
		MessageRemind._timer = setTimeout(function() {
			MessageRemind.show();
			// 这里写Cookie操作
			MessageRemind._step++;
			if (MessageRemind._step == 3) {
				MessageRemind._step = 1;
			}
			if (MessageRemind._step == 1) {
				document.title = "【　　　】" + temps;
			}
			if (MessageRemind._step == 2) {
				document.title = "【" + MessageRemind._msg + "】" + temps;
			}
		}, 800);
		return [ MessageRemind._timer, MessageRemind._title ];
	},
	// 取消新消息提示
	hide : function() {
		clearTimeout(MessageRemind._timer);
		document.title = MessageRemind._title;
		//这里写Cookie操作
	}
};