<%--
  Created by IntelliJ IDEA.
  User: hung0
  Date: 2/16/2025
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Danh Sách Tòa Nhà</title>
</head>
<body>

<div class="main-content">
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
                                        <%--@elvariable id="" type=""--%>
                                        <form:form action="/admin/building-list" method="GET" id="formList"
                                                   modelAttribute="modelSearchRequest">
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-6">
                                                            <label for="" class="name">Tên tòa nhà</label>
                                                            <form:input class="form-control" path="name"/>

                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label for="" class="name">Diện tích sàn</label>
                                                            <form:input class="form-control" path="floorArea"/>
                                                        </div>
                                                        <div class="col-xs-2">
                                                            <label for="" class="name">Quận</label>
                                                            <form:select class="form-control" path="district">
                                                                <form:option value="">--Chọn Quận--</form:option>
                                                                <form:options items="${districts}"/>
                                                            </form:select>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="" class="name">Phường</label>
                                                            <form:input class="form-control" path="ward"/>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="" class="name">Đường</label>
                                                            <form:input class="form-control" path="street"/>
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="" class="name">Số tầng hầm</label>
                                                            <form:input class="form-control" path="numberOfBasement"/>
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="" class="name">Hướng</label>
                                                            <form:input class="form-control" path="direction"/>
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="" class="name">Hạng</label>
                                                            <form:input class="form-control" path="level"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <label for="" class="name">Diện tích từ</label>
                                                            <form:input class="form-control" path="areaFrom"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <label for="" class="name">Diện tích đến</label>
                                                            <form:input class="form-control" path="areaTo"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <label for="" class="name">Giá thuê từ</label>
                                                            <form:input class="form-control" path="rentPriceFrom"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <label for="" class="name">Giá thuê đến</label>
                                                            <form:input class="form-control" path="rentPriceTo"/>
                                                        </div>

                                                        <div class="col-xs-5">
                                                            <label for="" class="name">Tên quản lý</label>
                                                            <form:input class="form-control" path="managerName"/>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="" class="name">Điện thoại quản lý</label>
                                                            <form:input class="form-control" path="managerPhone"/>
                                                        </div>
                                                        <security:authorize access="hasRole('MANAGER')">
                                                            <div class="col-xs-2">
                                                                <label for="" class="name">Nhân viên</label>
                                                                <form:select class="form-control" path="staffId">
                                                                    <form:option
                                                                            value="">--Chọn nhân viên--</form:option>
                                                                    <form:options items="${listStaffs}"/>
                                                                </form:select>
                                                            </div>
                                                        </security:authorize>

                                                        <div class="col-xs-12">
                                                            <div class="col-xs-6">
                                                                <form:checkboxes items="${typeCodes}" path="typeCode"/>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12">
                                                            <div class="col-xs-6">
                                                                <button class="btn btn-info" id="buildingSearchModel">
                                                                    Tìm Kiếm
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                            <div class="pull-right">
                                <security:authorize access="hasRole('MANAGER')">
                                    <a href="/admin/building-edit">
                                        <button class="btn btn-info" title="Thêm tòa nhà">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                                <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                            </svg>
                                        </button>
                                    </a>
                                    <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-building-dash" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </security:authorize>
                            </div>
                        </div>
                    </div>
                    <!-- Bảng danh sách -->
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <table id="tableList" style="margin: 3em 0;"
                               class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên Tòa Nhà</th>
                                <th>Địa Chỉ</th>
                                <th>Số Tầng Hầm</th>
                                <th>Tên Quản Lý</th>
                                <th>Số Điện Thoại Quản Lý</th>
                                <th>D.Tích Sàn</th>
                                <th>Giá Thuê</th>
                                <th>D.Tích Thuê</th>
                                <th>Phí Môi Giới</th>
                                <th>Thao Tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="item" items="${buildingList}">
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td>${item.name}</td>
                                    <td>${item.street}, ${item.ward}, ${districts[item.district]}</td>
                                    <td>${item.numberOfBasement}</td>
                                    <td>${item.managerName}</td>
                                    <td>${item.managerPhone}</td>
                                    <td>${item.floorArea}</td>
                                    <td>${item.rentPrice}</td>
                                    <td>
                                        <c:forEach var="area" items="${item.rentAreas}" varStatus="status">
                                            ${area}<c:if test="${!status.last}">, </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${item.brokerageFee}</td>

                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <security:authorize access="hasRole('MANAGER')">
                                                <button class="btn btn-xs btn-success" title="Giao tòa nhà"
                                                        onclick="assingmentBuilding(${item.id})">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>
                                            </security:authorize>
                                            <a class="btn btn-xs btn-info" title="Sửa tòa nhà"
                                               href="/admin/building-edit-${item.id}">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </a>
                                            <security:authorize access="hasRole('MANAGER')">
                                                <button class="btn btn-xs btn-danger"
                                                        onclick="deleteBuilding(${item.id})">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>
                                            </security:authorize>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
                <%--                <div class="row">--%>
                <%--                    <div class="col-xs-12">--%>
                <%--                        <nav aria-label="Page navigation example">--%>
                <%--                            <ul class="pagination d-flex pagination-container" style="display: flex;justify-content: flex-end;">--%>
                <%--                                <c:if test="${buildingPage.hasPrevious()}">--%>
                <%--                                    <li class="page-item">--%>
                <%--                                        <a class="page-link"--%>
                <%--                                           href="/admin/building-list?page=${buildingPage.number - 1}&size=${buildingPage.size}"--%>
                <%--                                           aria-label="Previous">--%>
                <%--                                            <span aria-hidden="true">&laquo;</span> <!-- Dấu "<" -->--%>
                <%--                                        </a>--%>
                <%--                                    </li>--%>
                <%--                                </c:if>--%>
                <%--                                <c:forEach var="i" begin="0" end="${buildingPage.totalPages - 1}">--%>
                <%--                                    <li class="page-item <c:if test="${i == buildingPage.number}">active</c:if>">--%>
                <%--                                        <a class="page-link"--%>
                <%--                                           href="/admin/building-list?page=${i}&size=${buildingPage.size}">--%>
                <%--                                                ${i + 1}--%>
                <%--                                        </a>--%>
                <%--                                    </li>--%>
                <%--                                </c:forEach>--%>
                <%--                                <c:if test="${buildingPage.hasNext()}">--%>
                <%--                                    <li class="page-item">--%>
                <%--                                        <a class="page-link"--%>
                <%--                                           href="/admin/building-list?page=${buildingPage.number + 1}&size=${buildingPage.size}"--%>
                <%--                                           aria-label="Next">--%>
                <%--                                            <span aria-hidden="true">&raquo;</span> <!-- Dấu ">" -->--%>
                <%--                                        </a>--%>
                <%--                                    </li>--%>
                <%--                                </c:if>--%>
                <%--                            </ul>--%>
                <%--                        </nav>--%>
                <%--                    </div>--%>
                <%--                </div>--%>


                <!-- /.page-content -->
            </div>
        </div>
    </div><!-- /.main-content -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<div class="modal fade" id="assingmentBuildingModal" role="dialog"
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
                    <input type="hidden" id="buildingId" name="buildingId" value="">
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssingmentBuilding">Giao Tòa Nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script>
    function assingmentBuilding(buildingId) {
        $('#assingmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
    }

    function loadStaff(buildingId) {
        $.ajax({
            type: "GET",
            url: `${buildingAPI}/` + buildingId + '/staffs',
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

    $('#btnAssingmentBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assignment(data);
        }
        console.log("OK");
    });
    $('#buildingSearchModel').click(function (e) {
        e.preventDefault();
        $('#formList').submit();
    })

    function assignment(data) {
        $.ajax({
            url: `${buildingAPI}/` + 'assignment',
            type: "POST",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                console.info("Success");
            },
            error: function (response) {
                console.info("Giao Không Thành Công!");
                window.location.href = "<c:url value='/admin/building-list?message=error'/>";
                console.log(response);
            }
        });
    }


    function deleteBuilding(id) {
        var buildingID = [id];
        deleteBuildings(buildingID);
    }

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();
        var buildingIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    });

    function deleteBuildings(data) {
        $.ajax({
            type: "Delete",
            url: `${buildingAPI}/` + data,
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
</body>
</html>
