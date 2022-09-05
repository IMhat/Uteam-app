const AWS = require('aws-sdk');

const updateProduct = async (event) => {

    const dynamodb = new AWS.DynamoDB.DocumentClient();

    const { id } = event.pathParameters;

    const {productName, productImage, description, points} = JSON.parse(event.body);

    await dynamodb.update({
        TableName: "ProductTable",
        Key: {            
            id
            },
        UpdateExpression: 'set productName = :productName, productImage = :productImage, description = :description, points = :points',

        ExpressionAttributeValues: {
            ":productName": productName,
            ":productImage": productImage,
            ":description": description,
            ":points": points
        },
        ReturnValues: 'ALL_NEW'
    }).promise();


    return {
        // status: 200,
        body: JSON.stringify({
            message : 'Product update successfully'
        })
    }

    

};

module.exports = {
    updateProduct,
};