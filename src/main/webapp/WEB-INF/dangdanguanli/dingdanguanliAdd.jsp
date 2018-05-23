<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
    <button type="button" class="close"
            data-dismiss="modal" aria-hidden="true">&times;
    </button>
    <h4 class="modal-title" id="addAPILabel">
        添加订单
    </h4>
</div>
<div class="modal-body">

    <form id="addAPI" class="form-horizontal">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-4 control-label">日期</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control pull-right" name="riqi" id="mydatepicker">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">规格</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="guige" placeholder="规格">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">团购数量</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="tuangoushulaing" placeholder="团购数量">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4  control-label">分销价</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="fenxiaojia" placeholder="分销价">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4  control-label">利润</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="lirun" placeholder="利润">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4  control-label">电话</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="dianhua" placeholder="电话">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">快递</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="kuaidi" placeholder="快递">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4  control-label">售后</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="shouhou" placeholder="售后">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-4 control-label">产品</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="chanpin" placeholder="产品">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">团购价</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="tuangoujia" placeholder="团购价">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">总价</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="zhongjia" placeholder="总价">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">返现</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="fanxian" placeholder="返现">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">姓名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="xingming" placeholder="姓名">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">地址</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="dizhi" placeholder="地址">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">是否到货</label>
                    <div class="col-sm-8">
                        <input type="checkbox" class="minimal" name="shifoudaohuo" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default"
            data-dismiss="modal">关闭
    </button>
    <button type="button" class="btn btn-primary" onclick="addAPIpush();">
        提交
    </button>
</div>

<script>

    $(function(){
        $('#mydatepicker').datepicker({
            autoclose: true,
            todayHighlight: true,
            language:"zh-CN", //语言设置
            format:"yyyy-mm-dd"  //日期显示格式
        });
    });


    // $.ajax({
    //     type:"post",
    //     url: "dealers/getAllDealers.do",
    //     success: function(data){
    //         var dataobj = eval("("+data+")");
    //         var temp ="";
    //         for(var i=0;i<dataobj.length;i++){
    //             temp +="<input type='checkbox' id='check"+i+"' name='dealers' value='"+dataobj[i].id+"'><label for='check"+i+"'>"+dataobj[i].dealers_name+"</label>&nbsp;&nbsp;&nbsp;&nbsp;";
    //         }
    //         $("#jxs").html(temp);
    //     }
    // });


    function addAPIpush() {
        $.ajax({
            type:"post",
            url: "addDingDan",
            data: $("#addAPI").serialize(),
            success: function(data){
                $("#addapp").modal('hide');
                $("#addapp").bootstrapTable('refresh');
            }
        })

    }
</script>