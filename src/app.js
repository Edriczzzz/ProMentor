import express from "express";
import cors from "cors";
import morgan from "morgan";

import productRoutes from "./routes/products.routes.js";
import usuarioRoutes from "./routes/usuario.routes.js";
import materiaRoutes from "./routes/materia.routes.js";
const app = express();

app.use(cors({
  origin: "*",
}));

app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Routes
app.use("/api", usuarioRoutes);
app.use("/api", materiaRoutes);
export default app;
