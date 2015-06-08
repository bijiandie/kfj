<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        <script type="text/javascript">
        window.URL = window.URL || window.webkitURL;
    	var fileElem = document.getElementById("fileElem"),
    	    fileList = document.getElementById("fileList");
    	function handleFiles(obj) {
    		var files = obj.files,
    			img = new Image();
    		if(window.URL){
    			//File API
    			  alert(files[0].name + "," + files[0].size + " bytes");
    		      img.src = window.URL.createObjectURL(files[0]); //创建一个object URL，并不是你的本地路径
    		      img.width = 200;
    		      img.onload = function(e) {
    		         window.URL.revokeObjectURL(this.src); //图片加载后，释放object URL
    		      }
    		      fileList.appendChild(img);
    		}else if(window.FileReader){
    			//opera不支持createObjectURL/revokeObjectURL方法。我们用FileReader对象来处理
    			var reader = new FileReader();
    			reader.readAsDataURL(files[0]);
    			reader.onload = function(e){
    				alert(files[0].name + "," +e.total + " bytes");
    				img.src = this.result;
    				img.width = 200;
    				fileList.appendChild(img);
    			}
    		}else{
    			//ie
    			obj.select();
    			obj.blur();
    			var nfile = document.selection.createRange().text;
    			document.selection.empty();
    			img.src = nfile;
    			img.width = 200;
    			img.onload=function(){
    		      alert(nfile+","+img.fileSize + " bytes");
    		    }
    			fileList.appendChild(img);
    			//fileList.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src='"+nfile+"')";
    		}
    	}
	function ljbm(){
		if(document.getElementById('name').value==''){
    		document.getElementById ("bdnr").innerHTML="用户名不能为空！";
        	document.getElementById("bar").style.display="";
			   return false;
			}
		if(document.getElementById('age').value==''){
			document.getElementById ("bdnr").innerHTML="宝贝年龄不能为空！";
        	document.getElementById("bar").style.display="";
			   return false;
			}else{
				var age = document.getElementById('age').value;
				var regAge = /^120$|^((1[0-1]|[1-9])?\d)$/m;
				if(regAge.test(age)==false){
					document.getElementById ("bdnr").innerHTML="宝贝年龄有误！";
		        	document.getElementById("bar").style.display="";
					return false;
					}
			}
		if(document.getElementById('phone').value==''){
			document.getElementById ("bdnr").innerHTML="联系电话不能为空！";
        	document.getElementById("bar").style.display="";
			return false;
			}else{
				var tel = document.getElementById('phone').value;
				var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
				 if (reg.test(tel)==false) {
					 document.getElementById ("bdnr").innerHTML="联系电话有误！";
			         document.getElementById("bar").style.display="";
					 return false;
				 }
			}
		if(document.getElementById('picture').value==''){
			document.getElementById ("bdnr").innerHTML="请上传宝贝照片！";
        	document.getElementById("bar").style.display="";
			   return false;
			}
		var form = document.forms[0];
		form.submit();
	}
	function close(obj) {
	       document.getElementById("bar").style.display="none";
	    }
</script>
    </head>
    <body>    
        <div class='content'>
            <div class="bar" id="bar" style="display:none"><span id="bdnr"></span><a href="javascript:close();" class="close">关闭</a></div>        
            <div><img src='style/p2_01.jpg' /></div>
            <form action="/kfj/baby/upload.do" method="post" name="bmForm" enctype="multipart/form-data">
            <div class="form">
                <ul>
                    <li><div class="left"><span>*</span>宝 贝 姓 名&nbsp;</div><div class="right"><input id="name" type="text" name="name" placeholder="必填" /></div></li>
                    <li><div class="left"><span>*</span>宝 贝 性 别&nbsp;</div><div class="right"><input type="text" name="sex" placeholder="必填" /></div></li>
                    <li><div class="left"><span>*</span>宝 贝 年 龄&nbsp;</div><div class="right"><input id="age" type="text" name="age" placeholder="必填" /></div></li>
                    <li><div class="left"><span>*</span>宝 贝 电 话&nbsp;</div><div class="right"><input id="phone" type="text" name="phone" placeholder="必填" /></div></li>
                    <li><div class="left"><span>&nbsp;</span>业务员代码&nbsp;</div><div class="right"><input id="ywydm" type="text" name="ywydm" /></div></li>
                    <li><div class="left"><span>*</span>宝 贝 照 片&nbsp;</div><div class="right"><input id="picture" type="file" name="picture" accept="image/*;capture=camera" /></div></li>
                    <li><div class="left"><span>&nbsp;</span>参 赛 才 艺&nbsp;</div><div class="right"><input id="talent" type="text" name="talent" /></div></li>
                    <li class="gli"><div class="left"><span>&nbsp;</span>成 长 寄 语&nbsp;</div><div class="right"><textarea id="czjy" name="czjy"></textarea></div></li>
                    <li></li>
                </ul>
            </div>
            <div>
             <a javascript:void(0)" onclick="ljbm()"><img src='style/p2_04.png' /></a></div>
            </form>
        </div>
    </body>
</html>