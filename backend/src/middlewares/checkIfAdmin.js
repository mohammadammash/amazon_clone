const checkIfAdminMiddleware = async (req, res, next) => {

  try {
    const user = req.user;
    if (user.type != process.env.USERTYPE_ADMIN) return res.status(401).send({ msg: "Unauthorized" });

    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = checkIfAdminMiddleware;
