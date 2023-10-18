import { Sequelize } from "sequelize";
import config from "../config/config.js";

const sequelize = new Sequelize(config.database, config.user, config.pass, {
    host: config.host,
    port: config.port,
    dialect: config.dialect
});

export default sequelize;

// yarn sequelize-auto -h localhost -d db_food_app -u root -x bachduong7400 -p 3307 --dialect mysql -o ./src/models -l esm