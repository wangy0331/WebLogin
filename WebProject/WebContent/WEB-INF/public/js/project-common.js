$(document).ready(function() {
	$('.newWindow').click(function(event) {
//		var url = $(this).attr("href");
		var url = "../common/showUploadFiles";
		var windowName = "fileUpload";
		var windowSize = [ "width=800,height=600, top=120, left=320"];
		window.open(url, windowName, windowSize).focus();
		event.preventDefault();
	});
	
	
	$('.newWindowStart').click(function(event){
		var url = "../common/showUploadStart";
		var windowName = "fileUpload";
		var windowSize = [ "width=800,height=600, top=120, left=320"];
		window.open(url, windowName, windowSize).focus();
		event.preventDefault();
	});
	
	$('.newWindowStart5').click(function(event){
		var url = "../common/showUploadStart5";
		var windowName = "fileUpload";
		var windowSize = [ "width=800,height=600, top=120, left=320"];
		window.open(url, windowName, windowSize).focus();
		event.preventDefault();
	});
	
	
	
	$('#confirmDelBtnId').click(function(event) {
		$('#deleteModalConfirm').modal('hide');
		$.get("deleteFile", {
			fileName : fileNm
		}, function(data) {
			if (data == 1) {
				$('.delFile').each(function() {
					if ($(this).attr("rel") == fileNm) {
						var files = $("#filesId").val();
						$("#filesId").val(files.replace(fileNm, ""));
						$(this).parent().parent().parent().remove();
					}
				});
				showSucMsg('成功删除！');
			}else{
				showFailMsg('删除失败！');
			}
		});
	});
	
	$('#confirmDelBtnIdStart').click(function(event) {
		$('#deleteModalConfirmStart').modal('hide');
		$.get("../common/deleteFileStart", {
			fileName : fileNm
		}, function(data) {
			if (data == 1) {
				$('.delFile').each(function() {
					if ($(this).attr("rel") == fileNm) {
						var files = $("#videoImage").val();
						$("#videoImage").val(files.replace(fileNm, ""));
						$(this).parent().parent().parent().remove();
					}
				});
				showSucMsg('成功删除！');
			}else{
				showFailMsg('删除失败！');
			}
		});
	});
	
	//删除书籍文件
	$('#confirmDelBtnIdStart2').click(function(event) {
		$('#deleteModalConfirmStart2').modal('hide');
		$.get("../common/deleteFileStart", {
			fileName : fileNm
		}, function(data) {
			if (data == 1) {
				$('.delFile').each(function() {
					if ($(this).attr("rel") == fileNm) {
						var files = $("#bookPath").val();
						$("#bookPath").val(files.replace(fileNm, ""));
						$("#bookPathShow").html("");
						$("#size").val("");
						$(this).remove();
					}
				});
				showSucMsg('成功删除！');
			}else{
				showFailMsg('删除失败！');
			}
		});
	});
	
	$('#confirmDelBtnIdStart5').click(function(event) {
		$('#deleteModalConfirmStart5').modal('hide');
		$.get("deleteFileStart5", {
			fileName : fileNm
		}, function(data) {
			if (data == 1) {
				$('.delFile').each(function() {
					if ($(this).attr("rel") == fileNm) {
						var files = $("#image5").val();
						$("#image5").val(files.replace(fileNm, ""));
						$(this).parent().parent().parent().remove();
					}
				});
				showSucMsg('成功删除！');
			}else{
				showFailMsg('删除失败！');
			}
		});
	});
	
});
function showSucMsg(msg){
	var html = '<div class="alert alert-success"> '+
					'<button type="button" class="close" data-dismiss="alert">&times;</button>'+
					msg+
				'</div>';
	$('#msgZoneId').html(html);
}
function showFailMsg(msg){
	var html = '<div class="alert alert-error" style="margin-bottom: 0px;"> '+
	'<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	'<h4>错误!</h4>'+msg+
	'</div>';
	$('#msgZoneId').html(html);
}
var fileNm = '';
function deleteFile(fileName, id) {
	fileNm = fileName;
	fileId = id;
	$('#deleteModalConfirm').modal('show');
}

function deleteStart(fileName){
	fileNm = fileName;
	$('#deleteModalConfirmStart').modal('show');
}

//删除文件
function deleteStart2(fileName){
	fileNm = fileName;
	$('#deleteModalConfirmStart2').modal('show');
}

function deleteStart5(fileName){
	fileNm = fileName;
	$('#deleteModalConfirmStart5').modal('show');
}

function sendToWeibo(msgContent, picUrl, url){
	var weiboUrl = "http://service.weibo.com/share/share.php?";
	weiboUrl += "title="+ msgContent;
	weiboUrl += "&url="+ url;
	weiboUrl += "&source="+ "bookmark";
	weiboUrl += "&appkey="+ "3333831417";
	weiboUrl += "&pic="+ picUrl;
	weiboUrl += "&ralateUid=";
	window.open(weiboUrl, '_blank');
}