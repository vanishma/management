<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <form id="updateAPI" class="form-horizontal">
        <input type="hidden" name="id" value="${dingdan.id}">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-4 control-label">日期</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control pull-right" name="riqi" id="mydatepicker" value="${dingdan.riqi}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">规格</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="guige" placeholder="规格" value="${dingdan.guige}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">团购数量</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="tuangoushulaing" placeholder="团购数量" value="${dingdan.tuangoushulaing}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4  control-label">分销价</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="fenxiaojia" placeholder="分销价" value="${dingdan.fenxiaojia}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4  control-label">利润</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="lirun" placeholder="利润" value="${dingdan.lirun}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4  control-label">电话</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="dianhua" placeholder="电话" value="${dingdan.dianhua}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">快递</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="kuaidi" placeholder="快递" value="${dingdan.kuaidi}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4  control-label">售后</label>
                    <div class="col-sm-8">
                        <input type="checkbox" class="minimal" <c:if test="${dingdan.shouhou == '是'}">checked </c:if>  name="shouhou" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-4 control-label">产品</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="chanpin" placeholder="产品" value="${dingdan.chanpin}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">团购价</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="tuangoujia" placeholder="团购价" value="${dingdan.tuangoujia}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">总价</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="zhongjia" placeholder="总价" value="${dingdan.zhongjia}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">返现</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="fanxian" placeholder="返现" value="${dingdan.fanxian}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">姓名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="xingming" placeholder="姓名" value="${dingdan.xingming}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">地址</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="dizhi" placeholder="地址" value="${dingdan.dizhi}">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label">是否到货</label>
                    <div class="col-sm-8">
                        <input type="checkbox" class="minimal" <c:if test="${dingdan.shifoudaohuo == '是'}">checked </c:if> name="shifoudaohuo" />
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

    function addAPIpush() {
        $.ajax({
            type:"post",
            url: "updateDingdan",
            data: $("#updateAPI").serialize(),
            success: function(data){
                $("#updateappApk").modal('hide');
                $("#appApktable").bootstrapTable('refresh');
            }
        })
    }
</script>