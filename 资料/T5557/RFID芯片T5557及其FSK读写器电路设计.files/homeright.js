var imgheight_close
document.ns = navigator.appName == "Microsoft Internet Explorer"

window.screen.width>800 ? imgheight_close=120:imgheight_close=120
 function myload()
{
myright.style.top=0;//document.body.scrollTop+document.body.offsetHeight-imgheight_close;
myright.style.left=916;
mymove();
}
 function mymove()
 {
 myright.style.top=document.body.scrollTop;
 myright.style.left=916;
 setTimeout("mymove();",50)
 }


if(document.ns){
document.write("<style>.xxx {position: absolute;width:40;top:5px;left:916;visibility: visible;z-index: 1;margin:5px 1px}</style>")
document.write("<div id=myright class='xxx'>");


	document.write("<iframe src='../int/homeright.htm' width=90 height=415 marginwidth=0 marginheight=0 hspace=0 vspace=0 frameborder=0 scrolling=no></iframe>");


document.write("</div>");

myload()
}
