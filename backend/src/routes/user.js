const express = require("express");
const router = express.Router();
//internal
const { addProductToCartController } = require("../controllers/user");

router.post("/add_to_cart", addProductToCartController);

module.exports = router;
