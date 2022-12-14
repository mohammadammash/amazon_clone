const express = require("express");
const router = express.Router();
//internal
const {
  addProductToCartController,
  deleteProductFromCartController,
  addCurrentUserAddressController,
  postSubmitOrderController,
  getCurrentUserOrdersController,
} = require("../controllers/user");

router.get("/orders", getCurrentUserOrdersController)
router.post("/add_to_cart", addProductToCartController);
router.post("/address", addCurrentUserAddressController);
router.post("/submit_order",postSubmitOrderController);
router.delete("/delete_from_cart", deleteProductFromCartController);

module.exports = router;
