const Pool = require('pg').Pool;

const pool = new Pool({
    user:'ec2-user',
    password:'',
    database:'postgres',
    host:'localhost',
    port:5432
});

module.exports = pool;