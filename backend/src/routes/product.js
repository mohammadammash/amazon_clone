const express = require("express");
const router = express.Router();
//internal
const { getProductsByCategoryController, getProductsSearchedFor, postRateProduct } = require("../controllers/product");

router.get("/", getProductsByCategoryController);
router.get("/:name", getProductsSearchedFor);
router.post("/rating", postRateProduct);

module.exports = router;
