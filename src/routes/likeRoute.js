import express from 'express';
import { createLike,removeLike,getLikeListByRes,getLikeListByUser } from '../controllers/likeController.js';

const likeRoute=express.Router();

// like
likeRoute.post("/create-like/:restId/:userId",createLike);

// unlike
likeRoute.delete("/remove-like/:restId/:userId",removeLike);

// get like list by res
likeRoute.get("/get-like-list-by-rest/:restId",getLikeListByRes);

// get like list by user
likeRoute.get("/get-like-list-by-user/:userId",getLikeListByUser);

export default likeRoute;