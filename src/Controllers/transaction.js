const transactionModels = require('../Models/transaction');
const formResponse = require('../Helpers/Form/formResponse');

const transactionController ={
  addTransaction :(req,res)=>{
    transactionModels
    .addTransaction(req.body)
    .then((results)=>{
      formResponse.success(res,results,200)
    })
    .catch((error)=>{
      formResponse.err(res,error,500)
    })
  }
}

module.exports=transactionController;