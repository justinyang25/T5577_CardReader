var menuOffX=0	//菜单距连接文字最左端距离
var menuOffY=18	//菜单距连接文字顶端距离
var vBobjects = new Array();
var fo_shadows=new Array()
var linkset=new Array()
////No need to edit beyond here
var ie4=document.all&&navigator.userAgent.indexOf("Opera")==-1
var ns6=document.getElementById&&!document.all
var ns4=document.layers
var monuobj=new Array()
window.__topPopMenuHidden = true;
function readCookie(name){
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for(var i=0;i < ca.length;i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1,c.length);
			if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
		};
		return null;
	};
function createCookie(name,value,days){
		var expires = "";
		if (days) {
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			expires = "; expires="+date.toGMTString();
		};
		document.cookie = name+"="+value+expires+"; path=/";
	};
	document.onclick=hidemenu;
function hidemenu(depth){
	var i=0;
	if(depth ){
		if (depth>0){
		i=depth
		}
		}
	while(monuobj[i]!=null && monuobj[i]!=''){
			if (monuobj[i].style.display=='block'){
			monuobj[i].style.display='none';
			window.__topPopMenuHidden = true;
		}
			monuobj[i]='';
			i++;
			}
}
function delayhidemenu(){
	if (ie4||ns6||ns4)
		delayhide=setTimeout("hidemenu()",500)
}
function showmenu(objname,depth){
	var obj=document.getElementById(objname);
	if (obj){
		if (monuobj[depth] && monuobj[depth]!=''){
			monuobj[depth].style.display='none';
			monuobj[depth]='';
		}
		if (depth >0){
			if (obj.parentNode.offsetWidth>0){
				obj.style.left= obj.parentNode.offsetWidth+'px';
			}else{
				obj.style.left='105px';
			}
			obj.style.top='-2px'
		}
		obj.style.display ='block';
		window.__topPopMenuHidden = false;
		monuobj[depth]=obj;
	}
}

//短信窗口
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=no' );
}
//插件窗口
function PlusOpen(url, width, height){
	window.open(url,"PlusOpen",'width=' + width + ',height=' + height + ',resizable=0,scrollbars=yes,menubar=no,status=yes' );
}

function imgzoom(img,maxsize){var vWidth = parseInt(img.width);	
	if(vWidth > maxsize * 4)
	{
		img.style.width=maxsize;
	}
	else if(vWidth > maxsize)
	{
		img.style.width=Math.round(vWidth * Math.floor(4 * maxsize / vWidth) / 4);
		img.style.width = (document.body.clientWidth - 180)*0.9;
	}
	return false;
}