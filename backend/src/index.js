const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");

require("dotenv").config();
require("./database/connection");

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

//ROUTES
const authMiddleware = require("./middlewares/auth");
const checkIfAdminMiddleware = require("./middlewares/checkIfAdmin");

const authRoutes = require("./routes/auth");
app.use("/api", authRoutes);

const adminRoutes = require("./routes/admin");
app.use("/admin", authMiddleware, checkIfAdminMiddleware, adminRoutes);

const productRoutes = require("./routes/product");
app.use("/products", authMiddleware, productRoutes);

const userRoutes = require("./routes/user");
app.use("/user", authMiddleware, userRoutes);

app.listen(process.env.SERVER_PORT, () => {
  console.log("Running on " + process.env.SERVER_PORT);
});
