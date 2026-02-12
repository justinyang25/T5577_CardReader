//Pop-it menu- By Dynamic Drive - Modified by Wbird
//For full source code and more DHTML scripts, visit http://www.dynamicdrive.com
//This credit MUST stay intact for use
var menuOffX=0	//菜单距连接文字最左端距离
var menuOffY=18	//菜单距连接文字顶端距离
var vBobjects = new Array();
var fo_shadows=new Array()
var linkset=new Array()
////No need to edit beyond here
var ie4=document.all&&navigator.userAgent.indexOf("Opera")==-1
var ns6=document.getElementById&&!document.all
var ns4=document.layers
var xslDoc;
function ReWidth(){
if(window.name!=''){
document.body.style.width='98%';
}
}
function GetBoardXml(sXMLSrc) {
	xslDoc = CreateXmlDocument();
	if (!xslDoc){ throw new Error('Not support!\nplease install a XML parser');return; }
	xslDoc.async = false;
	xslDoc.load(sXMLSrc);
	function CreateXmlDocument() {
		if (document.implementation && document.implementation.createDocument) {
			var doc = document.implementation.createDocument("", "", null);
			if (doc.readyState == null) {
				doc.readyState = 1;
				doc.addEventListener("load", function () {
					doc.readyState = 4;
					if (typeof doc.onreadystatechange == "function")
						doc.onreadystatechange();
				}, false);
			}
			return doc;
		}
		else if (window.ActiveXObject) {
			var prefix = ["MSXML3","MSXML2","MSXML","Microsoft"];
			for (var i=0;i<prefix.length;i++) {
				try {
					var doc = new ActiveXObject(prefix[i] + ".DOMDocument");
					//doc.setProperty("SelectionLanguage","XPath");
					if (doc)
					{
						return doc;
					}		
				} catch (e) {}
			}
		}
		return null;
	};
}

//短信窗口
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=no' );
}
//插件窗口
function PlusOpen(url, width, height){
	window.open(url,"PlusOpen",'width=' + width + ',height=' + height + ',resizable=0,scrollbars=yes,menubar=no,status=yes' );
}

function mybook() {
  h = 300;
  w = 300;
  t = ( screen.availHeight - h ) / 2;
  l = ( screen.availWidth - w ) / 2;
  window.open("http://forumAd.to5198.com/common/login.jsp?sCheckUrl=/out/login.jsp&sDesUrl=/out/mybook.jsp", "我的服务",
     "left=" + l + ",top=" + t + ",height=" + h + ",width=" + w
     + ",toolbar=no,status=no,scrollbars=no,resizable=yes" );
  return;
}

function MM_findObj(n, d) {
var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
 
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  
	if(!x && d.getElementById) x=d.getElementById(n); return x;

} 

