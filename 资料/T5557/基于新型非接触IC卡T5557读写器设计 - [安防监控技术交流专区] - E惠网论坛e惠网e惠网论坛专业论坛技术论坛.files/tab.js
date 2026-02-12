//新闻模式分类显示菜单
function NewsSpanBar(){
	this.f=1;
	this.event = "click"
	this.titleid = "";
	this.bodyid="";
	this.class_dis = "dis";
	this.class_undis = "undis";
	this.class_hiton = "tab_search_on";
	this.class_hitno = "tab_search";

	var Tags,TagsCnt,len,flag;
	var BClassName;
	this.load=function(){
		if (!document.getElementById(this.titleid)||!document.getElementById(this.bodyid))
		{
			return false;
		}
		flag = this.f;
		BClassName = [this.class_dis,this.class_undis,this.class_hiton,this.class_hitno];
		Tags=document.getElementById(this.titleid).getElementsByTagName('p'); 
		TagsCnt=document.getElementById(this.bodyid).getElementsByTagName('span'); 
		len=Tags.length;
		for(var i=0;i<len;i++){
			Tags[i].value = i;
			if (this.event!='click'){
				Tags[i].onmouseover=function(){changeNav(this.value)};
			}else{
				Tags[i].onclick=function(){changeNav(this.value)};
			}
			TagsCnt[i].className=BClassName[1];
		}
		Tags[flag].className=BClassName[3];
		TagsCnt[flag].className=BClassName[0];
	}
	function changeNav(v){
		Tags[flag].className=BClassName[2];
		TagsCnt[flag].className=BClassName[1];
		flag=v;
		Tags[v].className=BClassName[3];
		TagsCnt[v].className=BClassName[0];
	}
}
//收缩功能
function collapse(img, objName)
{
	

	if ( typeof(document.getElementById(objName)) != 'undefined' )
	{
		
	
	var obj = document.getElementById(objName);
/*	var min = 0;
	var max = obj.rows.length;

	if (obj.rows[0].className.toLowerCase() == 'category' || obj.rows[0].cells[0].className.toLowerCase() == 'category')
	{
		min++;
	}
	if (obj.rows[max-1].id == 'pagerrow')
	{
		max--;
	}
*/
  if(img.src.indexOf('forum_close')!=-1)
	{
	   obj.style.display='none';
	}
else if(img.src.indexOf('folder')!=-1)
	{
	if (img.src.indexOf('open') != -1)
	{
		/*if (document.all && max != obj.rows.length)
		{
			obj.border = 0;
		}
		img.src = img.src.replace('open', 'close');
		for (var i=min; i<max; i++)
		{
			if (obj.rows[i].getAttribute('alwaysdisplay') == 1) continue;
			obj.rows[i].style.display = 'none';
		}*/
		obj.style.display = '';
		img.src = img.src.replace('open', 'close');
		img.title='收缩';
		
		
	}
	else
	{/*
		if (document.all && max != obj.rows.length)
		{
			obj.border = 1;
		}
		img.src = img.src.replace('close', 'open');
		for (var i=min; i<max; i++)
		{
			if (obj.rows[i].getAttribute('alwaysdisplay') == 1) continue;
			obj.rows[i].style.display = '';
		}*/
		obj.style.display = 'none';
		img.src = img.src.replace('close', 'open');
		img.title='展开';
		
	}
	}
	else
	{
		 if(obj.style.display=='')
		{
			  obj.style.display='none';
			  if(img.src.indexOf('moderator')!=-1)
				  img.title='展开版主';
			  if(img.src.indexOf('subclass')!=-1)
				  img.title='展开子版';
		}
		 else
		{
			 obj.style.display=''
			  if(img.src.indexOf('moderator')!=-1)
				  img.title='收缩版主';
			  if(img.src.indexOf('subclass')!=-1)
				  img.title='收缩子版';
		}
	}
	}
} 