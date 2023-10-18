import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import restaurant from "../models/restaurant.js";
import user from "../models/user.js";
import like_res from "../models/like_res.js";
import { Op } from "sequelize";

let model = initModels(sequelize);


const createLike = async (req, res) => {
    let { restId, userId } = req.params;

    const rest = await restaurant.findByPk(restId);
    const user = await user.findByPk(userId);

    if (!rest || !user) {
        throw new Error('Restaurant or user not found');
    }

    let newData = {
        user_id: userId,
        res_id: restId,
        date_like: new Date(),
    }

    await model.like_res.create(newData);
    res.send("Liked successfully");
};

const removeLike = async (req, res) => {
    let { restId, userId } = req.params;

    const rest = await restaurant.findByPk(restId);
    const userLike = await user.findByPk(userId);

    if (!rest || !userLike) {
        throw new Error('Restaurant or user not found');
    }

    await like_res.destroy({
        where: {
            [Op.and]: [
                { res_id: restId }, { user_id: userId }
            ]
        }
    })
    res.send("Removed like successfully");
};

const getLikeListByRes = async (req, res) => { 
    let {restId}=req.params;

    let data=await model.like_res.findAll({
        where:{
            res_id:restId
        }
    })

    res.send(data);
};

const getLikeListByUser = async (req, res) => {
    let {userId}=req.params;

    let data=await model.like_res.findAll({
        where:{
            user_id:userId
        }
    })

    res.send(data);
 };

export { createLike, removeLike, getLikeListByRes, getLikeListByUser };
