const bcryptjs = require("bcryptjs");

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
  res.json({ message: "okay" });
};

module.exports = {
  loginUserController,
  registerUserController,
};
