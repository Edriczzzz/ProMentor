document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const isHuman = document.getElementById('not-robot').checked;

    // Aquí puedes añadir la lógica de autenticación real
    let userProfile = {};

    if (username === 'asesor' && password === 'password123') {
        userProfile = { name: 'Asesor', role: 'Asesor', image: 'asesor.png' };
        localStorage.setItem('userProfile', JSON.stringify(userProfile));
        window.location.href = 'asesor.html';
    } else if (username === 'asesorado' && password === 'password123') {
        userProfile = { name: 'Asesorado', role: 'Asesorado', image: 'asesorado.png' };
        localStorage.setItem('userProfile', JSON.stringify(userProfile));
        window.location.href = 'asesorado.html';
    } else if (username === 'admin' && password === 'password123') {
        userProfile = { name: 'Admin', role: 'Admin', image: 'admin.png' };
        localStorage.setItem('userProfile', JSON.stringify(userProfile));
        window.location.href = 'admin.html';
    } else {
        alert('Credenciales inválidas');
        return;
    }


});

function cancelLogin() {
    alert("Inicio de sesión cancelado.");
}
