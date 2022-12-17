const express = require("express");
const router = express.Router();
//internal
const { getProductsByCategoryController, getProductsSearchedFor, postRateProduct, getDealOfTheDayController } = require("../controllers/product");

router.get("/", getProductsByCategoryController);
router.get("/deal_of_the_day", getDealOfTheDayController);
router.get("/:name", getProductsSearchedFor);
router.post("/rating", postRateProduct);

module.exports = router;
