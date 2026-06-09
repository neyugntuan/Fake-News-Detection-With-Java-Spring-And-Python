<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        /* HEADER */
.header {
    background: linear-gradient(135deg, #0f172a, #1e1b4b, #312e81);
    color: white;
    padding: 40px 60px;
}

/* badge container */
.header-top {
    display: flex;
    gap: 10px;
    margin-bottom: 15px;
}

/* badge */
.badge {
    display: flex;
    align-items: center;
    gap: 6px;
    background: rgba(255,255,255,0.08);
    padding: 6px 14px;
    border-radius: 999px;
    font-size: 13px;
    color: #c7d2fe;
    backdrop-filter: blur(6px);
}

/* dot xanh (API online) */
.badge::before {
    content: "";
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #22c55e;
}

/* title */
.title {
    font-size: 40px;
    font-weight: 700;
    margin-bottom: 8px;
}

/* chữ "Tin Giả" gradient */
.title span {
    background: linear-gradient(90deg, #60a5fa, #22d3ee);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* subtitle */
.subtitle {
    font-size: 15px;
    color: #cbd5f5;
    opacity: 0.9;
}

        .badge {
            background: rgba(255,255,255,0.1);
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
        }

        .title {
            font-size: 32px;
            font-weight: 600;
        }

        .subtitle {
            font-size: 14px;
            opacity: 0.8;
        }

        /* MAIN */
        .container {
            max-width: 800px;
            margin: -40px auto 0;
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        /* TAB */
        .tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .tab {
            padding: 8px 16px;
            border-radius: 8px;
            background: #e5e7eb;
            cursor: pointer;
            font-size: 14px;
        }

        .tab.active {
            background: #6366f1;
            color: white;
        }

        /* TEXTAREA */
        textarea {
            width: 100%;
            height: 140px;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ddd;
            resize: none;
            margin-top: 10px;
        }

        /* SAMPLE */
        .section-title {
            margin-top: 20px;
            font-weight: 600;
        }

        .tags {
            margin-top: 10px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .tag {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            cursor: pointer;
        }

        .real {
            background: #58ea77;
            color: #070b09;
        }

        .fake {
            background: #fee2e2;
            color: #090606;
        }

        /* BUTTON */
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

        /* FOOTER */
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #6b7280;
        }

        .result-box {
    margin-top: 25px;
    padding: 20px;
    border-radius: 14px;
    border-left: 6px solid;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

/* REAL */
.result-box.real {
    background: linear-gradient(135deg, #d1fae5, #a7f3d0);
    border-color: #059669;
}

/* FAKE */
.result-box.fake {
    background: linear-gradient(135deg, #fee2e2, #fecaca);
    border-color: #dc2626;
}

.result-header {
    display: flex;
    align-items: center;
    gap: 15px;
}

.icon {
    width: 45px;
    height: 45px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
}

.real .icon {
    background: #059669;
    color: white;
}

.fake .icon {
    background: #dc2626;
    color: white;
}

.result-title {
    font-size: 22px;
    font-weight: 700;
}

.real .result-title {
    color: #065f46;
}

.fake .result-title {
    color: #7f1d1d;
}

.result-desc {
    font-size: 14px;
    opacity: 0.8;
}

.confidence {
    margin-top: 15px;
    display: flex;
    justify-content: space-between;
}

.progress {
    width: 100%;
    height: 8px;
    background: #e5e7eb;
    border-radius: 10px;
    margin-top: 10px;
    overflow: hidden;
}

.progress-bar {
    height: 100%;
    border-radius: 10px;
}

.real .progress-bar {
    background: #059669;
}

.fake .progress-bar {
    background: #dc2626;
}

.stats {
display: flex;
gap: 12px;
margin-top: 15px;
}

.stat {
flex: 1;
background: rgba(255,255,255,0.6);
padding: 12px;
border-radius: 10px;
text-align: center;
backdrop-filter: blur(4px);
}

.stat div {
font-size: 12px;
opacity: 0.7;
}

.stat b {
font-size: 16px;
}

.fake-box {
    background: linear-gradient(135deg, #fee2e2, #fecaca);
    border: 1px solid #ef4444;
}

.fake-box .icon {
    background: #ef4444;
}

.fake-box .progress div {
    background: linear-gradient(90deg, #ef4444, #dc2626);
}
    </style>
</head>

<body>

    <!-- HEADER -->
    <div class="header">
    <div class="header-top">
        <div class="badge">⚙️ BiLSTM Model</div>
        <div class="badge">API Online</div>
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
            <div class="tab active"><a href="/">Nhận diện</a></div>
            <div class="tab"><a href="/predict-batch">Hàng loạt</a></div>
            <div class="tab">API Guide</div>
        </div>

        <!-- INPUT -->

        <form action="/predict" method="post">

            <b><label>Nhập văn bản cần kiểm tra</label></b>
            <textarea id="inputText" name="text" placeholder="Ví dụ: 33 người chết ở bệnh viện Chợ Rẫy vì virus corona..." required>${text}</textarea>

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

            <!-- REAL -->
            <div class="section-title">✔ Mẫu tin THẬT:</div>
            <div class="tags">
                <div class="tag real" data-text="Tính từ 6h ngày 16/4 đến 18h ngày 29/6, đã 74 ngày Việt Nam không có ca lây nhiễm trong cộng đồng. Tính đến 18h ngày 29/6, Việt Nam có tổng cộng 215 ca nhiễm nhập cảnh được cách ly ngay. Trong số 355 bệnh nhân, 342 người đã khỏi bệnh.">✔ COVID chính thống</div>
                <div class="tag real" data-text="Chính phủ đã có Nghị quyết 41 ngày 9/4/2020 đồng ý thống nhất chủ trương chuyển đổi 8 dự án cao tốc Bắc - Nam sang đầu tư công. Đây là quyết định quan trọng nhằm đẩy nhanh tiến độ các dự án hạ tầng giao thông trọng điểm quốc gia.">✔ Cao tốc Bắc - Nam</div>
                <div class="tag real" data-text="Lô hàng nằm trong một nhà kho tại ngõ 16 Đỗ Xuân Hợp, phường Từ Liêm. Hôm nay tại thời điểm bị Phòng Cảnh sát kinh tế Công an Hà Nội phối hợp với lực lượng quản lý thị trường kiểm tra, chủ kho là bà Sơn chưa xuất trình được hóa đơn, chứng từ. Lô hàng trị giá hơn 120 triệu đồng.">✔ Bắt xúc xích lậu</div>
                <div class="tag real" data-text="Người Việt du lịch mạnh mẽ trở lại sau chiến dịch kích cầu nội địa, từng bước đưa du lịch nội địa phục hồi. Ngành du lịch Việt Nam ghi nhận lượng khách nội địa tăng mạnh so với cùng kỳ năm ngoái, đặc biệt tại các điểm đến như Đà Nẵng, Phú Quốc, Nha Trang.">✔ Du lịch phục hồi</div>
            </div>

            <!-- FAKE -->
            <div class="section-title">⚠ Mẫu tin GIẢ:</div>
            <div class="tags">
                <div class="tag fake" data-text="33 người chết ở bệnh viện Chợ Rẫy vì virus corona. Thông tin từ anh bạn làm bác sĩ và khuyên người nghe không nên ra đường, trữ thực phẩm vì khoảng 1 tuần, 10 ngày nữa sẽ phát dịch.">⚠ 33 người chết Chợ Rẫy</div>
                <div class="tag fake" data-text="Nguyên liệu sữa Vinamilk. Các ảnh này là sữa bột từ Trung Quốc được mang về làm sữa nước Vinamilk. Từ nay, bản thân mình cũng không dám tin vào cái gọi là sữa tươi nữa.">⚠ Sữa Vinamilk giả</div>
                <div class="tag fake" data-text="Có thể dùng thuốc trị sốt rét dự phòng COVID-19 nhé mọi người. Bác sĩ khuyến cáo nên trữ một ít thuốc này ở nhà, khi nào cảm thấy không khỏe là kịp thời uống tự xử lý luôn.">⚠ Thuốc sốt rét trị COVID</div>
                <div class="tag fake" data-text="VN sẽ có khoảng 50,000 người chết trong vòng 2 tháng tới, nạn dịch này còn nguy hiểm hơn cả corona. Đó là số liệu dự báo của nhóm nghiên cứu mỗi dịp lễ lớn.">⚠ 50K người chết dịp lễ</div>
            </div>

            <button class="btn" type="submit">Kiểm tra tin giả</button>
        </form>

        

        <!-- BUTTON -->
        <!-- <button class="btn" onclick="checkFakeNews()">Kiểm tra tin giả</button> -->

        <c:if test="${label != null}">
    <div class="result-box ${isFake ? 'fake' : 'real'}">

        <div class="result-header">
            <div class="icon">
                <c:choose>
                    <c:when test="${isFake}">⚠</c:when>
                    <c:otherwise>✔</c:otherwise>
                </c:choose>
            </div>

            <div>
                <div class="result-title">
                    <c:choose>
                        <c:when test="${isFake}">Fake</c:when>
                        <c:otherwise>Real</c:otherwise>
                    </c:choose>
                </div>

                <div class="result-desc">
                    <c:choose>
                        <c:when test="${isFake}">Tin này có dấu hiệu là tin giả</c:when>
                        <c:otherwise>Tin này có vẻ là tin thật</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="confidence">
            <div>Độ tin cậy</div>
            <div>${confidence}%</div>
        </div>

        <div class="progress">
            <div class="progress-bar" style="width:${confidence}%"></div>
        </div>

        <div class="stats">
            <div class="stat">
                <div>LABEL</div>
                <b>${label}</b>
            </div>
            <div class="stat">
                <div>XÁC SUẤT FAKE</div>
                <b>${fakeProb}%</b>
            </div>
            <div class="stat">
                <div>THỜI GIAN</div>
                <b>${time}ms</b>
            </div>
        </div>

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