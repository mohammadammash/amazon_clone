const express = require("express");
const router = express.Router();
//internal
const { addProductController, getAllProductsController } = require("../controllers/admin");

router.post("/add_product", addProductController);
router.get("/products", getAllProductsController)

module.exports = router;
