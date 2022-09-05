const { v4 } = require('uuid')
const AWS = require('aws-sdk');

const addProducts = async (event) =>{

    const dynamodb = new AWS.DynamoDB.DocumentClient();


    const { productName, productImage, description, points} = JSON.parse(event.body);
    const createdAt = new Date()
    const id = v4()

    const newProduct = {
        id,
        productName,
        productImage,
        description,
        points,
        createdAt
        
    }
    

    await dynamodb.put({
        TableName: 'ProductTable',
        Item: newProduct
    }).promise()

    return {
        status: 200,
        body: JSON.stringify(newProduct)
    }




};

module.exports = {
    addProducts,

};