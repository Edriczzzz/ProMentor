document.addEventListener('DOMContentLoaded', function() {
    const userProfile = JSON.parse(localStorage.getItem('userProfile'));

    if (!userProfile) {
        window.location.href = 'index.html';
        return;
    }

    document.getElementById('profile-name').textContent = userProfile.name;
    document.getElementById('profile-role').textContent = userProfile.role;
    document.getElementById('profile-image').src = userProfile.image;
});
