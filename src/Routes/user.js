const userRouter = require("express").Router();

const userController = require("../Controllers/user");
const uploadImage = require('../Helpers/Middlewares/Upload');

userRouter.patch('/updatePin',userController.updatePin);
userRouter.patch('/',uploadImage.singleUpload,userController.updateUser);
userRouter.get('/',userController.getAllUsers);
userRouter.get('/search',userController.searchContact);

module.exports = userRouter;