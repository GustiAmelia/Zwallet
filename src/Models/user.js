const connection = require('../Configs/dbMySql');
const bcrypt = require("bcrypt");

const userModel ={
  updatePin : (body)=>{
    return new Promise((resolve,reject)=>{
      bcrypt.genSalt(10,(error,salt)=>{
        if(error){
          reject(error);
        }
        const{pin}=body;
        bcrypt.hash(pin,salt,(error,hashedPin)=>{
          if(error){
            reject(error);
          }
          const newBody={...body,pin:hashedPin};
          const qs =`UPDATE users SET ? WHERE users.username ='${newBody.username}'`;
          connection.query(qs,newBody,(error,results)=>{
            if(!error){
              resolve(results);
            } else{
              reject(error);
            }
          })
        })
      })
    })
  },
  getAllUsers : (query)=>{
    return new Promise ((resolve,reject)=>{
      const qs = 'SELECT * FROM users WHERE NOT ?'
      connection.query(qs,[query],(error,results)=>{
        if(!error){
          resolve(results)
        }else{
          reject(error)
        }
      })
    })
  },
  updateUser: (body)=>{
    return new Promise((resolve,reject)=>{
      const queryString = `UPDATE users SET ? WHERE users.id=?`;
      connection.query(queryString,[body, body.id],(error,results)=>{
          if(!error){
              resolve(results);
          }else{
              reject(error);
          }
      });
    });
  }
}

module.exports=userModel;