function fetch_object(idname, forcefetch)
{
	if (typeof(vBobjects[idname]) == "undefined")
	{
		vBobjects[idname] = MM_findObj(idname);
	}
	return vBobjects[idname];
}
//menushow vmenu:内容，允许为空,vmenuobj DIV数据ID，MOD 0=关闭浏览器自适应，用于版面导航菜单
function menushow(e,vmenu,vmenuobj,mod){
	
	if (!document.all&&!document.getElementById&&!document.layers)
		return
	var which=vmenu;
	if (vmenuobj)
	{
		var MenuObj = fetch_object(vmenuobj);
		if (MenuObj)
		{
			which = MenuObj.innerHTML;
		}
	}
	if (!which)
	{
		return
	}
	clearhidemenu();
	ie_clearshadow();
	menuobj=ie4? document.all.popmenu : ns6? document.getElementById("popmenu") : ns4? document.popmenu : "";

	if(!menuobj) {alert(menuobj);return false;}
	menuobj.thestyle=(ie4||ns6)? menuobj.style : menuobj;
	if (ie4||ns6){
		menuobj.innerHTML=which
	}
	else{
		menuobj.document.write('<layer name=gui bgcolor="#E6E6E6" width="165" onmouseover="clearhidemenu()" onmouseout="online_hidemenu()">'+which+'</layer>')
		menuobj.document.close()
	}
	menuobj.contentwidth=(ie4||ns6)? menuobj.offsetWidth : menuobj.document.gui.document.width
	menuobj.contentheight=(ie4||ns6)? menuobj.offsetHeight : menuobj.document.gui.document.height
	eventX=ie4? event.clientX : ns6? e.clientX : e.x
	eventY=ie4? event.clientY : ns6? e.clientY : e.y
	var rightedge=ie4? document.body.clientWidth-eventX : window.innerWidth-eventX
	var bottomedge=ie4? document.body.clientHeight-eventY : window.innerHeight-eventY
	var getlength
		if (rightedge<menuobj.contentwidth){
			getlength=ie4? document.body.scrollLeft+eventX-menuobj.contentwidth+menuOffX : ns6? window.pageXOffset+eventX-menuobj.contentwidth : eventX-menuobj.contentwidth
		}else{
			getlength=ie4? ie_x(event.srcElement)+menuOffX : ns6? window.pageXOffset+eventX : eventX
		}
		menuobj.thestyle.left=getlength+'px'
		if (bottomedge<menuobj.contentheight&&mod!=0){
			getlength=ie4? document.body.scrollTop+eventY-menuobj.contentheight-event.offsetY+menuOffY-23 : ns6? window.pageYOffset+eventY-menuobj.contentheight-10 : eventY-menuobj.contentheight
		}	else{
			getlength=ie4? ie_y(event.srcElement)+menuOffY : ns6? window.pageYOffset+eventY+10 : eventY
		}
			
	menuobj.thestyle.top=getlength+'px'
	menuobj.thestyle.visibility="visible"
	ie_dropshadow(menuobj,"#999999",3)
	return false
}

function ie_y(e){  
	var t=e.offsetTop;  
	while(e=e.offsetParent){  
		t+=e.offsetTop;  
	}  
	return t;  
}  
function ie_x(e){  
	var l=e.offsetLeft;  
	while(e=e.offsetParent){  
		l+=e.offsetLeft;  
	}  
	return l;  
}  
function ie_dropshadow(el, color, size)
{
	var i;
	for (i=size; i>0; i--)
	{
		var rect = document.createElement('div');
		var rs = rect.style
		rs.position = 'absolute';
		rs.left = (el.style.posLeft + i) + 'px';
		rs.top = (el.style.posTop + i) + 'px';
		rs.width = el.offsetWidth + 'px';
		rs.height = el.offsetHeight + 'px';
		rs.zIndex = el.style.zIndex - i;
		rs.backgroundColor = color;
		var opacity = 1 - i / (i + 1);
		rs.filter = 'alpha(opacity=' + (100 * opacity) + ')';
		//el.insertAdjacentElement('afterEnd', rect);
		fo_shadows[fo_shadows.length] = rect;
	}
}
function ie_clearshadow()
{
	for(var i=0;i<fo_shadows.length;i++)
	{
		if (fo_shadows[i])
			fo_shadows[i].style.display="none"
	}
	fo_shadows=new Array();
}


function contains_ns6(a, b) {
	while (b.parentNode)
		if ((b = b.parentNode) == a)
			return true;
	return false;
}

function online_hidemenu(){
	if (true != window.__topPopMenuHidden && 'undefined' != typeof(monuobj)) {
		for (var key in monuobj) {
			if (monuobj[key] && monuobj[key].className == 'submenu' && monuobj[key].style) {
				monuobj[key].style.display = 'none';
			}
		}
		window.__topPopMenuHidden = true;
	}
	if (window.menuobj)
		menuobj.thestyle.visibility=(ie4||ns6)? "hidden" : "hide"
	ie_clearshadow()
}

function dynamichide(e){
	if (ie4&&!menuobj.contains(e.toElement))
		online_hidemenu()
	else if (ns6&&e.currentTarget!= e.relatedTarget&& !contains_ns6(e.currentTarget, e.relatedTarget))
		online_hidemenu()
}

