<%--
  Created by IntelliJ IDEA.
  User: hung0
  Date: 4/28/2025
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xem Chi Tiết</title>
</head>
<body>
<div class="container">
    <h1>Bán bất động sản, Đường ${buildingDetail.street}, ${buildingDetail.ward}, ${districts[buildingDetail.district]}, Thành phố Hồ Chí Minh</h1>

    <div class="main-content">
        <div class="image-section">
            <img src="${buildingDetail.image}" alt="Phòng ngủ" class="main-image">
        </div>

        <div class="info-section">
            <p><strong>Quận/Huyện:</strong> ${buildingDetail.ward}, ${districts[buildingDetail.district]}</p>
            <p><strong>Giá:</strong> <span style="color: red;">${buildingDetail.rentPrice} triệu/m²</span></p>
            <p><strong>Diện tích:</strong> ${buildingDetail.floorArea} m2</p>

            <h3>Giới thiệu ngắn</h3>
            <p>
                Tôi Cần bán căn hộ ${buildingDetail.floorArea}m² tại Him Lam Chợ Lớn, Quận 6
                - Diện tích: ${buildingDetail.rentPrice}m², thiết kế 2 phòng ngủ, 2 WC, 1 ban công rộng rãi, 1 sân phơi riêng.
                - Vị trí: Tầng trung, view trực diện hồ bơi và công viên nội khu, cực kỳ thoáng mát.
                - Nhà trống, sẵn sàng giao ngay.
                - Trang bị: Thiết bị bếp và thiết bị vệ sinh cao cấp.
                - Giá: ${buildingDetail.rentPrice} triệu/m².
                - Pháp lý: Sổ hồng chính chủ, sang tên nhanh gọn
                - Phí đậu xe máy: ${buildingDetail.motoFee}
                -Chủ nhà thiện chí bán, hỗ trợ khách nhiệt tình.
            </p>

            <button class="contact-button">
                📞 ${buildingDetail.managerPhone}
            </button>
        </div>
    </div>

    <div class="thumbnail-gallery">
        <img src="https://tse3.mm.bing.net/th?id=OIP.pgYo9oMuHzqxZPogRhV2fwHaEo&pid=Api&P=0&h=180" alt="Hình nhỏ 1" class="thumbnail">
        <img src="https://tse1.mm.bing.net/th?id=OIP.YmFt7QNnGRz_ZrbvJKDp0gHaGL&pid=Api&P=0&h=180" alt="Hình nhỏ 2" class="thumbnail">
        <img src="https://tse2.mm.bing.net/th?id=OIP.szRSPd2v_hFb5XAmYnX-AwHaFj&pid=Api&P=0&h=180" alt="Hình nhỏ 3" class="thumbnail">
        <img src="https://tse2.mm.bing.net/th?id=OIP.0FmTjfo7iL_-Hxg_AV9urQHaEY&pid=Api&P=0&h=180" alt="Hình nhỏ 4" class="thumbnail">
    </div>

    <div class="overview-section">
        <h2>Tổng quan</h2>
        <p>Bán bất động sản, Đường ${buildingDetail.street}, Phường ${buildingDetail.ward}, ${districts[buildingDetail.district]}, Thành phố Hồ Chí Minh</p>

        <h2>Chi tiết</h2>
        <div class="details-table">
            <div class="column">
                <p><strong>Diện tích:</strong> ${buildingDetail.floorArea} m²</p>
                <p><strong>Pháp lý:</strong> Sổ đỏ</p>
                <p><strong>Số tầng hầm:</strong> ${buildingDetail.numberOfBasement}</p>
                <p><strong>Hướng:</strong> ${buildingDetail.direction}</p>
                <p><strong>Hẻm:</strong> -</p>
            </div>
            <div class="column">
                <p><strong>Rộng x Dài:</strong> 11.4 x 17.5m</p>
                <p><strong>Số tầng:</strong> -</p>
                <p><strong>Số toilet:</strong> </p>
                <p><strong>Mức giá:</strong>${buildingDetail.rentPrice} triệu/m²</p>
                <p><strong>Giá đất:</strong> -</p>
            </div>
        </div>
    </div>
    <div class="contact">
        <h2>Liên hệ</h2>
        <div class="contact_table">
            <div class="contact_Information">
                <p>Tên Liên lạc:</p>
                <p>Địa chỉ:</p>
                <p>Điện thoại:</p>
                <p>Email:</p>
            </div>
            <div class="contact_Information">
                <p>${buildingDetail.managerName}</p>
                <p>${buildingDetail.street}, ${buildingDetail.ward}, ${districts[buildingDetail.district]}, Thành phố Hồ Chí Minh</p>
                <p>${buildingDetail.managerPhone}</p>
                <p>${buildingDetail.deposit}</p>
            </div>
        </div>
        <button class="contact_button">
            📞 ${buildingDetail.managerPhone}
        </button>
    </div>
    <div class="listings-section">
        <h2>BÁN NHÀ MẶT PHỐ QUẬN 3</h2>

        <div class="listing">
            <img src="https://tse2.mm.bing.net/th?id=OIP.BENtDtrJF7Fg8dB3YoWf4QHaEo&pid=Api&P=0&h=180" alt="Nhà 1" class="listing-image">
            <div class="listing-info">
                <h3><span style="color: gold;">★</span> Bán nhà MT đường Hồng Bàng.Q11 (4,4m x 25m) chỉ 19.5 tỷ</h3>
                <p><strong>💰 19,50 tỷ</strong> | <strong>📏 Diện tích:</strong> 105 m²</p>
                <p><strong>📍 Địa chỉ:</strong> Đường Bắc Hải, Phường 1, Quận 3, TP.Hồ Chí Minh</p>
                <p>Bán nhà mặt tiền đường Hồng Bàng Q11 đoạn đẹp nhất cung đường. Diện tích 4,4m x 25m nở hậu không lỗi
                    gì. dtcn 105m²</p>
            </div>
        </div>

        <div class="listing">
            <img src="https://tse4.mm.bing.net/th?id=OIP.mL2f1GZysyoWzjYSVes0uwHaEk&pid=Api&P=0&h=180" alt="Nhà 2" class="listing-image">
            <div class="listing-info">
                <h3>Bán nhà mặt tiền đường Phạm Thế Hiển, P6, Q8 (DTCN 300m2) chỉ 21 tỷ</h3>
                <p><strong>💰 21 tỷ</strong> | <strong>📏 Diện tích:</strong> 300 m²</p>
                <p><strong>📍 Địa chỉ:</strong> Đường Bà Lê Chân, Phường 1, Quận 3, TP.Hồ Chí Minh</p>
                <p>Mặt tiền đường nhựa 8m, diện tích công nhận 300m², gần cầu Nhị Thiên Đường, thuận tiện đi các quận
                    trung tâm.</p>
            </div>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="container-fluid">
        <div class="top-footer text-center mt-0">
            <div class="logo logo-footer pt-5">
                <a href="./ViewHome.html"><img
                        src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo_footer.png?1676257083798"
                        alt="logo-footer"></a>
                <p class="desc-logo-footer mt-3">Với hơn 10 năm kinh nghiệm, SkyLand tự hào là sàn
                    mua
                    bán, giao dịch và quảng cáo
                    bất động sản hàng đầu tại Việt Nam</p>
                <div class="item-footer mt-5">
                    <div class="row">
                        <div class="col-12 col-md-4 text-center">
                            <div class="icon-footer">
                                <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_maps.png?1676257083798"
                                     alt="">
                            </div>
                            <div class="content-center-footer">
                                <p class="mb-1 mt-3">Trụ sở chính</p>
                                <p class="desc-footer">Số 46 Man Thiện, TP Thủ Đức, TP HCM</p>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 text-center">
                            <div class="icon-footer">
                                <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_phone.png?1676257083798"
                                     alt="">
                            </div>
                            <div class="content-center-footer">
                                <p class="mb-1 mt-3">Hotline</p>
                                <p class="desc-footer"><a class="a-text" href="#">098828</a></p>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 text-center">
                            <div class="icon-footer">
                                <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_email.png?1676257083798"
                                     alt="">
                            </div>
                            <div class="content-center-footer">
                                <p class="mb-1 mt-3">Email</p>
                                <p class="desc-footer"><a class="a-text" href="#">vsh@gmail.com</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <div class="border-bottom mb-5 mt-4"></div>
            </div>
        </div>
    </div>
    <div class="bottom-footer-2">
        <div class="text-center desc-bottom-footer-2">@ Bản quyền thuộc về Happy Team |
            Cung cấp bởi <a class="a-text group-name" href="#">HappyTeam</a></div>
    </div>
