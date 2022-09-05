const AWS = require ('aws-sdk');

const getPoint = async (event) =>{

    const dynamodb = new AWS.DynamoDB.DocumentClient();
    const {id} = event.pathParameters;

    const result = await dynamodb.get({
        TableName: "PointTable",
        Key: {  
            id
        },
    }).promise();

    const point =  result.Item;

    return{
        // status: 200,
        body: point
    };

};

const getPointsByUser = async (event) =>{

    const dynamodb = new AWS.DynamoDB.DocumentClient();

    const {username} = event.pathParameters;

    const result = await dynamodb.scan({

        FilterExpression: "username = :username",

        TableName: "PointTable",
        
        ExpressionAttributeValues: {  
            ":username":{
                "S": username
            }
        },
        ProjectionExpression: "id,username,description,point,createAt"

    }).promise();



    const point =  result.Items

    return{
        // status: 200,
        body: point
    };

};

module.exports = {
    getPoint,
    getPointsByUser,
};
