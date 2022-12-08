const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");

require("dotenv").config();
require("./database/connection");

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

const authRoutes = require("./routes/auth");
app.use("/api", authRoutes);

app.listen(process.env.SERVER_PORT, () => {
  console.log("Running on " + process.env.SERVER_PORT);
});
