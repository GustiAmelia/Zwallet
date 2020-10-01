const receiverModels = require('../Models/receiver');
const formResponse = require('../Helpers/Form/formResponse');
const { getAllReceiver } = require('../Models/receiver');

const receiverControllers ={
  updateReceiver : (req,res)=>{
    receiverModels
    .updateReceiver(req.body)
    .then((results)=>{
        formResponse.success(res,req.body,200);
    }).catch((error)=>{
        formResponse.err(res,error,500);
    })
  },
  getAllReceiver : (_,res)=>{
    receiverModels
    .getAllReceiver()
    .then((results)=>{
      formResponse.success(res,results,200)
    }).catch((error)=>{
      formResponse.err(res,error,500)
    })
  }
}

module.exports = receiverControllers;