const receiverRouter = require("express").Router();

const receiverControllers = require('../Controllers/receiver');
const uploadImage = require('../Helpers/Middlewares/Upload');

receiverRouter.patch('/',uploadImage.singleUpload,receiverControllers.updateReceiver)
receiverRouter.get('/',receiverControllers.getAllReceiver)

module.exports = receiverRouter;