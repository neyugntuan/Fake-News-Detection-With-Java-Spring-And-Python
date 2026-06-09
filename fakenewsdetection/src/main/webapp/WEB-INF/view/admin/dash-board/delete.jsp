<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>Delete Predict</title>
  <style>
    :root{
      --sidebar:#2b2f31;
      --muted:#6b6f76;
      --danger:#e74c3c;
      --card:#fff;
      --max-width:1100px;
    }
    *{box-sizing:border-box}
    body{margin:0; font-family: "Segoe UI", Roboto, Arial; background:#f6f7f8; color:#222;}

    .sidebar{position:fixed; left:0; top:0; bottom:0; width:240px; background:var(--sidebar); color:#d6d9da; padding:24px}
    .brand{font-weight:700; color:#fff; font-size:20px; margin-bottom:18px}
    .topbar{position:fixed; left:240px; right:0; top:0; height:64px; background:#171819; color:#fff; display:flex; align-items:center; justify-content:flex-end; padding:0 28px; z-index:2}
    .main{margin-left:240px; padding:96px 48px 48px; min-height:100vh}
    .container{max-width:var(--max-width); margin:0 auto}

    h1{font-size:44px; margin:0 0 8px}
    .breadcrumbs{color:var(--muted); margin-bottom:22px}

    .card{background:var(--card); border-radius:10px; padding:22px; box-shadow:0 6px 18px rgba(20,20,20,0.05)}

    .alert {
      background:#fbecec;
      border:1px solid #f0b8b8;
      color:#7d2e2e;
      padding:16px 18px;
      border-radius:6px;
      margin:12px 0 18px;
    }
    .confirm-btn {
      display:inline-block;
      padding:10px 16px;
      background:var(--danger);
      color:#fff;
      border-radius:6px;
      border:none;
      font-weight:700;
      text-decoration:none;
      cursor:pointer;
    }
    .back-btn { display:inline-block; padding:8px 12px; background:#eee; color:#222; border-radius:6px; text-decoration:none; margin-left:12px }

    @media (max-width:900px){
      .sidebar{position:relative; width:100%}
      .topbar{left:0}
      .main{margin-left:0; padding-top:20px}
    }
  </style>
</head>
<body>
  <aside class="sidebar">
    <div class="brand">Predict Management</div>
    <nav>
      <a href="/admin/dash-board" style="color:inherit; display:block; padding:8px 0; text-decoration:none">Dashboard</a>
    </nav>
  </aside>

  <div class="topbar">
    <div>Welcome, <strong>admin@gmail.com</strong></div>
  </div>

  <main class="main">
    <div class="container">
      <h1>Delete Predict</h1>
      <div class="breadcrumbs">
        <a href="${pageContext.request.contextPath}/admin/dash-board">Dashboard</a> /
        <span style="color:var(--muted)">Delete</span>
      </div>

      <div style="margin-top:18px; font-size:20px; font-weight:600">
        Delete the predict with id = <c:out value="${id}"/>
      </div>

      <div class="card" style="margin-top:18px;">
        <p style="margin:0 0 12px; color:var(--muted); border-bottom:1px solid #eee; padding-bottom:12px;">
          Bạn sắp xóa bản ghi này. Hành động này không thể hoàn tác.
        </p>

        <div class="alert">
          Are you sure you want to delete this predict?
        </div>

        <!-- Spring form binding -->
        <form:form method="post" action="/admin/dash-board/delete"
                   modelAttribute="newPredict">

          <!-- hidden field chứa id -->
          <form:hidden path="id" value="${id}"/>

          <button type="submit" class="confirm-btn">Confirm</button>

          <a href="/admin/dash-board" class="back-btn">Back</a>
        </form:form>

        
      </div>

      <footer style="margin-top:48px; color:var(--muted); text-align:center">
        Copyright © Lụm Đâu Đó Trên Mạng
      </footer>
    </div>
  </main>
</body>
</html>
