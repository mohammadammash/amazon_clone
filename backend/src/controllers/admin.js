const { Product } = require("../database/models/product");

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

const deleteSingleProductController = async (req,res)=>{
  try{
    res.status(200).json({msg: 'DELETE SINGLE PRODUCTOOOO'});
  }
  catch(e){
    res.status(500).json({error:e.message});
  }
} 

module.exports = {
  addProductController,
  getAllProductsController,
  deleteSingleProductController,
};
