import dotenv from 'dotenv'
dotenv.config();

import mysql from 'mysql2'

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASS,
    database: process.env.MYSQL_DB
}).promise();

function mydebug(str) {
    console.log(`\n*****\n***   ${str}\n*****`);
}

async function getUsersInfo() {
    const rows = await pool.query("SELECT * FROM user;");
    return rows;
}

async function getUsers() {
    const [rows] = await pool.query("SELECT * FROM user;");
    return rows;
}

var users = await getUsersInfo();
mydebug("getUsersInfo");
console.log(users);

var users = await getUsers();
mydebug("getUsers");
console.log(users);

export async function login(username, pass) {
    const [row] = await pool.query(`SELECT * FROM user where username = ? AND passw = ?`, [username, pass]);
    return row[0]
}

async function getUserNoSafe(id) {
    const [row] = await pool.query(`
        SELECT * 
        FROM user
        WHERE 
        idUser = ${id}
        ;`);

    return row;
}

async function getUserSafe(id) {
    const [row] = await pool.query(`
        SELECT *
        FROM user
        WHERE iduser = ?
        ;`, [id]); // La función revisa que no haga cosas raras

    return row;
}

// Regresará un valor válido
var user = await getUserSafe(1);
mydebug("getUserSafe VALID");
console.log(user);

// Regresará un valor no válido
var user = await getUserSafe(5);
mydebug("getUserSafe FAIL");
console.log(user);

// Al regresar el nodo 0, en caso de que no exista, qué pasa?
async function getUser (id)
{
    const [row] = await pool.query(`
        SELECT *
        FROM user
        WHERE iduser = ?
        ;`, [id]); // La función revisa que no haga cosas raras

    return row[0];
}

// Devuelve la info necesaria en formato JSON
async function insertUser (username, pass="asd")
{
    const [row] = await pool.query(`
        INSERT INTO user
        (username, passw)
        VALUES ( ?, ? );
        `, [username, pass]);
    
    return {
        affectedRows: row.affectedRows,
        id: row.insertId
    };
}

// Regresará un valor válido
var user = await getUser(1);
mydebug("getUser VALID");
console.log(user);

// Regresará un valor no válido
var user = await getUser(5);
mydebug("getUser FAIL");
console.log(user);

//////////////

async function insertUserAll(username, pass = "asd") {
    const row = await pool.query(`
        INSERT INTO user
        (username, passw)
        VALUES ( ?, ? );
        `, [username, pass]);

    return row;
}

/*
    fieldCount
    affectedRows
    insertId
    info
    serverStatus
    warningStatus
    changedRows
*/

var user = await insertUserAll("asd");
mydebug("insert ALLINFO");
console.log(user);

var user = await insertUser("asd");
mydebug("insert");
console.log(user);

export async function getProducts(idUser) {
    const [row] = await pool.query(`
        SELECT p.idProduct, p.name, p.sprite 
        FROM user as u
        INNER JOIN sale as s ON u.idUser = s.idUser 
        INNER JOIN saledetail as sd ON sd.idSale = s.idSale
        INNER JOIN product as p ON p.idProduct = sd.idProduct
        INNER JOIN productcategory as pc ON pc.idProductCategory = p.idProductCategory
        WHERE u.idUser = ?; `, [idUser]);
    return row;
}