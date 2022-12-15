const express = require("express");
const router = express.Router();
//internal
const { getProductsByCategoryController, getProductsSearchedFor } = require("../controllers/product");

router.get("/", getProductsByCategoryController);
router.get("/:name", getProductsSearchedFor);

module.exports = router;
