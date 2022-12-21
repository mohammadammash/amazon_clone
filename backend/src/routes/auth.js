const express = require("express");
const router = express.Router();
//internal
const { loginUserController, registerUserController, getUserDataController } = require("../controllers/auth");
const authMiddleware = require("../middlewares/auth");

router.get("/user", authMiddleware, getUserDataController);
router.post("/login", loginUserController);
router.post("/register", registerUserController);

module.exports = router;
