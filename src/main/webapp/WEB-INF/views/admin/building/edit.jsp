<%--
  Created by IntelliJ IDEA.
  User: hung0
  Date: 2/16/2025
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thêm tòa nhà</title>
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
                    Thông Tin Tòa Nhà
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

                <form:form modelAttribute="buildingEdit" id="listForm" method="POST" enctype="multipart/form-data">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="col-xs-3">Tên tòa nhà</label>
                            <div class="col-xs-9">
                                <form:input path="name" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Quận</label>
                            <div class="col-xs-9">
                                <form:select path="district" class="form-control">
                                    <form:option value="">--Chọn Quận--</form:option>
                                    <form:options items="${districts}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Phường</label>
                            <div class="col-xs-9">
                                <form:input path="ward" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Đường</label>
                            <div class="col-xs-9">
                                <form:input path="street" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Kết cấu</label>
                            <div class="col-xs-9">
                                <form:input path="structure" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Số tầng hầm</label>
                            <div class="col-xs-9">
                                <form:input path="numberOfBasement" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Diện tích sàn</label>
                            <div class="col-xs-9">
                                <form:input path="floorArea" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Hướng</label>
                            <div class="col-xs-9">
                                <form:input path="direction" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Hạng</label>
                            <div class="col-xs-9">
                                <form:input path="level" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Diện tích thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentArea" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Giá thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentPrice" type="number" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Mô tả giá</label>
                            <div class="col-xs-9">
                                <form:input path="rentPriceDescription" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Phí dịch vụ</label>
                            <div class="col-xs-9">
                                <form:input path="serviceFee" type="number" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Phí ô tô</label>
                            <div class="col-xs-9">
                                <form:input path="carFee" type="number" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Phí mô tô</label>
                            <div class="col-xs-9">
                                <form:input path="motoFee" type="number" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                                <form:input path="overtimeFee" type="number" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Tiền điện</label>
                            <div class="col-xs-9">
                                <form:input path="electricityFee" type="number" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Đặt cọc</label>
                            <div class="col-xs-9">
                                <form:input path="deposit" type="number" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Thanh toán</label>
                            <div class="col-xs-9">
                                <form:input path="payment" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Thời hạn thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentTime" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Thời gian trang trí</label>
                            <div class="col-xs-9">
                                <form:input path="decorationTime" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Tên quản lý</label>
                            <div class="col-xs-9">
                                <form:input path="managerName" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">SĐT quản lý</label>
                            <div class="col-xs-9">
                                <form:input path="managerPhone" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Phí môi giới</label>
                            <div class="col-xs-9">
                                <form:input path="brokerageFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Loại tòa nhà</label>
                            <div class="col-xs-9">
                                <form:checkboxes items="${typeCodes}" path="typeCode"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Ghi chú</label>
                            <div class="col-xs-9">
                                <form:input path="note" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Ảnh Tòa Nhà</label>
                            <div class="col-xs-3">
                                <input type="file" id="imageInput" name="image" class="form-control"/>
                            </div>
                            <c:if test="${not empty buildingEdit.image}">
                            <div class="col-xs-3">
                                <!-- Hiển thị ảnh nếu có -->
<%--                                <c:if test="${not empty buildingEdit.image}">--%>
                                    <img src="${buildingEdit.image}" alt="Building Image"
                                         style="max-width: 200px; max-height: 200px;"/>
<%--                                </c:if>--%>
                            </div>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3"></label>
                            <div class="col-xs-9">
                                <c:if test="${not empty buildingEdit.id}">
                                    <button type="submit" class="btn btn-primary" id="btnAddBuilding">Cập nhật tòa nhà
                                    </button>
                                    <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                </c:if>
                                <c:if test="${empty buildingEdit.id}">
                                    <button type="submit" class="btn btn-primary" id="btnAddBuilding">Thêm tòa nhà
                                    </button>
                                    <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                </c:if>
                            </div>
                        </div>
                        <form:hidden path="id" id="buildingId"/>
                    </div>
                </form:form>


                <!-- /.page-content -->
            </div>
        </div><!-- /.main-content -->
        <script>
            $('#btnAddBuilding').click(function (e) {
                e.preventDefault();
                var data = {};
                var typeCode = [];
                var formData = $('#listForm').serializeArray();

                $.each(formData, function (i, v) {
                    if (v.name != 'typeCode') {
                        data["" + v.name + ""] = v.value; // Thêm các giá trị khác vào data
                    } else {
                        typeCode.push(v.value); // Lưu trữ giá trị typeCode
                    }
                });
                data['typeCode'] = typeCode;
                if (typeCode.length > 0) {
                    // addOrUpdateBuilding(data)
                    var fileInput = $('#imageInput')[0].files[0];  // Lấy file ảnh từ input
                    if (fileInput) {
                        var reader = new FileReader();
                        reader.onloadend = function () {
                            var base64String = reader.result.split(',')[1];  // Lấy base64 string từ data URL
                            data['imageBase64'] = base64String;  // Thêm ảnh Base64 vào data
                            data['imageName'] = fileInput.name;  // Đặt tên file

                            // Gọi hàm AJAX để gửi dữ liệu lên server
                            addOrUpdateBuilding(data);
                        };
                        reader.readAsDataURL(fileInput);  // Đọc file dưới dạng base64
                    } else {
                        // Nếu không có ảnh, gửi dữ liệu không có ảnh
                        addOrUpdateBuilding(data);
                    }
                } else {
                    window.location.href = "<c:url value='/admin/building-edit?typeCode=require'/>";
                }
            });


            function addOrUpdateBuilding(data) {
                $.ajax({
                    type: "POST",
                    url: "/api/building",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (response) {
                        console.log('Upload thành công');
                        window.location.href = '<c:url value="/admin/building-list?message=success"/>';
                    },
                    error: function (response) {
                        console.log('failed');
                        window.location.href = '<c:url value="/admin/building-edit?message=error"/>';
                    }
                });
            }


            $('#btnCancel').click(function () {
                window.location.href = "/admin/building-list"
            })
        </script>
</body>
</html>
