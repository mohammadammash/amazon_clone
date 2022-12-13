const Product = require("../database/models/product");

const addProductController = async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;
    
    const product = new Product({
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

module.exports = {
  addProductController,
};
