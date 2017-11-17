window.onload =function(){
	showSubmenu();
	onMenuItemClick();
	tabSlide();
}

/**
*显示子菜单栏
*/
function showSubmenu(){
	var items = $(".item");
	items.each(function(){//each遍历
		var index=$(this).index();
		$(this).mouseenter(function(){
			$(this).addClass("select").siblings().removeClass("select");
			$(".sub_menu").eq(index).show()>siblings(".sub_menu").hide();

		})
	});
	$("#menu").mouseleave(function(){
		$(".item").removeClass("select");
		$(".sub_menu").hide();
	})
}
/**
*菜单栏项被点击
*/
function onMenuItemClick(){
	var items=$(".item");
	items.each(function(){
		var index = $(this).index();
		$(this).click(function(){
			$(this).addClass("select").siblings().removeClass();
			$(".sub_menu").eq(index).show().siblings(".sub_menu").hide();

		})
	});
}
/**
*卡片的滑动效果
*/
function tabSlide(){
	$(".item_class").mouseenter(function(){
		$(this).children(".item_class_intro").css("top","30px");
		$(this).css("box-shadow","5px 0 10px 0 rgba(0,0,0,0.2),"+"-5px 0 10px 0 rgba(0,0,0,0.2),0 5px 10px 0 rgba(0,0,0,0.2)");

	});
	$(".item_class").mouseleave(function(){
		$(this).children(".item_class_intro").css("top","100px");
		$(this).css("box-shadow","0 0");
	});
	$(".use_r").mouseleave(function(){
		$(this).children(".item_class_intro").css("top","100px");
		$(this).css("box-shadow","0 5px 10px 0 rgba(0,0,0,0.2)");
	});
}
