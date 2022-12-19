const express = require("express");
const router = express.Router();
//internal
const { addProductToCartController, deleteProductFromCartController } = require("../controllers/user");

router.post("/add_to_cart", addProductToCartController);
router.delete("/delete_from_cart", deleteProductFromCartController);

module.exports = router;
