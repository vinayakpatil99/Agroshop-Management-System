<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        h1 {
            color: #d9534f;
        }
        p {
            color: #555;
        }
    </style>
</head>
<body>
    <h1>Error</h1>
    <p><%= request.getParameter("message") %></p>
    <a href="index.jsp">Go Back</a>
</body>
</html>
