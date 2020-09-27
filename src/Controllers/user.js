const userModel = require('../Models/user');
const formResponse = require('../Helpers/Form/formResponse');

const userController ={
  updatePin : (req,res)=>{
    userModel
    .updatePin(req.body)
    .then((results)=>{
      const object={id:req.body.id}
      formResponse.success(res,object,200)
    }).catch((error)=>{
      formResponse.err(res,error,500)
    })
  },
  getAllUsers : (_,res)=>{
    userModel
    .getAllUsers()
    .then((results)=>{
      formResponse.success(res,results,200)
    }).catch((error)=>{
      formResponse.err(res,error,500)
    })
  }
}

module.exports=userController;