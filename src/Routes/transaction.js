const transactionRouter = require('express').Router();

const transactionController = require('../Controllers/transaction');

transactionRouter.post('/',transactionController.addTransaction)

module.exports=transactionRouter;