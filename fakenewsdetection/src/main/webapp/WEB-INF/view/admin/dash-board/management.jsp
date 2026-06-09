<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Manage Users - Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap" rel="stylesheet">
  <style>
    :root{
      --sidebar:#22282b;
      --accent:#1e90ff;
      --muted:#6b6f76;
      --card:#ffffff;
      --danger:#e74c3c;
      --warn:#f1c40f;
      --success:#27ae60;
      --table-border:#e7e7e7;
      --radius:8px;
      --max-width:1100px;
    }
    *{box-sizing:border-box}
    body{
      margin:0; font-family:Inter, system-ui, -apple-system, 'Segoe UI', Roboto, 'Helvetica Neue', Arial;
      background:#f7f8fa; color:#222;
    }

    /* Topbar */
    .topbar{
      height:64px; background:#121416; color:#fff; display:flex; align-items:center; justify-content:flex-end; padding:0 24px; box-shadow:0 1px 0 rgba(0,0,0,0.25);
      position:fixed; left:240px; right:0; top:0; z-index:3;
    }
    .topbar .user{opacity:0.9}

    /* Sidebar */
    .sidebar{
      position:fixed; left:0; top:0; bottom:0; width:240px; background:var(--sidebar); color:#cfd6d9; padding:26px 18px; overflow:auto;
    }
    .brand{color:#fff; font-weight:700; font-size:20px; margin-bottom:18px}
    .nav{margin-top:18px}
    .nav a{display:block; color:inherit; text-decoration:none; padding:10px 12px; border-radius:6px; margin-bottom:6px}
    .nav a:hover{background:rgba(255,255,255,0.03)}
    .logged{position:absolute; bottom:16px; left:18px; color:#93a3a7; font-size:13px}

    /* Main layout */
    .main{
      margin-left:240px; padding:92px 48px 48px; min-height:100vh;
    }
    .card{
      background:var(--card); border-radius:10px; padding:28px; box-shadow:0 6px 18px rgba(20,20,20,0.06);
    }

    h1{font-size:40px; margin:0 0 8px}
    .breadcrumbs{color:var(--muted); margin-bottom:22px}
    .page-top{display:flex; align-items:center; justify-content:space-between; margin-bottom:18px}

    /* Table */
    .table-wrapper{margin-top:12px}
    table{width:100%; border-collapse:collapse; background:transparent}
    thead th{ text-align:left; padding:14px 16px; font-weight:700; color:#333; border-bottom:1px solid var(--table-border)}
    tbody td{padding:16px; border-bottom:1px solid var(--table-border); color:#333}
    tbody tr td.id{width:80px; font-weight:600}

    .actions{display:flex; gap:8px}
    .btn{display:inline-block; padding:8px 12px; border-radius:6px; font-weight:600; text-decoration:none; border:none; cursor:pointer}
    .btn.view{background:var(--success); color:#fff}
    .btn.edit{background:var(--warn); color:#111}
    .btn.del{background:var(--danger); color:#fff}
    .create-btn{background:var(--accent); color:#fff; padding:10px 16px; border-radius:8px; font-weight:700; border:none}

    /* Pagination */
    .pager{display:flex; justify-content:center; margin-top:20px}
    .pager .page{display:inline-block; padding:8px 12px; border-radius:6px; background:#fff; border:1px solid #e6e6e6; margin:0 6px}
    .pager .page.active{background:var(--accent); color:#fff; border-color:var(--accent)}

    /* Responsive */
    @media (max-width:900px){
      .topbar{left:0}
      .sidebar{position:relative; width:100%; height:auto}
      .main{margin-left:0; padding-top:24px}
      .page-top{flex-direction:column; gap:12px; align-items:flex-start}
      table thead{display:none}
      tbody td{display:block}
      tbody tr{margin-bottom:12px; background:#fff; border-radius:8px}
      .actions{margin-top:8px}
    }

    /* small touches */
    .muted{color:var(--muted)}

    .limit-text {
    max-width: 300px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    display: inline-block;
    vertical-align: top;
    }
    
    tbody tr {
    border-bottom: 1px solid var(--table-border);
}

tbody td {
    border-bottom: none;
}

table {
    border-collapse: collapse;
}
  </style>
</head>
<body>
  <aside class="sidebar">
    <div class="brand">Predict Management</div>
    <nav class="nav">
      <a href="#" style="background:rgba(255,255,255,0.03); color:#fff;">Predict</a>
    </nav>
    <div class="logged">Logged in as:<br><strong>ADMIN</strong></div>
  </aside>

  <div class="topbar">
    <div class="user">Welcome, admin@gmail.com</div>
  </div>

  <main class="main">
    <div style="max-width:var(--max-width); margin:0 auto">
      <div class="page-top">
        <div>
          <h1>Manage Predicts</h1>
          <div class="breadcrumbs"><a href="#">Dashboard</a> / <span class="muted">Predicts</span></div>
        </div>
        <div>
          <a href="/"><button class="create-btn">Do a predict</button></a>
        </div>
      </div>

      <div class="card">
        <h3 style="margin:0 0 8px">Table predicts</h3>
        <div class="table-wrapper">
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Text</th>
                <th>Label</th>
                <th>Label Name</th>
                <th>Probability</th>
                <th style="text-align:center">Action</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="u" items="${list}">
                <tr>
                    <td class="id">${u.id}</td>
                    <td class="limit-text">${u.text}</td>
                    <td>${u.label}</td>
                    <td>${u.labelName}</td>
                    <td>${u.probability}</td>
                    <td style="text-align:center">
                    <div class="actions">
                        <a href="/admin/dash-board/${u.id}"><button class="btn view">View</button></a>
                        <!-- <button class="btn edit">Update</button> -->
                        <a href="/admin/dash-board/delete/${u.id}"><button class="btn del">Delete</button></a>
                    </div>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
          </table>

          <div class="pager" aria-label="Pagination">
            <span class="page">«</span>
            <span class="page active">1</span>
            <span class="page">»</span>
          </div>
        </div>
      </div>

      <footer style="margin-top:22px; color:var(--muted); text-align:center">Copyright © Lụm Đâu Đó Trên Mạng</footer>
    </div>
  </main>
</body>
</html>
