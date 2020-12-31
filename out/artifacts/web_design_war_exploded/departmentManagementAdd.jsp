<%--
  Created by IntelliJ IDEA.
  User: kyle
  Date: 20/12/30
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增部门</title>

    <link href="resources/plugins/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="resources/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet" />
    <link href="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.css" rel="stylesheet" />
    <link href="resources/plugins/waves-0.7.5/waves.min.css" rel="stylesheet" />
    <link href="resources/plugins/jquery-confirm/jquery-confirm.min.css" rel="stylesheet" />
    <link href="resources/plugins/select2/css/select2.min.css" rel="stylesheet" />
    <script src="resources/plugins/select2/js/select2.min.js"></script>
    <link href="resources/css/common.css" rel="stylesheet" />
</head>
<body>
<div style="padding: 30px 20%;">
    <p>
    <h4>输入部门基本信息</h4>
    <br>
<%--    <h4>--%>
<%--        <%--%>
<%--            String str1=request.getParameter("dnum");--%>

<%--        %>--%>
<%--        123:<%=str1%>--%>
<%--    </h4>--%>
    <%
        String dname=request.getParameter("dname");
        String dnum=request.getParameter("dnum");
        String type=request.getParameter("type");
        String phone=request.getParameter("phone");
        String fax=request.getParameter("fax");
        String des=request.getParameter("des");
        String parent=request.getParameter("parent");
        String establishDate=request.getParameter("establishDate");
    %>


    </p>
    <div id="createDialog" class="crudDialog">
        <form id="newForm" action="${pageContext.request.contextPath }/DepartmentAdd" method="post">
<%--    <form >--%>
            <div class="form-group">
                <label for="dnum" class="active">编号（必填）</label>
                <input id="dnum" name="dnum" type="text" value=<%=dnum%> class="form-control">
            </div>
            <div class="form-group">
                <label for="dname" class="active">名称（必填）</label>
                <input id="dname"  name="dname" type="text" value=<%=dname%> class="form-control">
            </div>
<%--            <div class="form-group">--%>
<%--                <label for="type">类型（必填）</label>--%>
<%--                <input id="type" name="type" type="text" class="form-control">--%>
<%--            </div>--%>
            <div class="form-group">
                <label for="phone" class="active">电话（必填）</label>
                <input id="phone" name="phone" type="text"value=<%=phone%> class="form-control">
            </div>

            <div class="form-group">
                <label for="fax" class="active">传真</label>
                <input id="fax" type="text" name="fax" value=<%=fax%> class="form-control">
            </div>

            <div class="form-group">
                <label for="des" class="active">描述</label>
                <input id="des" name="des" type="text" value=<%=des%> class="form-control">
            </div>

            <div class="form-group">
                <label for="parent" class="active">上级部门</label>
                <input id="parent" name="parent" type="text" value=<%=parent%> class="form-control">
            </div>
            <div class="form-group">
                <label for="establishDate" class="active">成立时间（必填）</label>
                <input id="establishDate" name="establishDate" type="date" value=<%=establishDate%> class="form-control">
            </div>

            <div class="form-group">
                <select class="form-control" name="type" ng-value=<%=type%> id="type">
                    <option disabled>(请选择类型)</option>
                    <option>公司</option>
                    <option>部门</option>
                </select>
            </div>
<%--            <input type="submit">--%>

            <a class="waves-effect waves-button" href="javascript:;" onclick="Sure()"><i class="zmdi zmdi-seat"></i> 提交</a>


        </form>
    </div>

</div>

<script src="resources/plugins/jquery.1.12.4.min.js"></script>
<script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<script src="resources/plugins/select2/js/select2.min.js"></script>



<script src="resources/js/common.js"></script>



<script>


    function Sure() {
        if(checkEmpty1()==0){
            return 0;
        }
        else{
            console.log(document.getElementById("newForm"))
            document.getElementById("newForm").submit();
     
        }
    }

    function checkEmpty1() {
        var dnum = $('#dnum').val();
        var dname = $('#dname').val();
        var type = $('#type').val();
        var phone = $('#phone').val();
        var des = $('#des').val();
        var parent = $('#parent').val();
        var establishDate = $('#establishDate').val();
        var fax = $('#fax').val();
        //consloe.log(dnum,dname,type,phone,des,parent,)
        if (dnum == null || dnum == ""|| dname == null || dname == ""|| type == null || type == ""|| phone == null || phone == ""|| establishDate == null || establishDate == "") {
            alert("有必填项还未填写！");
            return 0;
        }
        else{
            return 1;
        }
    }

</script>
<script src="resources/plugins/jquery.1.12.4.min.js"></script>
<script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<script src="resources/plugins/select2/js/select2.min.js"></script>



<script src="resources/js/common.js"></script>

</body>
</html>

