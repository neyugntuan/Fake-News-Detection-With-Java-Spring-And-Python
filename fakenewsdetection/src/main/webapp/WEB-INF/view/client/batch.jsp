<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhận diện Tin Giả</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    background: #f3f4f6;
}

/* ================= HEADER ================= */
.header {
    background: linear-gradient(135deg, #0f172a, #1e1b4b, #312e81);
    color: white;
    padding: 40px 60px;
}

.header-top {
    display: flex;
    gap: 10px;
    margin-bottom: 15px;
}

.header-badge {
    display: flex;
    align-items: center;
    gap: 6px;
    background: rgba(255,255,255,0.08);
    padding: 6px 14px;
    border-radius: 999px;
    font-size: 13px;
    color: #c7d2fe;
}

.header-badge::before {
    content: "";
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #22c55e;
}

.title {
    font-size: 36px;
    font-weight: 700;
}

.title span {
    background: linear-gradient(90deg, #60a5fa, #22d3ee);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.subtitle {
    font-size: 14px;
    color: #cbd5f5;
}

/* ================= CONTAINER ================= */
.container {
    max-width: 800px;
    margin: -40px auto 0;
    background: white;
    border-radius: 12px;
    padding: 25px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
}

/* ================= TABS ================= */
.tabs {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
}

.tab {
    padding: 8px 16px;
    border-radius: 8px;
    background: #e5e7eb;
    font-size: 14px;
    text-decoration: none;
    color: #111;
}

.tab.active {
    background: #6366f1;
    color: white;
}

/* ================= TEXTAREA ================= */
textarea {
    width: 100%;
    height: 140px;
    padding: 12px;
    border-radius: 10px;
    border: 1px solid #ddd;
    resize: none;
    margin-top: 10px;
}

/* ================= BUTTON ================= */
.btn {
    margin-top: 25px;
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(135deg, #6366f1, #4f46e5);
    color: white;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    opacity: 0.9;
}

/* ================= SUMMARY ================= */
.result-summary {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.summary-badge {
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 13px;
}

.summary-badge.real {
    background: #d1fae5;
    color: #059669;
}

.summary-badge.fake {
    background: #fee2e2;
    color: #dc2626;
}

/* ================= RESULT LIST ================= */
.result-list {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

/* ITEM */
.result-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 14px 16px;
    border-radius: 12px;
    background: #f9fafb;
    border-left: 6px solid;
    transition: 0.2s;
    animation: fadeIn 0.3s ease;
}

.result-item:hover {
    transform: translateY(-2px);
}

/* STATUS COLOR */
.result-item.real {
    border-color: #059669;
}

.result-item.fake {
    border-color: #dc2626;
}

/* TEXT */
.result-text {
    flex: 1;
    font-size: 14px;
    color: #374151;
    margin-right: 15px;

    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

/* RIGHT SIDE */
.result-right {
    text-align: right;
    min-width: 80px;
}

/* TAG */
.result-tag {
    font-size: 12px;
    padding: 4px 10px;
    border-radius: 8px;
    display: inline-block;
    margin-bottom: 5px;
}

.result-tag.real {
    background: #d1fae5;
    color: #059669;
}

.result-tag.fake {
    background: #fee2e2;
    color: #dc2626;
}

.tag {
    display: inline-block;
    margin-top: 10px;
    padding: 12px 16px;

    background: #f9fafb;           /* nền xám nhẹ */
    border: 1px solid #e5e7eb;     /* viền xám */
    border-radius: 10px;           /* bo góc */

    font-size: 14px;
    cursor: pointer;

    transition: all 0.2s ease;
}

/* hover */
.tag:hover {
    background: #ffffff;
    border-color: #c7d2fe;         /* viền sáng hơn */
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    transform: translateY(-2px);
}

.tag:active {
    transform: scale(0.98);
}

/* PERCENT */
.percent {
    font-weight: 600;
    font-size: 14px;
}

.percent.real {
    color: #059669;
}

.percent.fake {
    color: #dc2626;
}

/* ================= ANIMATION ================= */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(6px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ================= FOOTER ================= */
.footer {
    text-align: center;
    margin-top: 20px;
    font-size: 13px;
    color: #6b7280;
}
    </style>
</head>

<body>

    <!-- HEADER -->
    <div class="header">
    <div class="header-top">
        <div class="header-badge">⚙️ BiLSTM Model</div>
        <div class="header-badge">API Online</div>
    </div>

    <div class="title">
        Nhận diện <span>Tin Giả</span>
    </div>

    <div class="subtitle">
        Hệ thống phân loại tin thật / tin giả sử dụng mô hình Deep Learning BiLSTM
    </div>
</div>
    <br>
    <br>
    <!-- MAIN -->
    <div class="container">

        <!-- TABS -->
        <div class="tabs">
            <div class="tab"><a href="/">Nhận diện</a></div>
            <div class="tab active"><a href="/predict-batch">Hàng loạt</a></div>
            <div class="tab">API Guide</div>
        </div>

        <!-- INPUT -->

        <form action="/predict-batch" method="post">

            <b><label>Nhập văn bản cần kiểm tra</label></b>
            <textarea id="inputText" name="texts" placeholder="Ví dụ: 33 người chết ở bệnh viện Chợ Rẫy vì virus corona..." required>${raw}</textarea>

            <c:if test="${error != null}">
            <div style="
                background:#fee2e2;
                color:#b91c1c;
                padding:10px;
                border-radius:8px;
                margin-bottom:15px;
            ">
                ${error}
            </div>
            </c:if>

            <div class="tag real" data-text="
            Tính từ 6h ngày 16/4 đến 18h ngày 29/6, đã 74 ngày Việt Nam không có ca lây nhiễm trong cộng đồng. Tính đến 18h ngày 29/6, Việt Nam có tổng cộng 215 ca nhiễm nhập cảnh được cách ly ngay. Trong số 355 bệnh nhân, 342 người đã khỏi bệnh.
            Nguyên liệu sữa Vinamilk. Các ảnh này là sữa bột từ Trung Quốc được mang về làm sữa nước Vinamilk. Từ nay, bản thân mình cũng không dám tin vào cái gọi là sữa tươi nữa.
            Có thể dùng thuốc trị sốt rét dự phòng COVID-19 nhé mọi người. Bác sĩ khuyến cáo nên trữ một ít thuốc này ở nhà, khi nào cảm thấy không khỏe là kịp thời uống tự xử lý luôn.
            VN sẽ có khoảng 50,000 người chết trong vòng 2 tháng tới, nạn dịch này còn nguy hiểm hơn cả corona. Đó là số liệu dự báo của nhóm nghiên cứu mỗi dịp lễ lớn.
            33 người chết ở bệnh viện Chợ Rẫy vì virus corona. Thông tin từ anh bạn làm bác sĩ và khuyên người nghe không nên ra đường, trữ thực phẩm vì khoảng 1 tuần, 10 ngày nữa sẽ phát dịch.
            Chính phủ đã có Nghị quyết 41 ngày 9/4/2020 đồng ý thống nhất chủ trương chuyển đổi 8 dự án cao tốc Bắc - Nam sang đầu tư công. Đây là quyết định quan trọng nhằm đẩy nhanh tiến độ các dự án hạ tầng giao thông trọng điểm quốc gia.
            Lô hàng nằm trong một nhà kho tại ngõ 16 Đỗ Xuân Hợp, phường Từ Liêm. Hôm nay tại thời điểm bị Phòng Cảnh sát kinh tế Công an Hà Nội phối hợp với lực lượng quản lý thị trường kiểm tra, chủ kho là bà Sơn chưa xuất trình được hóa đơn, chứng từ. Lô hàng trị giá hơn 120 triệu đồng.
            Người Việt du lịch mạnh mẽ trở lại sau chiến dịch kích cầu nội địa, từng bước đưa du lịch nội địa phục hồi. Ngành du lịch Việt Nam ghi nhận lượng khách nội địa tăng mạnh so với cùng kỳ năm ngoái, đặc biệt tại các điểm đến như Đà Nẵng, Phú Quốc, Nha Trang.
            "
            >⚡️Nạp 8 mẫu tin 4 thật & 4 giả vào</div>


            <button class="btn" type="submit">Kiểm tra tin giả</button>
        </form>

        

        <!-- BUTTON -->
        <!-- <button class="btn" onclick="checkFakeNews()">Kiểm tra tin giả</button> -->
        <br>
        <c:if test="${results != null}">

    <c:set var="realCount" value="0"/>
    <c:set var="fakeCount" value="0"/>

    <c:forEach var="r" items="${results}">
        <c:choose>
            <c:when test="${r.label == 1}">
                <c:set var="fakeCount" value="${fakeCount + 1}"/>
            </c:when>
            <c:otherwise>
                <c:set var="realCount" value="${realCount + 1}"/>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <!-- SUMMARY -->
    <div class="result-summary">
        <div class="left">
            <b>${fn:length(results)} kết quả</b>
            <span>(${time} ms)</span>
        </div>

        <div class="right">
            <span class="summary-badge real">✔ ${realCount} Real</span>
            <span class="summary-badge fake">⚠ ${fakeCount} Fake</span>
        </div>
    </div>

    <!-- LIST -->
    <div class="result-list">
        <c:forEach var="r" items="${results}">
            <div class="result-item ${r.label == 1 ? 'fake' : 'real'}">

                <div class="result-text">
                    ${r.text}
                </div>

                <div class="result-right">
                    <div class="result-tag ${r.label == 1 ? 'fake' : 'real'}">
                        ${r.label == 1 ? 'Fake' : 'Real'}
                    </div>

                    <div class="percent ${r.label == 1 ? 'fake' : 'real'}">
                        ${Math.round(r.confidence * 1000) / 10}%
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>

</c:if>








    </div>

    <div class="footer">
        BiLSTM Fake News Detection v3.0 • JSP + SPRINGBOOT
    </div>

    <!-- SCRIPT -->
    <script>
        // click tag -> fill textarea
        document.addEventListener("DOMContentLoaded", function () {
        const textarea = document.getElementById("inputText");

            document.querySelectorAll(".tag").forEach(tag => {
                tag.addEventListener("click", function () {
                    const text = this.getAttribute("data-text");

                    textarea.value = text;
                    textarea.focus();
                });
            });
        });

        document.querySelector("form").addEventListener("submit", function(e) {
    const text = document.getElementById("inputText").value.trim();

    if (text === "") {
        e.preventDefault();
        alert("Không được để trống hoặc chỉ nhập dấu cách!");
    }
});
    </script>

</body>
</html>