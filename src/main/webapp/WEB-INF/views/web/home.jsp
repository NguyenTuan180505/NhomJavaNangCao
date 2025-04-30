<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>

</head>

<body>
<div class="page-wrapper">
    <div class="">
        <div class="container-fluid">
            <div class="p-0">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div><img
                                    src="http://congchungkimcuc.vn/wp-content/uploads/2020/01/31531392.jpg"
                                    alt="" style="width: 1920px; height: 750px;">
                            </div>
                            <div class="carousel-caption d-none d-md-block">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="img-slideshow"><img
                                    src="https://pqland.vn/datafiles/images/banner%20h.jpg"
                                    alt="" style="width: 1920px; height: 750px;"></div>
                            <div class="carousel-caption d-none d-md-block>
                            </div>
                        </div>
                        <div class=" carousel-item
                            ">
                            <img src="http://congchungkimcuc.vn/wp-content/uploads/2020/01/31531392.jpg"
                                 alt="..." style="width: 1920px; height: 750px;">
                            <div class="carousel-caption d-none d-md-block">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- SEARCH -->
        <div class="search">
            <div class="container">
                <form:form action="/trang-chu" method="GET" id="formList" modelAttribute="modelSearchRequest">
                    <div class="row">
                        <div class="col-12 col-md-3">
                            <div class="search-item">
                                <p class="search-text">Chọn tỉnh/thành phố</p>
                                <select class="search-option" name="search-option" id="search-option">
                                    <option value>- Tỉnh/thành phố</option>
                                    <option value="">TP.Hồ Chí Minh</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="search-item">
                                <p class="search-text">Chọn quận/huyện</p>
                                <form:select class="form-control" path="district">
                                    <form:option value="">--Chọn Quận--</form:option>
                                    <form:options items="${districts}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="search-item">
                                <p class="search-text">Chọn giá mong muốn</p>
                                <form:input class="form-control" path="rentPriceTo"/>
                            </div>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="search-btn">
                                <button class="search-btn-text" id="buildingSearchModel">
                                    <i class="fa-solid fa-magnifying-glass search-btn-icon"></i>
                                    <span>Tìm kiếm nhanh</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>

        <!-- CONTENT 1  -->
        <div class="content">
            <div class="content-title">
                <div class="title-cover">
                    <span id="title1">Dự án BĐS nổi bật</span>
                    <span id="title2">Tổng hợp các BĐS tại Hà Nội, Đà Nẵng, TP Hồ Chí Minh,... và các tỉnh thành
                            phố khác hot hiện tại</span>
                </div>
            </div>
            <div class="content-product ">
                <div class="container">
                    <div class="content1 justify-content-center">
                        <div class="row">
                            <c:forEach var="item" items="${buildingList}">
                                <div class="col-12 col-md-4">
                                    <div class="product1 vip">
                                        <div>
                                            <img src="${item.image}" alt="Building Image" class="img-fluid"/>
                                        </div>

                                        <div class="product1-conntent">
                                            <div class="product1-conntent-header">
                                                <a href="">${item.name}</a>
                                            </div>
                                            <span class="product1-conntent-title">Dự án Sky Park Residence số 3 Tôn Thất
                                                Thuyết đang
                                                trong quá trình hoàn thiện để đáp ứng tiến độ bàn giao nhà trong năm
                                                2018.
                                                Khách
                                                hàng có thể thăm quan và giám sát trực tiếp chất lương công trình cũng
                                                như
                                                thưởng
                                                ngoạn tầm view tuyệt đẹp ra hai công viên lớn nhất quận Cầu Giấy.</span>
                                            <ul class="product1-conntent-list">
                                                <li class="product1-conntent-item">
                                                    <i class="fa-solid fa-location-dot"></i>
                                                    <span>${item.street}, ${item.ward}, ${districts[item.district]}</span>
                                                </li>
                                                <li class="product1-conntent-item">
                                                    <i class="fa-solid fa-building"></i>
                                                    <span>Loại BĐS: Chung cư</span>
                                                </li>
                                                <li class="product1-conntent-item">
                                                    <i class="fa-solid fa-earth-asia"></i>
                                                    <span>Diện tích: ${item.floorArea} m<sup>2</sup> </span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product1-footer">
                                            <span class="product1-footer-cost">${item.rentPrice} triệu/m<sup>2</sup></span>
                                            <a href="/xem-chi-tiet-${item.id}"
                                                   style="color:#fff">
                                                    <button class="product1-footer-detail">Xem chi
                                                        tiết
                                                    </button>
                                                </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- CONTENT 2  -->
        <section class="section-why mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-12">
                        <div class="title_module_main a-center text-center">
                            <h2 style="margin-bottom: 15px;"><span>Vì sao bạn chọn bất động sản
                                        369 ?</span>
                            </h2>
                            <p style="margin-bottom: 30px;">Chúng tôi cung cấp đầy đủ và chính xác
                                nhất thông tin
                                các dự án bất động sản trên
                                toàn quốc song hành với dịch vụ tư vấn nhanh chóng và hiệu quả</p>
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
                        <div class="wrap">
                            <div
                                    class="swiper_why swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-multirow">
                                <div class="swiper-wrapper">
                                    <div class="item swiper-slide swiper-slide-active">
                                        <div class="row section-why">
                                            <div class="col-12 col-md-4">
                                                <div class="wrap-temp d-flex">
                                                    <div class="ico">
                                                        <img class="img-responsive lazyload loaded"
                                                             src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why1.png?1676257083798"
                                                             data-src=""
                                                             alt="Chất lượng tốt nhất" data-was-processed="true">
                                                    </div>
                                                    <div class="content_p ml-4">
                                                        <h4><a href="#" class="why-title a-text">Chất lượng
                                                            tốt nhất</a>
                                                        </h4>
                                                        <p class="why-desc">Nghiên cứu, thiết kế và
                                                            đầu tư xây dựng
                                                            với hệ thống dịch
                                                            vụ
                                                            với chất
                                                            lượng tốt nhất</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-4">
                                                <div class="wrap-temp d-flex">
                                                    <div class="ico">
                                                        <img class="img-responsive lazyload loaded"
                                                             src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why2.png?1676257083798"
                                                             data-src="" alt=""
                                                             data-was-processed="true">
                                                    </div>
                                                    <div class="content_p ml-4">
                                                        <h4><a href="#" class="why-title a-text">Tìm kiếm
                                                            thông tin dễ
                                                            dàng</a></h4>
                                                        <p class="why-desc">Tìm kiếm bất động sản
                                                            bạn muốn theo danh
                                                            mục cực kì dễ
                                                            dàng</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-4">
                                                <div class="wrap-temp d-flex">
                                                    <div class="ico">
                                                        <img class="img-responsive lazyload loaded"
                                                             src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why3.png?1676257083798"
                                                             data-src="" alt=""
                                                             data-was-processed="true">
                                                    </div>
                                                    <div class="content_p ml-4">
                                                        <h4><a href="#" class="why-title a-text">Kết nối
                                                            với nhà đầu tư</a>
                                                        </h4>
                                                        <p class="why-desc">Nhà đầu tư sẽ mang đến
                                                            những sản phẩm và
                                                            dịch vụ tốt nhất
                                                            đáp ứng nhu cầu của bạn</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-4">
                                            <div class="wrap-temp d-flex">
                                                <div class="ico">
                                                    <img class="img-responsive lazyload loaded"
                                                         src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why4.png?1676257083798"
                                                         data-src=""
                                                         alt="Chất lượng tốt nhất" data-was-processed="true">
                                                </div>
                                                <div class="content_p ml-4">
                                                    <h4 class=""><a href="#" class="why-title a-text">Tối
                                                        ưu hóa dịch
                                                        vụ</a></h4>
                                                    <p class="why-desc">Nghiên cứu, thiết kế và đầu
                                                        tư xây dựng với
                                                        hệ thống dịch vụ
                                                        với chất
                                                        lượng tốt nhất</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="wrap-temp d-flex">
                                                <div class="ico">
                                                    <img class="img-responsive lazyload loaded"
                                                         src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why5.png?1676257083798"
                                                         data-src=""
                                                         alt="Chất lượng tốt nhất" data-was-processed="true">
                                                </div>
                                                <div class="content_p ml-4">
                                                    <h4><a href="#" class="why-title a-text">Đảm bảo quyền
                                                        lợi khách
                                                        hàng</a></h4>
                                                    <p>
                                                    <p class="why-desc">Thực hiện các chương trình
                                                        chăm sóc và gia
                                                        tăng lợi ích cho
                                                        khách hàng.</p>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="wrap-temp d-flex">
                                                <div class="ico">
                                                    <img class="img-responsive lazyload loaded"
                                                         src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why6.png?1676257083798"
                                                         data-src=""
                                                         alt="Chất lượng tốt nhất" data-was-processed="true">
                                                </div>
                                                <div class="content_p ml-4">
                                                    <h4><a href="#" class="why-title a-text">Tiết kiệm thời
                                                        gian và chi
                                                        phí</a></h4>
                                                    <p class="why-desc">Cập nhật giá cả nhanh chóng
                                                        và chính xác
                                                        giúp bạn tiết kiệm
                                                        chi phí hơn nhiều</p>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- CONTENT 3 - NEW  -->
        <div class="content3">
            <div class="container">
                <div class="text-center">
                    <a class="content3-title" href="#">Bất động sản mới nhất</a>
                </div>

                <div class="content-product ">
                    <div class="container">
                        <div class="content1 justify-content-center">
                            <div class="row">
                                <c:forEach var="item" items="${buildingList}">
                                    <div class="col-12 col-md-4">
                                        <div class="product1 vip">
                                            <div>
                                                <img src="${item.image}" alt="Building Image" class="img-fluid"/>
                                            </div>

                                            <div class="product1-conntent">
                                                <div class="product1-conntent-header">
                                                    <a href="">${item.name}</a>
                                                </div>
                                                <span class="product1-conntent-title">Dự án Sky Park Residence số 3 Tôn Thất
                                                Thuyết đang
                                                trong quá trình hoàn thiện để đáp ứng tiến độ bàn giao nhà trong năm
                                                2018.
                                                Khách
                                                hàng có thể thăm quan và giám sát trực tiếp chất lương công trình cũng
                                                như
                                                thưởng
                                                ngoạn tầm view tuyệt đẹp ra hai công viên lớn nhất quận Cầu Giấy.</span>
                                                <ul class="product1-conntent-list">
                                                    <li class="product1-conntent-item">
                                                        <i class="fa-solid fa-location-dot"></i>
                                                        <span>${item.street}, ${item.ward}, ${districts[item.district]}</span>
                                                    </li>
                                                    <li class="product1-conntent-item">
                                                        <i class="fa-solid fa-building"></i>
                                                        <span>Loại BĐS: Chung cư</span>
                                                    </li>
                                                    <li class="product1-conntent-item">
                                                        <i class="fa-solid fa-earth-asia"></i>
                                                        <span>Diện tích: ${item.floorArea} m<sup>2</sup> </span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="product1-footer">
                                                <span class="product1-footer-cost">${item.rentPrice} triệu/m<sup>2</sup></span>
                                                <a href="/xem-chi-tiet-${item.id}"
                                                   style="color:#fff">
                                                    <button class="product1-footer-detail">Xem chi
                                                        tiết
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- FOOTER  -->
        <div class="brand mt-5 border-top">
            <div class="container">
                <div class="row">
                    <div class="d-flex justify-content-evenly mt-4">
                        <div><img
                                src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand1.png?1676257083798"
                                alt=""></div>
                        <div><img
                                src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand2.png?1676257083798"
                                alt=""></div>
                        <div><img
                                src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand3.png?1676257083798"
                                alt=""></div>
                        <div><img
                                src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand4.png?1676257083798"
                                alt=""></div>
                        <div><img
                                src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand5.png?1676257083798"
                                alt=""></div>
                        <div><img
                                src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand6.png?1676257083798"
                                alt=""></div>
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
                <div class="bottom-footer container">
                    <div class="row">
                        <div class="col-12 col-md-3">
                            <h4 class="title-item-bottom-footer">Thông tin công ty</h4>
                            <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                chủ</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                sản</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                        </div>
                        <div class="col-12 col-md-3">
                            <h4 class="title-item-bottom-footer">Chính sách hoạt động</h4>
                            <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                chủ</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                sản</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                        </div>
                        <div class="col-12 col-md-3">
                            <h4 class="title-item-bottom-footer">Hỗ trợ khách hàng</h4>
                            <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                chủ</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                sản</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                        </div>
                        <div class="col-12 col-md-3">
                            <h4 class="title-item-bottom-footer">Kết nối với chúng tôi</h4>
                            <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                chủ</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                sản</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                            <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottom-footer-2">
                <div class="text-center desc-bottom-footer-2">@ Bản quyền thuộc về Happy Team |
                    Cung cấp bởi <a class="a-text group-name" href="#">HappyTeam</a></div>
            </div>
        </footer>
    </div>
