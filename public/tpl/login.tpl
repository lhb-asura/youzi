<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div>
        <form class="login_form" action="Check/login">
            <p class="headtext">柚子校园招聘
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <p>
            <p><input class="input1  " type="text" name="email" placeholder="邮箱"></p>
            <p><input class="input1" type="password" name="password" placeholder="密码"></p>
            <p>
                <button class="button1 btn " type="submit">登录</button>
                <button class="button1 btn "><a class="reg_a" href="regist" class=target="_blank">立即注册</a>
                </button>
            </p>
        </form>
    </div>
</div>
<div class="right">
{if session('?user')}
    <a class="button cur" >{:session('user')['name']}</a>
    <a class="signup button" href="Check/logout">注销</a>

{else /}

    <a class="button cur" data-toggle="modal" data-target="#myModal">登录</a>
    <a class="signup button" href="regist">注册</a>


{/if}
</div>