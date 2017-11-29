{volist name="job_list" id="data"}
    <div class="intern-content-href">
        <a target="_blank" class="intern-logo" href="">
            <img src="{$data.c_icon_url}" alt="" class="intern-logo-img">
        </a>

        <div class="intern-title">
            <a name="{$data.j_id}" {notin name="data.j_id" value="$employ_j_list"} data-toggle="modal" data-target="#delivery" onclick="bind_data('{:session("user")["id"]}','{$data.j_id}')" {/notin}>{$data.j_name}

            </a>
            {in name="data.j_id" value="$employ_j_list"}
                <span style="color: #f6a709; float: right">
                           {switch name=$status_list[$data.j_id]}
                           {case value='0'}待审核{/case}
                           {case value='1'}通过筛选{/case}
                           {case value='2'}录用{/case}
                           {case value='3'}未通过筛选{/case}
                           {/switch}
                        </span>
            {/in}
        </div>
        <div class="intern-sub">
            <a class="link" href="" target="_blank">{$data.c_name}</a>
            <span>{$data.j_description}</span>
        </div>
        <div class="intern-info">
            <span>{$data.j_arrange}</span><span>{$data.j_min_salary}-{$data.j_max_salary}/天</span>
            <span>{$data.j_location}</span>
        </div>
    </div>
{/volist}
<script>
    function bind_data(uid, jid){
        document.getElementById("u_id_input").value=uid;
        document.getElementById("j_id_input").value=jid;
    }
</script>