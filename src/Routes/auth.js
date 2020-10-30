const authRouter = require("express").Router();

const authController = require("../Controllers/auth");

authRouter.post("/register", authController.register);
authRouter.post("/login", authController.login);
authRouter.post("/pin",authController.pinConfirmation);
authRouter.patch('/changePassword',authController.updatePassword);
authRouter.post('/password',authController.checkPassword);
authRouter.post("/sendEmail", authController.sendEmail);
authRouter.post("/checkOTP", authController.checkOTP);

module.exports = authRouter;
