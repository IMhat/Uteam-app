const AWS = require('aws-sdk');

const deletePoint = async (event) => {
    const dynamodb = new AWS.DynamoDB.DocumentClient();
    const {id} = event.pathParameters;

    await dynamodb.delete({
        TableName: "PointTable",
        Key: {
            id

        },
    }).promise()

    return{
        // status:200,
        body: {
            message: "Point deleted",
        },
    }
}

module.exports = {
    deletePoint
}