</footer>
<style>
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f7f7f7;
    }

    .container {
    width: 90%;
    max-width: 1200px;
    margin: 30px auto;
    background: #fff;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    border-radius: 8px;
    }

    .breadcrumb {
    font-size: 14px;
    margin-bottom: 15px;
    }

    .breadcrumb a {
    color: #3498db;
    text-decoration: none;
    }

    .breadcrumb a:hover {
    text-decoration: underline;
    }

    h1 {
    font-size: 26px;
    margin-bottom: 20px;
    color: #2c3e50;
    }

    .main-content {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    }

    .image-section {
    flex: 1 1 50%;
    }

    .main-image {
    width: 100%;
    border-radius: 8px;
    }

    .info-section {
    flex: 1 1 40%;
    display: flex;
    flex-direction: column;
    gap: 10px;
    }

    .info-section p {
    margin: 5px 0;
    font-size: 16px;
    }

    .info-section h3 {
    margin-top: 15px;
    color: #2980b9;
    }

    .contact-button {
    margin-top: 20px;
    background-color: #e74c3c;
    color: #fff;
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    }

    .contact-button:hover {
    background-color: #c0392b;
    }

    .thumbnail-gallery {
    margin-top: 30px;
    display: flex;
    gap: 15px;
    justify-content: flex-start;
    }

    .thumbnail {
    width: 120px;
    height: 80px;
    object-fit: cover;
    border-radius: 6px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    cursor: pointer;
    transition: transform 0.3s ease;
    }

    .thumbnail:hover {
    transform: scale(1.05);
    }
    .overview-section {
    margin-top: 40px;
    }

    .overview-section h2 {
    color: #2c3e50;
    margin-bottom: 10px;
    }

    .overview-section p {
    font-size: 16px;
    margin-bottom: 20px;
    }
    .details-table {
    display: flex;
    gap: 50px;
    margin-top: 20px;
    }
    .details-table .column {
    flex: 1;
    }
    .details-table p {
    margin: 8px 0;
    font-size: 16px;
    border-bottom: 1px solid #eee;
    padding-bottom: 8px;
    }
    .contact{
    border: 1px solid #ddd;
    margin-top: 40px;
    }
    .contact h2{
    padding: 10px;
    margin: 0;
    background-color: #297fb966;
    color: #078ae1cd;

    }
    .contact_table{
    display: flex;
    gap: 50px;
    padding: 20px;
    font-size: 16px;

    }
    .contact_button{
    margin: 10px;
    background-color: #0099ff66;
    color: #fff;
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    }
    .contact_button:hover{
    background-color:#0099ff;
    }
    .listings-section {
    margin-top: 40px;
    }

    .listings-section h2 {
    background-color: #297fb9;
    color: #fff;
    padding: 10px;
    margin-bottom: 20px;
    font-size: 22px;
    }

    .listing {
    display: flex;
    border: 1px solid #ddd;
    margin-bottom: 20px;
    padding: 15px;
    border-radius: 8px;
    background-color: #fff;
    }

    .listing-image {
    width: 200px;
    height: 150px;
    object-fit: cover;
    border-radius: 6px;
    margin-right: 20px;
    }

    .listing-info {
    flex: 1;
    }

    .listing-info h3 {
    margin: 0 0 10px;
    font-size: 18px;
    color: #2c3e50;
    }

    .listing-info p {
    margin: 5px 0;
    font-size: 15px;
    }

</style>
</body>
</html>
