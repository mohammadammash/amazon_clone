const express = require("express");
const router = express.Router();
//internal
const { loginUserController, registerUserController } = require("../controllers/auth");

router.post("/login", loginUserController);
router.post("/register", registerUserController);

module.exports = router;
