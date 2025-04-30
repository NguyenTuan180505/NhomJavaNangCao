<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hung0
  Date: 4/26/2025
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
    <title>Thêm Khách Hàng</title>
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

            <div class="page-header">
                <h1>
                    Thông Tin Khách Hàng
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">
                </div>
                <!-- Bảng danh sách -->
            </div>
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <form:form modelAttribute="customerEdit" id="listForm" method="POST">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="col-xs-3">Tên Khách Hàng</label>
                            <div class="col-xs-9">
                                <form:input path="name" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Số Điện Thoại</label>
                            <div class="col-xs-9">
                                <form:input path="customerPhone" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Email</label>
                            <div class="col-xs-9">
                                <form:input path="email" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Tên Công Ty</label>
                            <div class="col-xs-9">
                                <form:input path="companyName" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Nhu Cầu</label>
                            <div class="col-xs-9">
                                <form:input path="demand" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Tình Trạng</label>
                            <div class="col-xs-9">
                                <form:input path="status" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group" style="margin-top: 20px;">
                            <label class="col-xs-3"></label>
                            <div class="col-xs-9">
                                <c:if test="${not empty customerEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Cập nhật
                                        khách hàng
                                    </button>
                                    <button type="button" class="btn btn-primary">Hủy thao tác</button>
                                </c:if>
                                <c:if test="${empty customerEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm khách
                                        hàng
                                    </button>
                                    <button type="button" class="btn btn-primary">Hủy thao tác</button>
                                </c:if>
                            </div>
                        </div>
                        <form:hidden path="id" id="customerId"/>

                    </div>
                </form:form>
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <c:if test="${not empty customerEdit.id}">
        <div class="page-header">
            <h1>
                Giao Dịch Của Nhân Viên Với Khách Hàng
            </h1>
        </div>
        <div class="col-xs-9">
            <button type="button" class="btn btn-primary" id="a" style="border: 0px; padding: 12px;"
                    onclick="AddTransaction(${customerEdit.id})">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-send-fill"
                     viewBox="0 0 16 16">
                    <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471z"/>
                </svg>
                Add
            </button>
        </div>
        <table id="b" style="margin: 3em 0;" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <label class="pos-rel">
                    <input type="checkbox" class="ace">
                </label>
                </th>
                <th>Ngày Tạo</th>
                <th>Người Tạo</th>
                <th>Loại Giao Dịch</th>
                <th>Chi Tiết Giao Dịch</th>
                <th>Thao Tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${transactionList}">
                <tr>
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
                    <td>${transactionType[item.code]}</td>
                    <td>${item.note}</td>
                    <td>
                        <button class="btn btn-xs btn-danger" onclick="UpdateTransaction(${item.id})">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<div class="modal fade" id="transactionModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Nhập Giao Dịch</h4>
            </div>
            <div class="modal-body">
                <form id="transactionForm">
                    <!-- Loại Giao Dịch -->
                    <div class="form-group">
                        <label><strong>Loại Giao Dịch:</strong></label>
                        <div class="form-check" style="margin-left: 7px;">
                            <input class="form-check-input" type="radio" name="transactionType" id="careCustomer"
                                   value="CSKH">
                            <label class="form-check-label" for="careCustomer">Chăm Sóc Khách Hàng</label>
                        </div>
                        <div class="form-check" style="margin-left: 7px;">
                            <input class="form-check-input" type="radio" name="transactionType" id="showCustomer"
                                   value="DDX">
                            <label class="form-check-label" for="showCustomer">Dẫn Đi Xem</label>
                        </div>
                        <div class="form-check" style="margin-left: 7px;">
                            <input class="form-check-input" type="radio" name="transactionType" id="signContract"
                                   value="KHD">
                            <label class="form-check-label" for="signContract">Dẫn Đi Ký Hợp Đồng</label>
                        </div>
                    </div>

                    <!-- Mô Tả Giao Dịch -->
                    <div class="form-group" style="margin-top: 15px;">
                        <label for="transactionNote" style="display: block; margin-bottom: 5px;"><strong>Mô Tả Giao
                            Dịch:</strong></label>
                        <br>
                        <input type="text" class="form-control" id="transactionNote"
                               placeholder="Nhập mô tả giao dịch..." style="display: block; width: 100%;">
                    </div>

                    <input type="hidden" id="customerId" value="">
                    <input type="hidden" id="id" value="">
                </form>
            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAddOrUpdaterTransaction">Nhập Giao Dịch</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script>
    $('#btnAddOrUpdateCustomer').click(function (e) {
        e.preventDefault();
        var data = {}
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        })
        if (data != null) {
            addOrUpdateCustomer(data);
        } else {
            window.location.href = "<c:url value='/admin/customer-list?data=require'/>";
        }
    })

    function addOrUpdateCustomer(data) {
        $.ajax({
            type: "POST",
            url: "${customerAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                window.location.href = '<c:url value="/admin/customer-list?message=success" />';
            },
            error: function (response) {
                window.location.href = '<c:url value="admin/customer-list?message=error"/>';
            }
        })
    }

    function AddTransaction(CustomerId) {
        $('#transactionModal').modal();
        $('#customerId').val(CustomerId);
    }

    function UpdateTransaction(id) {
        $('#transactionModal').modal();
        $('#id').val(id);
    }

    $('#btnAddOrUpdaterTransaction').click(function (e) {
        e.preventDefault();

        var data = {};

        data['customerId'] = $('#customerId').val();
        data['id'] = $('#id').val();
        var code = $('input[name="transactionType"]:checked').val();
        var note = $('#transactionNote').val();

        if (!code) {
            alert('Vui lòng chọn một loại giao dịch!');
            return;
        }
        if (!note || note.trim() === '') {
            alert('Vui lòng nhập mô tả giao dịch!');
            return;
        }

        data['code'] = code;
        data['note'] = note;
        addOrUpdateTransaction(data);

        console.log("Data gửi đi: ", data);
    });

    function addOrUpdateTransaction(data) {
        $.ajax({
            url: '${customerAPI}/' + 'transaction',
            type: "POST",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                console.info("Success");
            },
            error: function (response) {
                console.info("Nhập Không Thành Công!");
                window.location.href = "<c:url value='/admin/customer-list?message=error'/>";
                console.log(response);
            }
        });
    }


</script>
</body>
</html>
