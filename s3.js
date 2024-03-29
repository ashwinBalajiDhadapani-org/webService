require('dotenv').config()
const fs = require('fs')
const S3 = require('aws-sdk/clients/s3')

const bucket = process.env.S3_BUCKET_NAME
const region = process.env.S3_BUCKET_REGION
const accessKeyId = process.env.AWS_ACCESS_KEY
const secretAccessKey = process.env.AWS_SECRET_KEY

const s3 = new S3({
  region,
  accessKeyId,
  secretAccessKey
})

// uploads a file to s3
function uploadFile(file) {
  const fileStream = fs.createReadStream(file.path)
  const uploadParams = {
    Bucket: bucket,
    Body: fileStream,
    Key: file.filename
  }

  return s3.upload(uploadParams).promise()
}

exports.uploadFile = uploadFile


// downloads a file from s3
function getFileStream(fileKey) {
  const downloadParams = {
    Key: fileKey,
    Bucket: bucket
  }

  return s3.getObject(downloadParams).createReadStream()
}
exports.getFileStream = getFileStream

//delete file
function deleteFile(fileKey) {
    const downloadParams = {
      Key: fileKey,
      Bucket: bucket
    }
  
    return s3.deleteObject(downloadParams).createReadStream()
  }

  exports.deleteFile = deleteFile