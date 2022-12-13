const express = require("express");
const router = express.Router();
//internal
const { addProductController } = require("../controllers/admin");

router.post("/add_product", addProductController);

module.exports = router;
