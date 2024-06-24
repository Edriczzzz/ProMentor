import { getConnection, sql } from "../database/connection.js";

export const getMateria = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM InformacionAsesoria;");
    res.json(result.recordset);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

// controllers/materia.controller.js

export const deleteMateriaById = async (req, res) => {
    try {
        const id = req.params.id;
        const pool = await getConnection();

        const result = await pool
          .request()
          .input("id", id)
          .query(
            "DELETE FROM InformacionAsesoria WHERE id_asesoria = @id; DELETE FROM Calificaciones WHERE id_unidadAprendizaje = @id; DELETE FROM ListaAlumno WHERE id_listaAlumno = @id;DELETE FROM AsesoriaUsuario WHERE id_asesoriaUsuario = @id; DELETE FROM NotificacionAsesoria WHERE id_notificacionAsesoria = @id; DELETE FROM UnidadAprendizaje WHERE id_unidadAprendizaje = @id"
          );

        if (result.rowsAffected[0] === 0) {
            return res.sendStatus(404);
        }

        return res.sendStatus(204);
    } catch (error) {
        console.error('Error al eliminar la materia:', error.message);
        res.status(500).send(error.message);
    }
};