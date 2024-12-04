<%@ page import="java.sql.*" %>
<%
    ResultSet customer = (ResultSet) request.getAttribute("customer");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #00b4d8, #0077b6);
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            color: #333;
        }

        /* Main Container */
        .container {
            width: 70%;
            max-width: 500px;
            margin: 80px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.2s ease-out;
        }

        /* Heading */
        h2 {
            text-align: center;
            font-size: 2em;
            color: #0077b6;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* Form Elements */
        label {
            font-size: 1em;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1em;
            transition: all 0.3s ease;
            outline: none;
        }

        input:focus, textarea:focus {
            border-color: #00b4d8;
        }

        input.invalid, textarea.invalid {
            border-color: #dc3545;
        }

        .error-message {
            color: #dc3545;
            font-size: 0.9em;
            margin-top: -10px;
            margin-bottom: 10px;
            visibility: hidden;
        }

        .error-message.show {
            visibility: visible;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #0077b6;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.2em;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #00b4d8;
        }

        /* Back Link */
        .back-link {
            display: block;
            text-align: center;
            font-size: 1em;
            color: #0077b6;
            text-decoration: none;
            margin-top: 20px;
        }

        .back-link:hover {
            color: #00b4d8;
            text-decoration: underline;
        }

        /* Animation for Container */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 20px;
            }
            h2 {
                font-size: 1.7em;
            }
            input, textarea {
                font-size: 1em;
            }
            button {
                font-size: 1.1em;
            }
        }
    </style>
</head>
<body>

    <!-- Main Container -->
    <div class="container">
        <h2>Edit Customer</h2>
        <form id="editCustomerForm" action="CustomerServlet?action=update" method="post" onsubmit="return validateForm()">
            
            <input type="hidden" name="id" value="<%= customer.getInt("id") %>">
            
            <label for="name">Customer Name</label>
            <input type="text" id="name" name="name" value="<%= customer.getString("name") %>" required>
            <div class="error-message" id="nameError">Name is required</div>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%= customer.getString("email") %>" required>
            <div class="error-message" id="emailError">Please enter a valid email</div>

            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" value="<%= customer.getString("phone") %>" required>
            <div class="error-message" id="phoneError">Please enter a valid phone number</div>

            <label for="address">Address</label>
            <textarea id="address" name="address" rows="4" required><%= customer.getString("address") %></textarea>
            <div class="error-message" id="addressError">Address cannot be empty</div>

            <button type="submit">Update Customer</button>
        </form>
        <a href="CustomerServlet?action=list" class="back-link">Back to Customer List</a>
    </div>

    <!-- JavaScript for Form Validation -->
    <script>
        function validateForm() {
            let valid = true;

            // Name Validation
            const name = document.getElementById('name');
            const nameError = document.getElementById('nameError');
            if (name.value.trim() === "") {
                name.classList.add('invalid');
                nameError.classList.add('show');
                valid = false;
            } else {
                name.classList.remove('invalid');
                nameError.classList.remove('show');
            }

            // Email Validation
            const email = document.getElementById('email');
            const emailError = document.getElementById('emailError');
            const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailRegex.test(email.value.trim())) {
                email.classList.add('invalid');
                emailError.classList.add('show');
                valid = false;
            } else {
                email.classList.remove('invalid');
                emailError.classList.remove('show');
            }

            // Phone Validation
            const phone = document.getElementById('phone');
            const phoneError = document.getElementById('phoneError');
            const phoneRegex = /^\d{10}$/;
            if (!phoneRegex.test(phone.value.trim())) {
                phone.classList.add('invalid');
                phoneError.classList.add('show');
                valid = false;
            } else {
                phone.classList.remove('invalid');
                phoneError.classList.remove('show');
            }

            // Address Validation
            const address = document.getElementById('address');
            const addressError = document.getElementById('addressError');
            if (address.value.trim() === "") {
                address.classList.add('invalid');
                addressError.classList.add('show');
                valid = false;
            } else {
                address.classList.remove('invalid');
                addressError.classList.remove('show');
            }

            return valid;
        }
    </script>

</body>
</html>
