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
  },
  updatePassword : (body)=>{
    return new Promise((resolve,reject)=>{
      bcrypt.genSalt(10,(error,salt)=>{
        if(error){
          reject(error);
        }
        const{password}=body;
        bcrypt.hash(password,salt,(error,hashedPassword)=>{
          if(error){
            reject(error);
          }
          const newBody={...body,password:hashedPassword};
          const qs =`UPDATE users SET ? WHERE users.email ='${newBody.email}'`;
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
  checkPassword :(body)=>{
    return new Promise((resolve,reject)=>{
      const qs ='SELECT *  FROM users WHERE email=?'
      connection.query(qs,body.email,(error,results)=>{
        if(error){
          reject({msg:'Password Invalid'})
        }
        if (!results.length) {
          reject("User Not Found");
        } 
        else {
          bcrypt.compare(body.password,results[0].password,(error,isSame)=>{
          if(isSame){
            const passwordUser = true
            resolve({passwordUser:passwordUser})
          }
          if(!isSame){
            reject({passwordUser:false})
          }
          if(error){
            reject(error)
          }
        })}
      })
    })
  },
  sendEmail: (body) => {
    return new Promise((resolve, reject) => {
      const otp = Math.floor(1000 + Math.random() * 900000);
      const queryString = "SELECT email, code FROM code_otp WHERE email = ?";
      connection.query(queryString, [body.email], (error, results) => {
        if (error) {
          reject(error);
        }
        if (results.length) {
          const Qs = `UPDATE code_otp SET code = ${otp} Where email = ? `;
          connection.query(Qs, [body.email], (error, results) => {
            if (!error) {
              resolve({ sendOTP: "success", code: otp ,email:body.email});
            } else {
              reject(error);
            }
          });
        } else {
          const Qstr = `INSERT INTO code_otp SET email = ?, code= ?`;
          connection.query(Qstr, [body.email, otp], (error, results) => {
            if (!error) {
              resolve({ sendOTP: "success", code: otp, email:body.email});
            } else {
              reject(error);
            }
          });
        }
      });
    });
  },
  checkOTP: (body) => {
    return new Promise((resolve, reject) => {
      const queryString = `SELECT code FROM code_otp WHERE email = ?`;
      connection.query(queryString, [body.email], (err, data) => {
        if (!err) {
          resolve({ code: data[0].code });
        } else {
          reject(err);
        }
      });
    });
  },
}

module.exports=authModel;