const { v4 } = require('uuid')
const AWS = require('aws-sdk');

const addPoints = async (event) =>{

    const dynamodb = new AWS.DynamoDB.DocumentClient();

    // const newPoint = JSON.parse(even.body);
    const { username, description, point} = JSON.parse(event.body);
    const createdAt = new Date()
    const id = v4()

    const newPoint = {
        id,
        username,
        description,
        point,
        createdAt
    },
    AttributeDefinitions=[
        {
            'AttributeName': 'id',
            'AttributeType': 'N'
        },
        {
            'AttributeName': 'username',
            'AttributeType': 'S'
        },
        {
            'AttributeName': 'description',
            'AttributeType': 'S'
        },
        {
            'AttributeName': 'point',
            'AttributeType': 'N'
        },
        {
            'AttributeName': 'date',
            'AttributeType': 'N'
        },
    ]
    

    await dynamodb.put({
        TableName: "PointTable",
        Item: newPoint
    }).promise()

    return {
        // status: 200,
        body: JSON.stringify(newPoint)
    }




};

module.exports = {
    addPoints,

};