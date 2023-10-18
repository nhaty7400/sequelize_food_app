import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

let model = initModels(sequelize);

const createRate=async(req,res)=>{
    let {amount}=req.body;
    let { restId, userId } = req.params;

    const rest = await model.restaurant.findByPk(restId);
    const user = await model.user.findByPk(userId);

    if (!rest || !user) {
        throw new Error('Restaurant or user not found');
    }

    let newData={
        user_id: userId,
        res_id: restId,
        amount,
        date_rate: new Date(),
    }

    await model.rate_res.create(newData);
    res.send("Rated successfully");
};

const getRateListByRest=async(req,res)=>{
    let {restId}=req.params;

    let data=await model.rate_res.findAll({
        where:{
            res_id:restId
        }
    })

    res.send(data);
};

const getRateListByUser=async(req,res)=>{
    let {userId}=req.params;

    let data=await model.rate_res.findAll({
        where:{
            user_id:userId
        }
    })

    res.send(data);
};

export {createRate,getRateListByRest,getRateListByUser};