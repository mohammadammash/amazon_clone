const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
//internal
const User = require("../database/models/user");

const registerUserController = async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "User with same email already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password: hashedPassword,
      name,
    });

    user = await user.save();
    res.status(200).json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const loginUserController = async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email }).lean();
    if (!user) {
      return res.status(400).json({ msg: "User with this email does not exist!" });
    }

    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "InValid Credentials" });
    }

    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET_KEY); //secondParam is key to add to token encoding and decode
    res.json({ token, ...user });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

const getUserDataController = async (req, res) => {
  try {
    const currentUser = req.user;
    res.status(200).json(currentUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = {
  loginUserController,
  registerUserController,
  getUserDataController,
};
