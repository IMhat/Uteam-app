const AWS = require('aws-sdk');

const updatePoint = async (event) => {

    const dynamodb = new AWS.DynamoDB.DocumentClient();

    const { id } = event.pathParameters;

    const {username, description, point} = JSON.parse(event.body);

    await dynamodb.update({
        TableName: "PointTable",
        Key: {            
            id
            },
        UpdateExpression: 'set username = :username, description = :description',
        UpdateExpression: 'add  point = :point',
        ExpressionAttributeValues: {
            ":username": username,
            ":description": description,
            ":point": point,
            
        },
        ReturnValues: 'ALL_NEW'
    }).promise();

    return {
        // status: 200,
        body: JSON.stringify({
            message : 'point update successfully'
        })
    }

    

};

module.exports = {
    updatePoint,
};