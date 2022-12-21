const express = require("express");
const router = express.Router();
//internal
const {
  addProductController,
  getAllProductsController,
  deleteSingleProductController,
  getAllOrdersController,
  updateOrderStatusController,
  getAnalyticsController,
} = require("../controllers/admin");

router.post("/add_product", addProductController);
router.put("/order_status", updateOrderStatusController);
router.get("/products", getAllProductsController);
router.get("/analytics", getAnalyticsController);
router.get("/orders", getAllOrdersController);
router.delete("/product", deleteSingleProductController);

module.exports = router;
