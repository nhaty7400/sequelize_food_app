import express from 'express';
import {createRate,getRateListByRest,getRateListByUser} from "../controllers/rateController.js"

const rateRoute=express.Router();

// rate
rateRoute.post("/create-rate/:restId/:userId",createRate);

// get rate list by res
rateRoute.get("/get-rate-list-by-rest/:restId",getRateListByRest);

// get rate list by user
rateRoute.get("/get-rate-list-by-user/:userId",getRateListByUser);

export default rateRoute;