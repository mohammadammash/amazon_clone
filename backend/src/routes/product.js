const express = require("express");
const router = express.Router();
//internal
const { getProductsByCategoryController } = require("../controllers/product");

router.get("/", getProductsByCategoryController);

module.exports = router;
