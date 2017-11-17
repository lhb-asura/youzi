window.onload = function() {
    var list_banner = document.getElementById("list_banner");
    var imgs = document.getElementsByTagName("img");
    var lis = document.getElementsByTagName("li");
    var workbanner_left=document.getElementById('workbanner_left');
    var workbanner_right=document.getElementById('workbanner_right');
    var index = 1;/*总共能搜到6张图片，第一张为logo不要*/
    function run(){
        index++;
        if(index==6)index=1;/*超出回1*/
        for(var i =1;i<6;i++)/*初始化*/
        {
            imgs[i].style.display="none";
            lis[i-1].style.background="black";/*li为五个 正常*/
        }
        imgs[index].style.display="block";/*特定显示*/
        lis[index-1].style.background="red";
    }

    var timer = setInterval(run,1000);/*定时器*/
   /* 鼠标移入事件*/
    for(var i=0;i<lis.length;i++){
        lis[i].xuhao=i;
        lis[i].onmouseover=function(){
            index = this.xuhao;/*鼠标移入点的序号*/
            for(var i=0;i<lis.length;i++){
                imgs[i+1].style.display='none';
                lis[i].style.background='black';
            }
            imgs[index+1].style.display='block';
            lis[index].style.background='red';
            clearInterval(timer);
        }
    }

    for(var i=0;i<lis.length;i++){
        lis[i].onmouseout = function(){
        timer = setInterval(run,1000);
        }
    }

    list_banner.onmouseover=function() {
        workbanner_left.style.display="block";
        workbanner_right.style.display="block";
    }

     list_banner.onmouseout=function() {
        workbanner_left.style.display="none";
        workbanner_right.style.display="none";
    }

    workbanner_left.onclick=function(){
        index--;
        if (index<1) {
            index=5;
        }
        for(var i=1;i<6;i++){
            imgs[i].style.display='none';
            lis[i-1].style.background='black';
        }
        imgs[index].style.display='block';
        lis[index-1].style.background='red';
    }

    workbanner_right.onclick=function(){
        index++;
        if (index>5) {
            index=1;
        }
        for(var i=1;i<6;i++){
            imgs[i].style.display='none';
            lis[i-1].style.background='black';
        }
        imgs[index].style.display='block';
        lis[index-1].style.background='red';
    }

    workbanner_left.onmouseover = function() {
        clearInterval(timer);
    }
    workbanner_left.onmouseout = function() {
        timer = setInterval(run,1000);
    }
    workbanner_right.onmouseover = function() {
        clearInterval(timer);
    }
    workbanner_right.onmouseout = function() {
        timer = setInterval(run,1000);
    }
}