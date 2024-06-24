document.addEventListener('DOMContentLoaded', function() {
    // Ejemplo de datos del asesorado, puedes reemplazarlos con los datos reales.
    const studentName = "Juan Pérez";
    const studentId = "2023640198";

    document.getElementById('student-name').textContent = studentName;
    document.getElementById('student-id').textContent = studentId;

    // Funcionalidad del modal "Ver más"
    const modal = document.getElementById("ver-mas-modal");
    const span = document.getElementsByClassName("close")[0];

    document.querySelectorAll('.view-more').forEach(button => {
        button.addEventListener('click', function() {
            const materia = this.getAttribute('data-materia');
            const asesor = this.getAttribute('data-asesor');
            const descripcion = this.getAttribute('data-descripcion');
            const temas = this.getAttribute('data-temas');
            const material = this.getAttribute('data-material');
            const cupo = this.getAttribute('data-cupo');
            const max = this.getAttribute('data-max');
            const horarios = this.getAttribute('data-horarios');

            document.getElementById('modal-materia').textContent = materia;
            document.getElementById('modal-asesor').textContent = asesor;
            document.getElementById('modal-descripcion').textContent = descripcion;
            document.getElementById('modal-temas').textContent = temas;
            document.getElementById('modal-material').textContent = material;
            document.getElementById('modal-cupo').textContent = cupo;
            document.getElementById('modal-max').textContent = max;
            document.getElementById('modal-horarios').textContent = horarios;

            modal.style.display = "block";
        });
    });

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // Funcionalidad del botón "Inscribir" en el modal
    document.getElementById('modal-inscribir').addEventListener('click', function() {
        alert('Inscripción realizada');
        modal.style.display = "none";
    });
});
