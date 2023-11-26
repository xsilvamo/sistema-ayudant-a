import express from "express"
import {pool} from "./db.js"

const app = express()

app.use(express.json());

app.get('/paciente', async (req, res) => {
    const [resultado] = await pool.query('select * from paciente')
    res.send(resultado);
});

app.post('/paciente', async (req, res) => {
    const {rut, nombre} = req.body;
    const [resultado] = await pool.query('insert into paciente (rut_paciente, nombre_paciente) values (?, ?)', [rut, nombre])
    res.send(resultado);
});

app.get('/paciente/:rut', async (req, res) => {
    const [resultado] = await pool.query('select * from paciente where rut_paciente = ?', [req.params.rut]);
    res.send(resultado);
});

app.delete('paciente/:rut', async (req, res) => {
    const [resultado] = await pool.query('delete from paciente where rut_paciente = ?', [req.params.rut]);
    res.send(resultado);
})





app.listen(3000)

console.log("Servidor en escucha en puerto 3000")