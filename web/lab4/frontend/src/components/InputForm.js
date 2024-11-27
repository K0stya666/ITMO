import React, {useState} from "react";
import axios from "axios";
import {Autocomplete, Button, Input, TextField} from "@mui/material";

const xValues = ['-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3'];
const rValues = ['1', '2', '3', '4', '5'];

const InputForm = () => {

    const [x, setX] = useState(null);
    const [y, setY] = useState('');
    const [r, setR] = useState(null);
    const [errors, setErrors] = useState({});

    const validate = () => {
        const errors = {}
        if (x === null) errors.x = 'Введите значение X';
        if (!isNaN(y)) errors.y = 'Y не является числом. Попробуйте ещё раз';
        if (r === null) errors.r = 'Введите значение R';
        setErrors(errors);
        return Object.keys(errors).length === 0;
    }


    this.state = {

    }

    const submit = (e) => {
        if (validate()) {
            const data = {
                x: Number(x),
                y: Number(y),
            }





        }


        e.preventDefault();

        const data = {
            x: x,
            y: y,
            r: r,
        }

        axios.post('http://hui', data)
            .then(response => {
                console.log(response.data);
            })
            .catch(error => {
                console.log(error);
            });
    }

    return (
        <form >

            <div style={{ display: "flex"}}>
                <label htmlFor="x">Изменение X:</label>
                <Autocomplete
                    renderInput={(params) => (
                        <TextField {...params} label="Выбери значение X" variant="outlined" />
                    )}
                    options={xValues}
                    onChange={setX}
                    style={{
                        width: "20%",
                        height: "60px"
                    }}
                />
            </div>

            <div>
                <label htmlFor="y">Изменение Y:</label>
                <Input
                    type="number"
                    step="0.1"
                    value={y}
                    onChange={(value) => setY(value)}
                    // error={0}
                    min="-3"
                    max="3"
                    hint="Введите значение от -3 до 3"
                />
            </div>

            <div style={{ display: "flex" }}>
                <label htmlFor="r">Изменение R:</label>
                <Autocomplete
                    renderInput={(params) => (
                        <TextField {...params} label="Выбери значение R" variant="outlined" />
                    )}
                    options={rValues}
                    onChange={setR}
                    style={{
                        width: "20%",
                        height: "60px"
                    }}
                />
            </div>

            <Button
                type="submit"
                onClick={submit}
            >Отправить</Button>

        </form>
    )
}

export default InputForm;