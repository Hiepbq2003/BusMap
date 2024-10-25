<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .register-box {
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 300px;
            text-align: center;
        }

        .register-box h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            margin-top: 10px;
            font-size: 0.9em;
        }

        .password-wrapper {
            position: relative;
            width: 100%;
        }

        .password-wrapper input[type="password"] {
            padding-right: 40px;
        }

        .password-wrapper input[type="text"] {
            padding-right: 40px;
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #4CAF50;
        }
    </style>
    <script>
        function togglePasswordVisibility(fieldId, iconId) {
            var passwordField = document.getElementById(fieldId);
            var toggleIcon = document.getElementById(iconId);
            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleIcon.textContent = "Hide";
            } else {
                passwordField.type = "password";
                toggleIcon.textContent = "Show";
            }
        }
    </script>
</head>
<body>
    <div class="register-container">
        <div class="register-box">
            <h2>Đăng Ký</h2>
            <form action="register" method="post">
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <div class="password-wrapper">
                        <input type="password" id="password" name="password" required>
                        <span class="toggle-password" id="togglePassword1" onclick="togglePasswordVisibility('password', 'togglePassword1')">Show</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Nhập lại mật khẩu</label>
                    <div class="password-wrapper">
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                        <span class="toggle-password" id="togglePassword2" onclick="togglePasswordVisibility('confirmPassword', 'togglePassword2')">Show</span>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit">Đăng Ký</button>
                </div>
            </form>
            <c:if test="${not empty errorMessage}">
                <div class="error-message">
                    ${errorMessage}
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
