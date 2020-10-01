const connection = require('../Configs/dbMySql');

const receiverModels = {
  updateReceiver : (body)=>{
    return new Promise((resolve,reject)=>{
      const queryString = `UPDATE receiver SET ? WHERE receiver.id=?`;
      connection.query(queryString,[body, body.id],(error,results)=>{
          if(!error){
              resolve(results);
          }else{
              reject(error);
          }
      });
    });
  },
  getAllReceiver :()=>{
    return new Promise((resolve,reject)=>{
      const qs ='SELECT * FROM receiver'
      connection.query(qs,(error,results)=>{
        if(!error){
          resolve(results)
        }else{
          reject(error)
        }
      })
    })
  }
}

module.exports = receiverModels;