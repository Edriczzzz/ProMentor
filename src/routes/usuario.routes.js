import { Router } from "express";
import {
  getUsuarios,
  createNewUser,
  deleteUser,
} from "../controllers/usuario.controller.js";

const router = Router();

router.get("/users", getUsuarios);

router.post("/crearusuario", createNewUser);

router.delete("/delete/:id", deleteUser)


export default router;
