const registerUserController = async (req, res) => {
  res.json({ message: "Hello" });
};

const loginUserController = async (req, res) => {
  res.json({ message: "okay" });
};

module.exports = {
  loginUserController,
  registerUserController,
};
