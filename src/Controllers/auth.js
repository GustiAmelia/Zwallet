const authModel =require('../Models/auth');
const formResponse = require('../Helpers/Form/formResponse');

const authControllers ={
    register:(req,res)=>{
      authModel
      .postNewUser(req.body)
      .then((results)=>{
        // const object={username:req.body.username, email:req.body.email}
        formResponse.success(res,req.body,200);
        }).catch((error)=>{
            formResponse.err(res,error,500);
        })
    },
    login:(req,res)=>{
        authModel
        .loginUser(req.body)
        .then((results)=>{
        formResponse.success(res,results,200);
        }).catch((error)=>{
            formResponse.err(res,error,500);
        })
    },
    pinConfirmation:(req,res)=>{
        authModel
        .pinConfirmation(req.body)
        .then((results)=>{
            formResponse.success(res,results,200)
        }).catch((error)=>{
            formResponse.err(res,error,500)
        })
    }
}

module.exports=authControllers;