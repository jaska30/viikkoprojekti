const Pool = require('pg').Pool;
require('dotenv').config();

const conopts = {
    user: 'xxxx',
    password: 'xxxx',
    host: 'localhost',
    database: 'viikkoprojekti'
}
//console.log(process.env.DB_CONNECTIONSTRING)
const pool = new Pool(conopts);


const getStuff = (cb) => {
    pool.query('SELECT * from topic ORDER BY id', (err, results) => {
        if (err) throw err;
        console.dir(results);
        cb(results.rows);
    })
}
const getStuffById = (id, cb) => {
    pool.query('SELECT * FROM topic WHERE id=$1', [id], (err, results) => {
        if (err) throw err;
        console.dir(results.rows);
        cb(results.rows);
    })
}

//lisää tänne startlearningdate ja inprogress, kunhan keksit miten timestampin ja booleanin arvot lisätään!!
const insertStuff = (newstuff, cb) => {
    const { title, description, timetomaster, timespent, source } = newstuff;
    pool.query('INSERT INTO topic (title, description, timetomaster, timespent, source) VALUES ($1, $2, $3, $4, $5)', [title, description, timetomaster, timespent, source], (err, results) => {
        if (err) throw err;
        console.dir(results);
        cb(results.rowCount);
    })
}
//lisää tänne startlearningdate ja inprogress, kunhan keksit miten timestampin ja booleanin arvot lisätään!!

const updateStuff = (stuff, id, cb) => {
    const { title, description, timetomaster, timespent, source } = stuff;
    pool.query('UPDATE topic SET title=$1, description=$2, timetomaster=$3, timespent=$4, source=$5 WHERE id=$6', [title, description, timetomaster, timespent, source, id], (err, results) => {
        if (err) throw err;
        console.dir(results);
        cb(results.rowCount);
    })
}
const deleteStuff = (id, cb) => {
    pool.query('DELETE FROM topic WHERE id=$1', [id], (err, results) => {
        if (err) throw err;
        console.dir(results);
        cb(results.rowCount);
    })
}
module.exports = { getStuff, getStuffById, insertStuff, updateStuff, deleteStuff };