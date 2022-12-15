const { Product } = require("../database/models/product");

const getProductsByCategoryController = async (req, res) => {
  try {
    const {category} = req.query;

    const products = await Product.find({category: category});
    res.status(200).json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = {
  getProductsByCategoryController,
};
