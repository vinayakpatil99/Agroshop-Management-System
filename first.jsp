<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%
    // Fetch the current timestamp
    String currentTimestamp = LocalDateTime.now().toString();
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Agroshop Management System</title>
      <style>
         body {
            margin: 0;
            padding: 0;
            font-family: montserrat;
            background: black;
            color: white;
         }
         .center {
            display: flex;
            flex-direction: column;
            text-align: center;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
         }
         .ring {
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            animation: ring 2s linear infinite;
         }
         @keyframes ring {
            0% {
               transform: rotate(0deg);
               box-shadow: 1px 5px 2px #e65c00;
            }
            50% {
               transform: rotate(180deg);
               box-shadow: 1px 5px 2px #18b201;
            }
            100% {
               transform: rotate(360deg);
               box-shadow: 1px 5px 2px #0456c8;
            }
         }
         .ring:before {
            position: absolute;
            content: '';
            left: 0;
            top: 0;
            height: 100%;
            width: 100%;
            border-radius: 50%;
            box-shadow: 0 0 5px rgba(255, 255, 255, .3);
         }
         span {
            color: #737373;
            font-size: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
            line-height: 200px;
            animation: text 3s ease-in-out infinite;
         }
         @keyframes text {
            50% {
               color: black;
            }
         }
         .welcome {
            font-size: 40px; /* Increased font size */
            font-weight: bold;
            color: white; /* Ensure white color */
            margin-bottom: 20px;
         }
         .link {
            margin-top: 20px;
            font-size: 18px;
            text-decoration: none;
            color: #18b201;
            border: 2px solid #18b201;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
         }
         .link:hover {
            background-color: #18b201;
            color: black;
         }
         marquee {
            font-size: 18px;
            font-weight: bold;
            color: #e65c00;
            margin-top: 20px;
         }
      </style>
   </head>
   <body>
    <marquee><h1>“Agriculture is the foundation of civilization and the backbone of a sustainable future."</h1></marquee>
      <div class="center">
         <!-- Welcome message -->
         <div class="welcome">Welcome to Agroshop Management System</div>
         
         
         <div class="ring"></div>
         <span>loading...</span>
         <!-- Link to the next page -->
         <a href="index.html" class="link">Let's Start...</a>
         
         <!-- Motivational line in marquee -->
        
      </div>
   </body>
</html>
