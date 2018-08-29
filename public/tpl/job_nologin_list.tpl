{volist name="job_list" id="data"}
<div class="intern-content-href">
    <a target="_blank" class="intern-logo" href="">
        <img src="{$data.c_icon_url}" alt="" class="intern-logo-img">
    </a>

    <div class="intern-title">
        <a name="{$data.j_id}"  data-toggle="modal" data-target="#myModal" >{$data.j_name}
        </a>

    </div>
    <div class="intern-sub">
        <a class="link" href="" target="_blank">{$data.c_name}</a>
        <span>{$data.j_description}</span>
    </div>
    <div class="intern-info" >
        <span>{$data.j_arrange}</span><span>{$data.j_min_salary}-{$data.j_max_salary}/天</span>
        <span>{$data.j_location}</span>
    </div>
</div>
{/volist}