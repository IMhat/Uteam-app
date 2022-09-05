const AWS = require("aws-sdk");

const getProducts = async (event) => {
  const dynamodb = new AWS.DynamoDB.DocumentClient();

  const result = await dynamodb.scan({ 
    TableName: "ProductTable" }).promise();

  const products= result.Items;

  return {
      products,
  };
};

module.exports = {
    getProducts,
};