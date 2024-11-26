import React, {useState} from "react";
import {Autocomplete, Input, TextField} from "@mui/material";
import {useNavigate} from "react-router-dom";

const xValues = ['-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3'];
const rValues = ['1', '2', '3', '4', '5'];

const InputForm = () => {

    const [x, setX] = useState(null);
    const [y, setY] = useState('');
    const [r, setR] = useState(null);

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
                    // value={y}
                    // onChange={(value) => {}}
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

        </form>
    )
}

export default InputForm;