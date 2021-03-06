<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 内容标题（页面标题） -->
<section class="content-header">
    <h1>
        bootstrap-table  test
        <small>Optional description</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol>
</section>
<script>
    var $table = $('#appApktable');
    $('#appApktable').bootstrapTable({
        url: 'appcontroller/getApp.do',
        queryParams: queryParams,
        queryParamsType: "limit",
        columns: [{
            field: 'version',
            title: '版本号',
            align:'center',
            width: 200
        } ,{
            field: 'url',
            title: '地址',
            align:'center',
            width: 400
        } ,{
            field: 'description',
            title: '内容',
            align:'center',
            width: 400
        } ,{
            field: 'category',
            title: '类别',
            align:'center',
            width: 400
        } ,{
            title:'编辑',
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
        $("#addapp").modal({ remote: "appcontroller/addAppPage.do" });
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
            <button id="add" class="btn btn-default" onclick="addDepartmentDialog();">
                <i class="glyphicon glyphicon-plus"></i> 添加
            </button>
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
            <div class="modal-dialog">
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
