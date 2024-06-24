import { getConnection, sql } from "../database/connection.js";

export const getUsuarios = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM Usuario");
    res.json(result.recordset);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

// Ruta para crear un nuevo usuario

export const createNewUser = async (req, res) => {
  const { boleta, password, nombre, apellido, correo, unidadAcademica, grupo } =
    req.body;

  if (
    !boleta ||
    !password ||
    !nombre ||
    !apellido ||
    !correo ||
    !unidadAcademica ||
    !grupo
  ) {
    return res.status(400).json({ msg: "Bad Request. Please fill all fields" });
  }

  try {
    const pool = await getConnection();

    const result = await pool
      .request()
      .input("boleta_usuario", sql.VarChar, boleta)
      .input("password_usuario", sql.VarChar, password)
      .input("nombre_usuario", sql.VarChar, nombre)
      .input("apellido_usuario", sql.VarChar, apellido)
      .input("correo_usuario", sql.VarChar, correo)
      .input("id_unidadAcademica", sql.Int, unidadAcademica)
      .input("id_grupo", sql.Int, grupo)
      .query(
        "INSERT INTO Usuario (boleta_usuario, password_usuario, nombre_usuario, apellido_usuario, correo_usuario, id_unidadAcademica, id_grupo) VALUES (@boleta_usuario, @password_usuario, @nombre_usuario, @apellido_usuario, @correo_usuario, @id_unidadAcademica, @id_grupo)"
      );

    res.json({
      boleta_usuario: boleta,
      password_usuario: password,
      nombre_usuario: nombre,
      apellido_usuario: apellido,
      correo_usuario: correo,
      id_unidadAcademica: unidadAcademica,
      id_grupo: grupo,
    });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const deleteUser = async (req, res) => {
  const { id } = req.params;

  if (!id) {
    return res.status(400).json({ msg: "Bad Request. Please provide a user ID" });
  }

  try {
    const pool = await getConnection();

    await pool
      .request()
      .input("id", sql.Int, id)
      .query("DELETE FROM users WHERE id = @id");

    res.json({ msg: "User deleted successfully" });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};