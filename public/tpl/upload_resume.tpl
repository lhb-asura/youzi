<div class="modal fade" id="delivery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">

    <form action="Index/upload" method="post" class="applicant_form" enctype="multipart/form-data" onsubmit="if(resume.value==''){alert('请上传您的简历'); return false}">
        <p class="headtext">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <p>
        <p class="headtext">上传pdf简历</p>
        <span style="position: relative;top: -50px">(要求：小于3M)</span>
        <input class="file_style"  type="file" name="resume" id="pic"  accept="application/pdf" />
        <button type="submit" class="applicant_btn btn">确认投递
        </button>
         <input name="u_id" id="u_id_input" hidden/>
        <input name="j_id" id="j_id_input" hidden/>
    </form>
</div>