function delayhidemenu(){
	if (ie4||ns6||ns4)
		delayhide=setTimeout("online_hidemenu()",500)
}

function clearhidemenu(){
	if (window.delayhide)
		clearTimeout(delayhide)
}

function highlightmenu(e,state){
	if (document.all)
		source_el=event.srcElement
	else if (document.getElementById)
		source_el=e.target
	if (source_el.className=="menuitems"){
		source_el.id=(state=="on")? "mouseoverstyle" : ""
	}
	else{
		while(source_el.id!="popmenu"){
			source_el=document.getElementById? source_el.parentNode : source_el.parentElement
			if (source_el.className=="menuitems"){
				source_el.id=(state=="on")? "mouseoverstyle" : ""
			}
		}
	}
}

if (ie4||ns6)
document.onclick=online_hidemenu
function doSClick() {
	var targetId, srcElement, targetElement, imageId, imageElement;
	srcElement = window.event.srcElement;
	targetId = srcElement.id + "content";
	targetElement = document.all(targetId);
	imageId = srcElement.id;
	imageId = imageId.charAt(0);
	imageElement = document.all(imageId);
	if (targetElement.style.display == "none") {
		imageElement.src = "Skins/Default/minus.gif"
		targetElement.style.display = "";
	} else {
		imageElement.src = "Skins/Default/plus.gif"
		targetElement.style.display = "none";
	}
}
function doClick() {
	var targetId, srcElement, targetElement;
	srcElement = window.event.srcElement;
	targetId = srcElement.id + "_content";
	targetElement = document.all(targetId);
	if (targetElement.style.display == "none") {
		srcElement.src = "Skins/Default/minus.gif"
		targetElement.style.display = "";
	} else {
		srcElement.src = "Skins/Default/plus.gif"
		targetElement.style.display = "none";
	}
}

