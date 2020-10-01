//PACKAGE IMPORT
const express = require("express");

//FILEPATH IMPORT
const authRouter = require("./auth");
const receiverRouter = require("./receiver");
const userRouter = require("./user");
const trasactionRouter = require('./transaction');


//DEKLARASI
const indexRouter = express.Router();

//IMPLEMENTASI
indexRouter.use('/auth',authRouter);
indexRouter.use('/user',userRouter);
indexRouter.use('/receiver',receiverRouter);
indexRouter.use('/transaction',trasactionRouter);


//EXPORTS
module.exports = indexRouter;

