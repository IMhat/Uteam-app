const uuid = require("uuid");
const AWS = require("aws-sdk");

const updateUser = async (event) => {
    const dynamodb = new AWS.DynamoDB.DocumentClient();
    const { id } = event.pathParameters;

    const { username, email, points } = JSON.parse(event.body);

    await dynamodb
      .update({
        TableName: "UserTable",
        Key: { id },
        UpdateExpression: "set username = :username, email = :email, points = :points",
        // UpdateExpression: "ADD points = :points",
        ExpressionAttributeValues: {
          ":username": username,
          ":email": email,
          ":points": points
        },
        ReturnValues: "ALL_NEW",
      })
      .promise();

    return {
      body: JSON.stringify({
        message: "user updated",
      }),
    };
  };

  module.exports = {
    updateUser,
  };