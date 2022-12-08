const express = require("express");
const app = express();
require("dotenv").config();
require("./database/connection");

app.use(express.json());

const authRoutes = require("./routes/auth");
app.use("/api", authRoutes);

app.listen(process.env.SERVER_PORT, () => {
  console.log("Running on " + process.env.SERVER_PORT);
});
