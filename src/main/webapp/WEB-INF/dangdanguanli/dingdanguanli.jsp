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
        url: '/getDingDan',
        queryParams: queryParams,
        queryParamsType: "limit",
        columns: [{
            field: 'riqi',
            title: '日期',
            align:'center',
            width: 300
        } ,{
            field: 'chanpin',
            title: '产品',
            align:'center',
            width: 400
        } ,{
            field: 'guige',
            title: '规格',
            align:'center',
            width: 400
        } ,{
            field: 'tuangoujia',
            title: '团购价',
            align:'center',
            width: 400
        } ,{
            field: 'tuangoushulaing',
            title: '团购数量',
            align:'center',
            width: 400
        } ,{
            field: 'zhongjia',
            title: '总价',
            align:'center',
            width: 400
        } ,{
            field: 'fenxiaojia',
            title: '分销价',
            align:'center',
            width: 400
        } ,{
            field: 'fanxian',
            title: '返现',
            align:'center',
            width: 400
        } ,{
            field: 'lirun',
            title: '利润',
            align:'center',
            width: 400
        } ,{
            field: 'xingming',
            title: '姓名',
            align:'center',
            width: 400
        } ,{
            field: 'dianhua',
            title: '电话',
            align:'center',
            width: 400
        } ,{
            field: 'dizhi',
            title: '地址',
            align:'center',
            width: 400
        } ,{
            field: 'kuaidi',
            title: '快递',
            align:'center',
            width: 400
        } ,{
            field: 'shifoudaohuo',
            title: '是否到货',
            align:'center',
            width: 400
        } ,{
            field: 'shouhou',
            title: '售后',
            align:'center',
            width: 400
        } ,{
            title:'操作',
            width: 250,
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
            sousuo: $("#sousuo").val()

        };
        return temp;
    }

    function query(){
        $table.bootstrapTable('refresh');
        queryNow();
        return false;
    }

    function queryNow() {
        $.ajax({
            type:"post",
            url: "queryNow",
            data: "sousuo="+$("#sousuo").val(),
            success: function(data){
                $("#dangtian").html(data.serch);
                $("#lirun").html(data.lirun);
                $("#fanxian").html(data.fanxian);
                $("#yingyee").html(data.zhongjia);
                $("#dingdanliang").html(data.zcount);

                $("#zlirun").html(data.zlirun);
                $("#zfanxian").html(data.zfanxian);
                $("#zyingyee").html(data.zzhongjia);
                $("#zdingdanliang").html(data.zzcount);
            }
        })
    }

    function addDepartmentDialog() {
        $("#addapp").removeData("bs.modal");
        $("#addapp").modal({ remote: "/dingdanguanliAdd" });
    }

    function edit(id){
        $("#updateappApk").removeData("bs.modal");
        $("#updateappApk").modal({ remote: "/updateDingDan?id="+id});
    }
    function del(id){
        bootbox.setLocale("zh_CN");
        bootbox.confirm("您确定要删除吗？", function(result) {
            if (result) {
                $.ajax({
                    type:"post",
                    url: "delDingDan",
                    data: "id="+id,
                    success: function(data){
                        $("#appApktable").bootstrapTable('refresh');
                    }
                })
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
                        <td width="100"><label id="dangtian">当天</label></td>
                        <td>订单量:</td>
                        <td width="100"><label id="dingdanliang"></label></td>
                        <td>营业额:</td>
                        <td width="100"><label id="yingyee"></label></td>
                        <td>返现:</td>
                        <td width="100"><label id="fanxian"></label></td>
                        <td>利润</td>
                        <td width="100"><label id="lirun"></label></td>
                    </tr>
                    <tr>
                        <td>全部订单</td>
                        <td>总单量:</td>
                        <td><label id="zdingdanliang"></label></td>
                        <td>总营业额:</td>
                        <td><label id="zyingyee"></label></td>
                        <td>总返现:</td>
                        <td><label id="zfanxian"></label></td>
                        <td>总利润</td>
                        <td><label id="zlirun"></label></td>
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
                        <input type="text" class="form-control" name="sousuo" id="sousuo" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-success" onclick="query();" type="button">检索</button>
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
        <div class="modal fade" id="updateappApk" tabindex="-1" role="dialog" aria-labelledby="updateDepartmentLabel" aria-hidden="">
            <div class="modal-dialog">
                <div class="modal-content">
                </div>
            </div>
        </div>
    </div>


</section>
