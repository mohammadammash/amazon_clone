const { Product } = require("../database/models/product");

const getProductsByCategoryController = async (req, res) => {
  try {
    const { category } = req.query;

    const products = await Product.find({ category: category });
    res.status(200).json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const getProductsSearchedFor = async (req, res) => {
  try {
    const { name } = req.params;
    //if at least one matching chara found return product
    const products = await Product.find({ name: { $regex: name, $options: "i" } });
    res.status(200).json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const postRateProduct = async (req, res) => {
  try {
    const { rating, productId } = req.body;
    const { _id: userId } = req.user;

    let product = await Product.findById(productId);
    const newRating = {
      userId: userId,
      rating,
    };
    product.ratings.push(newRating);
    product = await product.save();

    res.status(200).json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const getDealOfTheDayController = async (req, res) => {
  try {
    res.status(200).send({ msg: "DEALLL" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = {
  getProductsByCategoryController,
  getProductsSearchedFor,
  postRateProduct,
  getDealOfTheDayController,
};
