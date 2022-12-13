const addProductController = async (req, res) => {
  console.log("Add Product");
  res.send({ msg: "Add Product" });
};

module.exports = {
  addProductController,
};
