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
  getAllUsers : ()=>{
    return new Promise ((resolve,reject)=>{
      const qs = 'SELECT * FROM users ORDER BY username ASC'
      connection.query(qs,(error,results)=>{
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
  },
  searchContact : (query)=>{
    return new Promise((resolve,reject)=>{
      const queryString = `SELECT * FROM users WHERE users.username LIKE '%${query.username}%' ORDER BY username ASC`;
      connection.query(queryString,(error,results)=>{
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