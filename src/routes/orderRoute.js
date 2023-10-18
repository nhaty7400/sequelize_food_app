import express from 'express';
import { createOrder } from '../controllers/orderController.js';

const orderRoute=express.Router();

// create order
orderRoute.post("/create-order",createOrder)

export default orderRoute;