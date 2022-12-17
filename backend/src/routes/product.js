const express = require("express");
const router = express.Router();
//internal
const { getProductsByCategoryController, getProductsSearchedFor, postRateProduct, getDealOfTheDayController } = require("../controllers/product");

router.get("/", getProductsByCategoryController);
router.get("/:name", getProductsSearchedFor);
router.get("/deal_of_the_day", getDealOfTheDayController);
router.post("/rating", postRateProduct);

module.exports = router;
