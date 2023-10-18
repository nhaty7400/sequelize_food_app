import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

let model = initModels(sequelize);

const createOrder = async (req, res) => {
    let { user_id, food_id, account, code, arr_sub_id } = req.body;

    const user = await model.user.findByPk(user_id);
    const food = await model.food.findByPk(food_id);

    if (!user || !food) {
        throw new Error('Food or user not found');
    }

    let newData = {
        user_id,
        food_id,
        account,
        code,
        arr_sub_id
    }

    await model.order.create(newData);
    res.send("Ordered successfully");
}

export { createOrder }