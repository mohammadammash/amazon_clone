const { Product } = require("../database/models/product");
const User = require("../database/models/user");

const addProductToCartController = async (req, res) => {
  try {
    const { product_id } = req.body;
    const { token, ...user } = req.user;

    const product = await Product.findById(product_id);
    if (user.cart.length == 0) user.cart.push({ product, quantity: 1 });
    else {
      //I used product._id because id from frontend is as String
      //I used .equals because both are ObjectID
      let isFound = false;
      for (let i = 0; i < user.cart.length; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          user.cart[i].quantity++;
          isFound = true;
          break;
        }
      }
      if (!isFound) user.cart.push({ product, quantity: 1 });
    }

    const { _id, cart, ...rest } = user;
    await User.findByIdAndUpdate(_id, { cart: cart }); //save user after updating //no need to await we have data already with user from auth
    res.status(200).json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};
//-----------------------------------------------------------

const deleteProductFromCartController = async (req, res) => {
  try {
    const { product_id } = req.body;
    const { token, ...user } = req.user;

    const product = await Product.findById(product_id);
    for (let i = 0; i < user.cart.length; i++) {
      //I used product._id because id from frontend is as String
      //I used .equals because both are ObjectID
      if (user.cart[i].product._id.equals(product._id)) {
        if (user.cart[i].quantity <= 1) user.cart.splice(i, 1);
        else user.cart[i].quantity--;
        break;
      }
    }

    const { _id, cart, ...rest } = user;
    await User.findByIdAndUpdate(_id, { cart: cart }); //save user after updating
    res.status(200).json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = {
  addProductToCartController,
  deleteProductFromCartController,
};