//HTML过滤函数
function HTML(text)
{
	text = text.replace(/&/g, "&amp;") ;
	text = text.replace(/"/g, "&quot;") ;
	text = text.replace(/</g, "&lt;") ;
	text = text.replace(/>/g, "&gt;") ;
	text = text.replace(/'/g, "&#146;") ;
	return text ;
}
function ReHTML(text)
{
	text = text.replace(/&amp;/g, "&") ;
	text = text.replace(/&quot;/g, '"') ;
	text = text.replace(/&lt;/g, "<") ;
	text = text.replace(/&gt;/g, ">") ;
	text = text.replace(/&#146;/g, "'") ;
	return text ;
}
function LoadHTML(o){
	//var sData = document.createElement("div");
	//sData.innerHTML=ReHTML(o.innerHTML);
	//alert(sData.getAttribute("language"))
	o.innerHTML=ReHTML(o.innerHTML);
	
}
function bbimg(o){
	var zoom=parseInt(o.style.zoom, 10)||100;zoom+=event.wheelDelta/12;if (zoom>0) o.style.zoom=zoom+'%';
	return false;
}var ix=0;
function imgzoom(img,maxsize){	
	var vWidth = parseInt(img.width);	
	if(vWidth > maxsize * 4)
	{
		img.style.width=maxsize;
	}
	else if(vWidth > maxsize)
	{
		//img.style.width=Math.round(vWidth * Math.floor(4 * maxsize / vWidth) / 4);
		img.style.width = (document.body.clientWidth - 180)*0.9;
	}
	return false;
}
function Dvbbs_ViewCode(replyid)
{
	var bodyTag="<html><head><style type=text/css>.quote{margin:5px 20px;border:1px solid #CCCCCC;padding:5px; background:#F3F3F3 }\nbody{boder:0px}.HtmlCode{margin:5px 20px;border:1px solid #CCCCCC;padding:5px;background:#FDFDDF;font-size:14px;font-family:Tahoma;font-style : oblique;line-height : normal ;font-weight:bold;}\nbody{boder:0px}</style></head><BODY bgcolor=\"#FFFFFF\" >";
	bodyTag+=document.getElementById('scode'+replyid).CodeText.value
	bodyTag+="</body></html>"
	preWin=window.open('preview','','left=0,top=0,width=550,height=400,resizable=1,scrollbars=1, status=1, toolbar=1, menubar=0');
	preWin.document.open();
	preWin.document.write(bodyTag);
	preWin.document.close();
	preWin.document.title="查看帖子内容";
	preWin.document.charset="UTF-8";
}
function getskins(skinid,boardid){
	var styleurl = "cookies.asp?action=stylemod&skinid="+skinid+"&boardid="+boardid;
	var Sframe = fetch_object('stylecss');
	if (Sframe)
	{
		stylecss.location.href = styleurl;
	}
}
function BoardData(userName,userConfig){
	var config = new InnerConfig();
	if (userConfig) { 
		for (var thisName in userConfig) {
		if (userConfig[thisName]) { config[thisName] = userConfig[thisName]; }
		}
	}
	var InnerValue;
	if (userName){
		for (var thisName in userName) {
			if (userName[thisName]){
				InnerValue = userName[thisName]+"_Value";
				if (config[userName[thisName]]){
					InnerData(config[userName[thisName]],config[InnerValue])
				}
			}
		}
	}
}

function InnerData(name,value)
{
	for (var objid in name) {
		var obj = document.getElementById(name[objid]);
		if (obj){
			obj.innerHTML = value[objid];
		}
	}
}

//论坛跳转下拉菜单部分,by Lao_Mi
function BoardJumpList(boardid,act){
		if (!xslDoc){GetBoardXml("index.asp?action=xml");
	}
		if (xslDoc.parseError){
			if (xslDoc.parseError.errorCode!=0){
				return "<div class=\"menuitems\">"+xslDoc.parseError.reason +"</div>";
			}
		}
		var MenuStr="";
		var LoadBoard,depth;
		if(boardid!=0)
		{
			var nodelist1=xslDoc.documentElement.getElementsByTagName("board");
			for(var i=0;i<nodelist1.length;i++)
			{
				LoadBoard = parseInt(nodelist1[i].getAttribute("boardid"));
				if (LoadBoard==parseInt(boardid))
				{
					var nodelist=nodelist1[i].getElementsByTagName("board");
					break;
				}
			}
		}else{
			var nodelist=xslDoc.documentElement.getElementsByTagName("board");
		}
		MenuStr+="<div class=\"menuitems\">";
		//alert(nodelist.length)
		if (nodelist!=null){
			for(var i=0;i<nodelist.length;i++)
			{
				depth = nodelist[i].getAttribute("depth");
				LoadBoard = nodelist[i].getAttribute("boardid");
				boardtype = nodelist[i].getAttribute("boardtype");
				if (depth==0){
					var outtext="╋";
				}
				else{
					var outtext="";
					for (var j=0;j<(depth);j++)
					{
						if (j>0)
						{
							outtext+=" |"
						}
						outtext+="&nbsp;&nbsp;"
					}
					outtext+="├"
				}
			MenuStr+="<a href=\"index.asp?boardid="+LoadBoard+"\">"+ outtext + boardtype +"</a><br>";
			}

			MenuStr+="</div>"
			return MenuStr;
		}else{
			return "<div class=\"menuitems\">错误</div>";
		}
}
//selected下拉列表选取表单()
function BoardJumpListSelect(boardid,selectname,fristoption,fristvalue,checknopost){
		if (!xslDoc){GetBoardXml("index.asp?action=xml");
	}
	var sel = 0;
	var sObj = document.getElementById(selectname);
	if (sObj)
	{
		sObj.options[0] =  new Option(fristoption, fristvalue);
		if (xslDoc.parseError){
				if (xslDoc.parseError.errorCode!=0){
					return;
			}
		}
		var nodes = xslDoc.documentElement.getElementsByTagName("board")
		if (nodes)
		{
			for (var i = 0,k = 1;i<nodes.length;i++) {
				var t = nodes[i].getAttribute("boardtype");
				var v = nodes[i].getAttribute("boardid");
				if (v==boardid)
				{
					sel = k;
				}
				if (nodes[i].getAttribute("depth")==0){
					var outtext="╋";
				}
				else
				{
					var outtext="";
					for (var j=0;j<(nodes[i].getAttribute("depth"));j++)
					{
						if (j>0){outtext+=" |"}
						outtext+="  "
					}
					outtext+="├"
				}
				t = outtext + t
				t = t.replace(/<[^>]*>/g, "")
				t = t.replace(/&[^&]*;/g, "")
				if(checknopost==1 && nodes[i].getAttribute("nopost")=='1')
				{
						t+="(不许转移)"
				}
				sObj.options[k++] = new Option(t, v);
			}
			sObj.options[sel].selected = true;
		}
	}
}
//SELECT表单选取 Obj 表单名，VAL所选的值
function ChkSelected(Obj,Val)
{
	if (Obj)
	{
	for (i=0;i<Obj.length;i++){
		if (Obj.options[i].value==Val){
		Obj.options[i].selected=true;
		break;
		}
	}
	}
}

//单选表单选取 Obj 表单名，VAL所选的值
function chkradio(Obj,Val)
{
	if (Obj)
	{
	for (i=0;i<Obj.length;i++){
		if (Obj[i].value==Val){
		Obj[i].checked=true;
		break;
		}
	}
	}
}
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

function MM_showHideLayers() { //v6.0
	if(''==document.getElementById('newpost').style.display || document.getElementById('newpost').style.display=='none'){
		document.getElementById('newpost').style.display='block';
	}
	else{
		document.getElementById('newpost').style.display='none';
	}
	return;
}


function MM_showHideNoDone() { //v6.0
	if(''==document.getElementById('done').style.visibility || document.getElementById('done').style.visibility=='hidden'){
		document.getElementById('done').style.visibility='visible';
	}
	else{
		document.getElementById('done').style.visibility='hidden';
	}
	return;
}


function MM_showHideNoLogin() { //v6.0
	if(''==document.getElementById('nologin').style.visibility || document.getElementById('nologin').style.visibility=='hidden'){
		document.getElementById('nologin').style.visibility='visible';
	}
	else{
		document.getElementById('nologin').style.visibility='hidden';
	}
	return;
}

function MM_showHideNoanswer() { //v6.0
	if(''==document.getElementById('noanswer').style.display || document.getElementById('noanswer').style.display=='none'){
		document.getElementById('noanswer').style.display='block';
	}
	else{
		document.getElementById('noanswer').style.display='none';
	}
	return;
}



function MM_showHideLayerspost() { //v6.0
	if(''==document.getElementById('newpost').style.display || document.getElementById('newpost').style.display=='none'){
		document.getElementById('newpost').style.display='block';
	}
	else{
		document.getElementById('newpost').style.display='none';
	}
	return;
}



function MM_showHideLayersbuy() { //交易贴v6.0
	if(''==document.getElementById('newbuy').style.display || document.getElementById('newbuy').style.display=='none'){
		document.getElementById('newbuy').style.display='block';
	}
	else{
		document.getElementById('newbuy').style.display='none';
	}
	return;
}



function MM_showHideLayersreback_0() { //交易贴v6.0
	if(''==document.getElementById('newreback_0').style.display || document.getElementById('newreback_0').style.display=='none'){
		document.getElementById('newreback_0').style.display='block';
	}
	else{
		document.getElementById('newreback_0').style.display='none';
	}
	return;
}



function MM_showHideLayersreback_1() { //交易贴v6.0
	if(''==document.getElementById('newreback_1').style.display || document.getElementById('newreback_1').style.display=='none'){
		document.getElementById('newreback_1').style.display='block';
	}
	else{
		document.getElementById('newreback_1').style.display='none';
	}
	return;
}

function MM_showHideLayersvote() { //v6.0
	if(''==document.getElementById('newvote').style.display || document.getElementById('newvote').style.display=='none'){
		document.getElementById('newvote').style.display='block';
	}
	else{
		document.getElementById('newvote').style.display='none';
	}
	return;
}



function MM_showHideLayersargue() { //v6.0
	if(''==document.getElementById('newargue').style.display || document.getElementById('newargue').style.display=='none'){
		document.getElementById('newargue').style.display='block';
	}
	else{
		document.getElementById('newargue').style.display='none';
	}
	return;
}




function MM_showHideLayersaction() { //v6.0
	if(''==document.getElementById('newaction').style.display || document.getElementById('newaction').style.display=='none'){
		document.getElementById('newaction').style.display='block';
	}
	else{
		document.getElementById('newaction').style.display='none';
	}
	return;
}
function CheckIE ()
{
		var GetIEedition = navigator.userAgent;
		var arrGetIEedition = GetIEedition.split(";");
		var GetIEsize; 
		GetIEsize = arrGetIEedition[1];
		GetIEsize = GetIEsize.replace(" ","");
		if (( GetIEsize != 'MSIE 7.0') && (GetIEsize != 'MSIE 6.0' ))
		{
			var arrGetIEedition2 = GetIEedition.split("Firefox");
			//GetIEsize = "Firefox"+arrGetIEedition2[1];
			//GetIEsize = GetIEsize.replace(" ","");
			if (arrGetIEedition2[0] != '')
				GetIEsize = 'Firefox';
		
		}
		switch(GetIEsize)
		{
			case 'MSIE 6.0' :
				return('1');
			break;
			case 'MSIE 7.0' :
				return('2');
			break;
			case 'Firefox' :
				return('3');
			break;
			default : return('999');
		}
}

//============================================================================
//     处理发表窗体代码    2007-9-11  
//============================================================================
var getText;
var getCheckIE;
var GetUserId;
var GetAllDivName='';

function dv_GetPostIframe(dvUserId,dvDivName,dvPostTitle,zindex)
{ 
	var GetDivName   = dvDivName; 
	var GetPostTitle = dvPostTitle; 
	GetUserId        = dvUserId; 
    if(zindex===null||typeof(zindex)=='undefined')zindex=998;
	getCheckIE   = CheckIE();//获取IE版本
	//var getTextBottom = '<div id="dvPostbg' + GetDivName + '" style="position:absolute;display:none;background:#CCCCCC;top:0px;left:0px;width:102%;height:1800px;filter:alpha(style=0,opacity=50);z-index:9998;"> </div>';
	getText='<div id="dvmain' + GetDivName + '" style=" position:absolute;width:90%;margin:0; z-index:'+zindex+'; ">';
	getText+='<div id="' + GetDivName + '" name="' + GetDivName + '" style="width:100%;position:absolute;display:none;color:#000;background:#FFFFFF;border:none;float:left;margin:0px;padding:0px;text-align:right;background-color:#A2C6DA;" >';	
	getText+='	<div id="imgbutton" style="background-image :url('+imgpath+'bg1.gif);width:100%;margin:0;padding:6px 0 0 0;  height:31px; background-color:#A2C6DA;">';
	getText+='		<div style="float:left;padding-left:20px;padding-top:3px;"><font color="#535353"><b>' + GetPostTitle + '</b></font></div>';
	getText+='		<a style="CURSOR: hand" onclick="dv_PostDisplay(\'' + GetDivName + '\',\'\',\'1\');">';
	getText+='		<img src="'+imgpath+'close.gif" border="0"/></a>';
	getText+='	</div>';
	getText+='	<div id ="iframepsot" ><div id="dvshowmenu' + GetDivName + '" style="z-index:999;"></div>';
	getText+='		<iframe id="if' + GetDivName + '" name="if' + GetDivName + '" src="#" height="960" width="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" onload="iframeResize(\'if' + GetDivName + '\')" style="margin:0px;padding:0px;background:#FFFFFF;"></iframe>';
	getText+='	</div>';
	getText+='</div>';
	getText+='</div>';
	document.writeln(getText);
	//alert(getText)
	var GetifObjMainPost =document.getElementById("dvmain" + GetDivName + "");
	//var GetdvPostbgObjDivName = document.getElementById('dvPostbg'+GetDivName+''); 
	if (GetifObjMainPost=='[object]' || typeof(GetifObjMainPost)=='object') //控制外围宽度大小
	{
		
		if (getCheckIE==1)
		{
			GetifObjMainPost.style.width = "100%"; 
			//GetdvPostbgObjDivName.style.width = "103%"; 
		}
		else if (getCheckIE==2)
		{
			GetifObjMainPost.style.width = "97%"; 
			//GetdvPostbgObjDivName.style.width = "100%"; 
		}
		else if (getCheckIE==3)
		{
			var GetFrameName =document.getElementById("if" + GetDivName + "");
			
			GetifObjMainPost.style.width = "97%"; 			
			//GetdvPostbgObjDivName.style.width = "100%"; 
		}
		else
		{
			GetifObjMainPost.style.width = "100%"; 
		}

	}

	GetAllDivName += GetDivName+'|';//获取所有名称
	//dv_PostLoadStyle (GetDivName);//加载风格

} 

function iframeResize(dvifDivName)
{
	var GETifDivName=dvifDivName;
	
	try{
		var f = document.frames(GETifDivName);
		var d = getObj(GETifDivName);
		if (f){ 
			
			var h = f.ietruebody().scrollHeight;

			d.height = h;

		}

	}
	catch(e){}
}

function getObj(id){
	return document.getElementById(id);
}

function ietruebody(){
	return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body;
}

function LoadInfo(dvifDivName){ //加载提示
				
		getObj(dvifDivName).innerHTML = '<div style="padding:13px 30px;"><img src="'+imgpath+'loading.gif" align="absbottom" /> 正在加载数据...</div>';		
		getObj(dvifDivName).className = 'dvpostmenu';
}

function dv_PostDisplay(DivName,PostUrl,dvClose) //点击掩藏或显示
{ 
	var di_newaction ; 
	var di_Postbg; 	
	var dv_objForumName;
	var GetbodyHeight =document.body.scrollHeight ;//控制底层透明大小
	if (GetbodyHeight == 0) GetbodyHeight=1500;
	if (dvClose=='1')
	{
			di_newaction = document.getElementById(DivName);
			if (typeof(di_newaction)=='object') 
			{
				if (di_newaction.style.display == "none")
				{
					di_newaction.style.display = "block";
				}else{
					di_newaction.style.display = "none";
				}
			}
	}
	else
	{
		var GetArrDivName = new   Array();   
		GetArrDivName = GetAllDivName.split("|");		
		for (i=0; i < GetArrDivName.length-1; i++ )
		{
			di_newaction = document.getElementById(GetArrDivName[i])

			if (typeof(di_newaction)=='object') 
			{
				if (DivName==GetArrDivName[i])
				{
					var dv_showmenuname = 'dvshowmenu'+GetArrDivName[i]+'';
					var dv_objForumName = "if"+DivName+"";
					LoadInfo(dv_showmenuname);					
					di_newaction.style.display = "block";
					setTimeout("dv_objForumLoad('"+dv_objForumName+"','"+PostUrl+"','"+dv_showmenuname+"');",300);					
					//getObj('dvshowmenu').style.display = "none";
					
				}else{
					di_newaction.style.display = "none";
				}
			}
		}
	}

}

function dv_objForumLoad(dv_objForumName,PostUrl,dv_showmenuname){
	getObj(dv_objForumName).src = PostUrl;
	getObj(dv_showmenuname).style.display = "none";
}


function dv_PostLoadStyle (dvDivName) //风格和框架大小
{
	var getScreenWh = screen.width;//分辨率宽度
	var GetDivName   = dvDivName; 

	var GetifObjDivName       =document.getElementById("if"+GetDivName+""); 

	if (GetifObjDivName=='[object]') //控制外围大小
	{
		if (getCheckIE==1)
		{
				/*if (dvDivName=='dvnewpost')GetifObjDivName.style.height = "710";//发表话题
				//if (dvDivName=='dvnewbuy')GetifObjDivName.style.height = "883";//发表交易
				if (dvDivName=='dvnewvote')GetifObjDivName.style.height = "874";//发表投票
				if (dvDivName=='dvnewargue')GetifObjDivName.style.height = "596";//发表辩论
				if (dvDivName=='dvnewaction')GetifObjDivName.style.height = "926";//发表活动
				if (dvDivName=='dvnewreback_0')GetifObjDivName.style.height = "667";//回帖 0 
				if (dvDivName=='dvnewreback_1')GetifObjDivName.style.height = "667";//回帖 1 */
				//=====================================================================
				/*if (dvDivName=='dvnewquiz')GetifObjDivName.style.height = "547";//发起提问 
				if (dvDivName=='dvnologin')GetifObjDivName.style.height = "547";//发起提问 
				if (dvDivName=='dvdone')GetifObjDivName.style.height = "547";//发起提问 */
				//=====================================================================
				/*if (dvDivName=='dvargue_reply')GetifObjDivName.style.height = "691";//发表观点 
				if (dvDivName=='dvargue_reply2')GetifObjDivName.style.height = "691";//发表观点 
				if (dvDivName=='dvargue_reply3')GetifObjDivName.style.height = "691";//发表观点 
				if (dvDivName=='dvargue_reply_fight_1')GetifObjDivName.style.height = "691";//发表评论 */
				

		}
		else if (getCheckIE==2)
		{
				/*if (dvDivName=='dvnewpost')GetifObjDivName.style.height = "730";//发表话题
				if (dvDivName=='dvnewbuy')GetifObjDivName.style.height = "903";//发表交易
				if (dvDivName=='dvnewvote')GetifObjDivName.style.height = "899";//发表投票
				if (dvDivName=='dvnewargue')GetifObjDivName.style.height = "606";//发表辩论
				if (dvDivName=='dvnewaction')GetifObjDivName.style.height = "945";//发表活动
				if (dvDivName=='dvnewreback_0')GetifObjDivName.style.height = "686";//回帖 0 
				if (dvDivName=='dvnewreback_1')GetifObjDivName.style.height = "686";//回帖 1*/ 
				//=====================================================================
				/*if (dvDivName=='dvnewquiz')GetifObjDivName.style.height = "521";//发起提问 
				if (dvDivName=='dvnologin')GetifObjDivName.style.height = "521";//发起提问 
				if (dvDivName=='dvdone')GetifObjDivName.style.height = "521";//发起提问 */
				//=====================================================================
				/*if (dvDivName=='dvargue_reply')GetifObjDivName.style.height = "670";//发表观点 
				if (dvDivName=='dvargue_reply2')GetifObjDivName.style.height = "670";//发表观点 
				if (dvDivName=='dvargue_reply3')GetifObjDivName.style.height = "670";//发表观点 
				if (dvDivName=='dvargue_reply_fight_1')GetifObjDivName.style.height = "670";//发表评论*/ 
		
		}
		else
		{
			GetifObjDivName.style.height = "100%"; 
		}
		/*if (GetUserId==0 && dvDivName!='dvnewargue') //客人没有上传.高度所以减去
		{
			var GetStyleHeight = GetifObjDivName.style.height;
			GetStyleHeight = GetStyleHeight.substr(0,3);
			if ( dvDivName=='dvnewaction' ) //活动话题
			{
				GetifObjDivName.style.height = parseInt(GetStyleHeight) - 35;
			}else{
				GetifObjDivName.style.height = parseInt(GetStyleHeight) - 50;
			}
		}*/
	}

}

function switch_display(objid){
	obj=document.getElementById(objid);
	if(!obj.style)return false;
	if(obj.style.display=='none'){
	  obj.style.display='block';
	}else{
	  obj.style.display='none';
	}
}


