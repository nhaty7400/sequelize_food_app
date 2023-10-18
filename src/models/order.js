import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class order extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    order_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'user',
        key: 'user_id'
      }
    },
    food_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'food',
        key: 'food_id'
      }
    },
    account: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    code: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    arr_sub_id: {
      type: DataTypes.STRING(255),
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'order',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "order_id" },
        ]
      },
      {
        name: "user_id",
        using: "BTREE",
        fields: [
          { name: "user_id" },
        ]
      },
      {
        name: "food_id",
        using: "BTREE",
        fields: [
          { name: "food_id" },
        ]
      },
    ]
  });
  }
}
