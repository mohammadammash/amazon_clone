const addProductToCartController = async (req, res) => {
  try {
    res.status(200).json({ msg: "Success!!" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = {
  addProductToCartController,
};
