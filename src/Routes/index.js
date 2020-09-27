//PACKAGE IMPORT
const express = require("express");

//FILEPATH IMPORT
const authRouter = require("./auth");
const userRouter = require("./user");


//DEKLARASI
const indexRouter = express.Router();

//IMPLEMENTASI
indexRouter.use('/auth',authRouter);
indexRouter.use('/user',userRouter);


//EXPORTS
module.exports = indexRouter;

