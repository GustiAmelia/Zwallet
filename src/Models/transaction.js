const conection = require('../Configs/dbMySql');

const transactionModels ={
  addTransaction : (body)=>{
    return new Promise ((resolve,reject)=>{
      const qsTransaction = 'INSERT INTO transaction SET ?';
      conection.query(qsTransaction,[body,body.sender_id],(error,results)=>{
        if(error){
          reject({msg:'Transaction Failed 1'})
        }
      
          const qsBalance = 'SELECT balance FROM users WHERE users.id=?';
          conection.query(qsBalance,[body.sender_id],(error,senderData)=>{
            console.log(senderData)
            if(error){
              reject({msg:'Transaction Failed 2'})
            }
              const qsUpdateBalance ='UPDATE users SET balance=? WHERE users.id=?';
              let newBalanceSender = (senderData[0].balance === null ?
                0-Number(body.amount)
                :
                Number(senderData[0].balance))-Number(body.amount);
                conection.query(qsUpdateBalance,[newBalanceSender, body.sender_id],(error)=>{
                if(error){
                  reject({msg:'Transaction Failed 3'})
                }
                  conection.query(qsBalance,[body.receiver_id],(error,receiverData)=>{
                    if(error){
                      reject({msg:'Transaction Failed 4'})
                    }
                      newBalanceSender = (
                        receiverData[0].balance === null ?
                        0 + Number(body.amount)
                        :
                        Number(receiverData[0].balance)) + Number(body.amount)
                      ;
                      conection.query(qsUpdateBalance,[newBalanceSender,body.receiver_id],(error)=>{
                        if(error){
                          reject({msg:'Transaction Failed 5'})
                        }
                          resolve({
                            ...body,
                            msg:'Transaction Success'
                          })
                        
                      })
                    
                  })
                
              })  
            
          })
        
      })
    })
  }
}

module.exports=transactionModels;