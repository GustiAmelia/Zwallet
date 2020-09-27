// IMPORT
const connection =require('../Configs/dbMySql');
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const authModel ={
  postNewUser : (body)=>{
    return new Promise((resolve,reject)=>{
      const querySelect='SELECT username FROM users WHERE username=?';
      connection.query(querySelect,[body.username],(error,results)=>{
        if(!results){
          reject(error)
        }
        if(results.length){
          reject({
            msg:'username already registed'
          })
        }else{
          const querySelectEmail ='SELECT email FROM users WHERE email=?';
          connection.query(querySelectEmail,[body.email],(error,results)=>{
            if(!results){
              reject(error);
            }
            if(results.length){
              reject({
                msg:'Email already registed'
              });
            }else{
              bcrypt.genSalt(10,(error,salt)=>{
                if(error){
                  reject(error);
                }
                const{password}=body;
                bcrypt.hash(password,salt,(error,hashedPassword)=>{
                  if(error){
                    reject(error);
                  }
                  const newBody={...body, password:hashedPassword};
                  const qs = 'INSERT INTO users SET ?';
                  connection.query(qs,newBody,(error,results)=>{
                    if(!error){
                      resolve(results);
                    }else{
                        reject(error);
                    }
                  });
                });
              });
            }
          });
        }  
      })
    });
  },
  loginUser :(body)=>{
    return new Promise((resolve,reject)=>{
      const qs ='SELECT username, password, email FROM users WHERE email=?';
      connection.query(qs,body.email,(error,results)=>{
        if(error){
          reject(error)
        }
        if(!results.length){
          reject('User Not Found');
        }
        else{
          bcrypt.compare(body.password, results[0].password,(error,isSame)=>{
            if(isSame){
              const {email}=body;
              const payload={
                email,
              };
              const token = jwt.sign(payload,process.env.SECRET_KEY,{
              });
              const msg ='Login Success';
              resolve({msg,token});
            }
            if(!isSame){
              reject({msg:'Wrong Password'});
            }
            if(error){
              reject(error);
            }
          });
        }
      })
    })
  }
}

module.exports=authModel;