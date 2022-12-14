const express = require("express");
const router = express.Router();
//internal
const { addProductController, getAllProductsController, deleteSingleProductController } = require("../controllers/admin");

router.post("/add_product", addProductController);
router.get("/products", getAllProductsController);
router.delete("/product", deleteSingleProductController);

module.exports = router;
