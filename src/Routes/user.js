const userRouter = require("express").Router();

const userController = require("../Controllers/user");

userRouter.patch('/updatePin',userController.updatePin);
userRouter.get('/',userController.getAllUsers);


module.exports = userRouter;