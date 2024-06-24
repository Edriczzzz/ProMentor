import { Router } from "express";
import {
getMateria,
deleteMateriaById,
} from "../controllers/materia.controller.js";

const router = Router();

router.get("/materia", getMateria);

router.delete("/materia/:id", deleteMateriaById);


export default router;
