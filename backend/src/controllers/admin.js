const { Product } = require("../database/models/product");
const Order = require("../database/models/order");

const addProductController = async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;

    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });

    product = await product.save();
    res.status(200).json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const getAllProductsController = async (req, res) => {
  try {
    const products = await Product.find({});
    res.status(200).json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const deleteSingleProductController = async (req, res) => {
  try {
    const { product_id } = req.body;
    await Product.findByIdAndDelete(product_id);
    res.status(200).json({ msg: "Successfully Deleted!!!" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const getAllOrdersController = async (req, res) => {
  try {
    const orders = await Order.find({});
    res.status(200).json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const updateOrderStatusController = async (req, res) => {
  try {
    const { order_id, new_status } = req.body;
    const updated_order = await Order.findByIdAndUpdate(order_id, { status: new_status }, { new: true });

    res.status(200).json(updated_order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const getAnalyticsController = async (req, res) => {
  try {
    res.status(200).json({ msg: "Analytics" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = {
  addProductController,
  getAllProductsController,
  deleteSingleProductController,
  getAllOrdersController,
  updateOrderStatusController,
  getAnalyticsController,
};
