const transactionRouter = require('express').Router();

const transactionController = require('../Controllers/transaction');

transactionRouter.post('/',transactionController.addTransaction)
transactionRouter.get('/',transactionController.getAllTransaction)

module.exports=transactionRouter;