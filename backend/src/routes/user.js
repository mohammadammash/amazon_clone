const express = require("express");
const router = express.Router();
//internal
const { addProductToCartController, deleteProductFromCartController, addCurrentUserAddressController } = require("../controllers/user");

router.post("/add_to_cart", addProductToCartController);
router.post("/address", addCurrentUserAddressController);
router.delete("/delete_from_cart", deleteProductFromCartController);

module.exports = router;
