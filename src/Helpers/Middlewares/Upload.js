const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination : (req,file,cb)=>{
        cb(null,'./public/images');
    },
    filename : (req,file,cb)=>{
        const nameFormat = `${Date.now()}-${file.fieldname}${path.extname(file.originalname)}`;
        cb(null,nameFormat);
    }
});

const limits ={
    fileSize: 10*1000*1000*1000
};
const fileFilter =(req,file,cb)=>{
    const fileType = /jpg|jpeg|png|gif/;
    const extName = fileType.test(path.extname(file.originalname).toLowerCase());
    if(extName){
        cb(null,true);
    }else{
        cb('Error:Images Only');
    }
};

const upload = multer({
    storage,
    limits,
    fileFilter
});

const uploadImage ={
    singleUpload:(req,res,next)=>{
        const singleUpload=upload.single('avatar');
        singleUpload(req,res,(error)=>{
            if(error){
                res.json({
                    msg:error
                })
            }else{
                try {
                    req.body.avatar=`/images/${req.file.filename}`
                } catch {
                    console.log(error)
                } finally {
                    next()
                }
            }
        })
    },
}

module.exports=uploadImage;