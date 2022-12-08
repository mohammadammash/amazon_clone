const express = require("express");
const app = express();
require("dotenv").config();

const authRoutes = require("./routes/auth");
app.use("/api", authRoutes);

app.listen(process.env.SERVER_PORT, () => {
  console.log("Running on " + process.env.SERVER_PORT);
});
