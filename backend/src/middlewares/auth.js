const jwt = require("jsonwebtoken");
const User = require("../database/models/user");

const authMiddleware = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.status(401).json({ msg: "No Authenticated User" });

    const verified = jwt.verify(token, process.env.JWT_SECRET_KEY);
    if (!verified) return res.status(401).json({ msg: "Token Expired" });

    const user = await User.findById(verified.id).lean();
    req.user = { token, ...user };
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = authMiddleware;