</div>

<style>
    .product1 img {
        width: 100%; /* Chiếm toàn bộ chiều rộng của khối */
        height: 200px; /* Đặt chiều cao cố định */
        object-fit: cover; /* Giữ tỷ lệ ảnh, cắt nếu cần để đầy khung */
        border-radius: 8px; /* Tùy chọn, thêm bo tròn góc cho ảnh */
    }

    .content3 {
        padding: 50px 0;
    }

    .content3-title {
        font-size: 2rem;
        color: #333;
        text-decoration: none;
        font-weight: bold;
    }

    .product2 {
        background: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-bottom: 20px;
    }

    .product1-content-header a {
        font-size: 1.2rem;
        color: #0056b3;
        text-decoration: none;
    }

    .product1-content-title {
        font-size: 1rem;
        color: #666;
        margin: 10px 0;
    }

    .product1-content-list {
        list-style: none;
        padding: 0;
    }

    .product1-content-item {
        font-size: 0.9rem;
        color: #444;
        margin-bottom: 5px;
    }

    .product1-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

    .product1-footer-cost {
        font-size: 1.2rem;
        color: #e74c3c;
        font-weight: bold;
    }

    .product1-footer-detail {
        background-color: #3498db;
        border: none;
        padding: 10px 20px;
        color: white;
        cursor: pointer;
        border-radius: 4px;
        text-transform: uppercase;
    }

    .product1-footer-detail a {
        color: white;
        text-decoration: none;
    }

    .search {
        background-color: #1c4e75; /* Nền của phần tìm kiếm */
        /*padding: 20px 0; !* Thêm một chút khoảng cách xung quanh *!*/
    }


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script>
    $('#buildingSearchModel').click(function (e) {
        e.preventDefault();
        $('#formList').submit();
    })
</script>
</body>

</html>