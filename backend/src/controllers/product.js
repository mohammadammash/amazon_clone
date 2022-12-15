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

const getProductsSearchedFor = async (req, res) => {
  try {
    const {name} = req.params;
    //if at least one matching chara found return product
    const products = await Product.find({name: {$regex: name, $options: "i"}});
    res.status(200).json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = {
  getProductsByCategoryController,
  getProductsSearchedFor,
};
