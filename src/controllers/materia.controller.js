import { getConnection, sql } from "../database/connection.js";

export const getMateria = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query(
      "SELECT * FROM UnidadAprendizaje;",
    );
    res.json(result.recordset);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const deleteMateriaById = async (req, res) => {
  const { id } = req.params;

  if (!id) {
    return res.sendStatus(500).json({
      msg: "Introduzca un id valido de materia",
    });
  }

  try {
    const pool = await getConnection();

    const fistQuery = await pool
      .request()
      .input("id", sql.Int, parseInt(id, 10))
      .query(
        "DELETE UnidadAprendizaje WHERE id_unidadAprendizaje = @id",
      );

    return res.sendStatus(200);
  } catch (error) {
    console.error("Error al eliminar la materia:", error.message);
    res.status(500).send(error.message);
  }
};
