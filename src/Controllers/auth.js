const authModel =require('../Models/auth');
const formResponse = require('../Helpers/Form/formResponse');
const nodemailer = require("nodemailer")

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
    },
    updatePassword : (req,res)=>{
        authModel
        .updatePassword(req.body)
        .then((results)=>{
          const object={id:req.body.id}
          formResponse.success(res,object,200)
        }).catch((error)=>{
          formResponse.err(res,error,500)
        })
    },
    checkPassword:(req,res)=>{
        authModel
        .checkPassword(req.body)
        .then((results)=>{
            formResponse.success(res,results,200)
        }).catch((error)=>{
            formResponse.err(res,error,500)
        })
    },
    checkOTP: (req, res) => {
        authModel
        .checkOTP(req.body)
        .then((results) => {
            formResponse.success(res,results,200)
        })
        .catch((error) => {
        formResponse.err(res, error,500);
        });
    },
    sendEmail: (req, res) => {
        authModel
        .sendEmail(req.body)
        .then((results) => {
            console.log(results)
        var transporter = nodemailer.createTransport({
            service: "gmail",
            auth: {
            user: process.env.email,
            pass: process.env.pass,
            },
        });

        var mailOptions = {
            from: process.env.email,
            to: results.email,
            subject: "OTP Reset Password",
            text: `Code OTP ${results.code}`,
        };
        console.log(mailOptions)

        transporter.sendMail(mailOptions, function (error, info) {
            if (error) {
            console.log(error);
            } else {
            console.log("Email sent: " + info.response);
            }
        });
        formResponse.success(res,results,200)
        })
        .catch((error) => {
        formResponse.err(res, error,500);
        });
    },
}

module.exports=authControllers;