document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent form submission

    // Predefined users
    const users = {
        asesor: { username: 'asesor', password: 'password123', role: 'asesor' },
        asesorado: { username: 'asesorado', password: 'password456', role: 'asesorado' },
        admin: { username: 'admin', password: 'password789', role: 'admin' }
    };

    // Get form values
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const notRobot = document.getElementById('not-robot').checked;

    // Validate the CAPTCHA
    if (!notRobot) {
        alert('Please confirm you are not a robot.');
        return;
    }

    // Check if user exists and password is correct
    if (users[username] && users[username].password === password) {
        // Redirect based on user role
        switch (users[username].role) {
            case 'asesor':
                window.location.href = '/dashboard/asesor.html';
                break;
            case 'asesorado':
                window.location.href = '/dashboard/asesorado.html';
                break;
            case 'admin':
                window.location.href = '/dashboard/admin.html';
                break;
        }
    } else {
        alert('Invalid username or password.');
    }
});

function cancelLogin() {
    document.getElementById('loginForm').reset();
}