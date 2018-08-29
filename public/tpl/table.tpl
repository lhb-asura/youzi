<tr>

    <!--
    <td bgcolor="#FFFFFF">
        <div align="center"><img src="{$data.u_img_url}"></div>
    </td>-->
    <td class="datacol" bgcolor="#FFFFFF">{$data.j_name}</td>
    <td bgcolor="#FFFFFF">{$data.e_time}</td>
    <td bgcolor="#FFFFFF">{$data.ex_hr_name}</td>
    <td class="yccol" bgcolor="#FFFFFF">{$data.adj}</td>
    <td class="czcol" bgcolor="#FFFFFF"><select name="{$data.status}" onchange='change_status(this,"{$data.e_id}","{:session('hr')['email']}","{:session('hr')['token']}")'>
            >

                <option value="0" {if $data.status==0}selected{/if}>未处理</option>
                <option value="1" {if $data.status==1}selected{/if}>通过筛选</option>
                <option value="2" {if $data.status==2}selected{/if}>录用</option>
                <option value="3" {if $data.status==3}selected{/if}>淘汰</option>


        </select>&nbsp;


        &nbsp;&nbsp;<a target="_blank" href="{$data.u_resume_url}">查看</a>

    </td>
</tr>