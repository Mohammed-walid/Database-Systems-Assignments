<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login & Registration</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; padding: 50px; }
        .container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 100%; max-width: 400px; margin: 0 20px; }
        h2 { text-align: center; color: #333; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input { width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        .btn { width: 100%; padding: 10px; background: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background: #218838; }
        .message { text-align: center; font-weight: bold; margin-bottom: 15px; }
        .error { color: red; }
        .success { color: green; }
    </style>
</head>
<body>

    <div class="container">
        <h2>Login</h2>
        <div id="loginMessage" class="message"></div>
        <form id="loginForm">
            <div class="form-group">
                <label>Email:</label>
                <input type="text" name="email" id="loginEmail">
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" id="loginPassword">
            </div>
            <button type="submit" class="btn">Login</button>
        </form>
    </div>

    <div class="container">
        <h2>Register</h2>
        <div id="registerMessage" class="message"></div>
        <form id="registerForm">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" id="regName">
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="text" name="email" id="regEmail">
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" id="regPassword">
            </div>
            <div class="form-group">
                <label>Confirm Password:</label>
                <input type="password" name="confirm_password" id="regConfirm">
            </div>
            <button type="submit" class="btn">Register</button>
        </form>
    </div>

    <script>
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        // Ajax Login
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            let email = document.getElementById('loginEmail').value;
            let password = document.getElementById('loginPassword').value;
            let msgBox = document.getElementById('loginMessage');

            if (email === "" || password === "") {
                msgBox.className = "message error";
                msgBox.innerText = "Email and password must not be empty.";
                return;
            }

            let formData = new FormData(this);
            fetch('login.php', { method: 'POST', body: formData })
                .then(response => response.json())
                .then(data => {
                    msgBox.className = data.status === 'success' ? "message success" : "message error";
                    msgBox.innerText = data.message;
                });
        });

        // Ajax Registration
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            let name = document.getElementById('regName').value;
            let email = document.getElementById('regEmail').value;
            let password = document.getElementById('regPassword').value;
            let confirm = document.getElementById('regConfirm').value;
            let msgBox = document.getElementById('registerMessage');

            let errors = [];
            if (name === "") errors.push("Name is empty.");
            if (email === "") errors.push("Email is empty.");
            else if (!emailRegex.test(email)) errors.push("Email format is invalid."); // Bonus: Email format validation
            if (password === "") errors.push("Password is empty.");
            if (confirm === "") errors.push("Confirm Password is empty.");
            if (password !== "" && confirm !== "" && password !== confirm) errors.push("Passwords do not match.");

            if (errors.length > 0) {
                msgBox.className = "message error";
                msgBox.innerText = errors.join("\n");
                return;
            }

            let formData = new FormData(this);
            fetch('register.php', { method: 'POST', body: formData })
                .then(response => response.json())
                .then(data => {
                    msgBox.className = data.status === 'success' ? "message success" : "message error";
                    msgBox.innerText = data.message;
                    if(data.status === 'success') document.getElementById('registerForm').reset();
                });
        });
    </script>
</body>
</html>