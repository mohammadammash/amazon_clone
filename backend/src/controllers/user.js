const { Product } = require("../database/models/product");
const Order = require("../database/models/order");
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

const addCurrentUserAddressController = async (req, res) => {
  try {
    const { address } = req.body;
    const { _id } = req.user;

    const user = await User.findByIdAndUpdate(_id, { address: address }, { new: true });
    res.status(200).json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const postSubmitOrderController = async (req, res) => {
  try {
    const { totalPrice } = req.body;
    const { cart, address, _id } = req.user;

    const order_products = [];
    for (let i = 0; i < cart.length; i++) {
      const product = await Product.findById(cart[i].product._id);
      if (product.quantity >= cart[i].quantity) {
        //stored quantity >= ordered quantit
        product.quantity -= cart[i].quantity; //update stored quantity
        order_products.push(cart[i]);
        await product.save(); //save updated edited product quantity stored
      } else {
        return res.status(400).json({ msg: `${product.name} is out of stock!!` });
      }
    }

    //if orders quantity matches stored quantity
    await User.findByIdAndUpdate(_id, { cart: [] });
    let new_order = new Order({
      products: order_products,
      totalPrice,
      address,
      userId: _id,
      orderedAt: new Date().getTime(),
    });
    new_order = await new_order.save();

    res.status(200).json(new_order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const getCurrentUserOrdersController = async (req,res)=>{
  try{
    res.status(200).send({msg: 'SUCCESSSS'});
  }catch(e){
    res.status(500).json({ error: e.message });
  }
}

module.exports = {
  addProductToCartController,
  deleteProductFromCartController,
  addCurrentUserAddressController,
  postSubmitOrderController,
  getCurrentUserOrdersController,
};
