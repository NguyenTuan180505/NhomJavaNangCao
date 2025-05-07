<%--
  Created by IntelliJ IDEA.
  User: hung0
  Date: 4/24/2025
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
    <title>Quản lý khách hàng</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box ui-sortable-handle">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm Kiếm</h5>

                            <div class="widget-toolbar">
                                <div class="widget-menu">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main">
                                    <form:form action="/admin/customer-list" method="GET" id="formList"
                                               modelAttribute="modelSearchRequest">
                                    <div class="row">
                                        <div class="form-group">
                                            <!-- Form fields in row -->
                                            <div class="col-xs-4">
                                                <label for="" class="name">Tên Khách Hàng</label>
                                                <form:input class="form-control" path="name"/>
                                            </div>
                                            <div class="col-xs-4">
                                                <label for="" class="name">Di Động</label>
                                                <form:input class="form-control" path="phone"/>
                                            </div>
                                            <div class="col-xs-4">
                                                <label for="email" class="name">Email</label>
                                                <form:input class="form-control" path="email"/>
                                            </div>
                                        </div>

                                        <!-- Dropdown and Button -->
                                        <security:authorize access="hasRole('MANAGER')">
                                            <div class="col-xs-4">
                                                <label for="" class="name">Chọn Nhân viên</label>
                                                <form:select class="form-control" path="staffId">
                                                    <form:option
                                                            value="">--Chọn nhân viên--</form:option>
                                                    <form:options items="${listStaffs}"/>
                                                </form:select>
                                            </div>
                                        </security:authorize>

                                        <!-- Search Button -->
                                        <div class="col-xs-12" style="margin: 10px 0;">
                                            <button class="btn btn-info" id="customerSearchModel'">Tìm Kiếm</button>
                                        </div>
                                    </div>
                                </div>
                                </form:form>
                            </div>

                        </div>
                    </div>

                    <!-- Add/Delete Buttons -->
                    <div class="pull-right">
                        <security:authorize access="hasRole('MANAGER')">
                            <a href="/admin/customer-edit">
                                <button class="btn btn-info" title="Thêm khách hàng">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                        <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                    </svg>
                                </button>
                            </a>
                            <button class="btn btn-danger" title="Xóa khách hàng" id="btnDeleteCustomer">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-person-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                                    <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                                </svg>
                            </button>
                        </security:authorize>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <table id="tableList" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center">
                        <label class="pos-rel">
                            <input type="checkbox" class="ace">
                            <span class="lbl"></span>
                        </label>
                    </th>
                    <th>Tên Khách Hàng</th>
                    <th>Di Động</th>
                    <th>Email</th>
                    <th>Nhu Cầu</th>
                    <th>Người Thêm</th>
                    <th>Ngày Thêm</th>
                    <th>Tình trạng</th>
                    <th>Thao Tác</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="item" items="${CustomerList}">
                    <tr>
                        <td class="center">
                            <label class="pos-rel">
                                <input type="checkbox" class="ace" value="${item.id}">
                                <span class="lbl"></span>
                            </label>
                        </td>
                        <td>${item.name}</td>
                        <td>${item.customerPhone}</td>
                        <td>${item.email}</td>
                        <td>${item.demand}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty item.modifiedBy}">
                                    ${item.modifiedBy}
                                </c:when>
                                <c:otherwise>
                                    ${item.createdBy}
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${not empty item.modifiedDate}">
                                    ${item.modifiedDate}
                                </c:when>
                                <c:otherwise>
                                    ${item.createdDate}
                                </c:otherwise>
                            </c:choose>
                        </td>


                        <td>${item.status}</td>
                        <td>
                            <div class="hidden-sm hidden-xs btn-group">
                                <security:authorize access="hasRole('MANAGER')">
                                    <button class="btn btn-xs btn-success" title="Giao tòa nhà"
                                            onclick="assingmentCustomer(${item.id})">
                                        <i class="ace-icon fa fa-check bigger-120"></i>
                                    </button>
                                </security:authorize>
                                <a class="btn btn-xs btn-info" title="Sửa tòa nhà"
                                   href="/admin/customer-edit-${item.id}">
                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                </a>
                                <security:authorize access="hasRole('MANAGER')">
                                    <button class="btn btn-xs btn-danger"
                                            onclick="deleteCustomer(${item.id})">
                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                    </button>
                                </security:authorize>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <!-- Các hàng khác -->
                </tbody>
            </table>
        </div>

        <!-- /.page-content -->
    </div>
</div>
<div class="modal fade" id="assingmentCustomerModal" role="dialog"
     style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh Sách Nhân Viên</h4>
            </div>
            <div class="modal-body">
                <table id="staffList" style="margin: 3em 0;" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>Chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>
                    </tbody>
                    <input type="hidden" id="customerId" value="">
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssingmentCustomer">Giao khách Hàng</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<!-- basic scripts -->

<!--[if !IE]> -->
<script src="assets/js/jquery.2.1.1.min.js"></script>

<!-- <![endif]-->
<script>
    function assingmentCustomer(CustomerId) {
        $('#assingmentCustomerModal').modal();
        loadStaff(CustomerId);
        $('#customerId').val(CustomerId)
    }

    $('#btnAssingmentCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assignment(data);
        }
        console.log("OK");
    });
    $('#customerSearchModel').click(function (e) {
        e.preventDefault();
        $('#formList').submit();
    })

    function loadStaff(customerId) {
        $.ajax({
            type: "GET",
            url: `${customerAPI}/` + customerId + '/staffs',
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class="text-center">';
                    row += '<input type="checkbox" value="' + item.staffId + '" id="checkbox_' + item.staffId + '"';
                    row += ' class="check-box-element" ' + (item.checked === "checked" ? 'checked' : '') + '>';
                    row += '</td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("Success");
            },
            error: function (response) {
                console.log("failed");
                console.log(response);
            }
        });
    }

    function assignment(data) {
        $.ajax({
            url: `${customerAPI}/` + 'assignment',
            type: "POST",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                console.info("Success");
            },
            error: function (response) {
                console.info("Giao Không Thành Công!");
                window.location.href = "<c:url value='/admin/customer-list?message=error'/>";
                console.log(response);
            }
        });
    }

    function deleteCustomer(id) {
        var customerId = [id];
        deleteCustomers(customerId);
    }

    $('#btnDeleteCustomer').click(function (e) {
        e.preventDefault()
        var customerId = $('#tableList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteCustomers(customerId);
    });

    function deleteCustomers(data) {
        $.ajax({
            type: "DELETE",
            url: '${customerAPI}/' + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                console.log("Success");
                location.reload();
            },
            error: function (respond) {
                console.log("failed");
                location.reload();
            }
        });
    }
</script>

<%--</div><!-- /.main-content -->--%>
</body>
</html>
