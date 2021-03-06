<%--
  Created by IntelliJ IDEA.
  User: BZhao
  Date: 2017/6/11
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh-CN">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="<%=basePath%>/plugins/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=basePath%>/theme/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="<%=basePath%>/theme/css/ionicons.min.css">

<link rel="stylesheet" href="<%=basePath%>/plugins/bootstrap-select/css/bootstrap-select.css">

<link rel="stylesheet" href="<%=basePath%>/plugins/jquery-confirm/jquery-confirm.min.css">

<link rel="stylesheet" href="<%=basePath%>/plugins/fakeLoader/css/fakeLoader.css">

<!-- Theme style -->
<link rel="stylesheet" href="<%=basePath%>/theme/css/AdminLTE.min.css">

<link rel="stylesheet" href="<%=basePath%>/theme/css/_all-skins.min.css">

<link rel="stylesheet" href="<%=basePath%>/theme/css/customer.css">

<!-- jQuery 2.2.3 -->
<script src="<%=basePath%>/plugins/jQuery/jquery-2.2.3.min.js" type="text/javascript"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=basePath%>/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script src="<%=basePath%>/plugins/bootstrap-select/js/bootstrap-select.js" type="text/javascript"></script>

<script src="<%=basePath%>/plugins/jquery-confirm/jquery-confirm.min.js" type="text/javascript"></script>

<script src="<%=basePath%>/plugins/fakeLoader/js/fakeLoader.min.js" type="text/javascript"></script>

<script src="<%=basePath%>/plugins/jquery.common.js" type="text/javascript"></script>


<head>
    <title>团队专利</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <%--header begin--%>
    <%@include file="/common/header.html" %>
    <%--header end--%>

    <%--left menu begin--%>
    <%@include file="/common/menu.html" %>
    <%--left menu end--%>

    <%-- coustomer content begin--%>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="text-left">
                <ol class="breadcrumb">
                    <li><i class="glyphicon glyphicon-home"></i>成果与风采管理</li>
                    <li>团队专利</li>
                </ol>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="tool-bar">

                        <span title="查询" class="icon-margin" href="javascript:void(0);" id="search">
                            <a class="glyphicon glyphicon-search"></a>
                        </span>

                        <span title="添加" class="icon-margin" href="javascript:void(0)" id="add">
                            <a class="glyphicon glyphicon-plus-sign"></a>
                        </span>

                        <span title="修改" class="icon-margin" href="javascript:void(0);" id="edit">
                            <a class="glyphicon glyphicon-pencil"></a>
                        </span>

                        <span title="删除" class="icon-margin" href="javascript:void(0);" id="del">
                            <a class="glyphicon glyphicon-trash"></a>
                        </span>
                </div>
            </div>
            <div class="row">
                <div class="form-group query">
                    <label>专利类型：</label>
                    <select class="selectpicker" id="patentType" multiple>
                        <option value="0">发明专利</option>
                        <option value="1">实用新型</option>
                        <option value="2">软件著作权</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table class="table table-hover table-bordered table-condensed customer-font-size">
                                <thead>
                                <tr class="info">
                                    <th>#</th>
                                    <th>编号</th>
                                    <th>内容</th>
                                    <th>类别</th>
                                    <th>创建时间</th>
                                    <th>更新时间</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Add Modal -->
    <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addModal"></h4>
                </div>
                <div class="modal-body">
                    <form>
                        <input id="typeID" class="hidden">
                        <div class="form-group">
                            <label class="control-label">专利类型：</label>
                            <select class="selectpicker" id="patent_type">
                                <option value="0">发明专利</option>
                                <option value="1">实用新型</option>
                                <option value="2">软件著作权</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">内容</label>
                            <div id="patent_text"></div>
                        </div >
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="save_patent">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!--Del Modal -->
    <div class="modal fade" id="Del_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1">删除专利</h4>
                </div>
                <div class="modal-body">
                    确定删除该专利？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="del_patent">确定</button>
                </div>
            </div>
        </div>
    </div>
    <%--footer begin--%>
    <%@include file="/common/footer.html" %>
    <%--footer end--%>

</div>

<%--必须放在最底部--%>
<script src="<%=basePath%>/plugins/app.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/plugins/Editor/wangEditor.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/page/achievements/patent.js" type="text/javascript"></script>
</body>
</html>
