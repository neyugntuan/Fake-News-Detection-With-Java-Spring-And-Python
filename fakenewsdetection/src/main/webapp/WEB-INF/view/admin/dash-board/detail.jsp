<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>User Detail</title>

  <!-- Bạn có thể thay bằng file CSS riêng hoặc Bootstrap nếu muốn -->
  <style>
    :root{
      --sidebar:#2b2f31;
      --accent:#1e90ff;
      --muted:#6b6f76;
      --card:#ffffff;
      --success:#27ae60;
      --radius:8px;
      --max-width:1100px;
    }
    *{box-sizing:border-box}
    body{margin:0; font-family: "Segoe UI", Roboto, Arial; background:#f6f7f8; color:#222;}

    /* Sidebar */
    .sidebar{
      position:fixed; left:0; top:0; bottom:0; width:240px; background:var(--sidebar); color:#d6d9da; padding:24px;
    }
    .brand{font-weight:700; color:#fff; font-size:20px; margin-bottom:18px}
    .nav a{display:block; color:inherit; text-decoration:none; padding:10px 12px; border-radius:6px; margin-bottom:6px}
    .nav a:hover{background:rgba(255,255,255,0.03)}
    .logged{position:absolute; bottom:16px; left:24px; color:#97a2a6; font-size:13px}

    /* Topbar */
    .topbar{
      position:fixed; left:240px; right:0; top:0; height:64px; background:#171819; color:#fff; display:flex;
      align-items:center; justify-content:flex-end; padding:0 28px; box-shadow:0 1px 0 rgba(0,0,0,0.2);
      z-index:2;
    }

    /* Main */
    .main{margin-left:240px; padding:96px 48px 48px; min-height:100vh}
    .container{max-width:var(--max-width); margin:0 auto}
    h1{font-size:44px; margin:0 0 8px}
    .breadcrumbs{color:var(--muted); margin-bottom:22px}

    .card{
      background:var(--card);
      border-radius:10px;
      padding:22px;
      box-shadow:0 6px 18px rgba(20,20,20,0.05);
    }

    .info-box{
      width:1000px;
      border:1px solid #e2e2e2;
      border-radius:6px;
      overflow:hidden;
      background:#fff;
    }
    .info-box .header{
      background:#f7f7f7; padding:12px 16px; font-weight:600; color:#333; border-bottom:1px solid #eaeaea;
    }
    .info-box .row{padding:12px 16px; border-bottom:1px solid #eee; color:#333}
    .info-box .row:last-child{border-bottom:none}

    .back-btn{
      display:inline-block; margin-top:18px; padding:8px 14px; border-radius:6px; background:var(--success); color:#fff; text-decoration:none; font-weight:600;
    }

    /* responsive */
    @media (max-width:900px){
      .sidebar{position:relative; width:100%; height:auto}
      .topbar{left:0}
      .main{margin-left:0; padding-top:20px}
      .info-box{width:100%}
    }
  </style>
</head>
<body>
  <aside class="sidebar">
    <div class="brand">Predict Detail</div>
    <nav class="nav">
      <a href="#" style="background:rgba(255,255,255,0.03); color:#fff">Predict</a>
    </nav>
    <div class="logged">Logged in as:<br><strong>ADMIN</strong></div>
  </aside>

  <div class="topbar">
    <div>Welcome, <strong>admin@gmail.com</strong></div>
  </div>

  <main class="main">
    <div class="container">
      <h1>Predict Detail</h1>
      <div class="breadcrumbs"><a href="/admin/dash-board">Dashboard</a> / <span style="color:var(--muted)">Predict</span></div>

      <div style="margin-top:18px; margin-bottom:22px; font-size:20px; font-weight:600">Predict Detail with id = <c:out value="${predict.id}"/></div>

      <div class="card" style="padding:28px; display:flex; gap:40px; align-items:flex-start;">
        <!-- left column: info box -->
        <div class="info-box" aria-label="User information">
          <div class="header">Predict full information</div>
          <div class="row">ID: <strong><c:out value="${predict.id}"/></strong></div>
          <div class="row">Text: <c:out value="${predict.text}"/></div>
          <div class="row">Label: <c:out value="${predict.label}"/></div>
          <div class="row">Label Name: <c:out value="${predict.labelName}"/></div>
          <div class="row">Prob: <c:out value="${predict.probability}"/></div>
        </div>

        
        </div>
      </div>

      <a href="/admin/dash-board" class="back-btn">Back</a>

      <footer style="margin-top:48px; color:var(--muted); text-align:center">Copyright © Lụm Đâu Đó Trên Mạng</footer>
    </div>
  </main>
</body>
</html>
