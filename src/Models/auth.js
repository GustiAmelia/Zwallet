// IMPORT
const connection =require('../Configs/dbMySql');
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const authModel ={
  postNewUser : (body)=>{
    return new Promise((resolve,reject)=>{
      const querySelect='SELECT * FROM users WHERE username=?';
      connection.query(querySelect,[body.username],(error,results)=>{
        if(!results){
          reject(error)
        }
        if(results.length){
          reject({
            msg:'username already registed'
          })
        }else{
          const querySelectEmail ='SELECT * FROM users WHERE email=?';
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
      const qs ='SELECT * FROM users WHERE email=?';
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
              const data = results[0];
              const payload={
                email,
              };
              const token = jwt.sign(payload,process.env.SECRET_KEY,{
              });
              console.log(data)
              const msg ='Login Success';
              resolve({msg,token,data});
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
  },
  pinConfirmation :(body)=>{
    return new Promise((resolve,reject)=>{
      const qs ='SELECT *  FROM users WHERE email=?'
      connection.query(qs,body.email,(error,results)=>{
        if(error){
          reject({msg:'Pin Invalid'})
        }
        bcrypt.compare(body.pin,results[0].pin,(error,isSame)=>{
          if(isSame){
            resolve({msg:'Pin Valid'})
          }
          if(!isSame){
            reject({msg:'Wrong Pin'})
          }
          if(error){
            reject(error)
          }
        })
      })
    })
  }
}

module.exports=authModel;