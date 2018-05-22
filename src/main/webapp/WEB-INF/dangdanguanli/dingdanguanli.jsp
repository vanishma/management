<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 内容标题（页面标题） -->
<section class="content-header">
    <h1>
        订单管理
        <small></small>
    </h1>
    <%--<ol class="breadcrumb">--%>
        <%--<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>--%>
        <%--<li class="active">Here</li>--%>
    <%--</ol>--%>
</section>
<script>
    var $table = $('#appApktable');
    $('#appApktable').bootstrapTable({
        url: 'appcontroller/getApp.do',
        queryParams: queryParams,
        queryParamsType: "limit",
        columns: [{
            field: 'version',
            title: '日期',
            align:'center',
            width: 200
        } ,{
            field: 'url',
            title: '产品',
            align:'center',
            width: 400
        } ,{
            field: 'description',
            title: '规格',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '团购价',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '团购数量',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '总价',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '分销价',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '返现',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '利润',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '姓名',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '电话',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '地址',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '快递',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '是否到货',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '售后',
            align:'center',
            width: 400
        } ,{
            title:'操作',
            width: 200,
            align:'center',
            formatter:function(value,row,index){
                var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\');">编辑</a> ';
                var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\');">删除</a> ';
                return e+d;
            }
        }]
    });
    function queryParams(params) {
        var temp = {
            limit: params.limit,
            order: params.order,
            offset: params.offset,
        };
        return temp;
    }

    function addDepartmentDialog() {
        $("#addapp").removeData("bs.modal");
        $("#addapp").modal({ remote: "/dingdanguanliAdd" });
    }

    function edit(id){
        $("#updateappApk").removeData("bs.modal");
        $("#updateappApk").modal({ remote: "appApk/toUpdateappApk.do?id="+id});
    }
    function del(id){
        bootbox.setLocale("zh_CN");
        bootbox.confirm("您确定要删除吗？", function(result) {
            if (result) {
                delpost("post","appApk/delappApk.do","id="+id,"appApk");
            }
        });
    }

</script>
<!-- 内容 -->
<section class="content container-fluid">
    <div style="margin-top: 10px; margin-left: 10px;float:left;">
        <div id="toolbar">
            <div>
                <table>
                    <tr>
                        <td width="100">当天</td>
                        <td>订单量:</td>
                        <td width="100">6</td>
                        <td>营业额:</td>
                        <td width="100">240</td>
                        <td>返现:</td>
                        <td width="100">6</td>
                        <td>利润</td>
                        <td width="100">6</td>
                    </tr>
                    <tr>
                        <td>全部订单</td>
                        <td>总单量:</td>
                        <td>6</td>
                        <td>总营业额:</td>
                        <td>240</td>
                        <td>总返现:</td>
                        <td>6</td>
                        <td>总利润</td>
                        <td>360</td>
                    </tr>
                </table>
            </div>
            <%--<button id="add" class="btn btn-default" onclick="addDepartmentDialog();">--%>
                <%--<i class="glyphicon glyphicon-plus"></i> 添加订单--%>
            <%--</button>--%>
            <div>&nbsp;</div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="input-group">
                      <span class="input-group-btn" >
                          <button class="btn btn-success" type="button" onclick="addDepartmentDialog();">添加订单</button>
                      </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button">检索</button>
                        </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->

        </div>

        <table id="appApktable"
               data-toggle="table"
               data-side-pagination="server"
               data-pagination="true"
               data-id-field="id"
               data-detail-formatter="operateFormatter"
               data-events="operateEvents"
               data-page-list="[5, 10, 20, 50, 100, 200]"
        >
        </table>
        <div style="margin-bottom: 50px;"></div>

        <!-- 添加app -->
        <div class="modal fade" id="addapp" tabindex="-1" role="dialog" aria-labelledby="addappLabel" aria-hidden="">
            <div class="modal-dialog" >   <%-- style="width: 55%"--%>
                <div class="modal-content">
                </div>
            </div>
        </div>

        <!-- 修改部门 -->
        <div class="modal fade" id="updateDepartment" tabindex="-1" role="dialog" aria-labelledby="updateDepartmentLabel" aria-hidden="">
            <div class="modal-dialog">
                <div class="modal-content">
                </div>
            </div>
        </div>
    </div>


</section>
